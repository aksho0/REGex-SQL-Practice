use regex2;

select * from employee;

-- ------------------------- Windows functions-------------------- 
-- Window functions in MySQL are basically SQL’s way of doing analytics on rows without collapsing them. 
-- In plain terms: you calculate values across a group of rows (a “window”) but still keep every row in the result.

-- Regular aggregate functions like SUM() or AVG() smash rows together with GROUP BY. 
-- Window functions keep the rows intact and just attach extra computed values. Think of it as analysis layered on top of the dataset.

-- ---------Syntax------------
-- function_name() OVER (
--    PARTITION BY column
--    ORDER BY column
-- )

-- 1. over() : defines the window of rows used for the calculation for each row.
-- The function uses the entire table as the window.
select e.*, 
max(salary) over() as max_sal -- this will create a new coloumn with a single window where the max salary will be shown
from employee as e; 

-- 2. over(partition by col) : This splits the table into groups, then the function runs inside each group.
select e.*, 
max(salary) over(partition by e.dept) as max_sal -- this will create a new coloumn with multiple windows where the max salary will be shown
from employee as e; 

-- 3. over(order by col) : Defines the order of rows, which enables things like running totals.
select e.*, 
max(salary) over(partition by e.dept order by eid) as max_sal -- this will create a new coloumn with multiple windows where the max salary will be shown
from employee as e;

-- row_number() : Gives each row a unique sequential number.
select e.*, 
row_number() over() as max_sal 
from employee as e; 

-- 4. rank() : Similar to ROW_NUMBER but ties/similar values get same rank
select e.*, 
rank() over() as max_sal 
from employee as e; 

-- 5. dense_rank() : Similar to RANK but, no gaps in ranking.
select e.*, 
dense_rank() over() as max_sal 
from employee as e; 


-- diffrebce bwtween rank() and dense_rank() and row_number()
 -- ROW_NUMBER() assigns unique sequential numbers to rows.
-- RANK() assigns the same rank for ties and skips the next rank.
-- DENSE_RANK() assigns the same rank for ties but does not skip ranks.

-- 6. lag(col, previous_record, default_val) : Access previous row.
select *, 
lag(salary) over(partition by dept) as max_sal 
from employee; 

-- 7. leaad(col, prior_record, default val) : Access next row.
select *, 
lead(salary) over(partition by dept) as max_sal 
from employee; 

-- diffrence between lag() and lead()
select e.*,
lag(salary) over(partition by dept order by eid) as prev_salary,
lead(salary) over(partition by dept order by eid) as prev_salary
from employee as e;