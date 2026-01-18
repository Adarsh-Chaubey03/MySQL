SE starterSQL;

-- add a column
ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

-- delete a column
ALTER TABLE users DROP COLUMN is_active;

-- move a column to first position
ALTER TABLE users MODIFY COLUMN name VARCHAR(100) FIRST;

-- modify column type
ALTER TABLE users MODIFY COLUMN name VARCHAR(150);

-- view table data
SELECT * FROM users;