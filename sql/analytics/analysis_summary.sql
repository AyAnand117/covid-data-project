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

-- Countries above global average cases
with country_cases as 
(select
country,
total_confirmed as cases
from vw_summary_metrics)
select 
country, 
cases
from country_cases
where cases >
(select
round((sum(total_confirmed)/count(*)),2)
from vw_summary_metrics)
order by cases desc;

-- Top 5 ranking countries as per fatality rate

select * from vw_summary_metrics

with country_rankings as (
select
country,
total_deaths as deaths,
total_confirmed as cases,
round((total_deaths/nullif(total_confirmed,0))*100, 2) as fatality_rate,
rank() over (order by round((total_deaths/nullif(total_confirmed,0))*100, 2) desc ) as country_rank
from vw_summary_metrics)
select 
country,
deaths,
cases,
fatality_rate,
country_rank
from country_rankings
where country_rank <= 10;

-- Percentile Distribution asper
-- -> Cases
select
country,
total_confirmed as cases,
round(percent_rank() over (order by total_confirmed desc),3) as cases_percentile_rank
from vw_summary_metrics;

-- -> Deaths
select
country,
total_deaths as deaths,
round(percent_rank() over (order by total_deaths desc),3) as deaths_percentile_rank
from vw_summary_metrics;




