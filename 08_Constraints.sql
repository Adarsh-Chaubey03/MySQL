-- Constraints
USE startersql;

-- UNIQUE ensures all values are different
DROP TABLE IF EXISTS new_table;

CREATE TABLE new_table (
    id INT AUTO_INCREMENT PRIMARY KEY,      -- unique user id
    name VARCHAR(100) NOT NULL,              -- name required
    email VARCHAR(100) UNIQUE NOT NULL,      -- email must be unique
    gender ENUM('Male','Female','Other'),    -- allowed values
    date_of_birth DATE,                      -- yyyy-mm-dd
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- auto timestamp
    CONSTRAINT check_dob CHECK (date_of_birth > '1920-01-01')
);

INSERT INTO new_table (name, email, gender, date_of_birth) VALUES
('Alices', 'alice@example.com', 'Female', '1990-11-23');

-- error: duplicate email
-- INSERT INTO new_table (name, email, gender, date_of_birth)
-- VALUES ('Charles', 'alice@example.com', 'Other', '1988-02-17');

-- error: name cannot be null
-- INSERT INTO new_table (name, email, gender, date_of_birth)
-- VALUES (NULL, 'test@example.com', 'Female', '1990-11-23');

-- error: check constraint fails
-- INSERT INTO new_table (name, email, gender, date_of_birth)
-- VALUES ('Al', 'al@example.com', 'Female', '1910-11-23');
