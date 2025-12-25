use world;
select * from country;

-- Aggregate funtions works on rows. If aggregate functions are used then we can not access a coloumn normallly without aggregate or group by

-- 1. COUNT() : count the number of rows in a column
--       NOTE : COUNT(*) will count the null rows as well

select count(name) from country;

-- DISTINCT : this keyword is used to get the distict rows from a coloumn, it will count the similar values only once
select count(distinct continent) from country;
select count(continent) from country;


-- 2. AVG() : returns the average, used with numerical coloumn
select avg(population) from country;


-- 3. SUM() : retuns the submission of the numericl values of the coloumn
select sum(population) from country;


-- Practice Questions -

-- get the total country, avg surface area, total population for the countries which has got their independencce from the year 1947 to 1998(eclusive)
select count(name), avg(surfacearea), sum(population) from country where indepyear between 1948 and 1997;

-- get the total no of countries and the number of unique continent along with the avgrage population and the total no of capital for the countries strating with a or d 
select count(distinct continent), count(name), avg(population), sum(capital) from country where name like 'a%' or 'd%';


-- GROUP BY : used to group rows that have the same values in specified columns into summary rows,
--            it is used with aggregate functions but on those coloumns which are noramlly accessed 

select count(name), continent from country group by continent;


-- HAVING : this clause is used to filter those groups based on conditions involving aggregate functions. 
--          it is used with those coloumns with aggregate function 


-- Practice Questions

-- get the total countries for each govt firm where the total no of capital should be > than 30
select count(name), governmentform from country where capital > 30 group by governmentform;

-- get the total countries fro each govt firm only for the countries having their capital > 30 and total population > 3 00 000
select count(name), governmentform from country where capital > 30 group by governmentform having sum(population) > 30;














