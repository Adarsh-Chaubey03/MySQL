USE startersql;

-- =====================================================
-- STORED PROCEDURE IN MYSQL
-- =====================================================
-- A Stored Procedure is a saved SQL block that can be
-- executed later using CALL.
-- It helps in:
-- 1. Reusability of logic
-- 2. Reducing repetitive SQL code
-- 3. Improving maintainability
-- 4. Encapsulating business logic inside database
-- =====================================================


-- -----------------------------------------------------
-- Why change DELIMITER?
-- MySQL uses ; to end statements.
-- Procedures contain multiple ; inside them.
-- So we temporarily change the delimiter.
-- -----------------------------------------------------

DELIMITER $$

CREATE PROCEDURE AddUser(
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_gender ENUM('Male', 'Female', 'Other'),
    IN p_dob DATE,
    IN p_salary INT
)
BEGIN
    INSERT INTO users (name, email, gender, date_of_birth, salary)
    VALUES (p_name, p_email, p_gender, p_dob, p_salary);
END$$

DELIMITER ;


-- -----------------------------------------------------
-- Calling the Procedure
-- -----------------------------------------------------
CALL AddUser(
    'Kiran Sharma',
    'kiran@example.com',
    'Female',
    '1994-06-15',
    72000
);


-- -----------------------------------------------------
-- View Existing Stored Procedures
-- -----------------------------------------------------
SHOW PROCEDURE STATUS WHERE Db = 'startersql';


-- -----------------------------------------------------
-- Drop Stored Procedure
-- -----------------------------------------------------
DROP PROCEDURE IF EXISTS AddUser;


-- =====================================================
-- Key Points:
-- CREATE PROCEDURE → Define procedure
-- CALL             → Execute procedure
-- IN               → Input parameter
-- DROP PROCEDURE   → Remove procedure
-- =====================================================