Create database BankingDB;
use BankingDB;
create table Customers
(
CustomerID int,
FirstName varchar(50),
LastName varchar(50),
Email varchar(100),
Phone varchar(15)
);
describe customers;

-- to add new column 'AccountCreationDate'-->Date --
alter table customers
add AccountCreationDate Date;
insert into customers(CustomerID,FirstName,LastName,Email,Phone,AccountCreationDate) 
values (101,'Raj', 'Kurve','raj_k@gmail.com', 9881004242,'2025-10-25');
-- to retrieve data from table --
-- syntax: Select * from <table_name>; --
select * from Customers;
Select FirstName,Email,AccountCreationDate from Customers;
-- Lab-2 --
use BankingDB;
create table Accounts (
AccountID int,
AccountType varchar(50),
Balance decimal(10,2)
);
describe Accounts;
show tables;
create table Transactions (
TransactionID int,
TransactionDate Date,
Amount decimal(10,2),
TransactionType varchar(20)
);
describe Accounts;

Show tables;
create table Branches(
BranchID int, BranchName varchar(100),
BranchAddress varchar(200), BranchPhone varchar(50)
);

create table AccountBranches(
AssignmentDate date);

create table loans(
LoanID int, LoanAmount Decimal(10,2), InterestRate decimal(5,2),startDate date, EndDate date
);
show tables;
# Modify the table structure by using Alter Command
/*
1) Add New Columns
2) Modify Existing Column
3)we can rename column
4)we can add constraints
5)we can remove Constraints
*/
describe customers;
-- Change data type of existing column --
alter table customers modify phone bigint;

desc customers;

alter table customers add column balance bigint;

-- add minimun balance constraints --
alter table customers
add constraint check_minimum_balance
check(balance>=5000);

-- drop accountbranches table --
-- syntax: drop table <table_name>; --
drop table accountbranches; 

-- add primary key constraint to 'customerID' in Customers table --
alter table customers
add primary key (CustomerID);
-- add unique constraint to "phone" of Customers table --
alter table customers add unique(phone);
describe Customers;
