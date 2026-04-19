create database rmd;
use rmd;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2)
);


INSERT INTO customers VALUES
(1, 'John', 'New York'),
(2, 'Alice', 'Los Angeles'),
(3, 'Bob', 'Chicago'),
(4, 'Emma', 'Houston'),
(5, 'Michael', 'Phoenix'),
(6, 'Sophia', 'Dallas'),
(7, 'David', 'Seattle'),
(8, 'Olivia', 'Boston'),
(9, 'James', 'Denver'),
(10, 'Isabella', 'Miami');


INSERT INTO orders VALUES
(101, 1, 250.00),
(102, 2, 300.00),
(103, 1, 150.00),
(104, 3, 400.00),
(105, 5, 500.00),
(106, 7, 700.00),
(107, 7, 200.00),
(108, 9, 350.00),
(109, 11, 600.00),  -- No matching customer
(110, 12, 800.00);  -- No matching customer

select * from customers;
select * from orders;

CREATE TABLE employees (
    eid INT PRIMARY KEY,
    ename VARCHAR(100),
    salary DECIMAL(10,2),
    manager_id INT
);



INSERT INTO employees VALUES
(1, 'John', 90000, NULL),   -- Top-level manager (CEO)
(2, 'Alice', 75000, 1),
(3, 'Bob', 70000, 1),
(4, 'Emma', 65000, 2),
(5, 'Michael', 60000, 2),
(6, 'Sophia', 62000, 2),
(7, 'David', 58000, 3),
(8, 'Olivia', 55000, 3),
(9, 'James', 50000, 4),
(10, 'Isabella', 52000, 4);


select * from employees;

-- 1. Inner Join : Returns the common rows 
select cs.customer_id, cs.name, ods.order_id, ods.order_amount from customers as cs
inner join orders as ods
on cs.customer_id = ods.customer_id;

-- 2. Left Outer Join : Returns the uniuqe elements from left table
select cs.customer_id, cs.name, ods.order_id, ods.order_amount from customers as cs
left join orders as ods
on cs.customer_id = ods.customer_id;

-- 3. Right Outer Join : Returns the uniuqe elements from right table
select cs.customer_id, cs.name, ods.order_id, ods.order_amount from customers as cs
right join orders as ods
on cs.customer_id = ods.customer_id;


-- Q Find those cutomers that never oredered anything
select cs.customer_id, cs.name, ods.order_id, ods.order_amount from customers as cs
left join orders as ods
on cs.customer_id = ods.customer_id
where ods.order_id is null; -- bz null is a state that's why we can not compare it like other values with =, we have to use is

-- Q Find the total amount for the orders placed by the customers
select cs.name, sum(ods.order_amount) from customers as cs
inner join orders as ods
on cs.customer_id = ods.customer_id
group by cs.name;

-- Q Get the total no of orders which are not placed by the customers
select count(ods.order_id) from customers as cs
right join orders as ods
on cs.customer_id = ods.customer_id
where cs.customer_id is null;

-- Q Get the total amount spent and the average amount spent for the orders placed by customers id 3 and after that 
select sum(ods.order_amount), avg(ods.order_amount) from customers as cs
inner join orders as ods
on cs.customer_id = ods.customer_id
where cs.customer_id >= 3;

-- 4. Self Join : A self join is a regular JOIN operation that joins a table to itself, 
-- 			treating the single table as two separate entities. 
-- 			This technique is used to compare or combine rows within the same table, 
-- 			particularly for handling hierarchical data or identifying relationships among related records. 

-- Example:  
select e.eid, e.ename, e.manager_id, m.ename from employees as e
join employees as m
where e.manager_id = m.eid;

-- 5. Cross/Cartesian Join : This means that every row from the first table is combined with every row from the second table, 
-- 						creating all possible combinations of rows (m x n).
select * from customers cross join orders;

-- 6. Natural Join : works as inner join, it automatically join two or more tables according to the common coloum name
-- 					if there is no common coloumn name then  it acts as cross join
-- 					even when the coloumn is foreign key, if name doesn't match, it will not work properly
select * from customers natural join orders;