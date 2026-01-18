USE startersql; -- select the sample database

SELECT * FROM users; -- fetch all users

SELECT * FROM users WHERE gender = 'Male'; -- fetch only male users

SELECT name, email FROM users WHERE gender = 'Male'; -- fetch name and email of male users

SELECT name, email FROM users WHERE gender <> 'Male'; -- fetch users where gender is not Male (<> operator)

SELECT name, email FROM users WHERE gender != 'Male'; -- fetch users where gender is not Male (!= operator)

SELECT * FROM users WHERE id > 10; -- fetch users with id greater than 10

SELECT * FROM users WHERE date_of_birth IS NULL; -- fetch users with missing date of birth

SELECT * FROM users WHERE date_of_birth IS NOT NULL; -- fetch users with available date of birth

SELECT * FROM users WHERE salary BETWEEN 65000 AND 80000; -- fetch users with salary in given range

SELECT * FROM users WHERE gender IN ('Male','Female'); -- fetch users who are either Male or Female
 
SELECT * FROM users 
WHERE gender IN ('Male','Female') 
ORDER BY date_of_birth ASC; -- sort users by oldest to youngest

SELECT * FROM users 
WHERE gender IN ('Male','Female') 
ORDER BY date_of_birth DESC 
LIMIT 2; -- fetch latest two users by date of birth

SELECT * FROM users WHERE gender = 'Male' AND salary > 65000;