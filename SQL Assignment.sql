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
SELECT PNAME, PROF1, PROF2
FROM PROGRAMMER
WHERE SEX = 'M';

-- 27. What is the average salary.
SELECT AVG(SALARY) FROM PROGRAMMER;

-- 28. How many people draw salary between 2000 and 4000.
SELECT COUNT(*)
FROM PROGRAMMER
WHERE SALARY BETWEEN 2000 AND 4000;

-- 29. Display the details of those who don’t know CLIPPER, COBOL or PASCAL.
SELECT *
FROM PROGRAMMER
WHERE PROF1 NOT IN ('CLIPPER','COBOL','PASCAL')
  AND PROF2 NOT IN ('CLIPPER','COBOL','PASCAL');

-- 30. Display the cost of packages developed by each programmer.
SELECT P.PNAME, S.TITLE, S.DCOST
FROM PROGRAMMER P
JOIN SOFTWARE S ON P.PNAME = S.PNAME;

-- 31. Display the sales values of the packages developed by each programmer.
SELECT P.PNAME, S.TITLE, (S.SOLD * S.SCOST) AS SALES_VALUE
FROM PROGRAMMER P
JOIN SOFTWARE S ON P.PNAME = S.PNAME;

-- 32. Display the number of packages sold by each programmer.
SELECT P.PNAME, SUM(S.SOLD) AS TOTAL_PACKAGES_SOLD
FROM PROGRAMMER P
JOIN SOFTWARE S ON P.PNAME = S.PNAME
GROUP BY P.PNAME;


-- 33. Display the sales cost of the packages developed by each programmer.
SELECT S.PNAME, SUM(S.SOLD * S.SCOST) AS TOTAL_SALES_COST
FROM SOFTWARE S
GROUP BY S.PNAME;

-- 34. Display the sales cost of the packages developed by each programmer language-wise.
SELECT S.PNAME, S.DEV_IN, SUM(S.SOLD * S.SCOST) AS TOTAL_SALES_COST
FROM SOFTWARE S
GROUP BY S.PNAME, S.DEV_IN;

-- 35. Display each language with average development cost, average selling cost, and average price per copy.
SELECT DEV_IN,
       AVG(DCOST) AS AVG_DEVELOPMENT_COST,
       AVG(SCOST) AS AVG_SELLING_COST,
       AVG(DCOST / SCOST) AS AVG_PRICE_PER_COPY
FROM SOFTWARE
GROUP BY DEV_IN;

-- 36. Display each programmer’s name with the costliest and cheapest packages developed.
SELECT S.PNAME,
       MAX(S.DCOST) AS COSTLIEST_PACKAGE,
       MIN(S.DCOST) AS CHEAPEST_PACKAGE
FROM SOFTWARE S
GROUP BY S.PNAME;


-- 37. Display each institute with number of courses and average cost per course.
SELECT INSTITUTE,
       COUNT(*) AS NO_OF_COURSES,
       AVG(COURSEFEE) AS AVG_COURSE_FEE
FROM STUDIES
GROUP BY INSTITUTE;


-- 38. Display each institute with number of students.
SELECT INSTITUTE,
       COUNT(*) AS NO_OF_STUDENTS
FROM STUDIES
GROUP BY INSTITUTE;


-- 39. Display names of male and female programmers along with sex.
SELECT PNAME, SEX FROM PROGRAMMER;

-- 40. Display the names of programmers and their packages.
SELECT P.PNAME, S.TITLE
FROM PROGRAMMER P
JOIN SOFTWARE S
ON P.PNAME = S.PNAME;


-- 41. Display the number of packages in each language except C and C++.
SELECT DEV_IN AS LANGUAGE,
       COUNT(*) AS NO_OF_PACKAGE
FROM SOFTWARE
WHERE DEV_IN NOT IN ('C', 'CPP')
GROUP BY DEV_IN;

-- 42. Display the number of packages in each language where development cost < 1000
SELECT DEV_IN, COUNT(*) 
FROM SOFTWARE
WHERE DCOST < 1000
GROUP BY DEV_IN;

-- 43. Display the average difference between selling cost and development cost
SELECT AVG(DCOST-SCOST) AS AVG_DIFFERENCE
FROM SOFTWARE;

