USE startersql;

CREATE TABLE admin_users (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary INT
);

INSERT INTO admin_users (id, name, email, gender, date_of_birth, salary) VALUES
(101, 'Anil Kumar',    'anil@example.com',   'Male',   '1985-04-12', 60000),
(102, 'Pooja Sharma',  'pooja@example.com',  'Female', '1992-09-20', 58000),
(103, 'Rakesh Yadav',  'rakesh@example.com', 'Male',   '1989-11-05', 54000),
(104, 'Dkjsdj ajds',  'sasa@example.com', 'Female', '1990-06-30', 62000);

-- UNION
-- Combines result sets of two SELECT queries
-- Removes duplicate rows
-- Number of columns and their data types must match

SELECT name, email FROM users
UNION
SELECT name, email FROM admin_users;

-- UNION ALL
-- Combines result sets of two SELECT queries
-- Does NOT remove duplicates (faster than UNION)

SELECT name, email FROM users
UNION ALL
SELECT name, email FROM admin_users;
