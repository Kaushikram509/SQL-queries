#creating new database
CREATE DATABASE SCHOOL;


#selecting database
USE SCHOOL;

#creating table
CREATE TABLE STUDENTS(
	ID INT,
	NAME VARCHAR(40),
	CLASS int
);


#check description of table
DESCRIBE STUDENTS;

#inserting data
INSERT INTO STUDENTS(ID, NAME, CLASS)
VALUES(01, 'RAM',9),(102, 'Ravi',10);

SELECT * FROM STUDENTS;
DROP DATABASE SCHOOL;
