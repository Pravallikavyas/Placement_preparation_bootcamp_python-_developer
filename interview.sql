create database interview;
use interview;
-- interview questions
create table test(
val integer);
insert into test values(5),(-6),(10),(-20);
select * from test;
select val,
case 
when sign(val)>0 then 'Positive'
when sign(val)<0 then 'negative'
end Posi_Nega
from test;

select val,
case 
when val>0 then 'Positive'
when val<0 then 'negative'
end Posi_Nega
from test;
-- Add the positive values together and negative values by column 
select 
sum(case when val>0 then val end) Positive,
sum(case when val<0 then val end) negative
from test;
-- by row
select sum(val)
from test
group by sign(val);

select 10=10 from dual;
 select 10 = 100 from dual;
 

-- Null cannot be compared with any number

select null=null from dual;

select NUll is null from dual;

select null = 3 from dual;

use exploresql;

create table x(
weight numeric(8,3));

insert into x values
(45.067),(12.87), ( 5),(3.08), (6.1);

select * from x;
select weight,weight div 1 kgs,round((weight%1)*1000) from x;
select weight, floor(weight), round((weight-floor(weight))*1000) gm from x;
drop table y;
create table y
( sid integer,
m1 integer,
m2 integer,
m3 integer);


insert into y values(1 , 45,90,60);
insert into y values(2 , NULL,40,78);
insert into y values(3 , 93,NULL,68);

select * from y;
-- Highest mark of each student
select sid, greatest(m1,m2,m3) from y;
-- Since the output is null 
select sid, greatest(ifnull(m1,0),ifnull(m2,0),ifnull(m3,0)) from y;
  
-- first not null mark for each student
select sid, greatest(ifnull(m1,0),ifnull(m2,0),ifnull(m3,0)),coalesce(m1,m2,m3) from y;

create table exam
(sid integer,
marks integer);

insert into exam values(100,75);
insert into exam values(100,61);
insert into exam values(100,83);
insert into exam values(200,25);
insert into exam values(200,87);
insert into exam values(200,49);
insert into exam values(300,73);
insert into exam values(300,80);
insert into exam values(300,58);
insert into exam values(300,94);
insert into exam values(400,84);
insert into exam values(400,20);
insert into exam values(400,17);

select * from exam;

-- List the students who has passsed in all the exams
select sid, min(marks) from exam
group by sid
having min(marks) >50;

-- Write a query to output all such symmetric pairs in ascending order by the value of X. 
-- List the rows such that X1 ≤ Y1.

-- Sample Output
-- 20 20
-- 20 21
-- 22 23*/