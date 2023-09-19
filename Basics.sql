create database exploresql;
use exploresql;
create table student(
sid integer,
sname varchar(20),
marks integer
);
select * from student;

insert into student values(100,'Ram',71);
insert into student values(101,'Raj',75);
insert into student values(102, 'Rajesh' , 65);
insert into student values(103, 'Deepa' , 79);
insert into student values(104, 'Deepak' , 91);
insert into student values(107, 'Animesh' , 82);
insert into student values(108, 'Harish' , 63);
insert into student values(110, 'Hitesh' , 55);
insert into student values(120, 'Sam' , 50);
insert into student values(130, 'Shreya' , 49);


select sid,sname from student;
select marks,sname from student;

select * from student;


select * from student
where sid=102;

select * from student
where marks=75; 

select * from student
where sname='Harish';

-- Relational operators or comparison operators
-- =,>=,>,>=,>,!=,<>
select * from student where marks = 75;
select * from student where marks <> 75;
select * from student where marks != 75;
select * from student where marks < 75;
select * from student where marks <= 75;
select * from student where marks > 75;
select * from student where marks >= 75;

-- List the students who has got marks between 60 and 75
select * from student
where marks between 60 and 75;

select * from student 
where marks>=60 and marks<=75;

-- Logical  operators
-- AND,OR, NOT

select * from student 
where sid>105 and marks>60;

select * from student 
where sid>105 or marks>60;

select * from student
where sname='Sam';


select * from student
where sname like 'R%';

select * from student
where sname like '%m';

select * from student
where sname like '_h%'; -- second letter h 

-- 1. List students whose name starts with R
select * from student
where sname like 'R%';

-- 2 List students whose name ends with h
select * from student
where sname like '%h';
 
 -- 3 list students whose sec letter is a 'n'
 select * from student
where sname like '_n%';
 
 -- 4 List students whose name contains 'e'
 select * from student
where sname like '%e%';

-- 5. List students whose name ends in j
 select * from student
where sname like '%j';

-- 6. List students whose name contains 'sh'
 select * from student
where sname like '%sh%';

-- 7. List students whose name starts with R and is 3 characters
 select * from student
where sname like 'R__';

-- 8. List students whose name is 6 characters long
 select * from student
where sname like '______';

 select * from student
where length(sname) = 5;

 select * from student
where sname not like 'R%';

 select * from student
where sid = 104 or sid = 107;

 select * from student
where sid in (104,107,101,102); -- in is used to add multiple values

select * from student
where sid not in (104,107,101,102);



CREATE TABLE customers (
customer_id integer primary key,
first_name varchar(10) NOT NULL,
last_name varchar(10) NOT NULL,
dob DATE,
phone varchar(12)
);
Insert into customers (customer_id, first_name,last_name,dob,phone) values(
1,'John','Brown','1965-01-01','800-555-1211');

Insert into customers (customer_id, first_name,last_name,dob,phone) values(
2,'Cynthia','Green','1968-02-05','800-555-1212');

Insert into customers (customer_id, first_name,last_name,dob,phone) values(
3,'Steve','White','1971-03-16','800-555-1213');
 
Insert into customers (customer_id, first_name,last_name,dob,phone) values(
4,'Gail','Black',NULL,'800-555-1214');

Insert into customers (customer_id, first_name,last_name,dob,phone) values(
5,'Doreen','Blue','1970-05-20',NULL);

select * from customers;

-- 1. List all customers
select * from customers;
  -- List customers whose
  -- 2. last name stats with 'Bl'
  select * from customers
  where last_name like 'Bl%';
  -- 3. who were born before Jan 1st 1970
   select * from customers
  where dob > 01-01-1970;
  -- 4. whose first name or last name contains 'ee'
   select * from customers
  where first_name like '%ee%' or last_name like '%ee%';
  -- 5. whose phone number ends in 12
   select * from customers
  where phone like '%12';
  -- 6. whose phone number contains 12
    select * from customers
  where phone like '%12%';
  -- 7 who do not have a phone number
     select * from customers
  where phone is NULL ;
  -- 8 who do not have a dob
    select * from customers
  where dob is NULL ;
  -- 9 lets merge the first name and last name together and print customer_name
select first_name , last_name, concat(first_name,' ',last_name) as customer_name from customers;

describe customers;
show tables;


use exploresql;
create table product_types(
product_type_id integer primary key,
name varchar(10) not null
);
create table products(
product_id integer primary key,
product_type_id integer references product_types(product_type_id),
name varchar(30) not null,
description varchar(50),
price decimal(5,2)
);

insert into product_types(product_type_id,name) values(1,'Book');
insert into product_types(product_type_id,name) values(2,'Video');
insert into product_types(product_type_id,name) values(3,'DVD');
insert into product_types(product_type_id,name) values(4,'CD');
insert into product_types(product_type_id,name) values(5,'Magazine');
select * from product_types;

INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (1, 1, 'Modern Science', 'A description of modern science', 19.95);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (2, 1, 'Chemistry', 'Introduction to Chemistry', 30.00);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (3, 2, 'Supernova', 'A star explodes', 25.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (4, 2, 'Tank War', 'Action movie about a future war', 13.95);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (5, 2, 'Z Files', 'Series on mysterious activities', 49.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (6, 2, '2412: The Return', 'Aliens return', 14.95);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (7, 3, 'Space Force 9', 'Adventures of heroes', 13.49);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (8, 3, 'From Another Planet', 'Alien from another planet lands on Earth', 12.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (9, 4, 'Classical Music', 'The best classical music', 10.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (10, 4, 'Pop 3', 'The best popular music', 15.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (11, 4, 'Creative Yell', 'Debut album', 14.99);
INSERT INTO products (  product_id, product_type_id, name, description, price) VALUES (12, NULL, 'My Front Line', 'Their greatest hits', 13.49);
 select * from products;