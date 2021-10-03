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

```
CREATE TABLE websites
(ssn INTEGER NOT NULL,
website VARCHAR,





