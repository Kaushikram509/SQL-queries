use IT_company;

#select all the employees
select * from employees;

#return those salary details that is greater than average salary of their repective dept
select * from employees E1
where salary > (select avg(salary) from employees E2
where E1.dept = E2.dept);

#maximum salary employees details in each dept
select * from employees E1
where salary = (select max(salary) from employees E2
				where E1.dept = E2.dept);

#return minimum age employees details in each dept
select * from employees E1
where age = (select min(age) from employees E2
			where E1.dept = E2.dept);

#select maximum salary employee details
select * from employees
where salary = (select max(salary) from employees);

select * from employees
where salary in(select max(salary) from employees
				group by dept);
                
#create a view with only "IT DEPT" employee details with(empid, name)
create view IT_DEPT as
select empid, name from employees
where dept = 'IT';

#select data in view
select * from IT_DEPT;

#update 101 employee name IT_DEPT view
update IT_DEPT set name = "KAUSHIK"
where empid = 101;

#check original table data
select * from employees;

#creat view dept_emp_count
create view dept_emp_count as
select dept, count(*) emp_count from employees
group by dept;

select * from dept_emp_count;

#delete one it dept reocrd 	in employees table
delete from employees 
where empid = 101;

select * from employees;
