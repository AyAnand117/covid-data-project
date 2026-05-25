CREATE TABLE covid_summary (
    country VARCHAR(100),
    continent VARCHAR(50),
    total_confirmed BIGINT,
    total_deaths BIGINT,
    total_recovered BIGINT,
    active_cases BIGINT,
    serious_or_critical INT,
    total_cases_per_1m_population BIGINT,
    total_deaths_per_1m_population BIGINT,
    total_tests BIGINT,
    total_tests_per_1m_population BIGINT,
    population BIGINT,
    death_rate FLOAT,
    recovery_rate FLOAT,
    infection_pct FLOAT,
    test_rate FLOAT
    );

CREATE TABLE covid_daily (
    dates DATE,
    country VARCHAR(100),
    cumulative_total_cases BIGINT,
    daily_new_cases BIGINT,
    active_cases BIGINT,
    cumulative_total_deaths BIGINT,
    daily_new_deaths BIGINT
    );
