# Loading libraries
library(tidyverse)   #data manipulation and visualization
library(lubridate)   #data handling

# 1. Import the raw data
data <- read.csv("data/insurance_data.csv")

# 2. Inspect data (structure, statistical summary)
str(data)   
summary(data)
head(data)

# 3. Rename columns (for clarity)
data <- data %>%
  rename(
    year = Year,
    premium = Insurance..premium.KES. ,
    inflation = Inflation..Rate... ,
    interest = Interest..Rate... ,
    gdp_growth = GDP.Growth.Rate...
    
  )

# 4. Fix data types
data$year <- as.integer(data$year)

# 5. Check missing values
colSums(is.na(data))   #count missing values per col

# 6. Check for outliers
boxplot(data$premium,
        main = "Distribution of Insurance Premiums")  #outliers retained as they reflect real market variations

# 7. Create derived variables
data <- data %>%
  arrange(year) %>%   #ensure correct time order
  mutate(
    log_premium = log(premium),   #stabilize variance
    premium_growth = (premium - lag(premium)) / lag(premium)  #year-on-year growth
  )

#Ensure data directory exist
if(!dir.exists("data")){
  dir.create("data")
}
# 8. save cleaned data
write.csv(data, "data/cleaned_insurance_data.csv", row.names = FALSE)
