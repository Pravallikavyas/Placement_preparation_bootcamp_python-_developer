use exploresql;

-- Join

select  p.*
from products p inner join product_types pt
on p.product_type_id = pt.product_type_id
where pt.name = 'Book';

-- Single Row Sub-query

select * from products where product_type_id = (
select product_type_id from product_types pt
where pt.name = 'Book');

-- multiple row sub-query
-- List all products whose product type name ends in a D
select * from products where product_type_id in (
select product_type_id from product_types 
where name like '%d');


select * from products;
select * from product_types;
 
select * from products where product_type_id in (
select product_type_id from product_types
where name like '%D');

select * from products where product_type_id in (1,3,4);

-- list all the products that were purchased
select * from purchases;
select * from products where product_id in(
select distinct product_id from purchases); 



select * from products where product_id in (
select distinct product_id from purchases);

-- list all the products that were not purchased

select * from products where product_id not in (
select distinct product_id from purchases);

-- list the details of the cheapest product

select * from products where price = (select min(price) from products);
select * from products where price = (select max(price) from products);
-- list the details of the expensive product

select * from products where price = (select max(price) from products);

-- list out the product price which is greater than the avg of total product price 
 select * from products where price > (select avg(price) from products);
 
 
select * from products where price > (select avg(price) from products);

select * from products 
where (product_type_id,price) in (select product_type_id, min(price) from products
group by product_type_id);


CREATE TABLE salary_grades (
  salary_grade_id INTEGER PRIMARY KEY,
  low_salary integer,
  high_salary integer
);

-- insert sample data into salary_grade table
insert into salary_grades ( salary_grade_id, low_salary, high_salary) VALUES ( 1, 1, 250000);
insert into salary_grades ( salary_grade_id, low_salary, high_salary) VALUES ( 2, 250001, 500000);
insert into salary_grades ( salary_grade_id, low_salary, high_salary) VALUES ( 3, 500001, 750000);
insert into salary_grades ( salary_grade_id, low_salary, high_salary) VALUES ( 4, 750001, 999999);

-- 19.95, 14.95















select * from products 
where price in (19.95,14.95);

select * from products 
where price > (19.95,14.95); -- greater than won't work in this query

select * from employees where salary > any (
select low_salary from salary_grades);

select * from employees where salary > all (
select low_salary from salary_grades);

select * from employees where salary < any (
select low_salary from salary_grades);

-- Correlated sub-query

select * from products op
where op.price=(
select max(price) from products ip
where ip.product_type_id=op.product_type_id);

select * from products op
where op.price=(
select min(price) from products ip
where ip.product_type_id=op.product_type_id);

select * from products op
where op.price > (
select avg(price) from products ip
where ip.product_type_id=op.product_type_id);

-- interview question
select 10=100 from dual;

select 'a'='ab' from dual;

select null=null from dual; -- null can't be compared with any number

select null is null from dual;

select null=3 from dual; -- null can never be compared with number so output will be null

-- Interview question

select * from employees;

select employee_id, manager_id,
case
	when manager_id is null then 'Root'
    when manager_id is not null and employee_id in (select manager_id from more_employees)
    then 'Node'
    else 'Leaf'
end result
from more_employees;

-- list the product types that have a product
-- using in


select * from product_types
where product_type_id in
(select product_type_id from products);

-- list the product types that do not have a product
-- using not in
select * from product_types
where product_type_id not in
(select product_type_id from products);

-- exists / not exists

-- exists
select * from product_types o
where exists
(select product_type_id from products i
where i.product_type_id = o.product_type_id);

-- not exists
select * from product_types o
where not exists
(select product_type_id from products i
where i.product_type_id = o.product_type_id);

-- work practise question
create table movies
( rowno char(1),
  seatno integer,
  available char(1));
  
insert into movies values
  ('A',1,'N'),
  ('A',2,'Y'),
  ('A',3,'Y'),
  ('A',4,'N'),
  ('B',1,'Y'),
  ('B',2,'N'),
  ('B',3,'Y'),
  ('B',4,'N'),
  ('C',1,'N'),
  ('C',2,'N'),
  ('C',3,'Y'),
  ('C',4,'Y');

select * from movies; 
  
select employee_id, manager_id,
case
when manager_id is null then 'Root' 
when manager_id = 1 then 'Node'
when manager_id = 2 then 'leaf'
end result
from employees;

select employee_id, manager_id,
case
when manager_id is null then 'Root' 
when manager_id is not null and employee_id in (select manager_id from employees) then 'Node'
else 'Leaf'
end result
from employees;



select * from product_types
where product_type_id in
(select product_type_id from products);

select * from product_types
where product_type_id not in
(select product_type_id from products);
  
select * from product_types o
where exists 
(select product_type_id from products i
where o.product_type_id = i.product_type_id);

select * from product_types o
where not exists 
(select product_type_id from products i
where o.product_type_id = i.product_type_id);




