CREATE TABLE
IF NOT EXISTS users
(
    user_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username varchar
(50) NOT NULL UNIQUE,
    email varchar
(225) NOT NULL UNIQUE
);

ALTER TABLE users
ADD COLUMN name varchar
(30) NOT NULL;

INSERT INTO users
    (username, email, name)
VALUES
    ('Calcur', 'Calcur@email.com', 'Calcur');

UPDATE users
SET name = 'shaqaboom'
WHERE user_id = 1;
SELECT *
FROM users;

CREATE TABLE posts (
    post_id  int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id int REFERENCES users
(user_id),
    title text NOT NULL,
    body text NOT NULL
);

INSERT INTO posts
    (user_id, title, body)
VALUES
    (2, 'Wakanda forever', 'in case you have no clue,there is going to be another one'),
    (2, 'super bowl', 'not like with uncle sam');
UPDATE posts
SET user_id = 1
WHERE post_id = 1;

SELECT *
FROM posts;

-- CREATE VIEW post_info AS
-- SELECT title, username
-- FROM posts INNER JOIN users ON posts.user_id= users.user_id

SELECT * FROM post_info;