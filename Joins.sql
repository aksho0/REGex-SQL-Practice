use world;

select * from country;
select * from city;
select * from countrylanguage;

-- Types of relatiom
-- 1. One to One
-- 2. One to Many
-- 3. Many to One
-- 4. Many to Many (Not recommended)

-- Realtionhip is established between 2 or more tables by using foreign key

-- Naming table Alias, same as coloumn alias 
select name, countrycode from city;
select ct.name, ct.countrycode from city as ct; -- same output as above, but recomended with databases with multiple tables

-- Joins: SQL joins are used to combine rows from two or more tables based on a related column between them. 
-- They allow you to retrieve data distributed across various tables as if they were a single result set.

-- here we have joined country and city table, they have country code and code as similar coloumns
select cnty.code, cnty.name, ct.name from city as ct 
join country as cnty 
where ct.countrycode = cnty.code;

-- Q. find the city name, population of the city along with the govt form in that city with the population from highest to the lowest 
select ct.name, ct.population, cnty.governmentform from city as ct 
join country as cnty 
where ct.countrycode = cnty.code order by ct.population desc;

-- country join countrylanguage
--  Q. get the country name, population and all the languages spoken for each country
select cnty.name, cnty.population from country as cnty 
join countrylanguage as cntylang
where cnty.code = cntylang.countrycode;

use sakila;
select * from actor; -- actor_id
select * from film_actor; -- actor_id, film_id
select * from film; -- film_id

-- Q. get the actor id and the first name along with its film id
select fa.actor_id, actor.first_name, fa.film_id from actor 
join film_actor as fa
where fa.actor_id = actor.actor_id;

-- Q. get the actor name along with the movie name he/she had done. So we have to join actor, film_actor and film table.
select actor.name, film.title from actor join film_actor join film
where actor.actor_id = film_actor.actor_id and film_actor.film_id = film.film_id; -- empty set, work on this



