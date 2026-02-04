# Purpose: Model the relationship between macroeconomic
#          factors and insurance premiums
# Methods: Multiple Linear Regression and Time series (ARIMAX) model

rm(list = ls())

# Load libraries
library(tidyverse)
library(car)        # diagnostic tools
library(forecast)   # time series models

# 1. Load cleaned data
data <- read.csv("data/cleaned_insurance_data.csv")

# 2. Multiple Linear Regression (MLR)
mlr_model <- lm(
  premium ~ inflation + interest + gdp_growth,
  data = data
)

# 3. Model summary
summary(mlr_model)

# Interpretation note:
# - Coefficients measure marginal effects
# - p-values assess statistical significance
# - R-squared shows explanatory power

# 4. Assumption checks

## 4.1 Multicollinearity
vif(mlr_model)
# VIF < 5 indicates no serious multicollinearity

## 4.2 Normality of residuals
shapiro.test(residuals(mlr_model))

## 4.3 Homoscedasticity
plot(
  fitted(mlr_model),
  residuals(mlr_model),
  main = "Residuals vs Fitted",
  xlab = "Fitted values",
  ylab = "Residuals"
)
abline(h = 0, lty = 2)

# 5. Time series (ARIMAX) model
premium_ts <- ts(data$premium, start = min(data$year), frequency = 1)

xreg <- data %>%
  select(inflation, interest, gdp_growth) %>%
  as.matrix()

arimax_model <- auto.arima(
  premium_ts,
  xreg = xreg
)

summary(arimax_model)

#Ensure model directory exist
if(!dir.exists("models")){
  dir.create("models")
}

# Save fitted models
saveRDS(mlr_model, "models/mlr_model.rds")
saveRDS(arimax_model, "models/arimax_model.rds")