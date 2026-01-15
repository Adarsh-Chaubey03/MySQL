-- BASICS.sql
-- A minimal MySQL starter script: database, table, CRUD, and cleanup.

-- 1) Create and use a database
CREATE DATABASE IF NOT EXISTS basics_db;
USE basics_db;

-- 2) Create a table (drop first so reruns are clean)
DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table (
        id INT PRIMARY KEY,
        name VARCHAR(50) NOT NULL
);

-- 3) Insert rows
INSERT INTO test_table (id, name) VALUES
    (1, 'Test Name'),
    (2, 'Another Name');

-- 4) Read
SELECT * FROM test_table;

-- 5) Update
UPDATE test_table
SET name = 'Updated Name'
WHERE id = 1;

SELECT * FROM test_table WHERE id = 1;

-- 6) Delete
DELETE FROM test_table WHERE id = 2;

SELECT * FROM test_table;
SHOW TABLES;