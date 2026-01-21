-- 1. Create a database
CREATE DATABASE starterSQL;

-- 2. Select the database for use
USE starterSQL;


-- 3. Create a table named users
CREATE TABLE users (
id INT AUTO_INCREMENT PRIMARY KEY,                   -- unique user ID
name VARCHAR(100) NOT NULL,                          -- user name (required)
email VARCHAR(100) UNIQUE NOT NULL,                  -- unique email (required)
gender ENUM('Male', 'Female', 'Other'),              -- allowed gender values
date_of_birth DATE,                                  -- date only (YYYY-MM-DD)
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP       -- auto time stamp
);



-- 4. View all records from users table 
SELECT * FROM users;


-- 5. View only specific columns
SELECT name, email FROM users;


-- 6. Rename table users to customers
RENAME TABLE users TO customers;

-- 7. Rename table customers back to users
RENAME TABLE customers TO users;




-- 8. Delete the database (use with caution)
DROP DATABASE startersql;
