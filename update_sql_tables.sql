ALTER TABLE disease
ADD COLUMN dpt_immunization_rate decimal(5,2) constraint chk_dpt_rate check (dpt_immunization_rate between 0 and 100),
ADD COLUMN hepb3_immunization_rate decimal(5,2) constraint chk_hepb3_rate check (hepb3_immunization_rate between 0 and 1),
ADD COLUMN measles_immunization_rate decimal(5,2) constraint chk_measles_rate check (measles_immunization_rate between 0 and 1),
ADD COLUMN polio_immunization_rate decimal(5,2) constraint chk_polio_rate check (polio_immunization_rate between 0 and 1),
ADD COLUMN pct_tuberculosis_detection decimal(5,2) constraint chk_tuberculosis_rate check (pct_tuberculosis_detection between 0 and 1),
ADD COLUMN tetanus_newborn_prot decimal(5,2) constraint chk_tetanus_rate check (tetanus_newborn_prot between 0 and 1);

ALTER TABLE education
RENAME COLUMN literacy_rate TO literacy_rate_adult;

ALTER TABLE education
ADD COLUMN literacy_rate_child decimal(5,2) constraint chk_literacy_rate_child check (literacy_rate_child between 0 and 1),
ADD COLUMN ratio_literate_fem_to_male decimal(5,2) constraint chk_fem_to_male check (ratio_literate_fem_to_male between 0 and 1);

ALTER TABLE nutrition
ADD COLUMN low_birthweight decimal(5,2) constraint chk_low_birthweight check (low_birthweight between 0 and 1),
ADD COLUMN anemia_child decimal(5,2) constraint chk_anemia_child check (anemia_child between 0 and 1),
ADD COLUMN severe_wasting_child decimal(5,2) constraint chk_severe_wasting_child check (severe_wasting_child between 0 and 1),
ADD COLUMN stunting_child decimal(5,2) constraint chk_stunting_child check (stunting_child between 0 and 1),
ADD COLUMN vitaminA_supplement decimal(5,2) constraint chk_vitaminA_supplement check (vitaminA_supplement between 0 and 1);

ALTER TABLE substance_abuse
RENAME COLUMN alchohol_consumption TO pct_alcohol_disorder;

ALTER TABLE substance_abuse
ADD COLUMN drug_use_death_rate decimal(5,2) constraint chk_drug_use_death_rate check (drug_use_death_rate between 0 and 1),
ADD COLUMN pct_drug_use_male decimal(5,2) constraint chk_pct_drug_use_male check (pct_drug_use_male between 0 and 1),
ADD COLUMN pct_drug_use_female decimal(5,2) constraint pct_drug_use_female check (pct_drug_use_female between 0 and 1),
ADD COLUMN death_rate_smoking numeric;

ALTER TABLE substance_abuse
ALTER COLUMN pct_drug_use TYPE decimal(5,4),
ALTER COLUMN pct_tobacco_use TYPE decimal(5,4),
ALTER COLUMN pct_alcohol_disorder TYPE decimal(5,4),
ALTER COLUMN drug_use_death_rate TYPE decimal(5,4),
ALTER COLUMN pct_drug_use_male TYPE decimal(5,4),
ALTER COLUMN pct_drug_use_female TYPE decimal(5,4);

ALTER TABLE medical_resources
ADD COLUMN births_supervised decimal(5,2) constraint chk_births_supervised check (births_supervised between 0 and 1),
ADD COLUMN contraceptive_prevalance decimal(5,2) constraint chk_contraceptive_prevalance check (contraceptive_prevalance between 0 and 1),
ADD COLUMN risk_of_maternal_death decimal(5,5) constraint pct_risk_of_maternal_death check (risk_of_maternal_death between 0 and 1),
ADD COLUMN adolescent_fertility_rate numeric,
ADD COLUMN risk_of_high_expenditure_surgical_care decimal(5,2);

ALTER TABLE medical_resources
ALTER COLUMN gov_spending TYPE decimal(7,2),
ALTER COLUMN births_supervised TYPE decimal(5,3),
ALTER COLUMN contraceptive_prevalance TYPE decimal(5,4),
ALTER COLUMN num_health_workers TYPE decimal(5,2),
ALTER COLUMN risk_of_maternal_death TYPE decimal(7,6),
ALTER COLUMN adolescent_fertility_rate TYPE decimal(6,5),
ALTER COLUMN risk_of_high_expenditure_surgical_care TYPE decimal(5,3);

ALTER TABLE employement
ADD COLUMN woman_non_agricultural decimal(5,2) constraint chk_woman_non_agricultural check (woman_non_agricultural between 0 and 1),
ADD COLUMN physicians decimal(5,4),
ADD COLUMN nurses_and_midwives decimal(5,4);

ALTER TABLE employement
ALTER COLUMN avg_hours_worked TYPE decimal(6,2); 

ALTER TABLE crime_rate
ADD COLUMN homicide_rate decimal(6,5),
ADD COLUMN corruption_perception_index int,
ADD COLUMN human_trafficking_over18_male int,
ADD COLUMN human_trafficking_over18_female int,
ADD COLUMN human_trafficking_under18_male int,
ADD COLUMN human_trafficking_under18_female int,
ALTER COLUMN crime_index TYPE decimal(5,4),
ALTER COLUMN abuse_rate TYPE decimal(6,5); 

ALTER TABLE country
ADD COLUMN population int,
ADD COLUMN gender_distribution decimal(4,1);

ALTER TABLE suiciderate
ALTER COLUMN suicide_rate TYPE decimal(4,3),
ALTER COLUMN sr_month TYPE varchar(8);

ALTER TABLE events
ALTER COLUMN event_name TYPE varchar(70),
ALTER COLUMN event_description TYPE varchar(70);

