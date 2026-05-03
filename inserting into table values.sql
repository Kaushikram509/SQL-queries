Create database school;

use school;

create table class9(student_id int, Name Varchar(40), Age int, percentage float);

select * from class9;

#inserting values into table
insert into class9(student_id , Name, age, percentage)
values(101, "Tanveer",20, 30.5), (102, "Kaushik",20,31.3),(103, "Sekhar",  21, 32.1),(104, "vamshi", 20, 32.4);

#retrieveing the values
select * from class9;
Describe class9;

-- changing percentage to city
alter table class9
modify percentage city varchar(40);

insert into class9(student_id, Name, age, city)
values('105', 'chiru',21,49);

select * from class9;


drop table class9;
describe class9;
