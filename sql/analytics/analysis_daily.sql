-- ANALYTICS --
select * from vw_country_daily_metrics;

-- Top 10 countries in terms of cases
select top 10 
country,
max(global_total_cases) as highest_cases
from vw_country_daily_metrics
group by country
order by highest_cases desc;

-- Highest death percentages

select top 10
country,
global_total_deaths as deaths,
global_total_cases as cases,
round((global_total_deaths/global_total_cases)*100, 2) as death_pct
from vw_country_daily_metrics
order by death_pct desc;

-- Daily Global Cases

select
dates,
sum(new_cases) as global_cases
from vw_daily_metrics
group by dates
order by dates;

-- Countries with cases more than 1 million

with country_cases as (
select
country,
max(total_cases) as highest_cases
from vw_daily_metrics
group by country )
select * from country_cases
where highest_cases > 1000000
order by highest_cases desc;

-- Country ranking

select
country,
max(total_cases) as total_cases,
rank() over(order by max(total_cases) desc ) as case_rank
from vw_daily_metrics
group by country;

-- Running total 

select
country,
dates,
new_cases,
sum(new_cases) over (partition by country order by dates) as running_total
from vw_daily_metrics;

-- Moving Averages

with moving_avg as
(select 
country,
dates,
new_cases,
avg(new_cases) over (partition by country order by dates rows between 6 preceding and current row) as moving_avg_7d
from vw_daily_metrics)
select country, dates, new_cases, round(moving_avg_7d,2) as moving_avg_7d
from moving_avg;
