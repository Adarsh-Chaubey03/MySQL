USE startersql;

-- =====================================================
-- INDEXES IN MYSQL
-- =====================================================
-- An INDEX is a database object used to improve the 
-- speed of data retrieval operations.
-- It works like a book index — allowing MySQL to find
-- rows faster without scanning the entire table.
--
-- Important:
-- 1. Improves SELECT performance.
-- 2. Useful for columns used in WHERE, JOIN, ORDER BY.
-- 3. Slows down INSERT, UPDATE, DELETE slightly.
-- 4. Consumes additional disk space.
-- =====================================================


-- -----------------------------------------------------
-- View Existing Indexes on a Table
-- -----------------------------------------------------
SHOW INDEXES FROM users;


-- -----------------------------------------------------
-- Create a Single-Column Index
-- Example: Improve search performance on email column
-- -----------------------------------------------------
CREATE INDEX idx_email 
ON users(email);

-- Example query that benefits from this index:
-- SELECT * FROM users WHERE email = 'example@example.com';


-- -----------------------------------------------------
-- Create a Multi-Column Index
-- Example: When filtering by gender and salary together
-- -----------------------------------------------------
CREATE INDEX idx_gender_salary 
ON users(gender, salary);

-- Efficient usage example:
-- SELECT * FROM users 
-- WHERE gender = 'Female' AND salary > 70000;

-- Note:
-- Index order matters.
-- (gender, salary) works efficiently when gender is included first.


-- -----------------------------------------------------
-- Drop an Index
-- -----------------------------------------------------
DROP INDEX idx_email ON users;


-- =====================================================
-- SUMMARY
-- =====================================================
-- SHOW INDEXES          → View indexes
-- CREATE INDEX          → Create index
-- CREATE INDEX (multi)  → Multi-column index
-- DROP INDEX            → Remove index
--
-- Use indexes when working with large tables and 
-- frequent filtering/search operations.
-- Avoid unnecessary indexes on small tables.
-- =====================================================