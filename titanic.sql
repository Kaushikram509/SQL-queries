#creating dataset database
create database dataset;

#selecting dataset
use dataset;

#select table date
select * from titanic;

#drop passenger id, name, sibsp, parch, ticket, embarked
alter table titanic drop column passengerid, drop column Name, drop column sibsp, drop column parch, drop column ticket, drop column embarked;

select * from titanic;

#change the column name from sex to gender
alter table titanic rename column sex to gender;

#find the unique values in gender column
select gender, count(*) from titanic
group by gender;

select gender from titanic
group by gender;

select distinct gender from titanic;

#find survival count of male and female 
select gender, count(*) as total from titanic
where survived = 1
group by gender;

#finding survived and non survived gender count
select gender, survived, count(*) from titanic
group by gender, survived;

select gender, case
					when survived = 1 then "SURVIVED"
                    when survived = 0 then "NON-SURVIVED" end as SURVIVED,
                    count(*) from titanic
group by gender, survived;

#find each class total passengers in descending order
select pclass, count(*) total_count from titanic
group by pclass
order by total_count desc;

#find 5 tickets price records
select fare from titanic
order by fae desc
limit 5;

#select second highest ticket price
select distinct fare from titanic
order by fare desc
limit 1 offset 1;

select * from titanic;
