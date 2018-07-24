-- check connection
\conninfo




-- users

-- list users
\du
\du+


-- create user
CREATE USER chillar WITH PASSWORD 'chillar';

-- to reset the password if you have forgotten
ALTER USER chillar WITH PASSWORD 'password';

-- upgrade a user to be a superuser
ALTER USER chillar WITH SUPERUSER;

-- delete user
DROP USER chillar;





-- databases
create database testdb;
drop database testdb;

-- show databases
\l
SELECT datname FROM pg_database;

-- connect to database
\c db_name
USE db_name

-- show all tables in all dbs
\dt *.*

-- show all tables in current db
\dt


-- show approximate row count
SELECT schemaname, relname, n_live_tup
FROM pg_stat_user_tables
ORDER BY n_live_tup
    DESC;





-- TABLES

-- create table
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
   );

-- describe table
\d <tablename>


--queuries
SELECT * FROM foo_table;

-- update ROWS
UPDATE core_user set is_superuser='t';
UPDATE core_user set is_superuser='t' WHERE username='chillaranand';
UPDATE core_user set is_superuser='t' WHERE username='foo';









-- sync primary keys - django

-- check last value
    \d testdb_id_seq;

SELECT MAX(id) FROM testdb;

SELECT setval('testdb_id_seq', (SELECT MAX(id) FROM testdb)+1);





-- connection
select count(*) from pg_stat_activity;

SELECT sum(numbackends) FROM pg_stat_database;




-- window functions
SELECT
    product_name,
    price,
group_name,
    AVG (price) OVER (PARTITION BY group_name)
FROM
    products
    INNER JOIN product_groups USING (group_id);


SELECT
    product_name,
    group_name,
    price,
    RANK () OVER (
        PARTITION BY group_name
        ORDER BY price
   )
FROM
    products
INNER JOIN product_groups USING (group_id);
