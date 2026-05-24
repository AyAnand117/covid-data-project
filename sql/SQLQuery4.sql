SELECT TOP (1000) [date]
      ,[country]
      ,[cumulative_total_cases]
      ,[daily_new_cases]
      ,[active_cases]
      ,[cumulative_total_deaths]
      ,[daily_new_deaths]
  FROM [Covid19_Project].[dbo].[covid_daily]

create view covid_daily_cleaned as
select [date], country,
abs(cumulative_total_cases) as total_cases,
abs(daily_new_cases) as new_cases,
abs(active_cases) as active_cases,
abs(cumulative_total_deaths) as total_deaths,
abs(daily_new_deaths) as new_deaths
from covid_daily;

-- Top 10 countries as per number of cases
select top 10
country, max(total_cases) as highest_cases
from covid_daily_cleaned
group by country
order by highest_cases desc;

-- Top 10 countries as per number of deaths
select top 10 
country, 
max(total_deaths) as highest_deaths
from covid_daily_cleaned
group by country
order by highest_deaths desc;

-- Top 20 countries as per death percentage
select top 20
country,
sum(total_cases) as cases,
sum(total_deaths) as deaths,
round((cast(sum(total_deaths) as float)/nullif(sum(total_cases),0))*100, 2) as death_pct
from covid_daily_cleaned
group by country
order by death_pct desc;