-- 44. Display total SCOST, DCOST, and amount to be recovered for programmers whose cost is not recovered
SELECT PNAME,
       SUM(SCOST*SOLD) AS TOTAL_SCOST,
       SUM(DCOST) AS TOTAL_DCOST,
       SUM(DCOST - SCOST*SOLD) AS AMOUNT_TO_RECOVER
FROM SOFTWARE
GROUP BY PNAME
HAVING SUM(SCOST*SOLD) < SUM(DCOST);

-- 45. Highest, lowest, and average salaries for those earning more than 2000
SELECT MAX(SALARY), MIN(SALARY), AVG(SALARY)
FROM PROGRAMMER
WHERE SALARY > 2000;

-- 46. Highest paid C programmer
SELECT PNAME
FROM PROGRAMMER
WHERE PROF1='C' OR PROF2='C'
ORDER BY SALARY DESC
LIMIT 1;

-- 47. Highest paid female COBOL programmer
SELECT PNAME
FROM PROGRAMMER
WHERE SEX='F' AND (PROF1='COBOL' OR PROF2='COBOL')
ORDER BY SALARY DESC
LIMIT 1;

-- 48. Highest paid programmer for each language
SELECT PROF, MAX(SALARY)
FROM (
    SELECT PROF1 AS PROF, SALARY FROM PROGRAMMER
    UNION ALL
    SELECT PROF2, SALARY FROM PROGRAMMER
) X
GROUP BY PROF;

-- 49. Least experienced programmer
SELECT PNAME
FROM PROGRAMMER
ORDER BY DOJ DESC
LIMIT 1;

-- 50. Most experienced male programmer knowing PASCAL
SELECT PNAME
FROM PROGRAMMER
WHERE SEX='M' AND (PROF1='PASCAL' OR PROF2='PASCAL')
ORDER BY DOJ
LIMIT 1;

-- 51. Language known by only one programmer
SELECT PROF
FROM (
    SELECT PROF1 AS PROF FROM PROGRAMMER
    UNION ALL
    SELECT PROF2 FROM PROGRAMMER
) X
GROUP BY PROF
HAVING COUNT(*) = 1;

-- 52. Programmer referred in Q51
SELECT PNAME
FROM PROGRAMMER
WHERE PROF1 IN (
    SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING COUNT(*)=1
)
OR PROF2 IN (
    SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING COUNT(*)=1
);

-- 53. Youngest programmer knowing DBASE
SELECT PNAME
FROM PROGRAMMER
WHERE PROF1='DBASE' OR PROF2='DBASE'
ORDER BY DOB DESC
LIMIT 1;

-- 54. Female programmer earning >3000 not knowing C, CPP, ORACLE, DBASE
SELECT *
FROM PROGRAMMER
WHERE SEX='F' AND SALARY>3000
AND PROF1 NOT IN ('C','CPP','ORACLE','DBASE')
AND PROF2 NOT IN ('C','CPP','ORACLE','DBASE');

-- 55. Institute with most students
SELECT INSTITUTE
FROM STUDIES
GROUP BY INSTITUTE
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 56. Costliest course
SELECT COURSE
FROM STUDIES
ORDER BY COURSEFEE DESC
LIMIT 1;

-- 57. Course done by most students
SELECT COURSE
FROM STUDIES
GROUP BY COURSE
ORDER BY COUNT(*) DESC
LIMIT 1;
-- 58. Which course has been done by the most students.
SELECT COURSE
FROM STUDIES
GROUP BY COURSE
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM STUDIES
        GROUP BY COURSE
    ) AS t
);

-- 59. Institute conducting costliest course
SELECT INSTITUTE
FROM STUDIES
ORDER BY COURSEFEE DESC
LIMIT 1;

-- 60. Institute and course below average fee
SELECT INSTITUTE, COURSE
FROM STUDIES
WHERE COURSEFEE < (SELECT AVG(COURSEFEE) FROM STUDIES);

