use Covid19_Project;
select top 10 * from covid_daily_cleaned;

create view vw_country_daily_metrics as
select
country,
max(cumulative_total_cases) as global_total_cases,
sum(daily_new_cases) as global_new_cases,
max(cumulative_total_deaths) as global_total_deaths,
max(active_cases) as global_active_cases,
sum(daily_new_deaths) as global_new_deaths
from covid_daily_cleaned
group by country;

select * from vw_country_daily_metrics;