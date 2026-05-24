SELECT TOP (1000) [country]
      ,[continent]
      ,[total_confirmed]
      ,[total_deaths]
      ,[total_recovered]
      ,[active_cases]
      ,[serious_or_critical]
      ,[total_cases_per_1m_population]
      ,[total_deaths_per_1m_population]
      ,[total_tests]
      ,[total_tests_per_1m_population]
      ,[population]
  FROM [Covid19_Project].[dbo].[covid_summary]

  select column_name, data_type from information_schema.columns where table_name = 'covid_summary';

  -- Top 3 continents according to death reports
  select top 3  continent,
  sum(total_deaths) as deaths
  from covid_summary
  group by continent
  order by deaths desc;


  create view covid_summary_cleaned as
  select country,
  continent,
  abs(total_confirmed) as tot_confirmed,
  abs(total_deaths) as tot_deaths,
  abs(total_recovered) as tot_recovered,
  abs(active_cases) as active_cases,
  abs(serious_or_critical) as seriousness,
  abs(total_cases_per_1m_population) as cases_per_mil,
  abs(total_deaths_per_1m_population) as deaths_per_mil,
  abs(total_tests) as tot_tests,
  abs(total_tests_per_1m_population) as tests_per_mil,
  abs(population) as population
  from covid_summary;


  select * from covid_summary_cleaned;

