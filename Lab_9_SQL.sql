SELECT
	*
FROM actor
WHERE first_name = "Scarlett";

SELECT
	*
FROM actor
WHERE last_name = "Johansson";


-- ¿Que peliculas estan disponibles para el alquiler?
SELECT COUNT(*) AS available_films
FROM film
WHERE film_id NOT IN (SELECT DISTINCT inventory.film_id FROM rental JOIN inventory ON rental.inventory_id = inventory.inventory_id);
-- Esta es una subconsulta que selecciona todos los film_id de la tabla inventory que están asociados con algún registro en la tabla rental. 
-- Utiliza una combinación (JOIN) entre las tablas rental e inventory utilizando la condición de igualdad rental.inventory_id = inventory.inventory_id. 
-- Luego, DISTINCT asegura que solo se obtengan valores únicos de film_id

-- ¿Cuantas películas han sido alquiladas?
SELECT COUNT(DISTINCT rental.inventory_id ) AS peliculas_alquiladas -- he tenido que cogr el rental.inventory_id de la JOIN de arriba
FROM rental;


-- ¿Qué peridoo de alquiler ha sido más corto y más largo?

SELECT MIN(rental_duration) AS min_rental_period, MAX(rental_duration) AS max_rental_period
FROM film;


-- ¿Que película es la más corta o más larga, nombre los valores con max_duration y min_duration?
SELECT MIN(length) AS min_duration, MAX(length) AS max_duration
FROM film;

-- ¿Cuál es la media de duración de las películas?
SELECT AVG(length) AS Duración_media_Minutos
FROM film;

-- ¿Lo mismo pero mostrado en horas minutos y segundos?
SELECT 
    CONCAT(
        FLOOR(AVG(length) / 60), 
        ' hours ', 
        AVG(length) % 60, 
        ' minutes'
    ) AS avg_duration_formatted
FROM film;

-- ¿Cuantas películas duran más de 3 horas?
SELECT COUNT(*) AS Películas_más_de_180_minutos
FROM film
WHERE length > 180; -- los 180 son los minutos

-- Cógeme el first name, last name y me cerar un email con sakilacustomer.org
SELECT 
    CONCAT(first_name, ' ', UPPER(last_name), ' - ', LOWER(CONCAT(first_name, '.', last_name, '@sakilacustomer.org'))) AS formatted_name_email
FROM customer;

-- Qué película tiene un nombre más largo
SELECT MAX(LENGTH(title)) AS Nombre_más_largo
FROM film;

SELECT title
FROM film
ORDER BY LENGTH(title) DESC
LIMIT 1;





