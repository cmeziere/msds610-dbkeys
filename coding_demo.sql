--Drop tables if they already exist
DROP TABLE IF EXISTS websites;
DROP TABLE IF EXISTS socials;

--Create socials table with Primary Key and Unique Key
CREATE TABLE socials
(ssn INTEGER NOT NULL,
 first_name VARCHAR,
 last_name VARCHAR,
 PRIMARY KEY (ssn),
 UNIQUE (last_name));
 
--Import data into socials from socials.csv
-- Be sure to use the location of the csv on your computer
COPY socials
FROM '/Users/cameronmeziere/Documents/Communications/msds610-dbkeys/socials.csv'
DELIMITER ','
CSV HEADER;

--Find records using column that isn't Primary Key or Unique Key
SELECT * FROM socials WHERE first_name = 'Jessica';

--Find records using Primary Key (should only ever return up to one record)
SELECT * FROM socials WHERE ssn = 676933726;

--Find records using Unique Key (should only ever return up to one record)
SELECT * FROM socials WHERE last_name = 'Frye';

--Enter values that already exist in Primary or Unique Key
INSERT INTO socials VALUES (676933726, 'Jamie', 'Alberts');
INSERT INTO socials VALUES (111111111, 'Edward', 'Frye');
 
 --Create websites table with Foreign Key that references ssn in socials table
CREATE TABLE websites
(ssn INTEGER NOT NULL,
 website VARCHAR,
 username VARCHAR,
 password VARCHAR,
 FOREIGN KEY (ssn) REFERENCES socials (ssn)
 ON DELETE CASCADE ON UPDATE CASCADE);
 
--Import data into websites table from websites.csv
-- Be sure to use the location of the csv on your computer
COPY websites
FROM '/Users/cameronmeziere/Documents/Communications/msds610-dbkeys/websites.csv'
DELIMITER ','
CSV HEADER;

--Return all info about people on benefits.gov using Join to combine the two tables
SELECT socials.ssn, first_name, last_name, website, username, password
FROM socials 
JOIN websites ON websites.ssn = socials.ssn
WHERE website = 'benefits.gov';

--See that ssn = 676933726 has records in both socials and websites
SELECT * FROM socials WHERE ssn = 676933726;
SELECT * FROM websites WHERE ssn = 676933726;

--Update ssn = 676933726 to 999999999 only in socials table
UPDATE socials SET ssn = 999999999 WHERE ssn = 676933726;

--See that records in both tables have changed ssn
SELECT * FROM socials WHERE ssn = 999999999;
SELECT * FROM websites WHERE ssn = 999999999;

--Add Primary Key to websites after initializing table
ALTER TABLE websites ADD PRIMARY KEY (website, username);