USE startersql;

SELECT * FROM users;

-- COUNT()
SELECT COUNT(*) FROM users; 
SELECT COUNT(*) FROM users WHERE gender = 'Female';

-- MIN() and MAX()
SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM users;

-- SUM()
SELECT SUM(salary) AS total_salary FROM users;

-- AVG() with GROUP BY
SELECT gender, AVG(salary) AS average_salary
FROM users
GROUP BY gender;

-- LENGTH()
SELECT name, LENGTH(name) AS name_length FROM users;

-- LOWER()
SELECT name, LOWER(name) AS name_lowercase FROM users;

-- CONCAT()
SELECT name, CONCAT(name, '2328') AS username FROM users;

-- DATEDIFF (age in days)
SELECT name, DATEDIFF(CURDATE(), date_of_birth) AS days_alive
FROM users;
