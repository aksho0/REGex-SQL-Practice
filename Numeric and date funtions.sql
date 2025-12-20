use world;
select * from country;

-- Numneric Functions

-- 1. round(number, decimals) : Round off the decimal values 

select 83.68, round(83.68, 1); -- 83.7
select 83.65, round(83.65, 1); -- 83.7

-- negative value will remove the digits after the decimal 
select 45.6, round(45.6, -1); -- it will round off the vslues before the decimal, so 5 becom 10 and 40+10 become 50
select 446.78, round(446.78, -2); -- 400
select 456.78, round(456.78, -2); -- 500

-- 2. MOD(dividend, divider) : it will return the remainder
select mod(5,2); -- 1

-- Some other numeric functions
-- 1. pow(number, exponent) : returns the exponential value 
-- 2. ceil(decimal) : returns the upper value of deciaml e.g: ceil(3.000000001) res: 4
-- 3. floor(decimal) : returns the integer value of the decimal e.g floor(2.999999999) res: 2


-- Some date funtions
select now(), curdate(), current_timestamp(), current_time();
