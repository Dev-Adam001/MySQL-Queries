show databases;
use sakila;
show tables;
select * from actor;
select first_name from sakila.actor where

select distinct productname from classicmodels.products 
where productname like "196%";

select count(productname) from classicmodels.products 
where productname like "196%";

select  from classicmodels.products 
where productname like "196%";

select first_name, last_name from sakila.actor 
where first_name = 'Penelope';

select * from sakila.actor 
where first_name = 'Penelope';

Update sakila.actor set actor_id = '1000' 
where last_name ='pinkett'

SELECT 
    title, release_year, rental_duration
FROM
    film
WHERE
    rental_duration BETWEEN 3 AND 6
Limit 10; 

SELECT 
    title, release_year, rental_duration
FROM
    film
WHERE
    rental_duration in(3, 5)
Limit 10; 

SELECT distinct first_name, last_name
FROM
    actor
WHERE
    first_name Like 'an%'
Limit 10; 

SELECT distinct first_name, last_name
FROM
    actor
WHERE
    first_name Like '%an'
Limit 10; 

SELECT distinct first_name, last_name
FROM
    actor
WHERE
    first_name not Like 'an%'
Limit 10; 

SELECT distinct first_name, last_name
FROM
    actor
WHERE
    first_name Like '%er%'
Limit 10;  

SELECT distinct first_name, last_name
FROM
    actor
WHERE
    first_name Like 'd_n'
Limit 10;  

#ORDER BY
SELECT 
    *
FROM
    actor
ORDER BY actor_id DESC;

UPDATE actor 
SET 
    actor_id = 54
WHERE
    last_name = 'pinkett';

SELECT 
    *
FROM
    actor
WHERE
    first_name LIKE 'an%'
ORDER BY last_name asc;

#SUBQUERY
SELECT 
    *
FROM
    actor
WHERE
    actor_id IN (SELECT 
            actor_id
        FROM
            film_actor
        WHERE
            film_id = '1');
            
SELECT 
    *
FROM
    film_actor
ORDER BY film_id ASC;

#NESTED SUBQUERY
SELECT 
    *
FROM
    actor
WHERE
    actor_id IN (SELECT 
            actor_id
        FROM
            film_actor
        WHERE
            film_id = (SELECT 
                    film_id
                FROM
                    film
                WHERE
                    title = 'ACADEMY DINOSAUR'))
LIMIT 10;

select * from film;

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    CHAR_LENGTH(first_name),
    CHARACTER_LENGTH(last_name)
FROM
    actor;

select * from film;

#UNION OPERATOR
(SELECT actor_id,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    actor) UNION (SELECT film_id, 
    title
FROM
    film);

SELECT 
    COUNT(*)
FROM
    film
WHERE
    replacement_cost > 27;

SELECT last_name,
    COUNT(first_name)
FROM
    actor
GROUP BY last_name;

SELECT 
    last_name, COUNT(*)
FROM
    actor
GROUP BY last_name
HAVING COUNT(*) > 3;

select * from customer;
select * from payment;

#INNER JOIN

SELECT a.actor_id,
    CONCAT(a.first_name, ' ', last_name) AS full_name,
    COUNT(f.film_id) AS film_produced
FROM
    actor AS a
        INNER JOIN
    film_actor AS f USING (actor_id)
GROUP BY CONCAT(a.first_name, ' ', last_name)
ORDER BY COUNT(f.film_id) DESC;

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    SUM(p.amount) AS total
FROM
    payment AS p
        INNER JOIN
    customer AS c ON p.customer_id = c.customer_id
GROUP BY c.customer_id
HAVING SUM(p.amount) > 100
ORDER BY SUM(amount) DESC;

select * from film_actor;

#FULL JOIN
SELECT 
    a.actor_id,
    CONCAT(a.first_name, ' ', last_name) AS full_name,
    fi.film_id,
    f.title,
    f.description
FROM
    actor AS a
        right JOIN
    film_actor AS fi ON a.actor_id = fi.actor_id
        left JOIN
    film AS f ON f.film_id = fi.film_id
GROUP BY f.film_id order by a.actor_id;


SELECT 
    actor_id, first_name, last_name
FROM
    actor
ORDER BY first_name;

use sakila;
 
select * from payment;
select customer_id from payment;
