USE startersql;

UPDATE users SET salary = 80000 WHERE id = 5;
UPDATE users SET salary = 80000, name = 'Ram', email='ram@gmail.com' WHERE id = 5;
SELECT * FROM users WHERE id = 5;

-- increase salary by 10000 for those whose current salary is less that 66000

SET SQL_SAFE_UPDATES = 0; -- disable safe update mode
UPDATE users  SET salary = salary + 10000 WHERE salary < 66000; -- now allowed

SET SQL_SAFE_UPDATES = 1; -- re-enable safe update mode

SELECT * FROM users;