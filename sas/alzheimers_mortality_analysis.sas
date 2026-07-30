/* Consider the data set on Alzheimer’s Disease in the 6 States (MI, MN, MT, ND, WA, WI) */
* 1.1 Reading data;
Proc import datafile = '/home/u63781314/Project/Alz_mortality_data_complete (1).csv'
out=Altz dbms=csv replace;
getnames= yes;
run;

/* Sort data by states */
data Altz;
   set Altz;
   State=scan(County, 2, ',');
   County=scan(County, 1, ',');
z = _N_;
   if z ge 1198 and z le 1280 then state = 'MI';
   if z ge 1281 and z le 1367 then state = 'MN';
   if z ge 1565 and z le 1620 then state = 'MT';
   if z ge 1957 and z le 2009 then state = 'ND';
   if z ge 2921 and z le 2959 then state = 'WA';
   if z ge 3015 and z le 3086 then state = 'WI';
if state NOT IN ("MI","MN","MT","ND","WA","WI") then delete;
run;
/* Create a new dataset with only the desired variables */
data Altz;
   set Altz (keep = var1 state sixtyfiveandup Smoking_Rate physical_inactivity Diabetes
   Heart_Disease Cancer Glyphosates NATA_Cancer_11 Mercury_TPY Lead_TPY);
run; /* keep only the desired variables */

 *print the data to the screen to see if they are okay;
proc print data= Altz;
run;

/* 2 Univariate normality assessment */

/* 2.1 Perform univariate tests for normality */
proc univariate normal plot;
var Diabetes Cancer; run;

/* 2.2.1 Perform univariate tests for normality by states for Diabetes*/
proc sort; by state;
proc univariate normal plot;
var Diabetes; by state; run;

/* 2.2.2 Perform univariate tests for normality by states for Cancer*/ 
proc sort; by state;
proc univariate normal plot;
var Cancer; by state; run;

/* 2.3 Outliers assessment */
/* Sort the data by the smallest Diabetes variable */
proc sort data=Altz;
   by Diabetes;
run;
/* Print the top and bottom few observations to identify counties with extreme small values */
proc print data=Altz(obs=10) ; /* Print the first 10 observations */
   title 'Counties with Smallest Diabetes Values';
run;
/* Sort the data by the largest Diabetes variable in descending order */
proc sort data=Altz;
   by descending Diabetes;
run;
/* Print the top and bottom few observations to identify counties with extreme large values */
proc print data=Altz(obs=10); /* Print the first 10 observations */
   title 'Counties with Largest Diabetes Values';
run;

/* 2.4 Bivariate tests for normality */

/* Generate scatterplots for pairs of variables */;
proc corr data=Altz plots(only)=scatter;
   var Diabetes Cancer;
run;
* Chi-Square and Gamma plots for Diabetes and Cancer (bivariate normality);
proc princomp std out=pcresult;var Diabetes Cancer;
run;
data mahal;set pcresult;dist2=uss(of prin1-prin2);
run;
proc sort;by dist2;run;
data plotdata;set mahal;
prb=(_n_ -.5)/390;chiquant=cinv(prb,2);
run;
proc gplot;plot dist2*chiquant;
run;

/* 3 Finding transformation for normality */

/* 3.1.1 perform box-cox transformation for Diabetes*/
proc rank normal=blom out=normals;
var Diabetes; ranks Dq;
proc transreg; 
model boxcox(Diabetes) = identity(Dq); 
run; 
/* Apply new transformation*/
data Altz;
set Altz;
n_Dia = (Diabetes**(-0.75)-1/(-0.75));
*print the data to the screen to see if they are okay */
proc print data= Altz;
run;  
/* Check for normality after transformation */
proc univariate normal plot;
var n_Dia; run;


/*3.1.2 perform box-cox transformation for Cancer*/
proc rank normal=blom out=normals;
var Cancer; ranks Cq;
proc transreg; 
model boxcox(Cancer) = identity(Cq); 
run;

/* 3.2 Quantile transformation for variables */
proc rank data=Altz normal=blom out=normals;
    var Diabetes;
    ranks new_Diabetes;
    var Cancer;
    ranks new_Cancer;
run;
/* Print transformed data */
proc print data=normals;
run;
/* Perform univariate tests for normality for transformed Diabetes */
proc univariate data=normals normal plot;
    var new_Diabetes; 
run;
/* Perform univariate tests for normality for transformed Cancer */
proc univariate data=normals normal plot;
    var new_Cancer; 
run;
/* Create new dataset with transformed variable */
data Altz_transformed;
    merge Altz(in=a) normals(in=b);
run;
/* Print transformed data */
proc print data=Altz_transformed;
title 'Transformed Data';
run;

/* 4. MANOVA testing */
/* MANOVA testing for new_Diabetes and new_Cancer */
proc glm;
class state;
model new_Diabetes new_Cancer = state/ss1 ss2; 
means state / tukey lines;
means state / tukey;
MANOVA h=state/printe printh ;
Run;

/* 5. Perform PCA for northern states */
* 5.1 Creating data set for PCA testing including WA state information only;
data Altz_PCA;
    set Altz_transformed; 
   
z = _N_;
    if z ge 280 and z le 318 then state = 'WA';
if state NOT IN ("WA") then delete;
run;
*print the data to the screen to see if they are okay;
proc print data=Altz_PCA;
run; 

/* 5.2 PCA testing WA state data using proc factor and varimax rotation*/
proc factor data=Altz_PCA method=prin priors=one rotate=varimax n=3 score out=pca;
    var sixtyfiveandup Smoking_Rate physical_inactivity Diabetes
        Heart_Disease Cancer Glyphosates NATA_Cancer_11 Mercury_TPY Lead_TPY;
run;
/* The corr procedure is used to calculate pairwise correlations
* between the first 3 principal components and the original variables. */
proc corr data=pca;
  var factor1 factor2 factor3 sixtyfiveandup Smoking_Rate physical_inactivity Diabetes
    Heart_Disease Cancer Glyphosates NATA_Cancer_11 Mercury_TPY Lead_TPY;
  run;
  
  
/* 6. FA testing WA state data using proc factor and varimax rotation*/
proc factor data=Altz_PCA method=principal priors=smc rotate=varimax n=3 score out=fa;
    var sixtyfiveandup Smoking_Rate physical_inactivity Diabetes
        Heart_Disease Cancer Glyphosates NATA_Cancer_11 Mercury_TPY Lead_TPY;
run; 
/* The corr procedure is used to calculate pairwise correlations
* between the first 3 principal components and the original variables. */
proc corr data=fa;
  var factor1 factor2 factor3 sixtyfiveandup Smoking_Rate physical_inactivity Diabetes
    Heart_Disease Cancer Glyphosates NATA_Cancer_11 Mercury_TPY Lead_TPY;
run;












