
use world;
select * from country;

-- String functions

-- 1. Case convertion
--       UPPER() 
--       LOWER()

select UPPER(name), LOWER(code) from country;


-- 2. Concatination 
--       concate(str1, str2, ....) : simply join two strings
--       concat_ws(separator ,str1, str2) : join two string with separator

select concat(continent, ' continent') from country;
select concat_ws(' ', continent,  'Continent') from country;


-- 3. SubString
--         substr(col_name, start_pos, end_pos) : ectract character based on the position

select name, substr(name, 2, 5) from country;
select name, substr(name, -2) from country;

-- get name and continent whose 1st character are same
select name, continent from country where substr(name, 1, 1) like substr(continent, 1, 1);

-- get those name of country which starts with alg
select name, continent from country where name like 'alg%'; 
select name, continent from country where substr(name, 1, 3) like 'alg';


-- 3. InString
--      instr(col_name, char) : returns the first position of the charecter given

select name, instr(name, 'e') from country;

-- 4. lenght(str) : returns the bytes used in the givem string
--          e.g length(文yash) will give 7 
-- 5. char_length(str) : returns the no. character in the given string
--          e.g char_length(文yash) will give 5

select length('文yash');
select char_length('文yash');

-- 6. trim(str) : removes extra spaces from both sides 
--    ltrim(str) : removes left most spaces 
--    rtrim(str) : removes right most spaces
-- can be used to remove any character from the string
-- e.g trim('a' from name)

select name, trim('A' from name) from country; -- it is case sensitive, a and A are diffrent
select name, trim('a' from name) from country;

-- 7. Padding : adding characters (usually spaces or zeros) to a string to ensure it reaches a specified total length
--     e.g SELECT LPAD('123', 5, '0') AS PaddedID;
--      res: 00123
