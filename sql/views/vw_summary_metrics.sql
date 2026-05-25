-- View for Covid Summary Data
create view vw_summary_metrics as
select
country,
continent,
total_confirmed,
total_recovered,
total_deaths,
active_cases,
serious_or_critical,
total_tests,
population
from covid_summary_cleaned;

select * from vw_summary_metrics;
