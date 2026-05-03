DROP DATABASE IF EXISTS insta1;

CREATE DATABASE insta1;
USE insta1;

-- USERS TABLE
CREATE TABLE IF NOT EXISTS users(
    userid INT AUTO_INCREMENT,
    instaid VARCHAR(40) NOT NULL UNIQUE,
    username VARCHAR(40) NOT NULL,
    password VARCHAR(30) NOT NULL,
    gender ENUM('female','male'),
    age TINYINT UNSIGNED CHECK(age > 13),
    mobile VARCHAR(10),
    email VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(userid)
);

-- POSTS TABLE
CREATE TABLE IF NOT EXISTS posts(
    postid VARCHAR(100) NOT NULL,
    userid INT,
    description TEXT,
    tags TINYTEXT,
    PRIMARY KEY(postid),
    FOREIGN KEY (userid) REFERENCES users(userid)
);

-- COMMENTS TABLE
CREATE TABLE IF NOT EXISTS comments(
    commentid VARCHAR(10) NOT NULL,
    userid INT,
    postid VARCHAR(100),
    comment TINYTEXT NOT NULL,
    likes INT DEFAULT 0,
    PRIMARY KEY(commentid),
    FOREIGN KEY(userid) REFERENCES users(userid),
    FOREIGN KEY(postid) REFERENCES posts(postid)
);

-- ALTER POSTS
ALTER TABLE posts ADD COLUMN views INT DEFAULT 0;
ALTER TABLE posts ADD COLUMN likes INT DEFAULT 0;

-- ✅ CORRECTED USERS INSERT
INSERT INTO users (instaid, username, password, gender, age, mobile, email) VALUES
('chiru_2', 'chiru', 'pass123', 'male', 21, '8639183417', 'chiru@gmail.com'),
('sekhar_02', 'putta sekhar', 'pass456', 'male', 22, '9876544321', 'sekhar@gmail.com'),
('sachin_03', 'sachin bhargav', 'pass789', 'female', 20, '9012345678', 'bbhargav@gmail.com'),
('varma_04', 'jagadeesh varma', 'pass999', 'male', 23, '9988776655', 'varma@gmail.com');

-- POSTS INSERT (already correct)
INSERT INTO posts (postid, userid, description, tags, views, likes) VALUES
('P101', 1, 'Enjoying coding journey', '#coding #python', 150, 25),
('P102', 2, 'Gym time 💪', '#fitness #health', 200, 40),
('P103', 3, 'Beautiful sunset 🌅', '#nature #photography', 180, 35),
('P104', 4, 'Weekend vibes', '#travel #fun', 220, 50);

-- COMMENTS INSERT (fixed datatype consistency)
INSERT INTO comments (commentid, userid, postid, comment, likes) VALUES
('C1', 2, 'P101', 'manchiga unava!', 10),
('C2', 3, 'P101', 'sakaga poo!', 5),
('C3', 1, 'P102', 'Adarkottinav le!', 8),
('C4', 4, 'P103', 'manchiundi!', 12),
('C5', 2, 'P104', 'Adinav le!', 6),
('C6', 1, 'P103', 'manchi saruku!', 7);

-- STORIES TABLE
CREATE TABLE stories (
    storyid VARCHAR(20) NOT NULL,
    userid INT,
    content TEXT NOT NULL,
    views INT DEFAULT 0,
    likes INT DEFAULT 0,
    expiry DATETIME NOT NULL,
    PRIMARY KEY (storyid),
    FOREIGN KEY (userid) REFERENCES users(userid)
);

-- STORIES INSERT
INSERT INTO stories (storyid, userid, content, views, likes, expiry) VALUES
('S101', 1, 'Rathi motham thiragadam', 120, 15, DATE_ADD(NOW(), INTERVAL 24 HOUR)),
('S102', 2, 'chai thaginama', 140, 20, DATE_ADD(NOW(), INTERVAL 24 HOUR)),
('S103', 3, '3 dosthulu+i1 Bike= Perfect combo ☕🌅', 160, 25, DATE_ADD(NOW(), INTERVAL 24 HOUR)),
('S104', 4, 'Road trip sneak peek 🚗✨', 180, 30, DATE_ADD(NOW(), INTERVAL 24 HOUR));

-- DATA CHECK
SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM comments;
SELECT * FROM stories;

-- ✅ EACH USER TOTAL COMMENTS
SELECT u.username, COUNT(c.commentid) AS total_comments
FROM users u
INNER JOIN comments c
ON u.userid = c.userid
GROUP BY u.username;

-- ✅ USERS WITH NO COMMENTS
SELECT u.userid, u.username
FROM users u
LEFT JOIN comments c
ON c.userid = u.userid
WHERE c.commentid IS NULL;

-- ✅ EACH POST TOTAL COMMENTS
SELECT p.postid, COUNT(c.commentid) AS total_comments
FROM posts p
LEFT JOIN comments c
ON c.postid = p.postid
GROUP BY p.postid;

-- ✅ POSTS WITH MORE THAN 2 COMMENTS
SELECT p.postid, COUNT(c.commentid) AS total_comments
FROM posts p
JOIN comments c
ON c.postid = p.postid
GROUP BY p.postid
HAVING COUNT(c.commentid) > 2;

-- find each posts total comments --
select p.postid,count(*) from posts p
inner join comments c
on p.postid = c.postid
group by c.postid;

#FIND POST DETAILS, ATLEAST HAVE MORE THAN 1 COMMENTS
SELECT p.postid, COUNT(*) AS total_comments
FROM posts p
INNER JOIN comments c
ON p.postid = c.postid
GROUP BY p.postid
HAVING COUNT(*) > 1;

#FOR EACH POST RETRUN THE USERNAME AND COMMENT
select u.userid, u.username, p.postid, c.commentid, c.comment, c.userid
from users u
inner join posts p
on u.userid = p.userid
inner join comments c
on c.postid = p.postid;
