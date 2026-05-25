-- View for fatility rate

create view vw_fatality_rate as
select 
country,
total_confirmed as cases,
total_deaths as deaths,
serious_or_critical as criticality,
round((total_deaths/nullif(total_confirmed,0))*100,2) as fatality_rate
from covid_summary_cleaned;

select * from vw_fatality_rate
order by fatality_rate desc;