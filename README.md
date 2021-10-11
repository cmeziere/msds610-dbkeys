# msds610-dbkeys

## Objective
Learn about Three Types of Database Keys

Learn How To Initialize Database Keys

Explore Uses of Keys

Drop Database Keys If Necessary

## What are Database Keys?
Three Types: Primary, Unique, and Foreign

Constraints on Tables

Keys can be used to ensure data integrity

Keys are used to efficiently search databases or establish relationships between databases


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

### 3. Use 
Filtering by a column that is not a Primary or Unique Key returns multiple rows:
```
SELECT * FROM socials WHERE first_name = 'Jessica';
```
Filtering by a Primary or Unique Key returns a unique row:
```
SELECT * FROM socials WHERE ssn = 676933726;
```
```
SELECT * FROM socials WHERE last_name = 'Frye';
```
<img src="img/4.png" > 


### 4. Potential Errors

Violating Primary Key
```
INSERT INTO socials VALUES (676933726,'Jamie','Alberts')

---
ERROR: duplicate key value violates unique constraint "socials_pkey"
DETAIL: Key(ssn)=(676933726) already exists.
SQL state: 23505
```

Violating Unique Key

```
INSERT INTO socials VALUES (111111111,'Edward','Frye')

---
ERROR: duplicate key value violates unique constraint "socials_last_name_key"
DETAIL: Key(last_name) =(Frye) already exists
SQL state:23505
```

## Primary Key & Foreign Key

We use primary key and foreign key to link or relate the information in one table to another table.

### 1. Initialization
``` ON DELETE CASCADE ON UPDATE CASCADE``` means we have set up reference table to update or delete automatically according to the change from the main table.

```
CREATE TABLE websites
(ssn INTEGER NOT NULL,
website VARCHAR,
username VARCHAR,
password VARCHAR,
FOREIGN KEY(ssn) REFERENCES socials (ssn)
ON DELETE CASCADE ON UPDATE CASCADE);
```

### 2. Use

Update tables automatically

```
UPDATE socials SET ssn = 999999999 where ssn = 676933726
```

<img src="img/5.png" > 

Join tables 

Since primary keys and foreign keys are a type of integrity constraint, if we join tables using them as keys, we will get the error-free and complete result.

```
SELECT socials.ssn, first_name, last_name, website, username password
FROM socials
JOIN websites ON websites.ssn = socials.ssn
WHERE website='benefits.gov';
```




## AFTER TABLE CREATION

We can also initializa primary key, unique key and foreign key after creating tables; one example below.

```
ALTER TABLE websites ADD PRIMARY KEY (website, username);
```

```
ALTER TABLE websites DROP CONSTRAINT websites_pkey;
```

