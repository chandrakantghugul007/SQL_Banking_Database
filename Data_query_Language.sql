use bankingdb;
create table student(
Stud_id varchar(50), stud_name varchar(50),address varchar(50),
city varchar(50)
);

insert into student values(1,'Shashank','RJPM','Lucknow');

alter table student add DOB Date;

desc student;

alter table student modify stud_name  varchar(100);

alter table student drop city;

create table if not exists teacher(
teacher_id int, teacher_name varchar (100), hiring_date date,age int, salary int(100));

insert into teacher values(1,'kamal','2021-08-09',28,50000),(2,'reshma','2020-12-12',34,67000),(3,'ujjwal','2023-11-23',25,15000),(4,'jay','25-11-10',30,56000);

select * from teacher;

alter table student add constraint pk_stud_id primary key(stud_id);
desc student;

-- RENAME --
alter table student rename column stud_name to name;

insert into student values('s01','gaurav','dharampeth','2005-10-10'),
('s02','kunal','reshambagh','1999-10-08'),('s03','faran','mominpura','1997-12-10'),('s04','vaibhav','vayusena nagar','2000-11-14'),('s05','vishal','pratap nagar','2009-08-07'),('s06','kumar','ravi nagar','2005-02-05'),('s07','dinesh','sitabuldi','1996-12-12'),('s08','tanushree','medical square','2009-12-13');

select * from student;

-- count --
select count(*) from student;

-- alias declaration --
select count(*) as 'Number of Students' from student;


select name from student;

select DOB, month(DOB),monthname(DOB),dayname(DOB),dayofweek(DOB),datediff(curdate(),DOB) from student;

select dat(DOB) from student;
select * from employees;
select city,count(*)
from employees
group by city
order by city;

select Department, count(*) as 'Number of Employees'
from employees
group by department
having count(EmployeeID)>=2
order by Department;

select department,sum(salary)
from employees
group by department
order by sum(salary) desc
limit 3;

-- AGGRIGATION FUNCTION IN SQL 07-09-2026 --
-- TOTAL NUMBER OF EMPLOYEES
SELECT COUNT(*) AS 'TOTAL EMPLOYEES' FROM EMPLOYEES;

-- TOTAL SALARY
SELECT SUM(SALARY) AS 'TOTAL SALARY' FROM EMPLOYEES;

-- TOTAL SALARY BY DEPATMENT WISE
SELECT DEPARTMENT, SUM(SALARY)AS 'TOTAL SALARY' FROM EMPLOYEES GROUP BY DEPARTMENT;

-- AVERAGE SALARY DEPARTMENT WISE --
SELECT DEPARTMENT,CONCAT("₹", ROUND(AVG(SALARY),0)) AS 'AVERAGE SALARY' FROM EMPLOYEES GROUP BY DEPARTMENT;

-- AGGRIGATION FUNCTION ON SALARY DEPARTMENT WISE --
SELECT DEPARTMENT,
CONCAT("₹", ROUND(AVG(SALARY),0)) AS 'TOTAL SALARY',
CONCAT("₹", ROUND(MAX(SALARY),0)) AS 'MAX SALARY',
CONCAT("₹", ROUND(MIN(SALARY),0)) AS 'MIN SALARY',
count(*) AS 'NUMBER OF EMPLOYEE'
FROM EMPLOYEES
GROUP BY DEPARTMENT
ORDER BY AVG(SALARY);

# PATTERN MACHING:
-- FIND EMPLOYEE WHOSE NAME START WITH 'R' --
SELECT * FROM EMPLOYEES
WHERE EMPLOYEENAME LIKE 'R%';

-- FIND EMPLOYEE WHOSE NAME END WITH 'A' --
SELECT * FROM EMPLOYEES
WHERE EMPLOYEENAME LIKE '%a';

-- FIND EMPLOYEE WHOSE NAME CONATAIN 'A' --
SELECT * FROM EMPLOYEES
WHERE EMPLOYEENAME LIKE '%a%';

-- FIND EMPLOYEE NAME WHOSE SECOND CARECTER IS A --
SELECT * FROM EMPLOYEES
WHERE EMPLOYEENAME LIKE '_a%';

-- FIND THE CITY NAME WHO HAVE 5 CHARECTER IN IT --
SELECT CITY FROM EMPLOYEES
WHERE CITY LIKE '_____';

-- FIND THE CITY WHICH START WITH 'M' --
SELECT CITY FROM EMPLOYEES
WHERE CITY LIKE 'M%';



