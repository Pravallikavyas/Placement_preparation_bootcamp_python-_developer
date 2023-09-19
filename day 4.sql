use exploresql;
select * from products;

-- Cartisian product/cross join
select p.product_id,p.product_type_id , pt.name , p.name , p.description
from products p, product_types pt;

-- inner join 1
select p.product_id,p.product_type_id , pt.name , p.name , p.description
from products p, product_types pt
where p.product_type_id = pt.product_type_id;

-- inner join 2
select p.product_id,p.product_type_id , pt.name , p.name , p.description
from products p inner join product_types pt
on p.product_type_id = pt.product_type_id;

select * from purchases;
select * from customers;

select pu.product_id, p.name, pu.customer_id, pu.quantity
from purchases pu join products p
on pu.product_id = p.product_id;

select pu.product_id, p.name, pu.customer_id, pu.quantity
from purchases pu join products p
on pu.product_id = p.product_id;

select pu.product_id, concat(c.first_name,' ',last_name) customer, pu.customer_id, pu.quantity
from purchases pu join customers c
on pu.customer_id = c.customer_id;

select * from purchases;
select * from products;
select sum(pu.quantity),pu.product_id , p.name
from purchases pu join products p
on pu.product_id = p.product_id
group by pu.product_id,p.name;


CREATE TABLE regions (
	region_id INT  UNSIGNED NOT NULL,
	region_name VARCHAR(25),
	PRIMARY KEY (region_id)
	);
INSERT INTO regions VALUES (1,'Europe');
INSERT INTO regions VALUES (2,'Americas');
INSERT INTO regions VALUES (3,'Asia');
INSERT INTO regions VALUES (4,	'Middle East and Africa');

CREATE TABLE countries (
	country_id CHAR(2) NOT NULL,
	country_name VARCHAR(40),
	region_id INT UNSIGNED NOT NULL,
	PRIMARY KEY (country_id)
);
use exploresql;
select p.product_id,p.product_type_id , pt.name , p.name , p.description
from products p left outer join product_types pt
on p.product_type_id = pt.product_type_id;
 
select p.product_id,p.product_type_id , pt.name , p.name , p.description
from products p right outer join product_types pt
on p.product_type_id = pt.product_type_id
order by 1;

select p.product_id,p.product_type_id , pt.name , p.name , p.description
from products p left outer join product_types pt
on p.product_type_id = pt.product_type_id
union 
select p.product_id,p.product_type_id , pt.name , p.name , p.description
from products p right outer join product_types pt
on p.product_type_id = pt.product_type_id
order by 1;
cREATE TABLE employees (
  employee_id INTEGER
    PRIMARY KEY,
  manager_id INTEGER,
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL,
  title VARCHAR(20),
  salary decimal(6, 0)
);
CREATE TABLE employees (
  employee_id INTEGER
    PRIMARY KEY,
  manager_id INTEGER,
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL,
  title VARCHAR(20),
  salary decimal(6, 0)
);


INSERT INTO employees (employee_id, manager_id, first_name, last_name, title, salary) VALUES( 1, NULL, 'James', 'Smith', 'CEO', 800000);
INSERT INTO employees (employee_id, manager_id, first_name, last_name, title, salary) VALUES( 2, 1, 'Ron', 'Johnson', 'Sales Manager', 600000);
INSERT INTO employees (employee_id, manager_id, first_name, last_name, title, salary) VALUES( 3, 2, 'Fred', 'Hobbs', 'Salesperson', 150000);
INSERT INTO employees (employee_id, manager_id, first_name, last_name, title, salary) VALUES( 4, 2, 'Susan', 'Jones', 'Salesperson', 500000);
select * from employees;

select e.employee_id, e.manager_id ,e.first_name,m.first_name
from employees e inner join employees m
on e.manager_id = m.employee_id;

select e.employee_id, e.manager_id ,e.first_name,m.first_name
from employees e left outer join employees m
on e.manager_id = m.employee_id;

CREATE TABLE more_employees (
  employee_id INTEGER PRIMARY KEY,
  manager_id INTEGER
    REFERENCES more_employees(employee_id),
  first_name VARCHAR(10) NOT NULL,
  last_name VARCHAR(10) NOT NULL,
  title VARCHAR(20),
  salary decimal(6, 0)
);


-- insert sample data into more_employees table

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
(  1, NULL, 'James', 'Smith', 'CEO', 800000);
     
INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
(  2, 1, 'Ron', 'Johnson', 'Sales Manager', 600000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
(  3, 2, 'Fred', 'Hobbs', 'Sales Person', 200000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
(  4, 1, 'Susan', 'Jones', 'Support Manager', 500000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
(  5, 2, 'Rob', 'Green', 'Sales Person', 40000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
(  6, 4, 'Jane', 'Brown', 'Support Person', 45000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
 (  7, 4, 'John', 'Grey', 'Support Manager', 30000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
(  8, 7, 'Jean', 'Blue', 'Support Person', 29000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
 (  9, 6, 'Henry', 'Heyson', 'Support Person', 30000);

INSERT INTO more_employees (  employee_id, manager_id, first_name, last_name, title, salary) VALUES 
  (  10, 1, 'Kevin', 'Black', 'Ops Manager', 100000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES
 ( 11, 10, 'Keith', 'Long', 'Ops Person', 50000);

INSERT INTO more_employees ( employee_id, manager_id, first_name, last_name, title, salary) VALUES 
(  12, 10, 'Frank', 'Howard', 'Ops Person', 45000);

INSERT INTO more_employees (  employee_id, manager_id, first_name, last_name, title, salary) VALUES 
(  13, 10, 'Doreen', 'Penn', 'Ops Person', 47000);

select * from more_employees;

select e.employee_id,e.first_name,e.manager_id,m.first_name
from more_employees e inner join more_employees m
on e.manager_id = m.employee_id;

select e.employee_id,e.first_name,e.manager_id,m.first_name
from more_employees e left outer join more_employees m
on e.manager_id = m.employee_id;
-- list all the support managers along with manager names
select e.employee_id,e.first_name,e.manager_id,m.first_name,e.title,m.title
from more_employees e inner join more_employees m
on e.manager_id = m.employee_id
where e.title = 'Support Manager';

-- list all the employees who report to support managers
select e.employee_id,e.first_name,e.manager_id,m.first_name,e.title,m.title
from more_employees e inner join more_employees m
on e.manager_id = m.employee_id
where m.title = 'Support Manager';


 