-- 61. Courses within ±1000 of average fee
SELECT COURSE
FROM STUDIES
WHERE COURSEFEE BETWEEN
(SELECT AVG(COURSEFEE)-1000 FROM STUDIES)
AND
(SELECT AVG(COURSEFEE)+1000 FROM STUDIES);

-- 62. Package with highest development cost
SELECT TITLE
FROM SOFTWARE
ORDER BY DCOST DESC
LIMIT 1;

-- 63. Course with below average number of students
SELECT COURSE
FROM STUDIES
GROUP BY COURSE
HAVING COUNT(*) <
(
    SELECT AVG(cnt)
    FROM (SELECT COUNT(*) cnt FROM STUDIES GROUP BY COURSE) X
);

-- 64. Package with lowest selling cost
SELECT TITLE
FROM SOFTWARE
ORDER BY SCOST
LIMIT 1;

-- 65. Programmer who developed least sold package
SELECT PNAME
FROM SOFTWARE
ORDER BY SOLD
LIMIT 1;

-- 66. Language used to develop package with highest sales amount
SELECT DEV_IN
FROM SOFTWARE
ORDER BY SCOST*SOLD DESC
LIMIT 1;

-- 67. Copies sold with least difference between DCOST and SCOST
SELECT SOLD
FROM SOFTWARE
ORDER BY ABS(DCOST - SCOST)
LIMIT 1;

-- 68. Costliest package developed in PASCAL
SELECT TITLE
FROM SOFTWARE
WHERE DEV_IN='PASCAL'
ORDER BY DCOST DESC
LIMIT 1;

-- 69. Language used to develop most packages
SELECT DEV_IN
FROM SOFTWARE
GROUP BY DEV_IN
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 70. Programmer who developed highest number of packages
SELECT PNAME
FROM SOFTWARE
GROUP BY PNAME
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 71. Packages sold less than average copies
SELECT TITLE
FROM SOFTWARE
WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE);

-- 72. Authors who recovered more than double development cost
SELECT PNAME
FROM SOFTWARE
WHERE SCOST*SOLD > 2*DCOST;

-- 73. Programmer and cheapest package per language
SELECT PNAME, DEV_IN, MIN(DCOST)
FROM SOFTWARE
GROUP BY PNAME, DEV_IN;

-- 74. Language used for highest and lowest selling package by programmer
SELECT PNAME, DEV_IN, SOLD
FROM SOFTWARE
WHERE SOLD IN (
    SELECT MAX(SOLD) FROM SOFTWARE
    UNION
    SELECT MIN(SOLD) FROM SOFTWARE
);

-- 75. Youngest male programmer born in 1965
SELECT PNAME
FROM PROGRAMMER
WHERE SEX='M' AND YEAR(DOB)=1965
ORDER BY DOB DESC
LIMIT 1;

-- 76. Oldest female programmer joined in 1992
SELECT PNAME
FROM PROGRAMMER
WHERE SEX='F' AND YEAR(DOJ)=1992
ORDER BY DOB
LIMIT 1;

-- 77. Year with most programmer births
SELECT YEAR(DOB)
FROM PROGRAMMER
GROUP BY YEAR(DOB)
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 78. Month with most programmer joins
SELECT MONTH(DOJ)
FROM PROGRAMMER
GROUP BY MONTH(DOJ)
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 79. Language most programmers are proficient in
SELECT PROF
FROM (
    SELECT PROF1 AS PROF FROM PROGRAMMER
    UNION ALL
    SELECT PROF2 FROM PROGRAMMER
) X
GROUP BY PROF
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 80. Male programmers earning below average female salary
SELECT *
FROM PROGRAMMER
WHERE SEX='M' AND SALARY <
(SELECT AVG(SALARY) FROM PROGRAMMER WHERE SEX='F');

-- 81. Female programmers earning more than highest paid male
SELECT *
FROM PROGRAMMER
WHERE SEX='F' AND SALARY >
(SELECT MAX(SALARY) FROM PROGRAMMER WHERE SEX='M');

-- 82. Language stated as PROF by most programmers
SELECT PROF
FROM (
    SELECT PROF1 AS PROF FROM PROGRAMMER
    UNION ALL
    SELECT PROF2 FROM PROGRAMMER
) X
GROUP BY PROF
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 83. Programmers drawing same salary
SELECT *
FROM PROGRAMMER
WHERE SALARY IN (
    SELECT SALARY FROM PROGRAMMER GROUP BY SALARY HAVING COUNT(*)>1
);

