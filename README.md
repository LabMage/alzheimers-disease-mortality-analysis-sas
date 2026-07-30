# Alzheimer's Disease Mortality Analysis Using SAS
## Overview

This repository presents a graduate-level statistical analysis of Alzheimer's disease mortality data conducted in SAS as part of the STA 6707 course. The project applies multivariate statistical techniques to investigate relationships among demographic, health, environmental, and pollution-related variables associated with Alzheimer's disease mortality across selected U.S. states.

The analysis includes Multivariate Analysis of Variance (MANOVA), Principal Component Analysis (PCA), and Factor Analysis (FA) to identify significant factors, explore variable relationships, and reduce data dimensionality. The repository contains the original SAS source code, project report, and dataset required to reproduce the analysis.

## Project Background

This project was completed as the final assignment for **STA 6707** under the supervision of **Dr. Raid Amin** at the University of West Florida. The objective was to investigate factors associated with Alzheimer's disease mortality across six U.S. states using multivariate statistical methods implemented in SAS.

The project was designed as a collaborative study in which the complete set of predictor variables was distributed among team members. Each student was responsible for conducting an in-depth analysis of two assigned variables and performing Principal Component Analysis (PCA) and Factor Analysis (FA) for one assigned state. While every student's report focused on their individual analyses, the PCA and FA were performed using the complete set of project variables rather than only the variables assigned to that student.

This repository contains my individual contribution to the project. My assigned variables were **Diabetes** and **Cancer**, and my PCA and Factor Analysis were performed for **Washington State** using the complete project dataset.

## My Contribution

This repository documents my individual contribution to the team project.
My responsibilities included:

- Investigating the relationships between **Diabetes**, **Cancer**, and Alzheimer's disease mortality using multivariate statistical analysis.
- Performing **Principal Component Analysis (PCA)** and **Factor Analysis (FA)** for **Washington State** using the complete set of project variables, as required by the project design.
- Interpreting statistical results and identifying significant patterns and relationships among the analyzed variables.
- Developing and documenting the complete SAS implementation for my assigned analyses.
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

## Results

## Requirements

## How to Reproduce the Analysis

## Acknowledgments
