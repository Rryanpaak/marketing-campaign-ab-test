# Marketing Campaign A/B Test Analysis

## Business Problem

The business needs to know whether the marketing campaign is actually increasing customer conversions. Customer purchasing behavior can be influenced by many factors, so observing conversion results alone is not enough to determine the impact of advertising.

This A/B test compares customers who were exposed to advertisements with the PSA group to determine whether advertising leads to a meaningful increase in conversion.

## Objective

Determine whether exposure to advertising significantly increases customer conversions compared with the PSA group.

## Dataset

The dataset contains observations from a marketing A/B test. Each row represents one user who was assigned to either the `ad` group or the `psa` group.

Dataset source: [Marketing A/B Testing on Kaggle](https://www.kaggle.com/datasets/faviovaz/marketing-ab-testing)

Key variables include:

- `user_id`: Unique user identifier
- `test_group`: Experiment group, either `ad` or `psa`
- `converted`: Whether the user completed the target conversion
- `total_ads`: Total number of advertisements shown to the user
- `most_ads_day`: Day when the user saw the most advertisements
- `most_ads_hour`: Hour when the user saw the most advertisements

## Primary Metric

Conversion rate = converted users / total users

## Hypothesis

- H0: Advertisements do not increase the conversion rate compared with the PSA group.
- H1: Advertisements increase the conversion rate compared with the PSA group.

## Data Validation

Before analyzing the experiment results, the dataset was checked for data quality and consistency. The validation included:

- Total row count and unique user count
- Duplicate users
- Missing values
- Valid experiment groups
- Valid conversion values
- Ranges for ad exposure and hour variables
- Group size distribution between the Ad and PSA groups

## A/B Test Results

The Ad group achieved a higher conversion rate than the PSA group:

- Ad conversion rate: 2.55%
- PSA conversion rate: 1.79%
- Absolute uplift: approximately 0.77 percentage points
- Relative uplift: approximately 43.09%

A one-sided proportion test was used to determine whether the Ad group had a higher conversion rate than the PSA group. The p-value was approximately 8.53e-14, which is far below the 0.05 significance level. Therefore, H0 was rejected.

The Ad group had a statistically significantly higher conversion rate than the PSA group during the experiment.

## Exploratory Analysis

Exploratory analysis was performed to understand whether conversion rate patterns differed by ad exposure level, day, and hour.

### Ad exposure level

Users were grouped into Low, Mid, and High exposure levels based on `total_ads`.

### Most ads day

Conversion rates were compared across the days when users received the most ad exposure.

### Most ads hour

Conversion rates were compared across the hours when users received the most ad exposure.

These exploratory patterns are associative and should not be interpreted as causal effects.

## Business Interpretation

The Ad group achieved a statistically significant increase in conversion compared with the PSA group.

The observed absolute uplift was approximately 0.77 percentage points, with a relative uplift of approximately 43.09%. This suggests that the advertising campaign increased the conversion rate during the experiment.

However, no predefined minimum detectable effect (MDE) was provided. It is not possible to determine whether the uplift is large enough to be practically meaningful.

## Limitations

1. No predefined MDE was provided, so it is difficult to determine whether the absolute uplift of approximately 0.77 percentage points is large enough to be practically meaningful.
2. The intended Ad/PSA allocation ratio is unknown. Although the observed groups are unbalanced, with 564,577 users in the Ad group and 23,524 users in the PSA group, sample ratio mismatch (SRM) cannot be confirmed without the intended ratio.
3. The exploratory analysis of `total_ads`, `most_ads_day`, and `most_ads_hour` shows associations, not causal relationships.
4. Advertising cost and ROI data were not provided.

## Recommendation

1. The advertising campaign showed a statistically significant increase in conversion rate compared with the PSA group.
2. Because no predefined MDE was provided, the campaign should not be judged on statistical significance alone.
3. The company should evaluate whether the uplift generates enough incremental revenue to justify the advertising cost before scaling the campaign further.

## Tools

- PostgreSQL: Data validation, conversion analysis, uplift calculation, and exploratory analysis
- R: Proportion test and statistical significance testing
