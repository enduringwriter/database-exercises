/*
Keith Stateson
SQL Exercise 2: select_exercises
Codeup
Note, the Answer is simply the command below the Question
*/

-- List of databases to select from
SHOW DATABASES;

-- Q2: Select database albums_db
USE albums_db;

-- Verify what database you are using 
SELECT DATABASE();

-- Show list of tables within the db
SHOW TABLES;

-- Q3: Explore the table albums
-- albums table has 6 columns: id, artist, name, release_date, sales, genre
-- each unique listing by PK id can have multiple genres
DESCRIBE albums;

-- Q3a: How many rows are in the albums table?
-- 31
SELECT * FROM albums;

-- Q3b: How many unique artist names are in the albums table?
-- 23
SELECT DISTINCT artist FROM albums;

-- NOTE that the following command does not work b/c multiple ids appear for a unique artist
-- SELECT id, DISTINCT artist FROM albums;

-- Q3c: What is the primary key for the albums table?
-- id
DESCRIBE albums;

-- Q3d: What is the oldest release date for any album in the albums table? What is the most recent release date?
SELECT * FROM albums
ORDER BY release_date ASC LIMIT 1;

SELECT min(release_date) FROM albums;

SELECT * FROM albums
ORDER BY release_date DESC LIMIT 1;

SELECT max(release_date) FROM albums;

SELECT min(release_date), max(release_date) FROM albums;

-- Q4a: The name of all albums by Pink Floyd
SELECT artist, name FROM albums
WHERE artist = 'Pink Floyd';

SELECT * FROM albums
WHERE artist IN ('Pink Floyd');

-- Q4b: The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT name, release_date FROM albums
WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

-- Q4c: The genre for the album Nevermind
SELECT name, genre FROM albums
WHERE name = 'Nevermind';

-- Q4d: Which albums were released in the 1990s
SELECT name, release_date FROM albums
WHERE release_date >= 1990 AND release_date <= 1999;

SELECT name, release_date FROM albums
WHERE release_date BETWEEN 1990 AND 1999;

-- Q4e: Which albums had less than 20 million certified sales
SELECT name, sales FROM albums
WHERE sales < 20.0
ORDER BY sales DESC;

-- Q4f: All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT * FROM albums
WHERE genre = 'Rock';
-- A: This query outputs a specific match of "Rock". Use '%Rock%' to get all genres with the word "Rock" in it
-- SELECT * FROM albums WHERE genre LIKE '%Rock%';
