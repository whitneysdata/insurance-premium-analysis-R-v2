# Install required packages for the project

required_packages <- c(
  "tidyverse",
  "lubridate",
  "ggplot2",
  "rlang",
  "vctrs",
  "car",
  "forecast",
  "broom"
)

installed_packages <- rownames(installed.packages())

for (pkg in required_packages) {
  if (!pkg %in% installed_packages) {
    install.packages(pkg)
  }
}