-- ------------CTE ---------------------- 
-- Stands for common table expression
-- This is a temp result which can be used multiple times within/inside one sql statement
-- It is mainly used to get code readability
-- It  will make your complex query easy
-- CTE can be used n number of times
-- CTEs can be used till the query execution, but after the execution(;), there is no existence of that CTE

-- ----------Syntax-------------
-- with cte1 as (query),
-- cte2 as (query)....
-- (query with CTE);

use regex2;
select * from employee;

with test as
(select dept, avg(salary) as avgSal, max(salary) as maxSal, min(salary) as minSal from employee group by dept)

select emp.name, emp.dept, emp.salary, t.avgSal from employee as emp
join test as t
on emp.dept = t.dept;

use regex;
select * from orders;

with completed_orders as (
	select * from orders where status = 'Completed'),
cte_join as (
	select co.order_id, co.customer_id, co.order_date, day(co.order_date) as days,
		oi.product_id, oi.quantity, oi.unit_price, (oi.quantity * oi.unit_price) as total
	from completed_orders as co 
	join order_items as oi
	where co.order_id = oi.order_id )
    
select customer_id, sum(total) from cte_join 
where days between 1 and 15
group by customer_id;

-- ----------Recursive CTE ---------------
-- Used to handle hierarchical or tree-structured data and generate series. 
-- It allows a temporary result set to repeatedly reference itself until a termination condition is met.

-- eg -->
with recursive cte as (
select 10 as n
union all
select n+1 from cte where n<13)
select * from cte;