-- 84. Software developed by male programmers earning >3000
SELECT S.*
FROM SOFTWARE S
JOIN PROGRAMMER P ON S.PNAME=P.PNAME
WHERE P.SEX='M' AND P.SALARY>3000;

-- 85. Software developed in PASCAL by female programmers
SELECT S.*
FROM SOFTWARE S
JOIN PROGRAMMER P ON S.PNAME=P.PNAME
WHERE S.DEV_IN='PASCAL' AND P.SEX='F';

-- 86. Programmers who joined before 1990
SELECT *
FROM PROGRAMMER
WHERE DOJ<'1990-01-01';

-- 87. Software developed in C by female programmers of Pragathi
SELECT S.*
FROM SOFTWARE S
JOIN PROGRAMMER P ON S.PNAME=P.PNAME
JOIN STUDIES ST ON P.PNAME=ST.PNAME
WHERE S.DEV_IN='C' AND P.SEX='F' AND ST.INSTITUTE='PRAGATHI';

-- 88. Packages, copies sold, sales value institute-wise
SELECT ST.INSTITUTE,
       COUNT(S.TITLE),
       SUM(S.SOLD),
       SUM(S.SOLD*S.SCOST)
FROM STUDIES ST
JOIN SOFTWARE S ON ST.PNAME=S.PNAME
GROUP BY ST.INSTITUTE;

-- 89. DBASE software by male programmers from institute with most students
SELECT S.*
FROM SOFTWARE S
JOIN PROGRAMMER P ON S.PNAME=P.PNAME
JOIN STUDIES ST ON P.PNAME=ST.PNAME
WHERE S.DEV_IN='DBASE'
AND P.SEX='M'
AND ST.INSTITUTE =
(
    SELECT INSTITUTE FROM STUDIES GROUP BY INSTITUTE ORDER BY COUNT(*) DESC LIMIT 1
);

-- 90. Software by males born before 1965 and females born after 1975
SELECT S.*
FROM SOFTWARE S
JOIN PROGRAMMER P ON S.PNAME=P.PNAME
WHERE (P.SEX='M' AND YEAR(P.DOB)<1965)
OR (P.SEX='F' AND YEAR(P.DOB)>1975);

-- 91. Software developed in languages not in PROF1 or PROF2
SELECT S.*
FROM SOFTWARE S
JOIN PROGRAMMER P ON S.PNAME=P.PNAME
WHERE S.DEV_IN NOT IN (P.PROF1, P.PROF2);

-- 92. Software developed by male students of Sabhari
SELECT S.*
FROM SOFTWARE S
JOIN PROGRAMMER P ON S.PNAME=P.PNAME
JOIN STUDIES ST ON P.PNAME=ST.PNAME
WHERE P.SEX='M' AND ST.INSTITUTE='SABHARI';

-- 93. Programmers who have not developed any packages
SELECT PNAME
FROM PROGRAMMER
WHERE PNAME NOT IN (SELECT DISTINCT PNAME FROM SOFTWARE);

-- 94. Total cost of software developed by programmers of Apple
SELECT SUM(S.DCOST)
FROM SOFTWARE S
JOIN STUDIES ST ON S.PNAME=ST.PNAME
WHERE ST.INSTITUTE='APPLE';
-- 95. Display names of programmers who have not developed any packages.
SELECT PNAME
FROM PROGRAMMER
WHERE PNAME NOT IN (
    SELECT DISTINCT PNAME
    FROM SOFTWARE
);

-- 96. Programmers having same PROF2
SELECT *
FROM PROGRAMMER
WHERE PROF2 IN (
    SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING COUNT(*)>1
);

-- 97. Total sales value institute-wise
SELECT ST.INSTITUTE, SUM(S.SCOST*S.SOLD)
FROM STUDIES ST
JOIN SOFTWARE S ON ST.PNAME=S.PNAME
GROUP BY ST.INSTITUTE;

