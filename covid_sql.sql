CREATE DATABASE covid19;
USE covid19;
show tables;
select * from ecdc_covid_19;
ALTER TABLE ecdc_covid_19 RENAME to covid_19;
select * from covid_19;

-- ARITHMETIC OPERATORS
select year,month,countriesAndTerritories from covid_19 WHERE deaths>10;
select cases,deaths,countriesAndTerritories from covid_19;
select * from covid_19 where cases>2000;
select * from covid_19 where countryterritoryCode="CHN";
select day,month,year,countriesAndTerritories from covid_19 where geoId IN("CN","AF","AD","AR");

-- LOGICAL OPERATORS
select * from covid_19 where cases>2000 AND deaths>1000;
select * from covid_19 where countriesAndTerritories="France" OR countriesAndTerritories="Brazil";
select * from covid_19 where not month=8;

-- SPECIAL OPERATORS
select * from covid_19 where countriesAndTerritories IN("armenia","bahamas","Brazil");
select * from covid_19 where countryterritoryCode NOT IN("afg","bra");
select * from covid_19 where deaths between 1000 and 2000;
select * from covid_19 where cases NOT BETWEEN 2000 and 3000;
select * from covid_19 where countryterritoryCode is NULL;
select * from covid_19 where geoId is NULL;
select * from covid_19 where geoId IS NOT NULL;
select * from covid_19 where countriesAndTerritories LIKE "B%";
select * from covid_19 where countriesAndTerritories LIKE "%a%";
select * from covid_19 where countriesAndTerritories LIKE "b_%";
select * from covid_19 where countriesAndTerritories LIKE "f__%";
select * from covid_19 where countriesAndTerritories NOT LIKE "b_%";
select countriesAndTerritories AS "Country",popData2018 AS "Population" from covid_19;
select DISTINCT year,month from covid_19;
select DISTINCT countriesAndTerritories from covid_19;

-- STRING FUNCTIONS
SELECT COUNT(*) FROM COVID_19;
select countriesAndTerritories,lower(countriesAndTerritories)as updated_country from covid_19;
select countriesAndTerritories,upper(countriesAndTerritories) as upper_country from covid_19;
select count(countriesAndTerritories) as count from covid_19;
select count(DISTINCT countriesAndTerritories) as unique_count from covid_19;

-- AGGREGATE FUNCTIONS
select max(cases) from covid_19;
select min(cases) from covid_19;
select sum(cases) as total_cases from covid_19;
select avg(cases) as average_cases from covid_19;
select max(deaths) from covid_19;
select min(deaths) from covid_19;
select sum(deaths) as total_deaths from covid_19;
select avg(deaths) as average_deaths from covid_19;

select * from covid_19 limit 10;

select * from covid_19 ORDER BY cases desc;
select * from covid_19 ORDER BY cases asc;
select * from covid_19 ORDER BY deaths desc;
select * from covid_19 ORDER BY deaths asc;
select * from covid_19 where geoId="BR" ORDER BY deaths desc;

select dateRep,year,cases,deaths,countriesAndTerritories,
case
when cases>1500
then "Very Critical"
when cases BETWEEN 1000 and 1500
then "Critical"
when cases BETWEEN 500 and 1000
then "Moderate"
else
"Low, Be Aware"
end
as country_stage
from covid_19;

select month,count(cases),count(deaths) from covid_19 GROUP BY month;
select countriesAndTerritories,sum(cases),sum(deaths) from covid_19 GROUP BY countriesAndTerritories;
select countriesAndTerritories,avg(popData2018) from covid_19 GROUP BY countriesAndTerritories;


select countriesAndTerritories,monthname(dateRep) from covid_19;

select monthname(dateRep) month_name,avg(cases)as average_cases from covid_19 GROUP BY month_name HAVING average_cases>100;

select countriesAndTerritories,sum(deaths)as death_total from covid_19 GROUP BY countriesAndTerritories HAVING death_total>500 ORDER BY death_total desc;
select countriesAndTerritories,sum(cases)as total_cases from covid_19 GROUP BY countriesAndTerritories HAVING total_cases>1000 ORDER BY total_cases desc;
select monthname(dateRep) month_name,countriesAndTerritories,sum(cases) from covid_19 GROUP BY countriesAndTerritories,month_name HAVING sum(cases)>1000 ORDER BY month_name desc;
