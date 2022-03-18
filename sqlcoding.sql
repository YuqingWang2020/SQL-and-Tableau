show databases;
create database if not exists Sales;
use sales;
create table customers(customer_id INT);
select*from sales;
select*from sales.sales;
drop table customers;
create table customers                                                              
(  
    customer_id INT AUTO_INCREMENT,  
	first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
primary key (customer_id)  
);  
create table items(
	item_code varchar(255),  
	item varchar(255),  
	unit_price numeric(10,2),  
	company_id varchar(255),
primary key (item_code)   );
create table companies(
	company_id varchar(255),  
	company_name varchar(255),  
	headquarters_phone_number int(12),   
primary key (company_id) )  ;
DROP TABLE items;
DROP TABLE companies;
ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;
INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);
CREATE TABLE companies
(
    company_id VARCHAR(255),
    company_name VARCHAR(255) DEFAULT 'X',
    headquarters_phone_number VARCHAR(255),
PRIMARY KEY (company_id),
UNIQUE KEY (headquarters_phone_number)
);
ALTER TABLE companies
MODIFY headquarters_phone_number VARCHAR(255) NULL;
ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;
use employees;
show tables;
select dept_no from departments;
select * from departments;
select * from employees where first_name='Elvis';
select * from employees where first_name='Kellie' and gender='F';
select * from employees where first_name='Kellie' or first_name='Aruna';
select * from employees where gender='F'and(first_name='Kellie' or first_name='Aruna');
select * from employees where first_name NOT IN ('John' , 'Mark', 'Jacob');
SELECT * from employees where first_name LIKE('Mark%'); 
SELECT * FROM employees WHERE hire_date LIKE ('%2000%');
SELECT * FROM employees WHERE emp_no LIKE ('1000_');
SELECT * from employees where first_name LIKE('%jack%'); 
/*0311*/
INSERT INTO departments VALUES ('d010', 'Business Analysis');
show tables;
UPDATE departments SET dept_name = 'Data Analysis' WHERE dept_no = 'd010';
DELETE FROM departments WHERE dept_no = 'd010';
select count(DISTINCT dept_no) from departments;
SELECT SUM(salary) FROM salaries WHERE from_date > '1997-01-01';
SELECT max(emp_no) from employees;
SELECT min(emp_no) from employees;
SELECT avg(salary) FROM salaries WHERE from_date > '1997-01-01';
SELECT round(avg(salary),2) FROM salaries WHERE from_date > '1997-01-01';
create table departments_dup(dept_no char(4) not null,dept_name varchar(40) not null) engine=InnoDB default charset=utf8;

DROP TABLE IF EXISTS departments_dup;
CREATE TABLE departments_dup (dept_no CHAR(4) NULL,dept_name VARCHAR(40) NULL);
INSERT INTO departments_dup (dept_no, dept_name)
SELECT* FROM departments;
INSERT INTO departments_dup (dept_name) VALUES ('Public Relations');
/*
DELETE FROM departments_dup WHERE dept_no = 'd002'; 
*/  
INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

SELECt dept_no,dept_name,COALESCE(dept_no, dept_name) AS dept_info FROM departments_dup ORDER BY dept_no ASC;
SELECT IFNULL(dept_no, 'N/A') as dept_no, IFNULL(dept_name, 'Department name not provided') AS dept_name,  COALESCE(dept_no, dept_name) AS dept_info
FROM departments_dup ORDER BY dept_no ASC;
/* 1103*/
DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');
DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 

select * from departments_dup;
/* 1303*/
DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );
INSERT INTO dept_manager_dup
select * from dept_manager;
INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES                (999904, '2017-01-01'),
                                (999905, '2017-01-01'),
                               (999906, '2017-01-01'),
                               (999907, '2017-01-01');
DELETE FROM dept_manager_dup
WHERE dept_no = 'd001';
INSERT INTO departments_dup (dept_name)
VALUES                ('Public Relations');
DELETE FROM departments_dup WHERE  dept_no = 'd002'; 
/* 1303*/