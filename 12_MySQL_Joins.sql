USE startersql;

-- JOIN: used to combine rows from two tables based on a related column

-- INNER JOIN
-- Returns only rows that have matching values in BOTH tables
SELECT u.name, a.city
FROM users u
INNER JOIN address a
ON u.id = a.user_id;

-- LEFT JOIN
-- Returns ALL rows from the LEFT table (users)
-- If no matching row exists in the RIGHT table (address), columns from address are NULL
SELECT u.name, a.city
FROM users u
LEFT JOIN address a
ON u.id = a.user_id;

-- RIGHT JOIN
-- Returns ALL rows from the RIGHT table (address)
-- If no matching row exists in the LEFT table (users), columns from users are NULL
SELECT u.name, a.city
FROM users u
RIGHT JOIN address a
ON u.id = a.user_id;
