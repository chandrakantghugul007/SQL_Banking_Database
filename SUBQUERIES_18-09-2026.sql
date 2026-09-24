USE SHOPPINGDB;

CREATE TABLE USERS(
USER_ID INT PRIMARY KEY,
USERNAME VARCHAR (50),
COUNTRY VARCHAR (50),
FOLLOWERS INT
);

CREATE TABLE POSTS(
POST_ID INT PRIMARY KEY,
USER_ID INT,
POST_TEXT VARCHAR (255),
FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID)
);

INSERT INTO users
(user_id, username, country, followers)
VALUES
(1, 'Rahul', 'India', 800000), (2, 'Priya', 'India', 600000),
(5, 'John', 'USA', 700000), (6, 'Emma', 'USA', 400000), (3, 'Amit', 'India', 300000), (4, 'Sneha', 'USA', 900000),
(7, 'Rohan', 'UK', 200000), (8, 'Sophia', 'UK', 100000);

SELECT * FROM USERS;

INSERT INTO posts
(post_id, user_id, post_text)
VALUES
(101, 1, 'Learning SQL'), (102, 1, 'Learning Python'),(103, 2, 'Data Science'),(104, 4, 'Machine Learning'),
(105, 4, 'AI Tutorial'), (106, 5, 'Power BI'), (107, 7, 'My First Post');

-- Scalar Subquery : this returns one row and column, i.e. single value. returns only one row value.
-- 1)
select round(avg(followers),2) as 'average followers'
from users;


-- 2) find the username whose followers is greater than the average followers
select username, followers
from users
where followers > (
select avg(followers)
from users);

-- 3) find user with maximum followers
select username, followers,country
from users
where followers = (
select max(followers)
from users);

-- 4) find user with min followers
select username, followers,country
from users
where followers = (
select min(followers)
from users);

-- 5) find user above 500000 follwers
select username, followers,country
from users
where  followers > 500000;

select username, followers,country
from users
where  followers >
( SELECT 500000);

-- MULTIPLE ROW SUBQUERY
-- THIS RETURNS MULTIPLE ROWS AND MULTIPLE COLUMNS USED WITH 1) IN  2) ANY 3) ALL 4) EXISTS

SELECT COUNTRY, AVG(FOLLOWERS)
FROM USERS
GROUP BY COUNTRY
HAVING AVG(FOLLOWERS) >500000;

-- FIND USERS FROM OUNTRY WHOSE AVG FOLLOWERS EXCEED 500000

SELECT USERNAME,COUNTRY, FOLLOWERS
FROM USERS
WHERE COUNTRY IN (
SELECT COUNTRY
FROM USERS
GROUP BY COUNTRY
HAVING AVG(FOLLOWERS) > 500000);

-- NOT IN WITH SUBQUERY
-- FIND THE USER WHO ARE NOT FROM COUNTRIES HAVING AVERAGE FOLLOWERS ABOVE 500000

SELECT USERNAME,COUNTRY, FOLLOWERS
FROM USERS
WHERE COUNTRY NOT IN (
SELECT COUNTRY
FROM USERS
GROUP BY COUNTRY
HAVING AVG(FOLLOWERS) > 500000);


-- ANY WITH SUBQUERY
-- ANY COMPARES A VALUE WITH AT LEAST ONE VALUE RETURNED BY THE SUBQUERY.

-- FIND USERS WHOSE FOLLOWERS ARE GREATER THAN ATLEAST ONE OF THESE VALUES.
SELECT USERNAME, FOLLOWERS
FROM USERS
WHERE FOLLOWERS > ANY(
SELECT FOLLOWERS
FROM USERS
GROUP BY COUNTRY = 'UK');

-- ALL WITH SUBQUERY
-- ALL REQUIRES COMPARISION TO BE TRUE FOR EVERY VALUE RETUREN BY THE SUBQUERY

SELECT USERNAME, FOLLOWERS
FROM USERS
WHERE FOLLOWERS > ALL(
SELECT FOLLOWERS
FROM USERS
WHERE COUNTRY = 'UK');

-- EXISTS WITH SUBQUERY

SELECT USERNAME,USER_ID
FROM USERS U 
WHERE EXISTS(
SELECT 1
FROM POSTS P
WHERE P.USER_ID = U.USER_ID); 

-- NOT EXISTS WITH SUBQUERY

SELECT USERNAME,USER_ID
FROM USERS U 
WHERE NOT EXISTS(
SELECT 1
FROM POSTS P
WHERE P.USER_ID = U.USER_ID); 

## TYPE 3
## correlated SQ : A correlated SQ refrance  a column from the outer query and 
## is evaluated for each outer row .
-- Ques - find user whose  follower are greater than their country's average 

select *from users;

select country ,avg(followers)
from users
group by country order by avg(followers) desc;


select 
u1.username,
u1. country,              
u1. followers  
from users u1
where u1.followers >( 
select avg (u2.followers)
from users u2
where u2.country=u1.country
);

## Subquery in FROM
/*
A subquery inside from is called a:alter
1)derived table 2) table subquery 3) inline view
it behaves like a temporery table and must have an alis in my sql.alter*/

select
country,
avg(followers) as avg_followers
from users
group by country;

select 
country_data.country,
country_data.avg_followers
from (
select
country,
avg(followers) as avg_followers
from users
group by country
)as country_data
where country_data.avg_followers > 500000;

select *
from (
select 
country,
count(user_id) as total_users,
avg(followers) as avg_followers
from users
group by country
) as country_summary where country ='usa'; 

select *
from (
select 
country,
count(user_id) as total_users,
avg(followers) as avg_followers
from users
group by country
) as country_summary where country in('uk','india');

 select *
from (
select 
country,
avg(followers) as avg_followers
from users
group by country
) as country_summary 
where avg_followers > 500000;


## SubQuery in Where Clause
-- find user who have posts
select user_id,username
from users
where user_id in (
select user_id
from posts
);

-- find user who have no posts
select user_id,username
from users
where user_id not in (
select user_id
from posts
);

## Nested Subquery: a subquery that contain another subquery
select username, followers
from users
where followers > (
select avg (followers)
from users
where country = (select country
from users
where username = 'Rahul')
);
