# msds610-dbkeys
Coding Demonstration of Database Keys

## Primary Key & Unique Key
### 1. Difference between Primary Key and Unique Key

In general, one table can set multiple unique keys but only one primary key. Unlike the primary key, unqiue keys torelate null values in a set.

<img src="img/1.jpg" > 

### 2. Initialization 

```
CREATE TABLE socials
(ssn INTEGER NOT NULL,
first_name VARCHAR
last_name VARCHAR,
PRIMARY KEY (ssn),
UNIQUE (last_name));

```

<img src="img/2.png" > 

### 3. Use for Primary Key and Unique Key

<img src="img/3.png" > 
