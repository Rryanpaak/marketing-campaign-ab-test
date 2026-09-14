## Marketing Campaign A/B test Analysis

## Business Problem
The business Problem   
    The business problem is that they don't know the marketing campaign is actually increasing customer conversions.
    Since the customer purchasing behavior can be influenced by many factors.
    Observing conversion result is not enough to determine the impact of advertising.

    This A/B test aims to compare the customers exposed to advertisements with the PSA group and determine
    whether advertising actually leads to a meangingful increase in conversion.


## Objectives
    To determine whether exposure to advertising significantly increase customer conversion behavior
    compared with the PSA group.

## Dataset
    The dataset contains observations from marketing A/B test
    Each row represents one user who was exposed to either the 'ad' group or 'psa' group

Key variables include:
    'user_id': unique user identifier
    'test_group': experiment group; 'ad' or 'psa'
    'converted': whether the user completed the target conversion 
    'total_ads': total number of exposed advertisements
    'most_ads_day': day when the user watched the most number of advertisements
    'most_ads_hour': hour when the user exposed to watch ads

## Primary Metrics
    conversion rate = converted user / total user

## Hypothesis
    H0: The advertisements are not increasing conversion rate compared with 'psa' group
    H1: The advertisements are increasing conversion rate compared with 'psa' group

## Data Validation
    Before analyzing the experiment result, the dataset was checked for data quality and consistency
    The validation include:
        - total row count and unique user checked
        - duplicate checked
        - missing value checked
        - valid experiment group checked
        - valid conversion value checked
        - range check for ad exposure and hour variables
        - group size distribution between 'ad' and 'psa'


## A/B test Results
    The 'ad' group achieved a higher conversion rate than the 'psa' group
    
    - Ad conversion rate: 2.55%
    - Psa conversion rate: 1.79%
    - Absolute uplift: 0.77 percentage points
    - Related uplift: 43.09%

    One-sided proportion test was conducted to test whether the Ad group had a higher conversion rate than Psa group
    The p-value was 8.53e-14 which is far below the 0.05 significance level. So the H0 Hypothesis is rejected
    This provides a statistical evidence that the Ad group had a higher conversion rate than Psa group during the experiment

## Exploratory Analysis
    Exploratory analysis performed to understand whether the conversion rate patterns differed by ad exposed level, day and hour

    ### Ad exposure level
    - Users are grouped into Low, Mid, High exposure level based on 'total_ads'
    ### Most ads day
    - Conversion rates are compared across the days on which users received the most ad exposure
    ### Most ads hour
    - Conversion rates are compared across the hours when users received the most ad exposure

## Business Interpretation
    The Ad group achieved a statistical significance improvement in conversion compared with the Psa group

    The Observed Absolute uplift was approximately 0.77 percentage points, with a relative uplift of about 43%.
    This suggests that the advertising campaign was effective on increasing conversion rate during the experiment.

    However, no predefined MDE was provided. It is not possible to determine whether the uplift is large enough to be considered practically or meaningful.
    
## Limitations
    1. Predefined MDE was not provided so It is hard to determine the Absolute uplift 0.77 is large enough to be considered or not.
    2. Expected group allocation was not described - The group scale of this dataset was unbalanced as 564,577 of ad group and 23,524 of psa group.
        and there are no pre-described group ratio, It is diffcult to know SRM.
    3. Exploratory variables are not enough - provided variables; total_ads, most_ads_day, most_ads_hour are give us to understand the analytical pattern, not the reason.
    
## Recommendation
    1. The advertising campaign showed a statiscally significance increased in conversion rate compared with Psa group.
    2. Since predefined MDE was not provided, the campaign should not be judged on statistical alone.
    
    So the company needs to evaluate whether the uplift generates sufficient incremental revenue to justify the advertising cost
    before the scailing the campaign further.

## Tools
    PostgreSQL - data validation, conversion analysis, uplift calculation and exploratory analysis
    R - proportion test and statistical significance testing
