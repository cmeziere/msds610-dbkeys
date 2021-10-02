DROP TABLE IF EXISTS websites;
DROP TABLE IF EXISTS socials;

CREATE TABLE socials
(ssn INTEGER NOT NULL,
 first_name VARCHAR,
 last_name VARCHAR,
 PRIMARY KEY (ssn),
 UNIQUE (last_name));
 
CREATE TABLE websites
(ssn INTEGER NOT NULL,
 website VARCHAR,
 username VARCHAR,
 password VARCHAR,
 FOREIGN KEY (ssn) REFERENCES socials (ssn)
 ON DELETE CASCADE ON UPDATE CASCADE);
 
COPY socials
FROM '/Users/cameronmeziere/Documents/Communications/msds610-dbkeys/socials.csv'
DELIMITER ','
CSV HEADER;

COPY websites
FROM '/Users/cameronmeziere/Documents/Communications/msds610-dbkeys/websites.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM socials;

SELECT * FROM socials WHERE first_name = 'Jessica';

SELECT * FROM socials WHERE ssn = 676933726;

SELECT * FROM socials WHERE last_name = 'Frye';

SELECT * FROM websites;

SELECT websites.ssn, first_name, last_name, website, username, password
FROM socials 
JOIN websites ON websites.ssn = socials.ssn
WHERE website = 'benefits.gov';

SELECT * FROM socials WHERE ssn = 676933726;
SELECT * FROM websites WHERE ssn = 676933726;
UPDATE socials SET ssn = 999999999 WHERE ssn = 676933726;
SELECT * FROM socials WHERE ssn = 676933726;
SELECT * FROM websites WHERE ssn = 676933726;
SELECT * FROM socials WHERE ssn = 999999999;
SELECT * FROM websites WHERE ssn = 999999999;

ALTER TABLE websites ADD PRIMARY KEY (website, username);