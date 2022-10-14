-- Lab | SQL Join (Part I)

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
USE sakila;
SELECT * FROM category;
SELECT cat.name, COUNT(f.film_id) as "n_movies"
FROM sakila.category cat
INNER JOIN sakila.film_category f
ON cat.category_id = f.category_id
GROUP BY cat.name
ORDER BY 'n_movies' DESC;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT staff_id, round(SUM(amount),2) AS total_amount
FROM sakila.payment
WHERE payment_date LIKE '%2005-08%'
GROUP BY staff_id;

-- 3. Which actor has appeared in the most films?
SELECT CONCAT(a.first_name,' ', a.last_name) AS 'Name', COUNT(f.film_id) as "n_movies"
FROM sakila.actor a
INNER JOIN sakila.film_actor f
ON a.actor_id = f.actor_id
ORDER BY 'n_movies' DESC
limit 1;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT * FROM rental;
SELECT rental.customer_id AS 'Most_active_customer', COUNT(DISTINCT rental_id) as "n_rents"
FROM sakila.rental
ORDER BY 'n_rents' DESC
limit 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address, a.address2, a.district, a.city_id, a.postal_code, c.city FROM sakila.staff AS s
INNER JOIN sakila.address AS a
ON s.address_id = a.address_id
INNER JOIN sakila.city AS c
ON c.city_id=a.city_id;

-- 6. List each film and the number of actors who are listed for that film.
USE sakila
SELECT film_actor.actor_id, film.title, COUNT(film_actor.actor_id) AS "n_actors" FROM film_actor
INNER JOIN film
ON film_actor.film_id = film.film_id
GROUP BY film.title
ORDER BY 'n_actors' DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT * FROM payment;
SELECT p.customer_id, c.last_name, round(SUM(p.amount),2) AS total_paid
FROM sakila.payment AS p
INNER JOIN customer as c
ON p.customer_id = c.customer_id
GROUP BY customer_id
ORDER BY c.last_name ASC;


