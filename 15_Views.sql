USE startersql;

-- =====================================================
-- VIEW: rich_users
-- =====================================================
-- A VIEW is a virtual table based on a SELECT query.
-- It does NOT store data physically.
-- It stores only the query definition.
-- Data is fetched dynamically from the base table
-- whenever the view is queried (real-time reflection).
--
-- Purpose:
-- 1. Simplifies complex queries
-- 2. Restricts or hides unnecessary columns
-- 3. Provides logical abstraction over base tables
-- 4. Improves reusability of query logic
-- =====================================================

CREATE VIEW rich_users AS
SELECT id, name, salary
FROM users
WHERE salary > 70000;

-- To use the view:
SELECT * FROM rich_users;

-- To remove the view:
DROP VIEW rich_users;