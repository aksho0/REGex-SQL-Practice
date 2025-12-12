use world;

show tables;

select * from city where countrycode <> 'afg';

-- in operator is used to filter the data in a spcific set of values
select * from city where countrycode in ('NLD', 'ARG');

select * from city where countrycode not in ('NLD', 'ARG');


select  * from country;

-- between operator is used to filter the data in a spcific range of values
SELECT name, continent FROM country WHERE indepyear BETWEEN 1947 AND 1990;

SELECT name, continent FROM country WHERE indepyear NOT BETWEEN 1947 AND 1990;

SELECT name, continent FROM country where indepyear = 1947;

select * from country;


-- get the code, country name where the region is not middle east
select code, name from country where region <> 'Middle East';

-- get the name, indpyear, population along with the expected 10 % increament in population
select name, indepyear, population, (population + population * 0.1) as increment_populatio from country;

-- get all the coulmns of the countries where life exptancy is 38.3 or 66.4
select * from country where LifeExpectancy in (38.3, 66.4);

-- get the name, continent, population and gnp coloumns from the table where the population is not from 5000 to 2 00 000 
select name, continent, population, gnp from country where population not between 5000 and 200000;

