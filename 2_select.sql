/*
Keith Stateson
SQL Exercise 2: select_exercises
*/

SHOW DATABASES; -- view databases to select from
USE albums_db; -- select database albums_db
SELECT DATABASE(); -- verify what database you are using
SHOW CREATE DATABASE albums_db; -- view command that was used to create the database

SHOW TABLES; -- view list of tables within the database
DESCRIBE albums; -- explore the table
EXPLAIN albums; -- explore the table
SELECT * FROM albums_db LIMIT 10; -- get overview/snapshot of the table

-- Q3: Explore the table albums. 6 columns: id, artist, name, release_date, sales, genre. Each unique listing by PK id can have multiple genres
DESCRIBE albums;

-- Q3a: How many rows are in the albums table? 31
SELECT * FROM albums;

-- Q3b: How many unique artist names are in the albums table? 23
SELECT DISTINCT artist FROM albums;

-- NOTE that the following command does not work b/c multiple ids appear for a unique artist
-- SELECT id, DISTINCT artist FROM albums;

-- Q3c: What is the primary key for the albums table? id
DESCRIBE albums;

-- Q3d: What is the oldest release date for any album in the albums table? What is the most recent release date?
-- multiples ways to solve:
SELECT release_date FROM albums
ORDER BY release_date ASC LIMIT 1; -- ASC or DESC

SELECT MIN(release_date) FROM albums; -- MIN or MAX

SELECT MIN(release_date), MAX(release_date) FROM albums;

-- Q4a: The name of all albums by Pink Floyd.
-- two methods to acheive same results

SELECT artist, name FROM albums
WHERE artist = 'Pink Floyd';

SELECT * FROM albums
WHERE artist IN ('Pink Floyd');

-- Q4b: The year Sgt. Pepper's Lonely Hearts Club Band was released.
SELECT name, release_date FROM albums
WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band'; -- use escape character "\"

-- Q4c: The genre for the album Nevermind.
SELECT name, genre FROM albums
WHERE name = 'Nevermind';

-- Q4d: Which albums were released in the 1990s.
-- two methods with same results using BETWEEN or using math symbols
SELECT name, release_date FROM albums
WHERE release_date >= 1990 AND release_date <= 1999;

SELECT name, release_date FROM albums
WHERE release_date BETWEEN 1990 AND 1999;

-- Q4e: Which albums had less than 20 million certified sales.
SELECT name, sales FROM albums
WHERE sales < 20.0
ORDER BY sales DESC;

-- Q4f: All the albums with a genre of "Rock".
-- Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"? "Rock" is a specific match and not like %Rock%
SELECT * FROM albums
WHERE genre = 'Rock';
