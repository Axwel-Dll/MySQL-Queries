-- 1. SELECT basics

#1. Show the population of Germany.
SELECT population 
FROM world
WHERE name = 'Germany';

#2. Show the name and population for Sweden, Norway and Denmark.
SELECT name, population 
FROM world
WHERE name IN ('Sweden', 'Norway','Denmark');

#3. Show the country and area for countries with an area between 200,000 and 250,000.
SELECT name, area 
FROM world
WHERE area BETWEEN 200000 AND 250000;


-- 2. SELECT name

#1. Find the country that start with "Y".
SELECT name
FROM world
WHERE name LIKE 'Y%';

#2. Find the countries that end with "y".
SELECT name 
FROM world
WHERE name LIKE '%y';

#3. Find the countries that contain the letter "x".
SELECT name 
FROM world
WHERE name LIKE '%x%';

#4. Find the countries that end with "land".
SELECT name 
FROM world
WHERE name LIKE '%land';

#5. Find the countries that start with "C" and end with "ia".
SELECT name 
FROM world
WHERE name LIKE 'C%' AND name LIKE '%ia';

#6. Find the country that has "oo" in the name.
SELECT name 
FROM world
WHERE name LIKE '%oo%';

#7. Find the countries that have three or more "a" in the name.
SELECT name 
FROM world
WHERE name LIKE '%a%a%a%';

#8. Find the countries that have "t" as the second character.
SELECT name 
FROM world
WHERE name LIKE '_t%';

#9. Find the countries that have two "o" characters separated by two others.
SELECT name 
FROM world
WHERE name LIKE '%o__o%';

#10. Find the countries that have exactly four characters.
SELECT name 
FROM world
WHERE name LIKE '____';

#11. Find the country where the name is the capital city.
SELECT name
FROM world
WHERE name = capital;

#12. Find the country where the capital is the country plus "City".
SELECT name
FROM world
WHERE capital = CONCAT(name, ' City');

#13. Find the capital and the name where the capital includes the name of the country.
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT('%', name, '%');

#14. Find the capital and the name where the capital is an extension of name of the country.
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT(name, '_%');

#15. Show the name and the extension where the capital is an extension of name of the country. 
#(For Monaco-Ville the name is Monaco and the extension is -Ville.)
SELECT name, REPLACE(capital, name, '')
FROM world
WHERE capital LIKE CONCAT(name,'_%');