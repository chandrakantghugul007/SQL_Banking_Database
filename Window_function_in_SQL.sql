## Window Function 
-- syntax:
/*
SELECT COLUM_NAME,
WINDOW_FUNCTION(COLUMN_NAME2)
OVER ([PARTITION BY COLUMN_NAME3] [ORDER BY COLUMN_NAME4]) AS NEW COLUMN
FROM TABLE_NAME;
*/
 USE BANKINGDB;
-- 1) ROW_NUMBER()
SELECT SALARY, ROW_NUMBER() OVER (ORDER BY SALARY DESC)
FROM EMPLOYEES;
 
 -- RAKE WISE SALARY
 
SELECT SALARY,
RANK() OVER (ORDER BY SALARY DESC)
FROM EMPLOYEES;

use bankingdb;

create table sales (
sales_id int primary key,
employee_name varchar(50),
department varchar(50),
sales_date date,
amount decimal(10,2)
);

INSERT INTO sales
(sales_id, employee_name, department, sales_date, amount)
VALUES
(1, 'Amit', 'Electronics', '2026-01-05', 50000),
(2, 'Priya', 'Electronics', '2026-01-10', 75000),
(3, 'Rahul', 'Electronics', '2026-01-15', 75000),
(4, 'Sneha', 'Electronics', '2026-01-20', 90000),
(5, 'Vikas', 'Clothing', '2026-01-05', 40000),
(6, 'Neha', 'Clothing', '2026-01-10', 60000),
(7, 'Rohit', 'Clothing', '2026-01-20', 85000),
(8, 'Pooja', 'Clothing', '2026-01-05', 30000),
(9, 'Karan', 'Furniture', '2026-01-05', 30000),
(10, 'Anjali', 'Furniture', '2026-01-10', 55000);

select * from sales;

# Windows Function

-- Assign row number --
select *,row_number() over(order by amount desc) as 'Row_Numbers',
rank() over(order by amount desc) as 'Rank',
dense_rank() over(order by amount desc) as 'dense_Rank'
from sales;

-- Partition By --
select department,amount,
rank() over(partition by department order by amount desc)as 'department rank',
dense_rank() over(partition by department order by amount desc)as 'department dense rank',
sum(amount) over(partition by department order by amount desc)as 'total amount'
from sales;

SELECT department,SUM(amount) AS total_amount
FROM sales
GROUP BY department;

-- percentage_wise ccontribution of each department --

SELECT 
    employee_name,department,amount,
    CONCAT(ROUND(amount / SUM(amount) OVER(PARTITION BY DEPARTMENT) * 100, 2),'%') AS percentage
FROM sales;

-- LAG () -->COMPARE CURRENT VALUE WITH THE PREVIOUS VALUE --
-- LEAD () --> COMAPRE CURRENT VALUE WITH THE NEXT VALUE -- 

SELECT
SALES_ID,DEPARTMENT,SALES_DATE,AMOUNT,
LAG(AMOUNT) OVER (ORDER BY SALES_DATE),
LEAD (AMOUNT) OVER (ORDER BY SALES_DATE)
FROM SALES;

-- Running Total with use of sum() --
USE BANKINGDB;
select SALES_ID,DEPARTMENT,SALES_DATE,AMOUNT,
sum(AMOUNT) OVER (PARTITION BY DEPARTMENT ORDER BY SALES_DATE) AS 'RUNNING TOTAL'
FROM SALES;

USE BANKINGDB;
select SALES_ID,DEPARTMENT,SALES_DATE,AMOUNT,
concat('₹ ',ROUND(AVG(AMOUNT) OVER (PARTITION BY DEPARTMENT ORDER BY SALES_DATE),2)) AS 'AVERAGE SALES'
FROM SALES;

-- FIRST VALUE & LAST values --

SELECT 
    DEPARTMENT,
    FIRST_VALUE(AMOUNT) OVER (
        PARTITION BY DEPARTMENT 
        ORDER BY AMOUNT DESC
    ) AS 'FIRST VALUE'
FROM SALES;
SELECT 
    DEPARTMENT,
    AMOUNT,
    LAST_VALUE(AMOUNT) OVER (
        PARTITION BY DEPARTMENT 
        ORDER BY AMOUNT DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS 'LAST VALUE'
FROM SALES;

use bankingdb;
select department,amount, ntile(6) over (order by amount desc) as amount_6_quartile from sales;
