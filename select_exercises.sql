/*
Keith Stateson
SQL Exercise 2
Codeup
Note, the Answer is simply the command below the Question
*/

-- List of databases to select from
SHOW DATABASES;

-- Select database albums_db
USE albums_db;

-- Verify what database you are using 
SELECT database();

-- Show list of tables within the db
SHOW TABLES;

-- Explore the table albums
-- albums table has 6 columns: id, artist, name, release_date, sales, genre
DESCRIBE albums;

-- Q: How many rows are in the albums table? A: 31
SELECT * FROM albums;

-- Q: How many unique artist names are in the albums table?
SELECT DISTINCT artist FROM albums;

-- Q: What is the primary key for the albums table? A: id
DESCRIBE albums;

-- Q: What is the oldest release date for any album in the albums table? What is the most recent release date?
SELECT * FROM albums ORDER BY release_date ASC LIMIT 1;
SELECT * FROM albums ORDER BY release_date DESC LIMIT 1;

-- Q: The name of all albums by Pink Floyd
SELECT artist, name FROM albums WHERE artist = 'Pink Floyd';
SELECT * FROM albums WHERE artist IN ('Pink Floyd');

-- Q: The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT name, release_date FROM albums WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

-- Q: The genre for the album Nevermind
SELECT name, genre FROM albums where name = 'Nevermind';

-- Q: Which albums were released in the 1990s
SELECT name, release_date FROM albums WHERE release_date >= 1990 AND release_date <= 1999;

-- Q: Which albums had less than 20 million certified sales
SELECT name, sales FROM albums WHERE sales < 20.0 ORDER BY sales DESC;

-- Q: All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT * FROM albums WHERE genre = 'Rock';
-- A: This query outputs a specific match of "Rock". Use '%Rock%' to get all genres with the word "Rock" in it
