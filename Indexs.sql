-- ------------------INDEXES---------------------
-- indexes are the techniques viz is used for faster retrival of data
-- these indexes are the objects of databse
-- e.g indexes are like phonebook library

-- Types of indexes :
-- 1. Clustred indexes : it is a type of indexing in which the data is sorted and physically stored in the table 
-- in order to create a clustred index, we use primary key
-- there can be only one clustured index in a single table, as there is only one primary key in a table

-- 2. Non-Clustred indexes : it is a type of indexing in which we create a seperate table whcih points to the data of the orignal table
-- there can be multiple non clustred indexes in a single table
-- it will create a new table which contain the pointer to the rows, this new table is created in b-tree(binary tree)

-- Syntax
-- CREATE INDEX index_name on table_name;

-- Syntex to get the index : 
-- SHOW INDEX FROM table_name

-- assingment 31-03-2026
-- 1. create composite index on two coloumns, apply WHERE condition on first coloumn(use it on id, not on name)
-- 2. create a partial index 
