USE startersql;

-- TRANSACTION CONTROL
SET autocommit = 0;      -- disable auto commit

DELETE FROM users WHERE id = 6;

-- ROLLBACK;            -- undo changes before commit
COMMIT;                 -- save changes permanently

SET autocommit = 1;      -- enable auto commit

SELECT * FROM users;
