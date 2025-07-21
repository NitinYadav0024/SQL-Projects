-- Using Aviation_project Database 
Use aviation_project;

-- Tables Contained by Database
Show Tables;

                                                -- Basic Queries 
-- Selecting All airports in USA 
SELECT name, municipality, iso_country
FROM airports
WHERE iso_country = 'US';

-- Selecting all the airlines that are Active 
Select name, country 
from airlines 
where active = 'Y';

-- Showing the 5 Longest Runways 
select airport_ident, length_ft, width_ft
from runways 
order by length_ft Desc
Limit 5;

                                    -- Aggregation & Filtering Quiries
-- Count airports per country
SELECT iso_country, COUNT(*) AS total_airports
FROM airports
GROUP BY iso_country
ORDER BY total_airports DESC;

-- No of Airports per region 
select iso_region, count(*) as Total_airports_per_region
from airports 
group by iso_region
order by Total_airports_per_region Desc;

-- Count Active vs Non active Airlines 
SELECT Active, COUNT(*) AS count
FROM airlines
GROUP BY Active;

                                             -- Queries Using Joins
-- Join airports and countries to get airport name with country name
SELECT a.name AS airport_name, c.name AS country_name
FROM airports a
JOIN countries c ON a.iso_country = c.code;

--  List runways with corresponding airport names
select r.airport_ident, a.name as Airport_names, r.length_ft, r.width_ft
from runways r 
join airports a ON r.airport_ident = a.ident;

-- Show airport frequency with airport name and type
Select f.airport_ident, f.frequency_mhz as Frequency, a.name as Airport_name 
From airport_freq f
Join airports a ON f.airport_ident = a.ident;

												-- Advanced Analysis (Real-World Insights)
-- Which country has the highest number of runways?
SELECT a.iso_country, COUNT(*) AS runway_count
FROM runways r
JOIN airports a ON r.airport_ident = a.ident
GROUP BY a.iso_country
ORDER BY runway_count DESC
LIMIT 1;

-- List of all international routes with source and destination airport names
SELECT r.`Airline`, `source airport`.name AS source_airport, da.name AS destination_airport
FROM routes r
JOIN airports sa ON r.`Source Airport ID` = sa.id
JOIN airports da ON r.`Destination Airport ID` = da.id
WHERE sa.iso_country != da.iso_country;

-- Number of unique aircraft models available
SELECT COUNT(DISTINCT Name) AS total_models
FROM planes;

-- Top 10 Busiest Source Airports (by number of routes)
SELECT 
    r.`Source Airport`, 
    a.name AS airport_name, 
    COUNT(*) AS total_routes
FROM routes r
JOIN airports a ON r.`Source Airport` = a.iata_code
GROUP BY r.`Source Airport`, a.name
ORDER BY total_routes DESC
LIMIT 10;

