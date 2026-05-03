create database IT_company;

-- Selecting database
use IT_company;

-- creating employee table
create table employees(
empid int not null,
name varchar(50),
dept varchar(50),
salary int unsigned,
age tinyint check (age>18),
primary key(empid)
);

-- inserting data into tables
insert into employees(empid,name,dept,salary,age)
values(101,'ravi','IT',50000,23),
(102,'raju','IT',45000,24),
(103,'siva','HR',40000,23),
(104,'geethu','Sales',35000,25),
(105,'prerana','IT',42000,24),
(106,'seenu','Sales',33000,22);

-- Display all employees details
select * from employees;

describe employees;

-- 1.Return the IT dept employee name
select name,dept from employees
where dept='IT';

-- 2. Find empnames and depts thoes belongs to HR or Sales depts
select name,dept from employees
where dept='HR' or dept='Sales';
-- using IN operator
select name,dept from employees
where dept in('HR','Sales');

-- 3.Find employee details those salary is morethan 40k
select * from employees
where salary>40000; 

-- 4. Find the IT dept employee details thoes salary is morethan 40k
select * from employees
where dept='IT' and salary>40000;

-- 5.Find NON-IT depts employees details
select * from employees
where dept !='IT';

select * from employees
where dept <>'IT';

-- 6. Find the employee details those salary in between 35k to 45k
select * from employees
where salary >=35000 and salary<=45000;

select * from employees
where salary between 35000 and 45000;

-- 7.Find total employees 
select count(*) from employees;

select count(*) as total_employees from employees;

select count(*) as "Total Employees" from employees;

select count(*) Total_Employees from employees;

-- 8.Find maximum salary and minimum salary
select max(salary),min(salary) from employees;

select max(salary) as maximum ,min(salary) as minimum_salary from employees;

-- 9.Find total value of company spending on employees salary
select sum(salary) as total from employees;

-- 10.Find the IT dept employee count
select count(*) IT_Employees from employees
where dept='IT';

-- 10.Find each Dept total salary those salaries are not null
select dept,sum(salary) from employees
where salary is not null
group by dept;


-- 11.Find each dept maximum salary
select dept,max(salary) from employees
group by dept;

-- 12. Find total employees in each dept and name it as EACH_DEPT_TOTAL_EMPS
select dept,count(*) EACH_DEPT_TOTAL_EMPS from employees
group by dept;

-- IT and sales department employee count
select Dept,count(*) Total_Employees  from employees
where dept in('IT','Sales')
group by dept;

-- 10.Find each dept total salary

insert into employees(empid,name,dept,salary,age)
values(107,'kasi','IT',50000,null),
(108,'sanju','IT',null,24),
(109,'mahi','HR',null,null);

select * from employees;

-- return employee details those age is null
select * from employees
where age=null;
-- we should not use '=' while checking the values is null we should use "is" operator 
select * from employees
where age is null;
