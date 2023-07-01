/*1. */
SELECT countries.name, languages.language, languages.percentage
FROM languages
JOIN countries ON countries.id = languages.country_id
WHERE languages.language = "Slovene"
ORDER BY languages.percentage DESC;

/*2. */
SELECT countries.name, COUNT(cities.id) AS cities
FROM cities
JOIN countries 
ON countries.id = cities.country_id
GROUP BY countries.id
ORDER BY cities DESC;

/*3. */
SELECT cities.name, cities.population
FROM cities
JOIN countries ON cities.country_id = countries.id
WHERE countries.code = 'MEX'AND cities.population > '500000'  
ORDER BY population DESC;

/*4. */
SELECT countries.name, languages.language, languages.percentage
FROM countries
LEFT JOIN languages
ON countries.id = languages.country_id
WHERE percentage > 89
ORDER BY languages.percentage DESC;

/*5. */
SELECT countries.name, countries.surface_area, countries.population
FROM countries
WHERE surface_area < '501' AND population > '100000';

/*6. */
SELECT countries.name, countries.government_form, countries.capital, countries.life_expectancy
FROM countries
WHERE government_form = 'Constitutional Monarchy' AND capital > '200' AND life_expectancy > '75';    

/*7. */
SELECT countries.name, cities.name, cities.district, cities.population
FROM countries
LEFT JOIN cities
ON countries.id = cities.country_id
WHERE countries.name = 'Argentina'
AND cities.district = 'Buenos Aires'
AND cities.population > 500000;

/*8. */
SELECT countries.region, COUNT(countries.id) as number_of_countries
FROM world.countries
GROUP BY region
ORDER BY COUNT(countries.id) DESC;