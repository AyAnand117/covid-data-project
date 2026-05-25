-- ANALYTICS SUMMARY--


select * from vw_summary_metrics;

-- Top countries by total cases

select top 10
country,
total_confirmed,
active_cases,
serious_or_critical
from vw_summary_metrics
order by total_confirmed desc;

-- Top Countries as per deaths

select top 10
country,
total_deaths,
total_tests,
population
from vw_summary_metrics
order by total_deaths desc;

-- Recovery rate

select 
country,
total_confirmed as confirmed_cases,
total_recovered as recovered_cases,
round((total_recovered/nullif(total_confirmed,0))*100, 2) as recovery_rate
from vw_summary_metrics
order by recovery_rate desc;

-- Continent with highest active cases

select
continent,
sum(active_cases) as total_active_cases
from vw_summary_metrics
group by continent
order by total_active_cases desc;

-- 