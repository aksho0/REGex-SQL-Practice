use world;

select * from country;
select * from city;

-- get the total population of each district accroding to its country
select cnty.name, cnty.code, c.district, sum(c.population)
from city as c inner join country as cnty
where c.countrycode = cnty.code
group by cnty.name, c.district, cnty.code;

-- get the country name, region and district name along with its population
select cnty.name, cnty.region, c.district, sum(c.population)
from city as c inner join country as cnty
on c.countrycode = cnty.code
group by cnty.name, cnty.region, c.district;

select * from countrylanguage;

-- find the total population for each language spoken
select clang.language, sum(cnty.population) from countrylanguage as clang
inner join country as cnty 
on clang.countrycode = cnty.code
group by clang.language;

-- find the total population, for each language spoken whether it is official or unofficial
select clang.language, clang.isofficial, sum(cnty.population) from countrylanguage as clang
inner join country as cnty 
on clang.countrycode = cnty.code
group by clang.language, clang.isofficial
order by clang.language;

use sakila;
select * from actor;
select * from film_actor;
select * from film;

-- find the actor name and teh total no of movies the actor has worked
select concat(a.first_name, ' ', a.last_name) as name, count(fa.actor_id) from actor as a
inner join film_actor as fa
on a.actor_id = fa.actor_id
group by concat(a.first_name, ' ', a.last_name)
order by name;

-- get the name of the actor, and the rating of the film along with the average length of the movie done by each actor
select concat(a.first_name, ' ', a.last_name), f.rating, avg(f.length) from actor as a
inner join film_actor as fa 
inner join film as f
on a.actor_id = fa.actor_id and fa.film_id = f.film_id
group by concat(a.first_name, ' ', a.last_name), f.rating;