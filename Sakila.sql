#1
SELECT address.city_id, city.city, customer.first_name, customer.last_name, customer.email, address.address
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
WHERE address.city_id = '312';

#2
SELECT film.film_id, film.title, film.description, film.release_year, film.rating, film.special_features, category.name
FROM film
JOIN film_category
ON film.film_id = film_category.film_id
JOIN category
ON film_category.category_id = category.category_id
WHERE category.name = 'Comedy'
ORDER BY film.film_id ASC;

#3
SELECT actor.actor_id, CONCAT(actor.first_name," ", actor.last_name) as actor_name, film.film_id, film.title, film.description, film.release_year
FROM actor, film
WHERE actor_id = 5;

#4
SELECT customer.store_id, address.city_id, customer.first_name, customer.last_name, customer.email, address.address
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE customer.store_id = 1
AND (address.city_id = 1
OR address.city_id = 42
OR address.city_id = 312
OR address.city_id = 459);

#5
SELECT film.title, film.description, film.release_year, film.rating, film.special_features
FROM film
JOIN film_actor ON film_actor.film_id = film.film_id
WHERE rating = 'G'
AND special_features LIKE '%Behind the Scenes%'
AND actor_id = '15';

#6
SELECT film.film_id, film.title, actor.actor_id, CONCAT(actor.first_name," ", actor.last_name) as actor_name
FROM actor
JOIN film_actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE film.film_id = '369';

#7
SELECT film.film_id, film.title, film.description, film.release_year, film.rating, film.special_features, category.name, film.rental_rate
FROM film 
JOIN film_category ON film_category.film_id=film.film_id
JOIN category ON film_category.category_id=category.category_id
WHERE category.name="Drama" AND film.rental_rate=2.99;

#8
SELECT actor.actor_id, CONCAT(actor.first_name," ", actor.last_name) as actor_name, film.title, film.description, film.release_year, film.rating, film.special_features, category.name
FROM film
JOIN film_category ON film_category.film_id = film.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN film_actor ON film_actor.film_id = film.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE category.name = 'Action' AND actor.actor_id = '23';