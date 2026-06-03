# Importing libraries

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
pd.set_option('display.max_columns',None)


daily = pd.read_csv('data/cleaned/covid_daily_cleaned.csv')

summary = pd.read_csv('data/cleaned/covid_summary_cleaned.csv')

daily['date'] = pd.to_datetime(daily['date'])

# Data overview

print("\n +++++++++++ Daily Dataset Shape +++++++++++")
print(daily.shape)

print("\n +++++++++++ Summary Dataset Shape +++++++++++")
print(summary.shape)

print('\n +++++++++++ Daily statistics ++++++++++')
print(daily.describe())

print('\n ++++++++++++ Summary statistics +++++++++++')
print(summary.describe())

# Distribution Analysis

# Daily New Cases
plt.figure(figsize=(10,6))
sns.histplot(daily['daily_new_cases'],
             bins = 50)
plt.title("Distribution of daily cases")
#plt.savefig('python/outputs/charts/daily_cases_distribution.png')
plt.show()

# The distribution of daily cases is right-skewed, with a long tail towards higher values. 
# This indicates that while most days have relatively low case counts, 
# there are occasional spikes in cases that significantly increase the average.

# Daily New Deaths
plt.figure(figsize=(10,6))
sns.histplot(daily['daily_new_deaths'],
             bins = 50)
plt.title("Distribution of daily deaths")
#plt.savefig('python/outputs/charts/daily_deaths_distribution.png')
plt.show()

# The distribution of daily deaths is right-skewed, with a long tail towards higher values. 
# This indicates that while most days have relatively low case counts, 
# there are occasional spikes in cases that significantly increase the average, just like the distribution of daily cases.

# Outliers Detection

#plt.figure(figsize = (10,6))
#sns.boxplot(x=daily['daily_new_cases'])
#plt.title("Boxplot of daily new cases")
#plt.savefig('python/outputs/charts/daily_cases_boxplot.png')
#plt.show()

# Top countries as per cases
top_countries_cases = summary.sort_values(by='total_confirmed', ascending=False).head(10)
plt.figure(figsize=(12,6))
sns.barplot(x='country', y='total_confirmed', data=top_countries_cases)
plt.title('Top 10 Countries by Total Cases')
plt.xticks(rotation=45)
plt.tight_layout()
#plt.savefig('python/outputs/charts/top_countries_cases.png')
plt.show()

# Top countries as per deaths
top_countries_deaths = summary.sort_values(by='total_deaths', ascending=False).head(10)
plt.figure(figsize=(12,6))
sns.barplot(x='country', y='total_deaths', data = top_countries_deaths)
plt.title('Top 10 countries by total deaths')
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig('python/outputs/charts/top_countries_deaths.png')
plt.show()

# Correlation Heatmap
plt.figure(figsize=(12,8))
corr = summary.select_dtypes(include='number').corr()
sns.heatmap(corr, annot = True, cmap='coolwarm')
plt.title("Correlation Heatmap")
plt.savefig('python/outputs/charts/correlation_heatmap.png')
plt.show()