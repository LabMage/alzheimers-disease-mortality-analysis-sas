# Alzheimer's Disease Mortality Analysis Using SAS
## Overview

This repository presents a graduate-level statistical analysis of Alzheimer's disease mortality data conducted in SAS as part of the STA 6707 course. The project applies multivariate statistical techniques to investigate relationships among demographic, health, environmental, and pollution-related variables associated with Alzheimer's disease mortality across selected U.S. states.

The analysis includes Multivariate Analysis of Variance (MANOVA), Principal Component Analysis (PCA), and Factor Analysis (FA) to identify underlying patterns in the data, examine relationships among variables, and reduce data dimensionality. The repository contains the original SAS source code, project report, and dataset required to reproduce the analysis.

## Project Background

This project was completed as the final assignment for STA 6707 under the supervision of Dr. Raid Amin at the University of West Florida.

The full class project examined Alzheimer's disease mortality data across U.S. states. The states were divided into four regional groups: **North, South, East, and West**. Our team was assigned the **Northern region**, consisting of six states: **Michigan, Minnesota, Montana, North Dakota, Washington, and Wisconsin**.

Within our regional team, each student was assigned two variables for detailed analysis and one state for Principal Component Analysis (PCA) and Factor Analysis (FA). PCA and FA used the complete set of project variables but were applied only to each student's assigned state.

## My Contribution

This repository documents my individual contribution to the team project.
My responsibilities included:

- Investigating the relationships between **Diabetes**, **Cancer**, and Alzheimer's disease mortality using multivariate statistical analysis.
- Evaluating statistical assumptions and applying appropriate data transformations prior to multivariate analysis.
- Performing Principal Component Analysis (PCA) and Factor Analysis (FA) for **Washington State** using the complete set of project variables, as required by the project design.
- Interpreting statistical results and identifying meaningful patterns and relationships among the analyzed variables.
- Developing and documenting the SAS implementation for my assigned analyses.
- Preparing the corresponding sections of the final technical report.

The repository has been organized for GitHub while preserving the original analyses, SAS programs, and technical report submitted for the course project.

## Dataset

The analysis was performed using a publicly available dataset containing Alzheimer's disease mortality and associated demographic, behavioral, environmental, and health-related variables for selected U.S. states.

The dataset includes variables representing:

- Alzheimer's disease mortality
- Demographic characteristics
- Health indicators (e.g., diabetes, heart disease, smoking)
- Physical activity measures
- Environmental pollutant exposure
- Air toxic emission estimates

The original dataset used for the course project is included in this repository to support reproducibility of the analyses.

## Statistical Methods

The analysis was conducted in SAS and followed a multistep multivariate statistical workflow.

### Data Preparation

The original CSV dataset was imported into SAS, filtered to include six selected states, and reduced to the variables required for the group analysis. State and county information was extracted and organized before the statistical procedures were performed.

### Univariate Normality Assessment

The distributions of **Diabetes** and **Cancer** were evaluated both across the complete six-state dataset and separately by state using `PROC UNIVARIATE`.

Normality was assessed using:

- Shapiro–Wilk tests
- Histograms
- Quantile–quantile (Q–Q) plots
- Box plots
- Identification of skewness and potential outliers

The original Diabetes and Cancer variables did not satisfy the normality assumption.

### Data Transformation

Box–Cox transformations were explored using `PROC TRANSREG`. Because the original variables remained non-normal, a Blom normal-score quantile transformation was applied using `PROC RANK`.

The transformed Diabetes and Cancer variables were then reassessed with `PROC UNIVARIATE` to verify approximate normality before multivariate testing.

### Multivariate Analysis of Variance

A one-way Multivariate Analysis of Variance (**MANOVA**) was performed with `PROC GLM` to test whether the combined mean values of transformed Diabetes and Cancer differed across the six states.

The analysis included:

- Multivariate tests for the overall effect of state
- Separate univariate tests for Diabetes and Cancer
- Type I and Type II sums of squares
- Tukey-adjusted post-hoc comparisons to identify which state pairs had significantly different means

### Principal Component Analysis

Principal Component Analysis (**PCA**) was performed for **Washington State** using all ten variables included in the group project:

