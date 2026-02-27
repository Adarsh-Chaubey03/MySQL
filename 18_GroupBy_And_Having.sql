USE startersql;

-- =====================================================
-- GROUP BY AND HAVING IN MYSQL
-- =====================================================
-- GROUP BY is used to group rows that have the same
-- values in specified columns.
-- It is commonly used with aggregate functions:
-- COUNT(), SUM(), AVG(), MIN(), MAX()
--
-- HAVING is used to filter grouped results.
-- WHERE filters rows before grouping.
-- HAVING filters groups after aggregation.
-- =====================================================


-- -----------------------------------------------------
-- 1. GROUP BY Example
-- Average salary by gender
-- -----------------------------------------------------
SELECT gender, AVG(salary) AS average_salary
FROM users
GROUP BY gender;


-- -----------------------------------------------------
-- 2. GROUP BY with COUNT
-- Count users referred by each user
-- -----------------------------------------------------
SELECT referred_by_id, COUNT(*) AS total_referred
FROM users
WHERE referred_by_id IS NOT NULL
GROUP BY referred_by_id;


-- -----------------------------------------------------
-- 3. HAVING Example
-- Show genders where average salary > 75000
-- -----------------------------------------------------
SELECT gender, AVG(salary) AS avg_salary
FROM users
GROUP BY gender
HAVING AVG(salary) > 75000;


-- -----------------------------------------------------
-- 4. HAVING with COUNT
-- Show users who referred more than 1 person
-- -----------------------------------------------------
SELECT referred_by_id, COUNT(*) AS total_referred
FROM users
WHERE referred_by_id IS NOT NULL
GROUP BY referred_by_id
HAVING COUNT(*) > 1;


-- =====================================================
-- SUMMARY
-- WHERE  → Filters rows before grouping
-- GROUP BY → Groups rows
-- HAVING → Filters aggregated groups
-- =====================================================