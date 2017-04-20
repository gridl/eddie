-- check connection
\conninfo




-- users

-- create user
CREATE USER mycroft WITH PASSWORD 'mycroft';

-- to reset the password if you have forgotten
ALTER USER "user_name" WITH PASSWORD 'new_password';

-- upgrade a user to be a superuser
ALTER USER myuser WITH SUPERUSER;

-- delete user
DROP USER <USER>;




-- databases

# CREATE
create database testdb;

# show databases
\l
SELECT datname FROM pg_database;

# connect to database
\c <dbname>
USE <dbname>

# show all tables in all dbs
\dt *.*

# show all tables in current db
\dt

# describe table
\d+ <tablename>

# drop database
drop database <foo>;




### tables

```
# show all rows
SELECT * FROM <table>;

# update rows
UPDATE table
SET column1 = value1,
    column2 = value2
WHERE
 condition;
```








-- sync primary keys - django

-- check last value
    \d testdb_id_seq;

SELECT MAX(id) FROM testdb;

SELECT setval('testdb_id_seq', (SELECT MAX(id) FROM testdb)+1);





-- connection
select count(*) from pg_stat_activity;

SELECT sum(numbackends) FROM pg_stat_database;
