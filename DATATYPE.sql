CREATE DATABASE IF NOT EXISTS datatype;
USE datatype;

DROP TABLE IF EXISTS sample;
CREATE TABLE sample (
    col1 VARCHAR(50),
    col2 INT
);

INSERT INTO sample (col1, col2) VALUES
    ('Alice', 30),
    ('Bob', 25),
    ('Charlie', 40);

SELECT * FROM sample;