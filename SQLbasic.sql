create database if not exists Sales;
/*create database Sales;*/
/*CREATE SCHEMA IF NOT EXISTS Sales;*/
USE Sales;
CREATE TABLE sales (
    customer_id INT,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int);
SELECT * FROM sales;
SELECT * FROM sales.sales;
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
CREATE TABLE sales (
    customer_id INT,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    company_id varchar(255),
primary key (customer_id),
foreign key (company_id) references companies(company_id) on delete cascade) ;
DROP TABLE sales;
DROP TABLE customers;
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
select* from companies;
ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;
select* from companies;