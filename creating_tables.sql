CREATE TABLE employement (
    Employement_Key int NOT NULL PRIMARY KEY,
    unemployement_rate decimal(5,2) constraint chk_unemployement_rate check (unemployement_rate between 0 and 1),
    /* monthly */
    avg_hours_worked int,
    avg_salary int
)

CREATE TABLE education (
    Education_Key int NOT NULL PRIMARY KEY,
    enrolment_rate decimal(5,2) constraint chk_enrolment_rate check (enrolment_rate between 0 and 1),
    dropout_rate decimal(5,2) constraint chk_dropout_rate check (dropout_rate between 0 and 1),
    literacy_rate decimal(5,2) constraint chk_literacy_rate check (literacy_rate between 0 and 1),
    /* monthly */
    spending_on_edu int
)

CREATE TABLE disease (
    Disease_Key int NOT NULL PRIMARY KEY,
    aids_rate decimal(5,2) constraint chk_aids_rate check (aids_rate between 0 and 1),
    covid_infection_rate decimal(5,2) constraint chk_covid_infection_rate check (covid_infection_rate between 0 and 1),
    covid_death_rate decimal(5,2) constraint chk_covid_death_rate check (covid_infection_rate between 0 and 1),
    covid_immunization_rate decimal(5,2) constraint chk_covid_immunization_rate check (covid_immunization_rate between 0 and 1)
)

CREATE TABLE medical_resources (
    Medical_Key int NOT NULL PRIMARY KEY,
    /* # of health workers per 1000 people */
    num_health_workers int,
    gov_spending int
)

CREATE TABLE nutrition (
    Nutrition_Key int NOT NULL PRIMARY KEY,
    pct_undernourished decimal(5,2) constraint chk_pct_undernourished check (pct_undernourished between 0 and 1),
    pct_overweight decimal(5,2) constraint chk_pct_overweight check (pct_overweight between 0 and 1)
)

CREATE TABLE substance_abuse (
    Substance_Key int NOT NULL PRIMARY KEY,
    pct_drug_use decimal(5,2) constraint chk_pct_drug_use check (pct_drug_use between 0 and 1),
    pct_tobacco_use decimal(5,2) constraint chk_pct_tobacco_use check (pct_tobacco_use between 0 and 1),
    alchohol_consumption int
)

CREATE TABLE crime_rate (
    Crime_Key int NOT NULL PRIMARY KEY,
    crime_index decimal(5,2) constraint chk_crime_index check (crime_index between 0 and 1),
    abuse_rate decimal(5,2) constraint chk_abuse_rate check (abuse_rate between 0 and 1)
)

CREATE TABLE country (
    Country_Key int NOT NULL PRIMARY KEY,
    country_name varchar(30),    
    continent varchar(15)
)

CREATE TABLE demographics (
    Demographics_Key int NOT NULL PRIMARY KEY,
    population int,
    /* male/female to other */
    gender_distribution decimal(5,2) constraint chk_gender_distribution check (gender_distribution between 0 and 1)
)

CREATE TABLE events (
    Event_Key int NOT NULL PRIMARY KEY,
    event_name varchar(50),
    event_description varchar(300),
    start_date date,
    end_date date
)

CREATE TABLE suiciderate (
    EmployementKey int references employement(Employement_Key),
    EducationKey int references education(Education_Key),
    DiseaseKey int references disease(Disease_Key),
    MedicalKey int references medical_resources(Medical_Key),
    NutritionKey int references nutrition(Nutrition_Key),
    SubstanceKey int references substance_abuse(Substance_Key),
    CrimeKey int references crime_rate(Crime_Key),
    CountryKey int references country(Country_Key),
    sr_year int,
    sr_month varchar(5),
    average_age smallint,
    /* suicide rate per 100k */
    suicide_rate decimal(5,2) constraint chk_suicide_rate check (suicide_rate between 0 and 1)
)