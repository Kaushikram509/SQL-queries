CREATE DATABASE school;

USE school;

CREATE TABLE class9 (
    id INT,
    name VARCHAR(30),
    age TINYINT
);

CREATE TABLE class10 (
    id INT,
    name VARCHAR(25),
    age TINYINT,
    class TINYINT
);

INSERT INTO class9 VALUES
(1,'ravi',10),
(2,'raju',12),
(3,'sanju',13),
(4,'mahi',15),
(5,'pranai',16);

INSERT INTO class10 VALUES
(1,'ravi',10,10),
(2,'raju',12,12),
(3,'sanju',13,13),
(4,'mahi',15,15),
(5,'pranai',16,16);

SELECT * FROM class9;

SELECT * FROM class10;

-- UNION (removes duplicates)
SELECT id, name, age FROM class9
UNION
SELECT id, name, age FROM class10;

-- INTERSECTION (MySQL does NOT support INTERSECT directly)
SELECT id, name, age FROM class9
WHERE (id, name, age) IN (
    SELECT id, name, age FROM class10
);

-- EXCEPT (MySQL does NOT support EXCEPT directly)
SELECT id, name, age FROM class10
WHERE (id, name, age) NOT IN (
    SELECT id, name, age FROM class9
);

