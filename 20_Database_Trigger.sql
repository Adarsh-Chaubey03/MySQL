USE startersql;

-- =====================================================
-- DATABASE TRIGGERS IN MYSQL
-- =====================================================
-- A Trigger is a stored program that automatically
-- executes when a specific event occurs on a table.
--
-- Trigger Events:
-- 1. INSERT
-- 2. UPDATE
-- 3. DELETE
--
-- Trigger Timing:
-- BEFORE  → Runs before the event
-- AFTER   → Runs after the event
--
-- Triggers are commonly used for:
-- - Logging changes
-- - Enforcing business rules
-- - Maintaining related data automatically
-- =====================================================


-- -----------------------------------------------------
-- Example Scenario:
-- Log every new user inserted into users table
-- -----------------------------------------------------


-- Step 1: Create a log table
CREATE TABLE user_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- -----------------------------------------------------
-- Step 2: Create Trigger
-- -----------------------------------------------------

DELIMITER $$

CREATE TRIGGER after_user_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO user_log (user_id, name)
    VALUES (NEW.id, NEW.name);
END$$

DELIMITER ;


-- -----------------------------------------------------
-- Step 3: Test Trigger
-- -----------------------------------------------------

INSERT INTO users (name, email, gender, date_of_birth, salary)
VALUES ('Ritika Jain', 'ritika@example.com', 'Female', '1996-03-12', 74000);

-- Check log table
SELECT * FROM user_log;


-- -----------------------------------------------------
-- Drop Trigger
-- -----------------------------------------------------
DROP TRIGGER IF EXISTS after_user_insert;


-- =====================================================
-- Key Points:
-- NEW.column → Refers to new row (INSERT/UPDATE)
-- OLD.column → Refers to old row (UPDATE/DELETE)
-- FOR EACH ROW → Runs once per affected row
-- =====================================================