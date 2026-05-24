import pandas as pd
import numpy as np

# Load the datasets
daily = pd.read_csv('data/raw/worldometer_coronavirus_daily_data.csv')
summary = pd.read_csv('data/raw/worldometer_coronavirus_summary_data.csv')

# Basic checks
print(daily.head())
print(summary.head())

print(daily.info())
print(summary.info())

# Check for missing values
print(daily.isnull().sum())
print(summary.isnull().sum())

# Converting date columns to datetime format
daily['date'] = pd.to_datetime(daily['date'])

#-------- Handling missing values----------
# Covid Daily data
daily[['daily_new_cases',
    'daily_new_deaths',
    'active_cases',
    'cumulative_total_cases',
    'cumulative_total_deaths']] = daily[[
        'daily_new_cases',
        'daily_new_deaths',
        'active_cases',
        'cumulative_total_cases',
        'cumulative_total_deaths']].fillna(0)

# Covid Summary data
summary[['total_confirmed',
         'total_deaths',
         'total_recovered',
         'active_cases',
         'serious_or_critical',
         'total_cases_per_1m_population',
         'total_deaths_per_1m_population',
         'total_tests',
         'total_tests_per_1m_population',
         'population']] = summary[[
             'total_confirmed',
             'total_deaths',
             'total_recovered',
             'active_cases',
             'serious_or_critical',
             'total_cases_per_1m_population',
             'total_deaths_per_1m_population',
             'total_tests',
             'total_tests_per_1m_population',
             'population']].fillna(0)

# Found negative values in daily_new_cases and daily_new_deaths, replacing them with positive values
daily[['daily_new_cases',
        'daily_new_deaths',
        'active_cases',
        'cumulative_total_cases',
        'cumulative_total_deaths']] = daily[[
            'daily_new_cases',
            'daily_new_deaths',
            'active_cases',
            'cumulative_total_cases',
            'cumulative_total_deaths']].abs()

# Remove duplicates
daily = daily.drop_duplicates()
summary = summary.drop_duplicates()


# Death rate
summary['death_rate'] = (summary['total_deaths']/summary['total_confirmed'])*100
# Recovery rate
summary['recovery_rate'] = (summary['total_recovered']/summary['total_confirmed'])*100
# Cases per Population
summary['infection_pct'] = (summary['total_confirmed']/summary['population'])*100
# Tests rate
summary['test_rate'] = (summary['total_tests']/summary['population'])*100

# Save cleaned data
daily.to_csv('data/cleaned/covid_daily_cleaned.csv', index=False)
summary.to_csv('data/cleaned/covid_summary_cleaned.csv', index=False)

