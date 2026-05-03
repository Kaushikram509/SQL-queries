CREATE DATABASE ConnectHub;

USE ConnectHub;

CREATE TABLE Users (
    user_id INT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL,
    created_at TIMESTAMP,
    PRIMARY KEY (user_id)
);

CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    content TEXT,
    created_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Likes (
    like_id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

CREATE TABLE Follows (
    follower_id INT,
    following_id INT,
    PRIMARY KEY (follower_id, following_id),
    FOREIGN KEY (follower_id) REFERENCES Users(user_id),
    FOREIGN KEY (following_id) REFERENCES Users(user_id)
);


-- Users
INSERT INTO Users VALUES
(1, 'Sreeja', 'alice@mail.com', 'Hyderabad', NOW()),
(2, 'Shravya', 'bob@mail.com', 'Chennai', NOW()),
(3, 'Ankit', 'ankit@mail.com', 'Hyderabad', NOW()),
(4, 'David', 'david@mail.com', 'Mumbai', NOW());


-- Posts
INSERT INTO Posts VALUES
(1, 1, 'Hello World!', NOW()),
(2, 2, 'My first post', NOW()),
(3, 2, 'Another post', NOW()),
(4, 3, 'Learning SQL', NOW());


-- Likes
INSERT INTO Likes VALUES
(1, 2, 1),
(2, 3, 2),
(3, 2, 3);


-- Follows
INSERT INTO Follows VALUES
(1, 2),
(2, 3),
(3, 1);


-- Display all users from 'Hyderabad'
SELECT * FROM Users
WHERE city = 'Hyderabad';


-- Show all posts created by user_id = 2
SELECT * FROM Posts
WHERE user_id = 2;


-- Users from 'Hyderabad' AND name starts with 'A'
SELECT * FROM Users
WHERE city = 'Hyderabad' AND name LIKE 'A%';

-- Users from 'Chennai' OR 'Mumbai'
SELECT * FROM Users
WHERE city = 'Chennai' OR city = 'Mumbai';

-- Users whose name contains letter 'a'
SELECT * FROM Users
WHERE name LIKE '%a%';

-- Update city to 'Bangalore' where user_id = 4
UPDATE Users
SET city = 'Bangalore'
WHERE user_id = 4;

-- Delete likes where post_id = 3 AND user_id = 2
DELETE FROM Likes
WHERE post_id = 3 AND user_id = 2;

-- Display posts where post_id > 2 AND post_id < 6
SELECT * FROM Posts
WHERE post_id > 2 AND post_id < 6;
