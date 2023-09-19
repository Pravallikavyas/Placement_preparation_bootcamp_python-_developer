use exploresql;

select sum(price) from products;

select product_id, name, price,
sum(price) over()
from products;

select product_id, name, price,
min(price) over()
from products;

select product_id, name, price,
max(price) over()
from products;

create table score
(val integer);

insert into score values
(30),(60),(60),(88),(89),(88),(60),(90),(89);

select val from score;

select val,
rank() over(order by val desc)
from score;

select val,
rank() over(order by val desc) myrank,
dense_rank() over(order by val desc) mydenserank,
row_number() over(order by val desc) myrowno 
from score;

select max(msrp) over(partition by productline) from products;

CREATE TABLE overtime (
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    hours INT NOT NULL,
    PRIMARY KEY (employee_name , department)
);

INSERT INTO overtime(employee_name, department, hours)
VALUES('Diane Murphy','Accounting',37),
('Mary Patterson','Accounting',74),
('Jeff Firrelli','Accounting',40),
('William Patterson','Finance',58),
('Gerard Bondur','Finance',47),
('Anthony Bow','Finance',66),
('Leslie Jennings','IT',90),
('Leslie Thompson','IT',88),
('Julie Firrelli','Sales',81),
('Steve Patterson','Sales',29),
('Foon Yue Tseng','Sales',65),
('George Vanauf','Marketing',89),
('Loui Bondur','Marketing',49),
('Gerard Hernandez','Marketing',66),
('Pamela Castillo','SCM',96),
('Larry Bott','SCM',100),
('Barry Jones','SCM',65);

select * from overtime;

select employee_name,hours,
first_value(employee_name) over()
from overtime;

select employee_name,hours,
first_value(employee_name) over(order by hours)
from overtime;

select employee_name,hours,
first_value(employee_name) over(order by hours desc)
from overtime;

-- Lag lead

create table pay
( empid integer,
year integer,
salary integer);

insert into pay values(101,2020, 1000);
insert into pay values(101,2021, 1100);
insert into pay values(102,2020, 3000);
insert into pay values(102,2021, 3100);

select * from pay;

-- find the previous salary for each employee
select empid, year, salary, 
lag(salary) over(partition by empid)
from pay;

-- find the employee who has got the highest hike percentage 
select empid, year, salary,
lag(salary) over(partition by empid) lagsal,
salary - lag(salary) over(partition by empid) hike,
(salary - lag(salary) over(partition by empid))
/ lag(salary) over(partition by empid)*100 hikepercent
from pay
order by 6 desc
limit 1;

-- find the employee who has got the least hike percentage
select empid, year, salary,
lag(salary) over(partition by empid) lagsal,
salary - lag(salary) over(partition by empid) hike,
(salary - lag(salary) over(partition by empid))
/ lag(salary) over(partition by empid)*100 hikepercent
from pay
order by 6 
limit 1 offset 2;


select * from score;

select val,
ntile(11) over() from score;

select val,
nth_value(val,2) over(order by val desc)
from score;

select val,
cume_dist() over(order by val)
from score;

select * from student;

-- 1.Rank the DSE students according to their marks
select id,course,marks,
dense_rank() over(order by marks desc)
from student where course='DSE'; 

-- 2.Rank the DSE students according to their location and marks
select id,course,location,marks,
dense_rank() over(partition by location order by marks desc)
from student where course='DSE'; 

-- 3.Rank the students according to course and location
select id,course,location,marks,
dense_rank() over(partition by course, location order by marks desc)
from student;
 
-- products table
-- 4.Rank the products from highest to least
select * from products;
select *,dense_rank() over(order by price desc) from products; 

with dse_rank as( 
select id,course,location,marks,
dense_rank() over(order by marks desc) myrank
from student 
where course='DSE')
select * from dse_rank
where myrank<=3;

-- Fetch the first three rank holders dse and mtech

with rank_holders as ( 
select id,course,location,marks,
dense_rank() over(partition by course order by marks desc) myrank
from student) 
select * from rank_holders
where myrank<=3;

with first_rank_holders as ( 
select id,course,location,batch,marks,
dense_rank() over(partition by course,location,batch order by marks desc) myrank
from student) 
select * from first_rank_holders
where myrank=1;

-- List the 6th rank holder for each course

with first_rank_holders as ( 
select id,course,location,batch,marks,
dense_rank() over(partition by course order by marks desc) myrank
from student) 
select * from first_rank_holders
where myrank=6;


select * from overtime;

select employee_name, hours,
first_value(employee_name) over(order by hours),
last_value(employee_name) over(order by hours
range between unbounded preceding and unbounded following
)
from overtime;

select employee_name, hours,
first_value(employee_name) over(order by hours
rows between 2 preceding and 3 following),
last_value(employee_name) over(order by hours
rows between 2 preceding and 3 following)
from overtime;

with dse_rank as(
select id, course, marks,
dense_rank() over(order by marks desc) myrank
from student
where course = 'Dse')
select * from dse_rank
where myrank<=3;

-- inline subquery
select * from (
select id, course, marks,
dense_rank() over(order by marks desc) myrank
from student
where course = 'Dse') a
where myrank<=3;

-- list the first three rank holders for dse/mtech
select * from (
select id, course, marks,
dense_rank() over(partition by course order by marks desc) myrank
from student) a
where myrank=1;


select * from movies;

create table trip
( id integer,
tripstart date,
tripend date,
active char(1));

insert into trip values(1, '2021-08-08', '2021-09-01', 'A');
insert into trip values(1, '2021-10-10', '2021-10-15', 'I');
insert into trip values(1, '2022-02-01', '2022-02-05', 'A');
insert into trip values(2, '2021-11-05', '2021-11-22', 'A');
insert into trip values(2, '2021-12-06', '2021-12-13', 'A');
insert into trip values(2, '2022-02-01', '2022-02-05', 'A');
insert into trip values(2, '2022-03-01', '2022-03-05', 'I');
insert into trip values(2, '2021-09-01', '2021-09-12', 'A');

select * from trip;

select distinct id, sum(datediff(tripend,tripstart)) 
over(partition by id) from trip where active='A';



    
  



  







