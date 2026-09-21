use n325_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers
VALUES
(101, 'Amit', 'Nagpur'),
(102, 'Priya', 'Pune'),
(103, 'Rahul', 'Mumbai'),
(104, 'Sneha', 'Delhi'),
(105, 'Vikas', 'Nashik');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2)
);

INSERT INTO orders
values(1,101,'laptop',55000),
(2,102,'mobile',25000),
(3,101,'mouse',1500),
(4,103,'keyboard',3000),
(5,102,'monitor',12000),
(6,106,'printer',18000);

DROP TABLE ORDERS;
## INNER JOINS: INNER JOIN RETURN ONLY THE RECORD THAT MATCHING VALUES IN BOTH TABLES

SELECT
C.*,O.*
FROM CUSTOMERS AS C INNER JOIN ORDERS AS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID;

SELECT
C.CUSTOMER_ID,C.CUSTOMER_NAME,C.CITY,CONCAT('₹ ',O.AMOUNT),O.PRODUCT
FROM CUSTOMERS AS C INNER JOIN ORDERS AS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID;

## LEFT JOIN 
SELECT
C.CUSTOMER_ID,C.CUSTOMER_NAME,C.CITY,CONCAT('₹ ',O.AMOUNT),O.PRODUCT
FROM CUSTOMERS AS C LEFT JOIN ORDERS AS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID;

## RIGHT JOIN
SELECT
C.CUSTOMER_ID,C.CUSTOMER_NAME,C.CITY,CONCAT('₹ ',O.AMOUNT),O.PRODUCT
FROM CUSTOMERS AS C RIGHT JOIN ORDERS AS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID;

## CROSS JOIN OR CARTESIAN JOIN
SELECT
C.CUSTOMER_ID,C.CUSTOMER_NAME,C.CITY,CONCAT('₹ ',O.AMOUNT),O.PRODUCT
FROM CUSTOMERS AS C CROSS JOIN ORDERS AS O;

## SELF JOIN / EQUIE JOIN
-- a table join itself --
create table employees(
employee_id int primary key,
employee_name varchar(50),
manager_id int
);

insert into employees
values
(1,'amit',null),
(2,'priya',1),
(3,'rahul',1),
(4,'sneha',2),
(5,'rocky',3);

select 
e.employee_name as Employee,
m.employee_name as Manager
from employees e left join employees m
on e.manager_id = m.employee_id;

create table employee_new(
employee_id int primary key,
employee_name varchar(50),
department varchar(50)
);

insert into employee_new
values
(1,'Rahul','IT'),
(2,'priya','HR'),
(3,'Hitesh','IT'),
(4,'Gaurav','HR'),
(5,'Amit','FINANCE');

SELECT 
    E_N1.EMPLOYEE_NAME AS EMPLOYEE_1,
    E_N2.EMPLOYEE_NAME AS EMPLOYEE_2,
    E_N1.DEPARTMENT, E_N2.DEPARTMENT
FROM EMPLOYEE_NEW E_N1
JOIN EMPLOYEE_NEW E_N2
    ON E_N1.DEPARTMENT = E_N2.DEPARTMENT;
    
    ## FULL OUTER JOINS: MYSQL dose not directly support, but we can make full outer join by union of left join and right join. --
    -- this will give records from both tables including unmatched records. --
    -- full join or full outer join: it will return matching and non-matching rows from both tables. --
    select
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.product
    from customers c
    left join orders o
    on c.customer_id = o.customer_id
    
    union
    
    select
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.product
    from customers c
    right join orders o
    on c.customer_id = o.customer_id;
    
    
    ## join with where clause --
     select
    c.*,
    o.product,
    o.amount
    from customers c
    inner join orders o
    on c.customer_id = o.customer_id
    where o.amount>12000;
    
     
    
    ##joins with group by
  
    select
   c.*,sum(o.amount)
    from customers c
    inner join orders o
    on c.customer_id = o.customer_id
    group by o.customer_id
    having c.amount > 50000;
    
    -- IN operator
    
    select
    c.*,
    o.product,
    o.amount
    from customers c
    inner join orders o
    on c.customer_id = o.customer_id
    where o.product in ('laptop','Monitor') and c.city = 'nagpur';
    
    ## GROUPBY ,HAVING ,LIMIT ,OFFSET --
select
C.CUSTOMER_NAME,C.CITY,
SUM(O.AMOUNT) AS 'TOTAL_AMOUNT'
FROM CUSTOMERS C
INNER JOIN ORDERS O 
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.CUSTOMER_NAME
HAVING C.CITY IN ('PUNE','NAGPUR','MUMBAI')
ORDER BY C.CITY ASC LIMIT 1 offset 1;

select
C.CUSTOMER_NAME,C.CITY,
SUM(O.AMOUNT) AS 'TOTAL_AMOUNT'
FROM CUSTOMERS C
INNER JOIN ORDERS O 
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.CUSTOMER_NAME
HAVING sum(O.AMOUNT)>30000;    
    
CREATE TABLE PRODUCTS (PROD_ID VARCHAR (40) PRIMARY KEY,PROD_NAME VARCHAR(50),MANUFACTURED_AT VARCHAR(100)
);
INSERT INTO PRODUCTS VALUES(501,'LAPTOP','USA'),(502,'MOBILE','SOUTH KOREA'),(503,'KEYBOARD','CHINA'),(504,'MONITOR','TAIWAN');


SELECT 
C.CUSTOMER_NAME,
O.ORDER_ID
FROM CUSTOMERS C INNER JOIN ORDERS
ON C.CUSTOMER_ID = O.CUSTOMER_ID
