-- Create database if it does not already exist
CREATE DATABASE IF NOT EXISTS Assignment01;

-- Select the database
USE Assignment01;


-- Create table: STUDIES
CREATE TABLE STUDIES (
    PNAME      VARCHAR(20),
    INSTITUTE  VARCHAR(20),
    COURSE     VARCHAR(10),
    COURSEFEE  INT
);

-- Insert records into STUDIES table
INSERT INTO STUDIES (PNAME, INSTITUTE, COURSE, COURSEFEE) VALUES
('ANAND',   'SABHARI',   'PGDCA',  4500),
('ALTAF',   'COIT',      'DCA',    7200),
('JULIANA', 'BITS',      'MCA',   22000),
('KAMALA',  'PRAGATHI',  'DCP',    5000),
('MARY',    'SABHARI',   'PGDCA',  4500),
('NELSON',  'PRAGATHI',  'DAP',    6200),
('PATRICK', 'PRAGATHI',  'DCAP',   5200),
('QADIR',   'APPLE',    'HDCP',  14000),
('RAMESH',  'SABHARI',   'PGDCA',  4500),
('RESECCA', 'BRILLIANT', 'DCAP',  11000),
('REMITHA', 'BDPS',      'DCS',    6000),
('VIJAYA',  'BDPS',      'DCA',   48000);

-- Display STUDIES table
SELECT * FROM STUDIES;


-- Create table: SOFTWARE
CREATE TABLE SOFTWARE (
    PNAME   VARCHAR(20),
    TITLE   VARCHAR(30),
    DEV_IN  VARCHAR(15),
    SCOST   DECIMAL(10,2),
    DCOST   DECIMAL(10,2),
    SOLD    INT
);

-- Insert records into SOFTWARE table
INSERT INTO SOFTWARE VALUES
('MARY','README','CPP',100.00,1200,84),
('ANAND','PARACHUTES','BASIC',399.95,6000,43),
('ANAND','VIDEOTITLING','PASCAL',7500.00,16000,9),
('JULIANA','INVENTORY','COBOL',3000.00,3500,0),
('KAMALA','PAYROLLPRG','DBASE',9000.00,20000,7),
('MARY','FINANCIALACC','ORACLE',18000.00,85000,4),
('MARY','CODEGENRRATOP','C',4500.00,20000,23),
('PATTRICK','README','CPP',300.00,1200,84),
('QADIR','BOMBSAWAY','ASSEMBLY',750.00,5000,11),
('QADIR','VACCINES','C',1900.00,3400,21),
('RAMESH','HOTLIMGMT','DBASE',12000.00,35000,4),
('RAMESH','DEADLEE','PASCAL',599.95,4500,73),
('REMITHA','PCUTILITIES','C',725.00,5000,51),
('REMITHA','TSRHELPPKG','ASSEMBLY',2500.00,6000,7),
('REVATHI','HOSPITALMGMT','PASCAL',1100.00,75000,2),
('VIJAYA','TSREDITOR','C',900.00,700,6);

-- Display SOFTWARE table
SELECT * FROM SOFTWARE;


-- Create table: PROGRAMMER
CREATE TABLE PROGRAMMER (
    PNAME   VARCHAR(20),
    DOB     DATE,
    DOJ     DATE,
    SEX     CHAR(1),
    PROF1   VARCHAR(15),
    PROF2   VARCHAR(15),
    SALARY  INT
);

-- Insert records into PROGRAMMER table
INSERT INTO PROGRAMMER VALUES
('ANAND','1966-04-12','1992-04-21','M','PASCAL','BASIC',3200),
('ALTAF','1964-07-02','1990-11-13','M','CLIPPER','COBOL',2800),
('JULIANA','1960-01-31','1990-04-21','F','COBOL','DBASE',3000),
('KAMALA','1968-10-30','1992-01-02','F','C','DBASE',2900),
('MARY','1970-06-24','1991-02-01','F','CPP','ORACLE',4500),
('NELSON','1965-09-11','1989-03-11','M','COBOL','DBASE',2500),
('PATTRICK','1965-11-10','1990-04-21','M','PASCAL',NULL,2800),
('QADIR','1965-08-31','1990-04-21','M','ASSEMBLY','C',3000),
('RAMESH','1967-05-03','1991-02-26','M','PASCAL','DBASE',3200),
('REBECCA','1967-01-01','1990-12-01','F','BASIC','COBOL',2500),
('REMITHA','1970-04-19','1993-04-20','F','C','ASSEMBLY',3000),
('REVATHI','1969-12-02','1992-01-02','F','PASCAL','BASIC',3200),
('VIJAYA','1965-12-14','1992-05-02','F','FOXPRO','C',4500);

