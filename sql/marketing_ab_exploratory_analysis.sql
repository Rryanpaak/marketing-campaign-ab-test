-- Percentile Check
select
	percentile_cont(0.25) within group (order by total_ads) as p25,
	percentile_cont(0.50) within group (order by total_ads) as p50,
	percentile_cont(0.75) within group (order by total_ads) as p75
from marketing_ab

-- Exposure Level Analysis
with exposure as(
select
	user_id,
	converted,
	total_ads,
	case
		when total_ads <= 4 then 'Low'
		when total_ads <= 27 then 'Mid'
		else 'High'
	end as exposure_level
from marketing_ab
)
select
	exposure_level,
	count(*) as total_users,
	count(*) filter(where converted = 'true') as converted_user,
	round(count(*) filter(where converted = 'true')::numeric / count(*),4) as conversion_rate
from exposure
group by exposure_level
order by conversion_rate desc;
	
-- Conversion rate by most watched ads in a day
select
	most_ads_day,
	count(*) as total_user,
	count(*) filter(where converted = 'true') as converted_user,
	round(count(*) filter(where converted = 'true')::numeric / count(*),4) as conversion_rate
from marketing_ab
group by most_ads_day
order by conversion_rate desc;

-- Conversion rate by most watched ads in a specific time.
select
	most_ads_hour,
	count(*) as total_user,
	count(*) filter(where converted = 'true') as converted_user,
	round(count(*) filter(where converted = 'true')::numeric / count(*),4) as conversion_rate
from marketing_ab
group by most_ads_hour
order by conversion_rate desc;

