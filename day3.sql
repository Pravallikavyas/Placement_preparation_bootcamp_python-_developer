use exploresql;
show tables;
CREATE TABLE more_products (
  prd_id INTEGER PRIMARY KEY,
  prd_type_id INTEGER
    REFERENCES product_types(product_type_id),
  name VARCHAR(30) NOT NULL,
  available CHAR(1)
);
INSERT INTO more_products (  prd_id, prd_type_id, name, available) VALUES (  1, 1, 'Modern Science', 'Y');
INSERT INTO more_products (  prd_id, prd_type_id, name, available) VALUES (  2, 1, 'Chemistry', 'Y');
INSERT INTO more_products (  prd_id, prd_type_id, name, available) VALUES (  3, NULL, 'Supernova', 'N');
INSERT INTO more_products (  prd_id, prd_type_id, name, available) VALUES (  4, 2, 'Lunar Landing', 'N');
INSERT INTO more_products ( prd_id, prd_type_id, name, available) VALUES ( 5, 2, 'Submarine', 'Y');
select * from more_products;

select product_id, product_type_id, name from products 
union
select prd_id, prd_type_id, name from more_products;

select product_id, product_type_id, name from products 
union all
select prd_id, prd_type_id, name from more_products;

select product_id, product_type_id, name, description from products 
union
select prd_id, prd_type_id, name, ' ' from more_products;

select product_id, product_type_id, name, description from products 
union
select prd_id, prd_type_id, name, 'No description' from more_products;

select product_id, product_type_id, name, description,price from products 
union
select prd_id, prd_type_id, name, 'No description', 0 from more_products;

select product_type_id from products;

select distinct product_type_id from products; -- gives the unique values instead of repeating

select product_id, name,price from products;
select distinct product_id,name,price from products;


select product_id, name,price,price*0.10 discount from products;

select distinct product_id, name,price,price*0.10 discount from products;

-- case end
select product_id, name,price,
case 
when price <15 then 'Price is low'
when price > 15 and price <20 then 'Price is moderate'
when price >=20 and price<30 then 'Price is high'
when price >=30 then 'Price is expensive'
end comments
from products;

select product_id, name,price,
case 
when price <15 then 'Price is low'
when price > 15 and price <20 then 'Price is moderate'
when price >=20 and price<30 then 'Price is high'
else 'Price is expensive'
end comments
from products;

select product_id, name,price,
case 
when price <15 then 'Price is low'
when price > 15 and price <20 then 'Price is moderate'
when price >=20 and price<30 then 'Price is high'
when price >=30 then 'Price is expensive'
end comments, price*0.1 discount
from products;

select product_id, name,price, 
case 
when price <15 then price-price*0.1 
when price > 15 and price <20 then price-price*0.15
when price >=20 and price<30 then price-price*0.20
when price >=30 then price-price*0.25
end discount
from products;

select product_id, name,price, 
case 
when price <15 then round(price*0.9,2) -- 10% discount
when price > 15 and price <20 then round(price*0.85,2) -- 15% discount
when price >=20 and price<30 then round(price*0.80,2) -- 20% discount
when price >=30 then round(price*0.75,2) -- 25% discount
end discount
from products;

select * from customers;
select concat('This is to certify that',' ', concat(first_name,' ',last_name),' ', 'with customer id', customer_id,' ', 'was born on', ' ', dob) from customers;

select concat('This is to certify that',' ', first_name,' ',last_name,' ', 'with customer id', ' ' ,customer_id,' ', 'was born on', ' ', ifnull(dob,'1997-10-16'))from customers;
-- coalesce same as that of ifnull
select concat('This is to certify that',' ', first_name,' ',last_name,' ', 'with customer id', ' ' ,customer_id,' ', 'was born on', ' ', coalesce(dob,'1997-10-16'))from customers;

-- Aggregate function (max, min, avg,sum,count)

select * from products;

select min(price),max(price),avg(price),sum(price),count(price) from products;

select min(price),max(price),avg(price),sum(price),count(price) from products;

select product_type_id,avg(price) from products; -- it gives only the avg value for one
select product_type_id,avg(price)
from products
where product_type_id is not null -- where should be before group by
group by product_type_id;

select product_type_id,avg(price) from products; -- it gives only the avg value for one
select product_type_id,avg(price)
from products
where product_type_id is not null and avg(price)>20
group by product_type_id;

select product_type_id,avg(price)
from products
where product_type_id is not null
group by product_type_id -- when the two of the condition is non aggregate, having is used 
having avg(price)>20;

select product_type_id, avg(price)
from products
where product_type_id is not null
group by product_type_id -- when the two of the condition is non aggregate, having is used 
having avg(price)>20
order by avg(price) desc;

