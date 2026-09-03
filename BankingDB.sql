create database BankingDB;
use BankingDB;
CREATE TABLE Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

describe Customers;

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);
CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);
drop table transactions;

-- Alter Commands --

ALTER TABLE Customers
ADD DateOfBirth DATE;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);


ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

DROP TABLE AccountBranches;

ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID);

ALTER TABLE Accounts
ADD CustomerID INT;

 
ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);

-- New Tables --
CREATE table Persons (
ID int NOT null,
LastName varchar(255) Not null,
FirstName varchar(255) not null,
Age int
);

ALTER TABLE Persons
MODIFY Age INT NOT NULL;


insert into persons values(1,'pandey','hitesh',33);
select * from persons;
select FirstName,LastName,concat(FirstName,"_",LastName) as 'EmployeeName' from Persons;

alter table persons add column Email varchar(200);

ALTER TABLE Persons
MODIFY Email Varchar(200) unique;

insert into persons values(2,'saxsena','Rajeev',23,'rajeev_saxsena@gmail.com'),(3,'Kapoor','jay',26,'kapoor_jay12@gmail.com'),(4,'ganatra','bhavin',23,'ganatra_bhavin@gmail.com');
select * from persons;

-- Making Primary key--
alter table Persons modify ID int primary key;
desc persons;

-- Check Constraint on 'age' Column --
alter table persons add constraint persons_chk check(age>18);
desc persons;

insert into persons values(5,'Gandhi','rahul',25,'rahul_gandhi@gmail.com');
insert into persons values (6,'gandhi','rajeev',19,'gandhi_rajeev@gmail.com'),(7,'gandhi','sanjay',29,'gandhi_sanjay@gmail.com');

create table Employees (
EmployeeID int primary key,
EmployeeName varchar(100) not null,
Department varchar(100),
Salary decimal(10,2),
JoiningDate DATE DEFAULT (CURRENT_DATE),
City varchar(50)
);

insert into Employees values (1,'rahul Sharma','it',50000,'2026-09-01','mumbai');

alter table Employees modify column salary int default 20000;

insert into Employees (employeeid, employeename,department,joiningdate,city) values (2,'chandrakant','it','2026-09-01','nagpur');

select * from Employees;

insert into Employees (employeeid, employeename,department,Salary,city) 
values
(3,'Priya patil','HR',45000,'pune'),
(4,'Amit Kumar','finance',60000,'Delhi'),
(5,'Snehal Joshi','IT',55000,'nagpur'),
(6,'Rohan Verma','Marketing',48000,'Mumbai');

select * from Employees;

alter table Employees alter city set default 'nagpur';

desc employees;

insert into employees (employeeid, employeename,department,Salary,JoiningDate) 
values
(7,'Gautam','HR',85000,'1997-01-16');

select * from employees;

#Foreign Key

create table Department (
DepartmentID int primary key,
DepartmentName varchar(50)
);
insert into Department values (101,'IT'),(102,'HR'),(103,'Finance');

create table Manager ( 
ManagerID INT primary key,
ManagerName varchar(100) not null
);

Create table EmployeeChild (
EmployeeID int primary key,
EmployeeName Varchar(100),
Departmentid int,

foreign key (DepartmentID)
references Department(DepartmentID),

foreign key(EmployeeID)
references Manager(ManagerID)
);

-- LAB 02 --

use bankingdb;
create table AccountBranches(
Assignmentdate date
);


alter table customers add DateOfBirth date;

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(102,'Kunal','Modi','Kunal@gmail.com','8989425438','1997-06-20');

select * from customers;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);

select * from accounts;

UPDATE customers
SET PHONE='9689425438'
WHERE CUSTOMERID = 101;

SELECT * FROM Customers
WHERE CustomerID = 101;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;

SELECT * FROM Customers
WHERE CustomerID = 101;

SET SQL_SAFE_UPDATES = 0;
UPDATE ACCOUNTS
SET BALANCE = 30000
WHERE ACCOUNTID = 201;

SELECT * FROM transactions;
DESC ACCOUNTS;
