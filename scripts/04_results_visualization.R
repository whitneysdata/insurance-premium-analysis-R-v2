# Purpose:
#   - Visualize and compare ARIMAX and MLR results
#   - Model fit and residual diagnostics

rm(list = ls())

# Load libraries
library(tidyverse)
library(ggplot2)
library(forecast)
library(broom)

# Load data and models
data <- read.csv("data/cleaned_insurance_data.csv")
arimax_model <- readRDS("models/arimax_model.rds")
mlr_model <- readRDS("models/mlr_model.rds")

# 1. ACTUAL vs FITTED VALUES (MODEL COMPARISON)
data <- data %>%
  mutate(
    fitted_mlr = fitted(mlr_model),
    fitted_arimax = as.numeric(fitted(arimax_model))
  )

ggplot(data, aes(x = year)) +
  geom_line(aes(y = premium, colour = "Actual"), linewidth = 1.2) +
  geom_line(aes(y = fitted_mlr, colour = "MLR Fitted"), linewidth = 1) +
  geom_line(aes(y = fitted_arimax, colour = "ARIMAX Fitted"), linewidth = 1) +
  scale_colour_manual(
    name = "Series",
    values = c(
      "Actual" = "black",
      "MLR Fitted" = "blue",
      "ARIMAX Fitted" = "red"
    )
  ) +
  labs(
    title = "Actual vs Fitted Insurance Premiums",
    x = "Year",
    y = "Insurance Premium (KES)"
  ) +
  theme_minimal()

# Interpretation:
# Closer alignment indicates better model fit over time.


# 2. MLR RESIDUALS vs FITTED VALUES
ggplot(data, aes(x = fitted_mlr, y = residuals(mlr_model))) +
  geom_point(color = "darkblue", size = 2) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  labs(
    title = "MLR Residuals vs Fitted Values",
    x = "Fitted Values",
    y = "Residuals"
  ) +
  theme_minimal()


# 3. ARIMAX RESIDUAL DIAGNOSTICS
checkresiduals(arimax_model)

# 4. OBSERVED vs PREDICTED (MLR)
ggplot(data, aes(x = premium, y = fitted_mlr)) +
  geom_point(color = "steelblue", size = 2) +
  geom_abline(
    slope = 1,
    intercept = 0,
    linetype = "dashed",
    color = "firebrick",
    linewidth = 1
  ) +
  labs(
    title = "Observed vs Predicted Premiums (MLR)",
    x = "Observed Premium (KES)",
    y = "Predicted Premium (KES)"
  ) +
  theme_minimal()


# 5. MLR COEFFICIENT ESTIMATES (WITH UNCERTAINTY)
coef_df <- tidy(mlr_model)   #from broom package

ggplot(coef_df, aes(x = term, y = estimate)) +
  geom_point(color = "purple", size = 3) +
  geom_errorbar(
    aes(
      ymin = estimate - std.error,
      ymax = estimate + std.error
    ),
    width = 0.2,
    color = "gray40"
  ) +
  labs(
    title = "MLR Coefficient Estimates with Standard Errors",
    x = "Predictor",
    y = "Coefficient Estimate"
  ) +
  theme_minimal()