select product_type_id, avg(price)
from products
where product_type_id is not null
group by product_type_id -- when the two of the condition is non aggregate, having is used 
having avg(price)>20
order by 2 desc
limit 2; -- 2 represents the column number i.e avg(price)


-- how to write a query, order to present it (mandatory)
-- select from
-- where
-- group by
-- having
-- order by
-- limit offset

-- internal workin of query
-- from
-- where
-- group by
-- having
-- select
-- order by
-- limit offset

select product_type_id,avg(price) from products; -- it gives only the avg value for one
select product_type_id, count(*) -- * totally the rows
from products
where product_type_id is not null 
group by product_type_id
having count(product_type_id)>=3;

select price, avg(price)
from products
where price is not null 
group by price
having price>avg(price);
 
 -- table
 
CREATE TABLE purchases (
  product_id INTEGER
    REFERENCES products(product_id),
  customer_id INTEGER
    REFERENCES customers(customer_id),
  quantity INTEGER NOT NULL,
  PRIMARY KEY (product_id, customer_id)
);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 1, 1, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 2, 1, 3);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 1, 4, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 2, 2, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 1, 3, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 1, 2, 2);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 2, 3, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 2, 4, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 3, 3, 1);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 4, 4, 6);
INSERT INTO purchases ( product_id, customer_id, quantity) VALUES ( 6, 2, 3);

select * from purchases;


drop table student;
create table student 
(id integer primary key, 
course varchar(10),
location varchar(10),
batch integer,
marks integer
  );
  
insert into student values(1,'Mtech','Bangalore',1,70);
insert into student values(2,'Mtech','Bangalore',1,85);
insert into student values(3,'Mtech','Bangalore',1,71);
insert into student values(4,'Mtech','Bangalore',1,64);
insert into student values(5,'Mtech','Bangalore',2,55);
insert into student values(6,'Mtech','Bangalore',2,74);
insert into student values(7,'Mtech','Bangalore',2,84);
insert into student values(8,'Mtech','Bangalore',2,63);
insert into student values(9,'Mtech','Chennai',1,50);
insert into student values(10,'Mtech','Chennai',1,98);
insert into student values(11,'Mtech','Chennai',1,67);
insert into student values(12,'Mtech','Chennai',1,20);
insert into student values(13,'Dse','Bangalore',1,64);
insert into student values(14,'Dse','Bangalore',1,88);
insert into student values(15,'Dse','Bangalore',1,79);
insert into student values(16,'Dse','Bangalore',1,69);
insert into student values(17,'Dse','Chennai',1,80);
insert into student values(18,'Dse','Chennai',1,61);
insert into student values(19,'Dse','Chennai',1,39);
insert into student values(20,'Dse','Chennai',1,48);
insert into student values(21,'Dse','Chennai',1,96);
insert into student values(22,'Dse','Chennai',2,78);
insert into student values(23,'Dse','Chennai',2,69);
insert into student values(24,'Dse','Chennai',2,86);
insert into student values(25,'Dse','Chennai',2,93);
insert into student values(26,'Dse','Chennai',2,66);
insert into student values(27,'Dse','Chennai',1,80);
insert into student values(28,'Mtech','Bangalore',1,85);

select * from student;
-- 1. List the average marks of dse students
select course,avg(marks) from student
where course = 'dse'
group by course;



select course, avg(marks)
from student
group by course
having course = 'dse';

select avg(marks) from student 
where course = 'dse';

-- 2. List the average marks of dse students for each location
select * from student;
select course, location, avg (marks)
from student
where course = 'dse' 
group by location;






select distinct location , course , avg(marks) from student
where course = 'dse'
group by location;
select * from student;
-- 3. list the average marks of students in bangalore for different courses
select course, location,avg(marks)
from student
where location = 'bangalore'
group by course,location;
-- 4. List the average marks of dse students for each location,batch
select location, batch, course,avg(marks)
from student
where course='dse'
group by location,batch;
-- 5. list the highest mark in each course, location wise
select course , location, max(marks) from student
group by location,course;
-- 6. list the highest mark in each course, location,batch wise
select course , location, max(marks),batch from student
group by course,batch,location;
-- 7. List the highest mark in each location /
select location,max(marks) from student
group by location;
-- 8. List students who have got more than 75 marks
select location,marks  from student
where marks > 75;
-- 9 List the number of mtech student in Chennai
select count(*) from student 
where course = 'mtech' and location = 'chennai';
-- 10. List students who have got less than 40 in Chennai
select course,marks,location from student
where marks < 40 and location = 'chennai';
-- 11. list the top 3 performers in dse and mtech
(select * from student 
where course = 'dse'
order by marks desc
limit 3)
union 
(select * from student 
where course = 'mtech'
order by marks desc
limit 3);