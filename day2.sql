use exploresql;
show tables;
 describe student;
 alter table student
 add city varchar(20);
 
  describe student;
  
 alter table student 
 modify sname varchar(30); 
 
describe student;

set sql_safe_updates=0;

update student set marks=87
where sid = 100; 

select * from student;

update student set city = 'Chennai';

insert into student values(11,'test',80,'blr');
select * from student;

rollback;

commit;
select * from student;

delete from student 
where sid=11;

select * from student;

update student set sname = 'Ramesh',marks = 93,city='Pondy'
where sid = 100;
select * from student;

update student set city = 'Goa'
where sid in(103,108,130);
select * from student;

alter table student 
drop city;

select * from student;

rename table student to student_info;

select * from student_info;

truncate table student_info;

select * from student_info;

drop table student_info;

create table student(
sid integer
);
 select * from student;

alter table student 
rename column sid to student_id;


-- String functions (Unary operators)

select first_name, upper(first_name),ucase(first_name), lower(first_name),lcase(first_name)
from customers;

select ltrim('     Athicavy    ') from dual; -- example

select name, substr(name,1,1) from products; -- from name, 1st letter,1 character
select name, substr(name,1,8) from products; -- from name, 1 starting value,8 characters
select name, substr(name,4,2) from products; -- from name, starting value 4, 2 characters
select name, substr(name,6,3) from products;
select name, substr(name,length(name),1) from products; -- end value
select name, substr(name,-1,1) from products;
select name, substr(name,-3) from products;
select name, substr(name,length(name)-1) from products; -- end value-1, output will be last two letters

select name, replace(name,'a','A') from products;
select name, replace(name,'as','AS') from products;

select name, replace(name,substr(name,1,1),lower(substr(name,1,1))) from products;


select name, replace(name,substr(name,1,1),lower(substr(name,1,1))) from products;

-- gives the position of the element , instr

select name, instr(name,'e') from products; -- in which position the e is present

-- Number functions
select 27+16,27-16,27*16,27/16,27 mod 16, 27 div 16 from dual;
select power(2,4) from dual;
select abs(-2716), abs(2716) from dual; -- absolute gives the output in the positive eventhough it is negative
select ceil(27.1610), ceil(16.7279) from dual; -- rounds of to the nearby value
select floor(27.79), floor(16.72) from dual; -- takes up the integer
select sign(-16),sign(0),sign(16) from dual;
select round(2716.1072,2) from dual; -- number nd 2 is rounds of to 2 decimal values by taking into account of the 3 value
select truncate(2716.1072,2) from dual; -- truncate allows only 2 values it doesnt takes up the next value after 2 
select truncate(2716.1072,3) from dual;

