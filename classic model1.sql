use classicmodels;

select * from employees;

-- return the 1002's employee  officecode
select officecode from employees where employeenumber=1002;

select * from employees where officecode = (select officecode from employees where employeenumber=1002);

-- return the employee details those of officecode of employee number =1002 and not 1002
select * from employees where officecode =(select officecode from employees where employeenumber=1002) and employeenumber !=1002;

-- return employee number . full name follwed by office location those are belongs to 1002's officecode
select employeenumber,concat(firstName," ",lastName) fullname ,country as location from employees e
inner join offices o
on e.officecode=o.officecode where o.officecode = (select officecode from employees where employeenumber=1002) ;

-- return the officecode,those employee count morethan office code 6's employee count

select officecode,count(*) from employees group by officecode having count(*) >= (select count(*) from employees where officecode=6);

select officecode, count(*) from employees group by officecode having count(*) >= (select count(*) from employees where officecode = 0);

