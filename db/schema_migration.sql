-- Write your sql commands to create your db schema here.
-- It should create a table in a new table in the db/ directory.

--To make a database we're going to do so in the db/ directory. 
-- This is where all sql files should go. Inside db/ is a file called schema_migration.sql. 
-- There you will write your sql statements to create a table with the proper schema. 
-- The schema should have an id column, name column, and a type column. 
-- The latter two should have the datatype text and the former an integer.

CREATE TABLE pokemon (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  type TEXT
);

