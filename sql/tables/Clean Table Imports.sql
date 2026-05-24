-- Imported the cleaned csv files 

-- Verifying them

select top 10 * from covid_daily_cleaned;

select top 10 * from covid_summary_cleaned;

-- Check the table structure

sp_help covid_daily_cleaned;

sp_help covid_summary_cleaned;

-- All seemed fine


