-- Primary Key --
-- Candidate Key --
-- Foreign Key --
-- Composite Key --
-- Indexing --
CREATE DATABASE InstagramDB;

USE InstagramDB;

CREATE TABLE Users (
userid INT auto_increment primary key,
username varchar(50) not null unique,
email varchar(100) not null unique,
firstname varchar(50),
lastname varchar(50),
createdat timestamp default current_timestamp
);

create table profiles(
profile_id INT AUTO_INCREMENT PRIMARY KEY,
userid int unique not null,
bio varchar(255),
profilepicture varchar(255),
dateofbirth date,

foreign key (userid)
references users(userid)
on delete cascade
);

Create Table Posts(
post_id int auto_increment primary key,
user_id int not null,
content text,
image_url varchar(255),
created_date timestamp default current_timestamp,

foreign key (user_id)
references Users(userid)
on delete cascade
);

create table comments(
comment_id int auto_increment primary key,
user_id int not null,
post_id int not null,
comment_text varchar(500),
created_date timestamp default current_timestamp,

foreign key(user_id)
references Users(userid)
on delete cascade,

foreign key (post_id)
references Posts(post_id)
);

Create table Likes (
user_id int,
post_id int,
liked_date timestamp default current_timestamp,

primary key (user_id,post_id),

foreign key (user_id)
references users(userid)
on delete cascade,

foreign key (post_id)
references Posts(post_id)
on delete cascade
);

insert into users
(username,email,firstname,lastname)
values('hitseh123','hitesh@gmail.com','hitesh','pandey'),
('rahul_01','rahul@gmail.com','rahul','sharma'),
('priya_99','priya@gmail.com','priya','patil');

insert into profiles
(userid,bio, dateofbirth)
values(1,'data science trainer','1995-05-10'),
(2,'software Developer','1998-08-15'),
(3,'data analyst','1999-12-20');

insert into posts
(user_id,content,image_url)
Values
(1,'Learning sql database relationship!','sql.img'),
(1,'Today we learned foreign keys.','foreignkey.jpg'),
(2,'hello from instagram database!','insta.jpg');

insert into comments
(user_id,post_id, comment_text)
values
(2,1,'great explanation'),(3,1,'veryuseful topic'),(1,3,'welcome to the platform');

insert into likes (user_id, post_id)
values
(2,1),(3,1),(1,3),(3,3);
