select dept_no from departments;
select * from departments;
select * from employees where first_name='Elvis';
select * from employees where first_name='Kellie' and gender='F';
select * from employees where first_name='Kellie' or first_name='Aruna';
select * from employees where gender='F'and(first_name='Kellie' or first_name='Aruna');
select * from employees where first_name IN ('Denis' , 'Elvis');
select * from employees where first_name NOT IN ('John' , 'Mark', 'Jacob');
SELECT * from employees where first_name LIKE('Mark%'); 
SELECT * FROM employees WHERE hire_date LIKE ('%2000%');
SELECT * FROM employees WHERE emp_no LIKE ('1000_');
SELECT * from employees where first_name LIKE('%jack%'); 
SELECT * from employees where first_name not LIKE('%jack%'); 
SELECT * FROM salaries WHERE salary BETWEEN 66000 AND 70000 ;
SELECT * FROM employees WHERE emp_no NOT BETWEEN '10004' AND '10012'  ; 
SELECT dept_name FROM departments WHERE dept_no BETWEEN 'd003' AND 'd006';
SELECT dept_name FROM departments WHERE dept_no IS NOT NULL;
SELECT * FROM employees WHERE hire_date >= '2000-01-01' AND gender = 'F';
SELECT * FROM salaries WHERE salary > 150000;
SELECT DISTINCT hire_date FROM employees;
SELECT COUNT(*) FROM salaries WHERE salary >= 100000; 
SELECT COUNT(*) FROM  dept_manager;
SELECT * FROM employees ORDER BY hire_date DESC;
SELECT salary, COUNT(emp_no) AS emps_with_same_salary 
FROM salaries WHERE salary > 80000 GROUP BY salary ORDER BY salary;
SELECT *, AVG(salary) FROM salaries WHERE salary > 120000 GROUP BY emp_no ORDER BY emp_no; 
SELECT *, AVG(salary) FROM salaries GROUP BY emp_no HAVING AVG(salary) > 120000;
SELECT emp_no, AVG(salary) FROM salaries GROUP BY emp_no HAVING AVG(salary) > 120000 ORDER BY emp_no;
select @@global.sql_mode;
set sql_mode=
'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
/*When using WHERE instead of HAVING, the output is larger 
because in the output we include individual contracts higher than $120,000 per year. 
The output does not contain average salary values.

Finally, using the star symbol instead of “emp_no” extracts a list that 
contains all columns from the “salaries” table.*/
SELECT emp_no FROM dept_emp WHERE from_date > '2000-01-01' GROUP BY emp_no 
HAVING COUNT(from_date) > 1 ORDER BY emp_no;
SELECT * FROM dept_emp LIMIT 100;