-- Subquery is a query within a qurry
-- ALso called nested/inner query

-- The inner query is always enclosed with parenthese and executed before the outer query

-- Types of subquery :- 
-- 1. Single-Row : Returns exactly one row and (usually) one value.
-- 					Used with operators like =, <, >, <=, >=.
-- 2. Multi Row one coloumn : Returns more than one row.
-- 						Used with IN, ANY, ALL.
-- 3. Multi Row mutiple column : Returns multiple columns.
-- 						Useful for matching tuples.
-- 4. Correlated : Subquery depends on the outer query.
-- 				Runs per row, which is great for tanking performance.


-- ----------------Single-Row Subquery Practice Questions -------------------
use sakila;
select * from payment;

-- get all the payment datails with minimum payment id
select * from payment where payment_id = (select min(payment_id) from payment);

-- get all the payment info with the highest rental_id
select * from payment where rental_id = (select max(rental_id) from payment);

-- get all the payment info for the earliest payment_date
select * from payment where payment_date = (select min(payment_date) from payment);

-- select all the payment info where the amount is same as of payment id 5
select * from payment where amount = (select amount from payment where payment_id = 5);

-- select all the payment info where the amount is greater than the avg amount of payment table
select * from payment where amount > (select avg(amount) from payment);

-- get all the payment info where the amount is greater than the max amount of customer id 1
select * from payment where amount > (select max(amount) from payment where customer_id = 1);

-- find the payment id, staff id and amount only for the payment where the month is equal to month of payment id 4
select payment_id, staff_id, amount, payment_date from payment where month(payment_date) = (select month(payment_date) from payment where payment_id = 4);

-- get the highest payment id form the payment table where the amount is same as of payment id 11 and customer id 1
select max(payment_id) from payment where amount = (select amount from payment where payment_id = 11 and customer_id = 1);

-- get all the country name whose population is equal to the highest population of Europe
select * from country where population = (select max(population) from country where continent = 'Europe');


-- ------------Multi-Row Subqeury practice quesions -------------------

select * from payment where amount in (select amount from payment where payment_id = 3 or payment_id = 6);

-- get all payment info where the customer_id is same as the customer id of payment id 3 or 6
select * from payment where customer_id in (select customer_id from payment where customer_id = 3 or customer_id = 6);
-- same query can be written with 'any' keyword
select * from payment where customer_id = any (select customer_id from payment where customer_id = 3 or customer_id = 6);

-- get all the payment info where the amount is greater than any amount of payment id 1 and 3
select * from payment where amount > any (select amount from payment where payment_id = 1 or payment_id = 3);

-- get all the payment info where the amount is greater amoung all the payment of customer id 1 
select * from payment where amount > all (select amount from payment where customer_id = 1);

use world;
select * from country;

-- get all the info where region is same as of all the regions of Europe
select * from country where region = any (select region from country where continent = 'Europe');

-- get all the country info whose population is greater among all the population of Africa
select * from country where population > all(select population from country where continent = 'Africa');

-- -------------------- Corelated Sub Querry Practice Question ---------------

use regex2;

-- get employee info of those whose salary is greater than the average salary of their dept
select * from employee as e where salary > (select avg(salary) from employee where dept = e.dept);

-- get the highest paid employee from their deptatment
select * from employee as e where salary = (select max(salary) from employee where dept = e.dept);

-- get the highest paid employee from their deptatment
select * from employee as e where salary = (select min(salary) from employee where dept = e.dept);

-- Employee who earn more than atleast one employee in thier dept
select * from employee as e where salary > any (select salary from employee where dept = e.dept);