# A/B test statistical analysis for marketing campaign
# Purpose: To compare the conversion rates between two groups: Ad and PSA

# Load the data
summary_ab <- read.csv(file.choose())

# Check the data
summary_ab
str(summary_ab)

# Extract values
ad_total <- summary_ab$total_user[summary_ab$test_group == "ad"]
ad_converted <- summary_ab$converted_user[summary_ab$test_group == "ad"]
psa_total <- summary_ab$total_user[summary_ab$test_group == "psa"]
psa_converted <- summary_ab$converted_user[summary_ab$test_group == "psa"]

# Proportion test
ab_test <- prop.test(
    x = c(ad_converted, psa_converted),
    n = c(ad_total, psa_total),
    alternative = "greater",
    correct = FALSE
)

ab_test
