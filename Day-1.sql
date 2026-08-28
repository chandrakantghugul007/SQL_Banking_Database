-- to create database --
create database N325;
-- to display database --
show databases;

-- to select the database --
use N325;

create database ds;

-- drop the database--
drop database ds;

-- how to create table --
create table if not exists employee
(
emp_id int, emp_name varchar(20),salary double,hiring_date date
);

-- describe the table --
desc employee;
describe employee;
-- insert records in table --
insert into employee(emp_id,emp_name,hiring_date) values(1,'Suresh','2026-08-27');

-- to display / retrive table --
select * from employee;

-- to display records of specific column from table --
select emp_name from employee;
