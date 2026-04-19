use regex2;

create table test(sno int);

insert into test values
(100),
(20),
(89);

select * from test;


-- ----------------- Data Types -----------------------
-- Integers --->
-- 1. tinyint : 1 byte, range -128 to 127
-- 2. tinyint unsigned : range 0 to 255
-- 3. smallint : 2 byte, range 2^16
-- 4. mediumint : 3 byte, range 
-- 5. int : 4 bytes, range 2^32
-- 6. bigint : 8 byte, range 2^64

-- Decimal --->
-- 1. float(m, d) : 4 byte, preserves upto 4 precision values
-- 2. double(m, d) : 8 byte, preserve every precision value 
-- m-> total digitis including precision values 
-- d-> decial value or precision values

-- Character ---> ** Interview question **
-- 1. char(range) : it trims every last white spaces, it will always take memeory upto the range
-- 					also known as fix length charater datatype
-- 2. varchar(range) : it will truncate the white spaces upto the given range, it takes memory upto the charlength
--                  also known as variable length character datatype

-- Date --->
-- date('yyyy-mm-dd') : converts the string into date implicitly, make sure the date and month are in range
-- 						date must be between 1-31 and month must be 1-12