- `sixtyfiveandup`
- `Smoking_Rate`
- `physical_inactivity`
- `Diabetes`
- `Heart_Disease`
- `Cancer`
- `Glyphosates`
- `NATA_Cancer_11`
- `Mercury_TPY`
- `Lead_TPY`

PCA was implemented with `PROC FACTOR` using the principal-component method, unit prior communalities, and Varimax rotation. Three principal components were retained based on the eigenvalues and cumulative proportion of explained variance.

The rotated component loadings were examined to identify groups of related demographic, health, behavioral, and environmental variables.

### Correlation Analysis of Principal Components

`PROC CORR` was used to calculate correlations between the retained principal-component scores and the original variables. This analysis supported interpretation of the components and confirmed the relationships observed in the rotated loading pattern.

### Factor Analysis

Exploratory Factor Analysis (**FA**) was also performed for Washington State using the same ten variables.

The analysis used:

- Principal factor extraction
- Squared multiple correlations as prior communality estimates
- Varimax rotation
- Three retained factors
- Factor-score generation

The rotated factor pattern and correlations between factor scores and the original variables were used to interpret the underlying latent dimensions connecting health indicators, lifestyle factors, and environmental exposures.

## Key Findings

The statistical analyses identified significant differences among the selected states in the combined effects of **Diabetes** and **Cancer** on Alzheimer's disease mortality.

Major findings include:

- The original Diabetes and Cancer variables did not satisfy the normality assumption required for multivariate analysis. After applying a Blom normal-score transformation, the transformed variables demonstrated distributions appropriate for subsequent statistical testing.

- MANOVA revealed statistically significant differences among the six states in the combined response of Diabetes and Cancer, indicating that disease patterns varied across geographic regions.

- Tukey-adjusted post-hoc comparisons identified specific state pairs with significant differences in the analyzed health indicators.

- Principal Component Analysis reduced the dimensionality of the dataset and identified major components representing shared variation among demographic, health, behavioral, and environmental variables.

- Factor Analysis revealed latent relationships among the project variables, providing a more interpretable representation of the underlying structure influencing Alzheimer's disease mortality.

Overall, the project demonstrates how multivariate statistical methods can be applied to investigate complex public health datasets and uncover relationships that may not be evident through univariate analyses alone.

## Repository Structure

```
alzheimers-disease-mortality-analysis-sas/
│
├── README.md                              # Project documentation
├── data/
│   └── Alz_mortality_data_complete (1).csv    # Dataset used in the analysis
├── docs/
│   └── alzheimers_mortality_analysis_report.pdf
├── sas/
│   └── alzheimers_mortality_analysis.sas
└── images/                                # Figures used in the README (optional)
```

- **README.md** – project overview, methodology, and instructions.
- **data/** – dataset used in the statistical analyses.
- **docs/** – technical report describing the methodology and results.
- **sas/** – original SAS program used to perform the analyses.
- **images/** – optional figures or screenshots for documentation.

## Requirements

To reproduce this analysis, you will need:

- SAS OnDemand for Academics, SAS Studio, or another SAS environment
- The dataset included in the `data/` directory
- The SAS program located in the `sas/` directory

No additional SAS packages or external libraries are required beyond the standard SAS procedures used in this project.

## How to Reproduce the Analysis

1. Clone or download this repository.

2. Open the SAS program located in the `sas/` directory.

3. If necessary, update the file path in the `PROC IMPORT` statement to match the location of the dataset on your SAS environment.

4. Ensure that the dataset `Alz_mortality_data_complete (1).csv` is available in the location referenced by the SAS program.

5. Run the SAS program sequentially. The workflow includes:
   - Data import and preprocessing
   - Normality assessment
   - Data transformation
   - MANOVA
   - Principal Component Analysis (PCA)
   - Factor Analysis (FA)

6. Compare the generated statistical output with the report included in the `docs/` directory.

## Acknowledgments

This project was completed as part of the graduate course **STA 6707** at the **University of West Florida** under the supervision of **Dr. Raid Amin**.

I would like to thank Dr. Amin for his instruction in multivariate statistical methods and for designing this course project.

I also thank my teammates for their collaboration in the original course project while noting that this repository contains only my individual contribution.