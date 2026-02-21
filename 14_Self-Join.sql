-- Select the database to work with
USE startersql;

-- Add a new column to store referral relationship
-- This column will hold the ID of the user who referred another user
ALTER TABLE users
ADD COLUMN referred_by_id INT;

-- View current table data before updates
SELECT * FROM users;

-- Update specific users to assign who referred them
-- Here, users with IDs (2,3,13,14,15,16,18,20) were referred by user ID = 1
UPDATE users
SET referred_by_id = 1
WHERE id IN (2,3,13,14,15,16,18,20);

-- Verify updates after modification
SELECT * FROM users;


-- ==============================
-- SELF JOIN EXPLANATION
-- ==============================

-- A self join is used when a table references itself.
-- Here, the users table links to itself through referred_by_id.
-- We use aliases:
-- A → represents the actual user
-- B → represents the user who referred them

SELECT 
    A.id,                      -- ID of the user
    A.name AS user_name,       -- Name of the user
    B.name AS referred_by      -- Name of the referring user
FROM users A
INNER JOIN users B
    ON A.referred_by_id = B.id;


-- INNER JOIN means:
-- Only users who HAVE a referrer will appear.
-- If you want ALL users (even those without referrers),
-- replace INNER JOIN with LEFT JOIN:

-- LEFT JOIN VERSION (shows all users)
SELECT 
    A.id,
    A.name AS user_name,
    B.name AS referred_by
FROM users A
LEFT JOIN users B
    ON A.referred_by_id = B.id; 