-- Display PROGRAMMER table
SELECT * FROM PROGRAMMER;
-- 1. Find out the selling average cost for packages developed in PASCAL.
SELECT AVG(SCOST) AS selling_average_cost 
FROM SOFTWARE WHERE DEV_IN = 'PASCAL';


-- 2. Display the names and ages of all programmers
SELECT PNAME,
       TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS AGE
FROM PROGRAMMER;


-- 3. Display the names of those who have done the DAP course.
SELECT PNAME FROM STUDIES WHERE COURSE = 'DAP';


-- 4. Display the names and dates of birth of all programmers born in January
SELECT PNAME, DOB FROM PROGRAMMER WHERE MONTH(DOB) = 1;


-- 5. What is the highest number of copies sold by a package.
SELECT MAX(SOLD) FROM SOFTWARE;


-- 6. Display the lowest course fee.
SELECT MIN(COURSEFEE) FROM STUDIES;


-- 7. How many programmers have done the PGDCA course.
SELECT COUNT(*) FROM STUDIES WHERE COURSE = 'PGDCA';


-- 8. How much revenue has been earned through sales of packages developed in C
SELECT SUM(SCOST * SOLD) AS TOTAL_REVENUE
FROM SOFTWARE
WHERE DEV_IN = 'C';


-- 9. Display the details of the software developed by Ramesh.
SELECT * FROM SOFTWARE WHERE PNAME = 'RAMESH';


-- 10. How many programmers studied at Sabhari.
SELECT COUNT(*) FROM STUDIES WHERE INSTITUTE = 'SABHARI';


-- 11. Display details of packages whose sales crossed the 2000 mark
SELECT * FROM SOFTWARE WHERE SCOST * SOLD > 2000;



-- 12. Find out the number of copies which should be sold in order to recover development cost.
SELECT TITLE, CEIL(DCOST / SCOST) AS copies_required FROM SOFTWARE;


-- 13. Display the details of packages for which development cost has been recovered.
SELECT * FROM SOFTWARE WHERE SOLD * SCOST >= DCOST; 


-- 14. What is the cost of the costliest software developed in BASIC.
SELECT MAX(DCOST) AS max_development_cost FROM SOFTWARE 
WHERE DEV_IN = 'BASIC'; 


-- 15. How many packages were developed in DBASE.
SELECT COUNT(*) FROM SOFTWARE WHERE DEV_IN = 'DBASE';


-- 16. How many programmers studied in Pragathi.
SELECT COUNT(*) FROM STUDIES WHERE INSTITUTE = 'PRAGATHI';


-- 17. How many programmers paid between 5000 and 10000 for their studies.
SELECT COUNT(*) FROM STUDIES WHERE COURSEFEE BETWEEN 5000 AND 10000;


-- 18. What is the average course fee.
SELECT AVG(COURSEFEE) FROM STUDIES;


-- 19. Display the details of programmers knowing C.
SELECT * FROM PROGRAMMER WHERE PROF1 = 'C' OR PROF2 = 'C'; 

-- 20. How many programmers know either COBOL or PASCAL.
SELECT COUNT(*) AS total_programmers FROM PROGRAMMER
WHERE PROF1 IN ('COBOL', 'PASCAL')
   OR PROF2 IN ('COBOL', 'PASCAL');
   
   -- 21. How many programmers don’t know PASCAL and C.
SELECT COUNT(*) FROM PROGRAMMER
WHERE PROF1 NOT IN ('PASCAL','C')
  AND PROF2 NOT IN ('PASCAL','C');

-- 22. How old is the oldest male programmer.
SELECT MAX(TIMESTAMPDIFF(YEAR, DOB, CURDATE())) AS OLDEST_MALE
FROM PROGRAMMER
WHERE SEX = 'M';

-- 23. Calculate the experience in years for each programmer and display along with names in descending order.
SELECT PNAME, TIMESTAMPDIFF(YEAR, DOJ, CURDATE()) AS EXPERIENCE
FROM PROGRAMMER
ORDER BY EXPERIENCE DESC;

-- 24. Who are the programmers who celebrate their birthdays during the current month.
SELECT *
FROM PROGRAMMER
WHERE MONTH(DOB) = MONTH(CURDATE());

-- 25. How many female programmers are there.
SELECT COUNT(*)
FROM PROGRAMMER
WHERE SEX = 'F';

-- 26. What are the languages known by male programmers.

-- 27. What is the average salary.

-- 28. How many people draw salary between 2000 and 4000.

-- 29. Display the details of those who don’t know CLIPPER, COBOL or PASCAL.

-- 30. Display the cost of packages developed by each programmer.

-- 31. Display the sales values of the packages developed by each programmer.

-- 32. Display the number of packages sold by each programmer.

-- 33. Display the sales cost of the packages developed by each programmer.

