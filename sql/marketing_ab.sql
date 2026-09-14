--Row / Unique Check
select
	count(*) as total_rows,
	count(distinct user_id) as unique_user
from marketing_ab
;

-- Duplicate Check
select
	user_id,
	count(*) as row_cnt
from marketing_ab
group by user_id
having count(*) > 1	

-- Null check
select
	count(*) filter(where user_id is null) as null_user,
	count(*) filter(where test_group is null) as null_test_group,
	count(*) filter(where converted is null) as null_converted,
	count(*) filter(where total_ads is null) as null_total_ads,
	count(*) filter(where most_ads_day is null) as null_most_ad_day,
	count(*) filter(where most_ads_hour is null) as null_ads_hour
from marketing_ab;
	
-- converted
select
	converted,
	count(*) as num_group
from marketing_ab
group by converted

-- test group
select
	test_group,
	count(*) as num_group
from marketing_ab
group by test_group

-- range check
select
	min(total_ads) as min_ads,
	max(total_ads) as max_ads,
	min(most_ads_hour) as min_hours_ads,
	max(most_ads_hour) as max_hours_ads
from marketing_ab

-- basic outputs each group
with basic as(
select
	test_group,
	count(*) as total_users,
	count(*) filter(where converted = true) as converted_user,
	count(*) filter(where converted = false) as non_converted
from marketing_ab
group by test_group
)
select
	test_group,
	total_users,
	converted_user,
	non_converted,
	round(converted_user::numeric / total_users * 100, 2) as conversion_rate
from basic
order by test_group;

-- absolute uplift / relative uplift
with basic as(
select
	test_group,
	count(*) as total_users,
	count(*) filter(where converted = true) as converted_user,
	count(*) filter(where converted = false) as non_converted
from marketing_ab
group by test_group
),
conversion_rate as (
select
	test_group,
	total_users,
	converted_user,
	non_converted,
	converted_user::numeric / total_users * 100 as conversion_rate
from basic
order by test_group
),
uplift as (
select
	max(case when test_group = 'ad' then conversion_rate end) as ad_conversion_rate,
	max(case when test_group = 'psa' then conversion_rate end) as psa_conversion_rate
from conversion_rate
)
select
	round(ad_conversion_rate - psa_conversion_rate	, 4) as absolute_uplift,
	round((ad_conversion_rate - psa_conversion_rate) / psa_conversion_rate * 100,4) as relative_uplift
from uplift

