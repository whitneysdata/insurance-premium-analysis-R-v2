Insurance Premium Analysis Using R

## Overview

This project analyzes the relationship between insurance premiums and selected macroeconomic factors

(inflation, interest rates, and GDP growth) using R.

The analysis combines:

- Classical statistical modeling (Multiple Linear Regression)

- Time series modeling with external regressors (ARIMAX)


This project was completed as part of a 4th Year Actuarial Science research project and is structured

to reflect good data science and actuarial practice.

---

## Objectives

- Examine trends in insurance premiums over time

- Assess the impact of macroeconomic variables on insurance premiums

- Compare regression-based and time-series-based modeling approaches

- Demonstrate a reproducible data analysis workflow in R

---

## Data

Source: Secondary macroeconomic and insurance premium data

Period: 2015–2024

Variables:

 - Insurance Premium

 - Inflation Rate

 - Interest Rate

 - GDP Growth Rate

---

## Project Structure

Insurance Premium Analysis

│

├── 📂 data

│   ├── insurance\_data.csv

│   └── cleaned\_insurance\_data.csv

│

├── 📂 scripts

│   ├── 01\_data\_cleaning.R

│   ├── 02\_exploratory\_analysis.R

│   ├── 03\_modelling.R

│   └── 04\_results\_visualization.R

│

├── 📂 models

│   ├── mlr\_model.rds

│   └── arimax\_model.rds

│

├── requirements.R

├── Insurance Premium Analysis.Rproj

└── README.md


---

## Methodology

1. Data Cleaning

 - Data inspection, validation, and transformation

 - Creation of derived variables (log premiums and growth rates)

2. Exploratory Data Analysis (EDA)

 - Trend analysis

 - Visualization of relationships between premiums and macroeconomic variables

 - Correlation analysis

3. Modeling

 - Multiple Linear Regression (MLR)

 - Diagnostic tests (multicollinearity, normality, homoscedasticity)

 - ARIMAX model incorporating macroeconomic regressors

4. Results & Interpretation

 - Comparison of regression and time series approaches

 - Interpretation of economic and actuarial implications

---

## Tools & Packages

 - R

 - tidyverse

 - car

 - forecast

---

## How to Run the Project

1. Open the RStudio project

2. Run requirements.R to install required packages

3. Execute scripts in numerical order (01 → 04)

---

## Author

Kemuma Whitney  

Bachelor of Actuarial Science

