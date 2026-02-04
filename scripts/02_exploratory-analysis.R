# NOTE:
# Exploratory analysis is descriptive, about seeing not proving.
# Observed relationships do not imply causation.
# Formal inference is conducted in the modelling stage.

rm(list = ls())  #clean environment

# Load libraries
library(ggplot2)

# 1. Load cleaned data
data <- read.csv("data/cleaned_insurance_data.csv")

# 2. Overview of the data
summary(data)   # quick statistical summary

# 3. Trend of insurance premiums over time
ggplot(data, aes(x = year, y = premium)) +
  geom_line() +
  labs(
    title = "Trend of Insurance Premiums Over Time",
    x = "Year",
    y = "Insurance Premium"
  )


# 4. Relationship of premiums with macroeconomic variables

## Inflation vs Premium
ggplot(data, aes(x = inflation, y = premium)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Insurance Premium vs Inflation Rate",
    x = "Inflation Rate",
    y = "Insurance Premium"
  )

## Interest Rate vs Premium
ggplot(data, aes(x = interest, y = premium)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Insurance Premium vs Interest Rate",
    x = "Interest Rate",
    y = "Insurance Premium"
  )

## GDP Growth vs Premium
ggplot(data, aes(x = gdp_growth, y = premium)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Insurance Premium vs GDP Growth",
    x = "GDP Growth",
    y = "Insurance Premium"
  )


# 5. Correlation check
cor(data[, c("premium", "inflation", "interest", "gdp_growth")])