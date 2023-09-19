-- structured query language
-- RDBMS -->Relational database mangaement system
-- data are structured and can be stored in rows(record) and columns. 
-- not case sensitive
-- languages in mysql
-- DDL --> data definition language
-- DML --> data manipulation language
-- DQL --> data query language
-- DCL --> data control language
-- TCL --> Transaction control language

-- DDL --> create, alter,drop,truncate,rename
-- DML --> insert, delete, update
-- DQL --> select
-- DCL --> Grant, revoke
-- TCL --> commit, rollback and savepoint

create database session1;
use session1;

create table student(
stu_id int,
stu_name varchar(30),
stu_grade varchar(10),
batch varchar(5));

select * from student;

insert into student values(101,'Pavani','A','First');
insert into student values(102,'Dinesh','B','Sec');
insert into student values(103,'Janarthanan','C','First');
insert into student values(104,'Yuvaraj','D','Sec');
insert into student values(105,'Prema','E','First');

select * from student 
where stu_name = 'Janarthanan';

select * from student 
where batch = 'sec';

update student set stu_name = 'Cavy'
where stu_id = 102;
select * from student;

use sq1;

select * from student;
-- describing the tables
describe student;

select sname from student where sid = 102;

-- Relational operators or comparison operators
-- =,>=,<=,!=,<>,>,<
select * from student where marks=75;
select * from student where marks!=75; -- not equal to
select * from student where marks<>75; -- not equal to
select * from student where marks>=75;

-- list out the students those who have got marks between 60 and 75
select sname,marks from student
where marks between 60 and 75;
select * from student;
-- logical operator and, or
select * from student 
where sid>105 and marks>60;
select * from student 
where sid>105 or marks>80;

select * from student
where marks>80;
select * from student
where sid>105;
 
-- List out the students whose name starts with R?
select sname from student
where sname like 'R%';
-- List out the students whose second letter of the name starts with a?
select sname from student
where sname like '_a%';
-- List out the students who j in their name ?
select sname from student where sname like '%j%';
select * from student;

set safe_sql_updates = 0;
update student set sname = 'Janarthanan'
where sid = 101; 

select * from student;
update student set city = 'Hyd'
where sid = 101;

update student set city = 'Delhi'
where city is NULL;

update student set city = 'Pune'
where sid between 101 and 103;

update student set city = 'Chennai'
where sid in (101,102,103);
select * from student;

rename table student to student_details;
select * from student_details;

-- drop --> permanent deletion of a table
-- truncate --> deleting the records in the table

alter table student_details
drop city;

delete from student_details where sid=100;

delete from student_details where sid = 103;

delete from student_details where sid in (102,104,107);

alter table student_details
rename column sid to student_id;

select * from student_details;

-- string functions

select ltrim('Athicavy   ') from dual;
select * from products;
select * from customers;

select first_name, upper(first_name) as a,lower(first_name) b,lcase(first_name) c from customers;

-- substr,replace,instr

-- Number functions
-- power,abs,ceil,floor,sign,round

select name from products;
select name, replace(name,'a','A') from products;
select name, substr(name,1,1) from products;
select name, substr(name,1,8) from products;
select name, substr(name,2,9) from products;

select name, replace(name,substr(name,1,1),lower(substr(name,1,1))) as a from products;

select name, replace(name,substr(name,1,1),lower(substr(name,1,1))) as a from products;

-- case end
select * from products;

-- price<15, price is low
-- price is greater than 15 and price<20, price is moderate
-- price >= 20 price <30, price is high
-- price >=30 , price is expensive

select name, product_id,price,
case 
when price<15 then 'Price is low'
when price>=15 and price<20 then 'Price is moderate'
when price>=20 and price<30 then 'Price is high'
when price>=30 then 'Price is expensive'
end comments
from products;

create view v10 as(select name, product_id,price,
case 
when price<15 then 'Price is low'
when price<20 then 'Price is moderate'
when price<30 then 'Price is high'
when price>=30 then 'Price is expensive'
end comments
from products);
select * from v10;

-- price<15, 10% discount
-- price is greater than 15 and price<20, 15% of discount
-- price >= 20 price <30, 20% of discount
-- price >=30 , 25% of discount
select * from v2;
select * from v3;

create view v12 as (
select name,price,
case
when price<15 then round(price*0.90,2)
when price<20 then round(price*0.85,2)
when price<30 then round(price*0.80,2)
when price>=30 then round(price*0.75,2)
end as discount from products);

select * from customers;
select first_name,last_name,concat(first_name,' ', last_name) Name from customers;

-- Aggregate functions
-- max, min,avg,sum, count

select * from products;
select max(price), min(price),sum(price),avg(price),count(price) from products;

select avg(price) from products;
select * from products
where product_type_id is NULL;

-- avg price based on the product type id and the product type id should not be null
select product_type_id, avg(price) from products
where product_type_id is not null
group by product_type_id;

select product_type_id, avg(price) from products
group by product_type_id;

-- avg price >20 based on the product type id and the product type id should not be null
select product_type_id, avg(price) from products
where product_type_id is not null 
group by product_type_id
having avg(price)>20;

-- how to write a query
-- select from
-- where
-- group by
-- having
-- order by 
-- limit

-- internal working 
-- from
-- where
-- group by
-- having
-- select
-- order by
-- limit

-- joins
 -- used to combine rows from two or more tables
 -- types of joins
 -- inner join --> it returns all the matching values in both of the tables
 -- left join --> returns all the records from the left tables and the matched records from the right table
 -- right join --> returns all the records from the right tables and the matched record from the left table
 -- cross join --> returns all the records from both the tables
 
 -- inner join 
 select * from products;
 select * from product_types;
 
select p.product_type_id, p.description,p.name,p.price, pt.name
from products p, product_types pt
where p.product_type_id = pt.product_type_id;

select p.name,p.description, pt.name
from products p inner join product_types pt
where p.product_type_id = pt.product_type_id;
 
select p.name,p.description, pt.name
from products p inner join product_types pt
on p.product_type_id = pt.product_type_id;

select * from customers;
select * from purchases;

select concat(c.first_name,' ', c.last_name) name, c.customer_id, p.quantity
from customers c , purchases p
where c.customer_id = p.customer_id;

select * from products;
select * from purchases;

select sum(pu.quantity),pu.product_id,p.name
from products p, purchases pu
where p.product_id = pu.product_id
group by pu.product_id, p.name;

create view v9 as(
select sum(pu.quantity),pu.product_id,p.name
from products p inner join purchases pu
on p.product_id = pu.product_id
group by pu.product_id, p.name);

select * from v9;



