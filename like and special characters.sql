use world;
select * from country;

-- like keyword
-- this keyword works like =, but it works with special charcaters 

-- sprcial characters 
-- 1.  % -> finding zero or more charaters 
--      e.g asia% will return all the values which starts from asia, remaining characters can be anything

select * from country where name like 'a%'; -- returns names starts with a
select * from country where name like '%a'; -- returns names ends with a
select * from country where name like '%a%'; -- return names which has a somwhere in it


-- 2.  _ (underscore) -> checks for one character only
--        e.g _a will check if the value has a in 2nd place

select * from country where name like 'ir__'; -- returns names starts with ir and has 2 more characters in it


-- practice questions

-- get name, continent, region where continrnt is not europe
select name, continent, region from country where continent not like 'europe';

-- get name, continent, region where 2nd character is 'a' and last character is also 'a' in region 
select name, continent, region from country where region like '_a%a';

-- get name, continent, region where the country name have atleast 5 characters
select name, continent, region from country where name like '_____%';

-- get name, continent, region where 2nd character of continent name is 'c' and 2nd last charcter is 'i'
select name, continent, region from country where continent like '_c%i_';

-- get name, continent, region where continent name must contian 2 'a' in between
select name, continent, region from country where continent like '%a%a%';