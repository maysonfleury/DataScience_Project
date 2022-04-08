-- DRILLDOWN query

SELECT SR.sr_year, SR.suicide_rate, C.country_name, C.continent 
from suiciderate as SR, country as C
where SR.countrykey = C.country_key 
and SR.sr_year between 2005 and 2015
group by (SR.sr_year, SR.suicide_rate, C.country_name, C.continent)
order by C.country_name, C.continent

-- ROLLUP query

SELECT round(avg(SR.suicide_rate),4), c.country_name
from suiciderate as SR, country as C
where SR.countrykey = C.country_key
and SR.sr_year between 2009 and 2019
group by (c.country_name)
order by (c.country_name)

-- SLICE query

SELECT C.country_name, SR.suicide_rate, SR.sr_year
from suiciderate as SR, country as C
where SR.countrykey = C.country_key
and C.country_name = 'Canada'
group by (C.country_name, SR.suicide_rate, SR.sr_year)
order by (SR.sr_year)

-- DICE queries (2 total)

SELECT SR.sr_year, SR.suicide_rate, C.country_name, D.literacy_rate_adult, E.avg_salary
from suiciderate as SR, country as C, education as D, employement as E
where SR.countrykey = C.country_key and SR.educationkey = D.education_key and SR.employementkey = E.employement_key
and C.country_name in ('Mexico','Canada') and SR.sr_year between 2010 and 2015 and avg_salary IS NOT NULL 
group by (SR.sr_year, SR.suicide_rate, C.country_name, D.literacy_rate_adult, E.avg_salary)
order by (C.country_name)

SELECT SR.sr_year, SR.suicide_rate, C.country_name, CR.homicide_rate, M.gov_spending, N.pct_undernourished
from suiciderate as SR, country as C, crime_rate as CR, medical_resources as M, nutrition as N
where SR.countrykey = C.country_key and SR.crimekey = CR.crime_key and SR.medicalkey = M.medical_key and SR.nutritionkey = N.nutrition_key
and C.country_name in ('Mexico','Canada','Sri Lanka') and SR.sr_year between 2005 and 2010 and gov_spending IS NOT NULL and pct_undernourished IS NOT NULL
group by (SR.sr_year, SR.suicide_rate, C.country_name, CR.homicide_rate, M.gov_spending, N.pct_undernourished)
order by (SR.suicide_rate)

-- Combining OLAP queries (4 total)

-- rollup and slice
SELECT round(avg(SR.suicide_rate),4), round(avg(E.avg_hours_worked),0), round(avg(D.literacy_rate_adult),3), c.country_name
from suiciderate as SR, country as C, education as D, employement as E
where SR.countrykey = C.country_key and SR.educationkey = D.education_key and SR.employementkey = E.employement_key
and C.country_name = 'Canada' and SR.sr_year between 2009 and 2019
group by (c.country_name)
order by (c.country_name)

-- rollup and dice
SELECT round(avg(SR.suicide_rate),4), round(avg(M.births_supervised),3), round(avg(D.literacy_rate_adult),3), c.country_name
from suiciderate as SR, country as C, education as D, medical_resources as M
where SR.countrykey = C.country_key and SR.educationkey = D.education_key and SR.medicalkey = M.medical_key
and D.literacy_rate_adult < 0.99 and C.continent != 'North America' and SR.sr_year between 2009 and 2019 
group by (c.country_name)
order by (c.country_name)

-- drilldown and slice
SELECT SR.sr_year, SR.suicide_rate, CR.homicide_rate, CR.abuse_rate, M.gov_spending, C.country_name, C.continent 
from suiciderate as SR, country as C, crime_rate as CR, medical_resources as M
where SR.countrykey = C.country_key and SR.crimekey = CR.crime_key and SR.medicalkey = M.medical_key
and C.continent = 'North America' and homicide_rate IS NOT NULL and abuse_rate IS NOT NULL
group by (SR.sr_year, SR.suicide_rate, CR.homicide_rate, CR.abuse_rate, M.gov_spending, C.country_name, C.continent )
order by C.country_name, C.continent

-- drilldown and dice
SELECT SR.sr_year, SR.suicide_rate, CR.homicide_rate, CR.abuse_rate, M.gov_spending, C.country_name, C.continent 
from suiciderate as SR, country as C, crime_rate as CR, medical_resources as M
where SR.countrykey = C.country_key and SR.crimekey = CR.crime_key and SR.medicalkey = M.medical_key
and homicide_rate > 0.015 and C.country_name in ('Mexico','Canada','Sri Lanka') and SR.sr_year between 2005 and 2015 
group by (SR.sr_year, SR.suicide_rate, CR.homicide_rate, CR.abuse_rate, M.gov_spending, C.country_name, C.continent )
order by C.country_name, C.continent

-- Iceberg query
SELECT SR.suicide_rate, SR.sr_year, C.country_name
from suiciderate as SR, country as C
where SR.countrykey = C.country_key and SR.suicide_rate IS NOT NULL
order by SR.suicide_rate desc
limit 5

-- Windowing query (second one takes average of the 2 and averages the years)
SELECT D.literacy_rate_adult, D.literacy_rate_child, C.country_name, SR.sr_year
from suiciderate as SR, education as D, country as C
where SR.educationkey = D.education_key and SR.countrykey = C.country_key
and SR.sr_year between 2016 and 2020
group by (D.literacy_rate_adult, D.literacy_rate_child, C.country_name, SR.sr_year)
order by (D.literacy_rate_adult) desc

SELECT round((avg(D.literacy_rate_adult) + (avg(D.literacy_rate_child))) / 2.0, 2) as average , C.country_name
from suiciderate as SR, education as D, country as C
where SR.educationkey = D.education_key and SR.countrykey = C.country_key
and SR.sr_year between 2016 and 2020 and literacy_rate_adult IS NOT NULL and literacy_rate_child IS NOT NULL
group by (C.country_name)
order by (average) desc

-- Window clause
SELECT SR.suicide_rate, SR.sr_year, C.country_name
from suiciderate as SR, country as C
where SR.countrykey = C.country_key and SR.suicide_rate IS NOT NULL
and C.country_name = 'Canada' and SR.sr_year between 2017 and 2019