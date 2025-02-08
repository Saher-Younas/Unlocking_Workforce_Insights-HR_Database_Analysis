CREATE DATABASE hr_db;
SELECT * FROM hr;
	
-- Change name of the column

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

Select birthdate FROM hr;
DESCRIBE hr;

SET sql_safe_updates= 0;

UPDATE hr 
SET birthdate=CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END; 

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

UPDATE hr 
SET hire_date=CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END; 

select hire_date from hr;
SELECT termdate from hr;

-- UPDATE hr
-- SET termdate= date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
-- WHERE termdate IS NOT NULL AND termdate!='';

UPDATE hr
SET termdate = DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';

SELECT termdate from hr;

alter table hr
modify column termdate date;
SELECT termdate from hr;

alter table hr
modify column hire_date date;
SELECT hire_date from hr;


ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age = TIMESTAMPDIFF(YEAR, birthdate, CURDATE());

SELECT birthdate, age FROM hr;

SELECT
	MIN(age) as youngest,
    MAX(age) as oldest
FROM hr;

SELECT count(*) FROM hr WHERE age<18;

-- ----------------------------------
-- Questions:
-- -----------------------------------
-- 1. What is the Gender breakdown of employees in the company?
SELECT gender, count(*) AS count
FROM hr
WHERE age>18 
GROUP BY gender;

-- 2. What is the race/ethnicity breakdown of employees in the company?
Select race, COUNT(*) as count
FROM hr
WHERE age>=18 
GROUP BY race
ORDER BY count DESC;



