-- DROP DATABASE IF EXISTS (for clean run)
DROP DATABASE IF EXISTS instagram;

CREATE DATABASE instagram;
USE instagram;

-- USERS TABLE
CREATE TABLE users(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    mobile VARCHAR(15),
    gender ENUM('M','F'),
    bio TEXT,
    dob DATE
);

-- POSTS TABLE
CREATE TABLE posts(
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    likes INT DEFAULT 0,
    description VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);

-- COMMENTS TABLE
CREATE TABLE comments(
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT,
    likes INT DEFAULT 0,
    comment_text VARCHAR(255),
    FOREIGN KEY (post_id) REFERENCES posts(post_id)
        ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);

-- STORIES TABLE
CREATE TABLE stories(
    story_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    likes INT DEFAULT 0,
    views INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);


-- INSERT USERS (NO NEED TO GIVE user_id manually)

INSERT INTO users(user_name,password,email,mobile,gender,bio,dob) VALUES
('sekhar','pass123','sekhar12@gmail.com','7896540022','M','Data Scientist','2004-05-31'),
('kavya','kavya123','kavya22@gmail.com','9988775432','F','Developer','2005-07-22'),
('pranai','pranai007','pranai23@gmail.com','8897650321','M','Designer','2004-02-20'),
('phani','phani455','phani09@gmail.com','9012345678','M','Engineer','2001-11-30'),
('priya','priya1503','priya66@gmail.com','9090223541','F','Content Creator','2003-08-25');


-- INSERT POSTS

INSERT INTO posts(user_id,likes,description) VALUES
(1,100,'AI project completed'),
(2,50,'Learning Java'),
(3,75,'UI/UX design post'),
(4,20,'Trip to Goa'),
(5,90,'Delicious food'),
(1,120,'Machine learning model'),
(2,60,'Full stack project'),
(3,30,'Creative art post');


-- INSERT COMMENTS

INSERT INTO comments(post_id,user_id,likes,comment_text) VALUES
(1,1,10,'Nice post'),
(2,2,5,'Great work'),
(3,3,8,'Amazing'),
(4,4,2,'Good'),
(5,5,6,'Interesting'),
(6,1,4,'Well done'),
(7,2,7,'Super'),
(8,3,3,'Cool'),
(1,4,5,'Nice design'),
(2,5,9,'Loved it');


-- INSERT STORIES

INSERT INTO stories(user_id,likes,views) VALUES
(1,40,200),
(2,25,150),
(3,30,180),
(4,20,100);


-- CHECK DATA

SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM comments;
SELECT * FROM stories;
