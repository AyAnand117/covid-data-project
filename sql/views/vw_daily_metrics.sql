create view vw_daily_metrics as 
select
country,
date as dates,
active_cases,
cumulative_total_cases as total_cases,
daily_new_cases as new_cases,
cumulative_total_deaths as total_deaths,
daily_new_deaths as new_deaths
from covid_daily_cleaned;

select * from vw_daily_metrics;