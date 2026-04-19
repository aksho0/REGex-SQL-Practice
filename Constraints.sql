-- ------------Constraints----------------
-- Constriants are the set of rules that are applied on the table column to aoid invalid data entry

-- 1. NOT NULL: Ensures a column cannot have NULL values.
-- 2. DEFAULT: Provides a default value if none is specified.

use regex2;

create table teest2(salary int not null default 1900, age int default 18);
insert into teest2(salary) values(20000);
insert into teest2(age) values(23);

select * from teest2;

-- 3. PRIMARY KEY: Uniquely identifies rows, combining NOT NULL and UNIQUE.
-- 					Combination of multiple coloums can be primary key as well

create table test4(a int, b int,
					primary key (a, b));
                    
insert into test4 values(10, 20);
insert into test4 values(10, 21);
select * from test4;

-- 4. FOREIGN KEY: Maintains referential integrity between tables.
-- 5. CHECK: Ensures values meet specific conditions.

create table test3(salary int, age int check(age > 18));
insert into test3 values(20000, 34);
insert into test3 values(20000, 12); -- error

-- 6. UNIQUE: Ensures all values in a column are distinct. It can have multiple null values.

-- --------Constraint nameing------------
-- A constraint name is an identifier you provide to a rule that enforces data integrity in a table. 
-- Naming constraints is optional, but highly recommended for better management, debugging, and error handling. 
-- If you do not provide a name, the database system will automatically generate a system-defined name 
-- Name is usually given in this fromat: dbName_tableName_colName_constraintName

-- Syntax ->

-- CREATE TABLE table_name (
--    column1 datatype,
--    column2 datatype,
--    CONSTRAINT constraint_name CONSTRAINT_TYPE (column_name(s))
-- );
