USE startersql;

-- =====================================================
-- SUBQUERIES IN MYSQL
-- =====================================================
-- A subquery is a query written inside another query.
-- It is used to break complex problems into smaller parts.
-- The inner query executes first, and its result is
-- used by the outer query.
--
-- Types:
-- 1. Scalar Subquery      → Returns single value
-- 2. Subquery with IN     → Returns multiple values
-- 3. Subquery in SELECT   → Used as calculated column
-- 4. Subquery in FROM     → Acts as derived table
-- =====================================================


-- -----------------------------------------------------
-- 1. Scalar Subquery
-- Find users earning more than average salary
-- -----------------------------------------------------
SELECT id, name, salary
FROM users
WHERE salary > (
    SELECT AVG(salary) FROM users
);


-- -----------------------------------------------------
-- 2. Subquery with IN
-- Find users referred by someone earning > 75000
-- -----------------------------------------------------
SELECT id, name, referred_by_id
FROM users
WHERE referred_by_id IN (
    SELECT id FROM users WHERE salary > 75000
);


-- -----------------------------------------------------
-- 3. Subquery in SELECT
-- Show each user's salary with overall average salary
-- -----------------------------------------------------
SELECT name, salary,
       (SELECT AVG(salary) FROM users) AS average_salary
FROM users;


-- -----------------------------------------------------
-- 4. Subquery in FROM (Derived Table)
-- Get users earning above overall average
-- -----------------------------------------------------
SELECT *
FROM (
    SELECT id, name, salary
    FROM users
) AS temp
WHERE salary > (
    SELECT AVG(salary) FROM users
);


-- =====================================================
-- Key Points:
-- Inner query runs first.
-- Can return single or multiple values.
-- Useful for dynamic filtering and comparisons.
-- =====================================================