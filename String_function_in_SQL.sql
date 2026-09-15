create database n325_db;
USE n325_db;

CREATE TABLE company(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    job_role VARCHAR(50),
    salary DECIMAL(10,2) DEFAULT 20000,
    hire_date DATE,
    city VARCHAR(50)
);

INSERT INTO company
(emp_id, emp_name, department, job_role, salary, hire_date, city)
VALUES
(101, 'Rahul Sharma', 'IT', 'Developer', 65000, '2021-01-15', 'Nagpur'),
(102, 'Priya Singh', 'HR', 'HR Manager', 75000, '2020-05-20', 'Mumbai'),
(103, 'Amit Kumar', 'IT', 'Developer', 70000, '2022-03-10', 'Pune'),
(104, 'Sneha Patil', 'Finance', 'Accountant', 60000, '2021-07-12', 'Nagpur'),
(105, 'Rohit Verma', 'IT', 'Tester', 55000, '2023-02-18', 'Mumbai'),
(106, 'Neha Joshi', 'HR', 'Recruiter', 50000, '2022-11-25', 'Pune'),
(107, 'Vikas Gupta', 'Finance', 'Manager', 85000, '2019-09-30', 'Delhi'),
(108, 'Anjali Rao', 'IT', 'Developer', 80000, '2020-12-05', 'Delhi'),
(109, 'Suresh Yadav', 'Sales', 'Executive', 45000, '2023-06-15', 'Nagpur'),
(110, 'Pooja Mehta', 'Sales', 'Manager', 70000, '2021-10-10', 'Mumbai');

select * from company;

## string funtion
select emp_name,length(emp_name)as 'no.of charecter' from company;

-- concat 
select concat(emp_name,' - ',department) from company;

-- SUBSTR (STRING,STRING_POSITION, LENGTH)
SELECT EMP_NAME, substr(EMP_NAME,2,4),substring(EMP_NAME,2,4) FROM COMPANY;
SELECT CITY, SUBSTR(CITY,1,3) FROM COMPANY;

-- TRIM() : Removes unnecessary space --
select 
emp_name, trim (emp_name) as cleaned_name
from company;

select length(' Nagpur '), length(trim(' Nagpur ')) from dual;

-- replace (old_string, new_str)-- 
select emp_name from company;
select 
emp_name,
replace(emp_name,'a','@')as modified_name
from company;

## mathematical function
-- 1) roundoff
select
emp_name,
salary,salary/12,
round(salary/12 ,0) as monthly_salary
from company;

-- 2) floor function
select 
salary/12,
floor(salary/1000) as rounded_down_salary,
ceil(salary/12) as rounded_high_salary
from company;

-- 3)ABS() --
SELECT
EMP_NAME,JOB_ROLE,SALARY,SALARY-60000,
ABS(SALARY-60000) AS SALARY_DIFFERENCE_WITH_ABS
FROM COMPANY;

-- 4) MOD()
select
EMP_ID,
MOD(EMP_ID,2) AS REMINDER,
MOD (SALARY,2)
FROM COMPANY;

-- 5) POWER()
SELECT
SALARY,
POWER(SALARY,2) AS SALARY_SQUARE
FROM COMPANY;

## COMPARISION OPERATORS
-- 1) GREATEST()
SELECT max(SALARY) FROM COMPANY;
SELECT MIN(SALARY) FROM COMPANY;
SELECT GREATEST(78,12,781,234,78989,133098) FROM DUAL;

SELECT
department,
SALARY,
greatest(SALARY,60000) AS SALARY_GREATER_THAN_60000
FROM COMPANY;

 -- LEAST()
 SELECT LEAST(12,11,34,09,46,3) FROM DUAL;
 
 SELECT 
 EMP_NAME,
 SALARY,
 least(SALARY,60000) AS SALARY_LESS_THAN_60000
 FROM COMPANY;
 
 ## COMAPRISION OPERATOR
 
 SELECT EMP_NAME,SALARY FROM company
 WHERE SALARY > 60000;
 
SELECT department,concat('₹ ',ROUND(SUM(salary),0)) AS 'DEPARTMENT_WISE_SALARY'
FROM company
GROUP BY department
HAVING SUM(salary) > 120000 ORDER BY SUM(SALARY);

-- DISTINCT --
SELECT distinct SALARY FROM COMPANY;
SELECT distinct CITY FROM COMPANY;

SELECT EMP_NAME,SALARY,SALARY*1.25 AS 'SALARY INCREASED BY 25%' FROM COMPANY
WHERE SALARY = 70000;

SELECT SALARY, SALARY*(1-0.1)
FROM COMPANY;

# NOT EQUAL TO
SELECT * 
FROM COMPANY
WHERE SALARY <> 50000;

SELECT * 
FROM COMPANY
WHERE SALARY != 50000;

# COMPARISION BASED ON CLASSIFICATION
SELECT DEPARTMENT,SALARY,
CASE
WHEN SALARY >=75000 THEN 'HIGH SALARY'
WHEN SALARY >= 60000 THEN 'MEDIUM SALARY'
ELSE ' LOW SALARY'
END AS SALARY_CATEGORY
FROM COMPANY;

## Aggregate functions in sql
-- Aggregation functions performs calculation on multiple rows.

SELECT COUNT(emp_id) AS total_employees_in_company
FROM company;

select department,count(*) as 'department_wise_employees' from company group by department;

SELECT department,sum(salary) AS total_employees
FROM company group by department;

SELECT department,avg(salary) AS total_salary
FROM company
group by department;

-- All Aggregation function --
SELECT
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM company;