-- 34. Display the sales cost of the packages developed by each programmer language-wise.

-- 35. Display each language with average development cost, average selling cost, and average price per copy.

-- 36. Display each programmer’s name with the costliest and cheapest packages developed.

-- 37. Display each institute with number of courses and average cost per course.

-- 38. Display each institute with number of students.

-- 39. Display names of male and female programmers along with sex.

-- 40. Display the names of programmers and their packages.

-- 41. Display the number of packages in each language except C and C++.

-- 42. Display the number of packages in each language where development cost is less than 1000.

-- 43. Display the average difference between selling cost and development cost for each package.

-- 44. Display total SCOST, DCOST, and amount to be recovered for each programmer whose DCOST is not recovered.

-- 45. Display highest, lowest, and average salaries for those earning more than 2000.

-- 46. Who is the highest paid C programmer.

-- 47. Who is the highest paid female COBOL programmer.

-- 48. Display the highest paid programmer for each language.

-- 49. Who is the least experienced programmer.

-- 50. Who is the most experienced male programmer knowing PASCAL.

-- 51. Which language is known by only one programmer.

-- 52. Who is the programmer referred to in question 51.

-- 53. Who is the youngest programmer knowing DBASE.

-- 54. Which female programmer earning more than 3000 does not know C, C++, ORACLE, or DBASE.

-- 55. Which institute has the most number of students.

-- 56. What is the costliest course.

-- 57. Which course has been done by the most students.

-- 58. Which course has been done by the most students.

-- 59. Which institute conducts the costliest course.

-- 60. Display institute and course with below average course fee.

-- 61. Display names of courses whose fees are within ±1000 of the average fee.

-- 62. Which package has the highest development cost.

-- 63. Which course has below average number of students.

-- 64. Which package has the lowest selling cost.

-- 65. Who developed the package that sold the least number of copies.

-- 66. Which language was used to develop the package with the highest sales amount.

-- 67. How many copies of the package with least difference between development and selling cost were sold.

-- 68. Which is the costliest package developed in PASCAL.

-- 69. Which language was used to develop the most number of packages.

-- 70. Which programmer developed the highest number of packages.

-- 71. Display names of packages sold less than the average number of copies.

-- 72. Who are the authors of packages that recovered more than double the development cost.

-- 73. Display programmer names and cheapest packages developed by them in each language.

-- 74. Display the language used by each programmer to develop highest and lowest selling packages.

-- 75. Who is the youngest male programmer born in 1965.

-- 76. Who is the oldest female programmer who joined in 1992.

-- 77. In which year were the most programmers born.

-- 78. In which month did the most programmers join.

-- 79. In which language are most programmers proficient.

-- 80. Who are the male programmers earning below the average salary of female programmers.

-- 81. Who are the female programmers earning more than the highest paid male programmer.

-- 82. Which language has been stated as PROF by most programmers.

-- 83. Display details of programmers drawing the same salary.

-- 84. Display details of software developed by male programmers earning more than 3000.

-- 85. Display details of packages developed in PASCAL by female programmers.

-- 86. Display details of programmers who joined before 1990.

-- 87. Display details of software developed in C by female programmers of Pragathi.

-- 88. Display number of packages, copies sold, and sales value of each programmer institute-wise.

-- 89. Display details of software developed in DBASE by male programmers from the institute with most students.

-- 90. Display software developed by male programmers born before 1965 and female programmers born after 1975.

-- 91. Display software developed in languages not listed in PROF1 or PROF2 of the programmer.

-- 92. Display software developed by male students of Sabhari.

-- 93. Display names of programmers who have not developed any packages.

-- 94. What is the total cost of software developed by programmers of Apple.

-- 95. Display names of programmers who have not developed any packages.

-- 96. Who are the programmers having the same PROF2.

-- 97. Display total sales value of software institute-wise.

-- 98. In which institute did the person who developed the costliest package study.

-- 99. Which language listed in PROF1 or PROF2 has not been used to develop any package.

-- 100. How much does the person who developed the highest selling package earn and which course did they undergo.

-- 101. How many months will it take for each programmer to recover the course fee.

-- 102. Which is the costliest package by a person with under 3 years experience.

-- 103. What is the average salary of programmers whose software sales exceed 50,000.

-- 104. How many packages were developed by students from the institute charging the lowest course fee.

-- 105. How many packages were developed by the person who developed the cheapest package and where did they study.

-- 106. How many packages were developed by female programmers earning more than the highest paid male programmer.

-- 107. How many packages were developed by the most experienced programmers from BDPS.

-- 108. List programmers and institutes they studied, including those who developed no packages.

-- 109. List each PROF with number of programmers having that PROF and number of packages in that PROF.

-- 110. List programmer names and number of packages each has developed.