-- 98. Institute of person who developed costliest package
SELECT ST.INSTITUTE
FROM STUDIES ST
JOIN SOFTWARE S ON ST.PNAME=S.PNAME
ORDER BY S.DCOST DESC
LIMIT 1;

-- 99. Language listed in PROF but not used in any package
SELECT DISTINCT PROF
FROM (
    SELECT PROF1 AS PROF FROM PROGRAMMER
    UNION
    SELECT PROF2 FROM PROGRAMMER
) X
WHERE PROF NOT IN (SELECT DISTINCT DEV_IN FROM SOFTWARE);

-- 100. Salary and course of person who developed highest selling package
SELECT P.SALARY, ST.COURSE
FROM SOFTWARE S
JOIN PROGRAMMER P ON S.PNAME=P.PNAME
JOIN STUDIES ST ON P.PNAME=ST.PNAME
ORDER BY S.SCOST*S.SOLD DESC
LIMIT 1;

-- 101. Months to recover course fee
SELECT ST.PNAME,
       CEIL(ST.COURSEFEE / (S.SCOST*S.SOLD/12)) AS RECOVER_MN
FROM STUDIES ST
JOIN SOFTWARE S ON ST.PNAME=S.PNAME;

-- 102. Costliest package by person with under 3 years experience
SELECT S.TITLE
FROM SOFTWARE S
JOIN PROGRAMMER P ON S.PNAME=P.PNAME
WHERE TIMESTAMPDIFF(YEAR,P.DOJ,CURDATE())<3
ORDER BY S.DCOST DESC
LIMIT 1;

-- 103. Average salary of programmers with sales >50000
SELECT AVG(P.SALARY)
FROM PROGRAMMER P
JOIN SOFTWARE S ON P.PNAME=S.PNAME
GROUP BY P.PNAME
HAVING SUM(S.SCOST*S.SOLD)>50000;

-- 104. Packages by students of institute charging lowest fee
SELECT COUNT(*)
FROM SOFTWARE
WHERE PNAME IN (
    SELECT PNAME
    FROM STUDIES
    WHERE COURSEFEE = (SELECT MIN(COURSEFEE) FROM STUDIES)
);


-- 105. Packages by developer of cheapest package and where studied
SELECT COUNT(*), ST.INSTITUTE
FROM SOFTWARE S
JOIN STUDIES ST ON S.PNAME=ST.PNAME
WHERE S.SCOST=(SELECT MIN(SCOST) FROM SOFTWARE)
GROUP BY ST.INSTITUTE;

-- 106. Packages by female programmers earning more than highest male
SELECT COUNT(*)
FROM SOFTWARE S
JOIN PROGRAMMER P ON S.PNAME=P.PNAME
WHERE P.SEX='F' AND P.SALARY>
(SELECT MAX(SALARY) FROM PROGRAMMER WHERE SEX='M');

-- 107. Packages by most experienced programmers from BDPS
SELECT S.TITLE
FROM SOFTWARE S
JOIN PROGRAMMER P ON S.PNAME=P.PNAME
JOIN STUDIES ST ON P.PNAME=ST.PNAME
WHERE ST.INSTITUTE='BDPS'
AND P.DOJ=(SELECT MIN(DOJ) FROM PROGRAMMER);

-- 108. Programmers and institutes (including no packages)
SELECT P.PNAME, ST.INSTITUTE
FROM PROGRAMMER P
LEFT JOIN STUDIES ST ON P.PNAME=ST.PNAME;

-- 109. Each PROF with number of programmers and packages
SELECT PROF,
       COUNT(DISTINCT PNAME),
       COUNT(TITLE)
FROM (
    SELECT P.PNAME, P.PROF1 AS PROF, S.TITLE
    FROM PROGRAMMER P LEFT JOIN SOFTWARE S ON P.PNAME=S.PNAME
    UNION ALL
    SELECT P.PNAME, P.PROF2, S.TITLE
    FROM PROGRAMMER P LEFT JOIN SOFTWARE S ON P.PNAME=S.PNAME
) X
GROUP BY PROF;

-- 110. Programmer names and number of packages developed
SELECT PNAME, COUNT(*)
FROM SOFTWARE
GROUP BY PNAME;
