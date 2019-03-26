-- check connection
\conninfo



-- extensions
SELECT * FROM pg_available_extensions;
SELECT * FROM pg_extension;
\dx


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


-- rename
alter database diabetes rename to diabetesm;



-- connect to database
\c db_name
USE db_name

-- show all tables in all dbs
\dt *.*

-- show all tables in current db
\dt


-- show approximate row count
SELECT schemaname, relname, n_live_tup FROM pg_stat_user_tables ORDER BY n_live_tup DESC;

SELECT relname, n_live_tup FROM pg_stat_user_tables ORDER BY n_live_tup DESC;

SELECT relname AS table_name, n_live_tup AS rows_count FROM pg_stat_user_tables ORDER BY n_live_tup DESC;





-- TABLES

-- create table
CREATE TABLE author(
   ID SERIAL PRIMARY KEY NOT NULL,
   NAME VARCHAR(32)
   );

CREATE TABLE book(
   ID INT PRIMARY KEY     NOT NULL,
   NAME VARCHAR(32),
   author_id INT REFERENCES author
   );


-- inserts
insert into author values (1, 'author1');
insert into author values (2, 'author2');

insert into book values (1, 'book1', 1);
insert into book values (2, 'book2', 2);
insert into book values (3, 'book3', 1);
insert into book values (4, 'book4', 2);
insert into book values (5, 'book5', 1);


insert into author values (1, 'author1');
insert into author values (2, 'author2');

insert into book values (1, 'book1', 1);
insert into book values (2, 'book2', 2);
insert into book values (3, 'book3', 1);
insert into book values (4, 'book4', 2);
insert into book values (5, 'book5', 1);


select * from book b inner join author ON author.id = b.author_id;
select * from author a inner join book b ON a.id = b.author_id;

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



-- indexes




--  list custom fields
SELECT      n.nspname as schema, t.typname as type
FROM        pg_type t
LEFT JOIN   pg_catalog.pg_namespace n ON n.oid = t.typnamespace
WHERE       (t.typrelid = 0 OR (SELECT c.relkind = 'c' FROM pg_catalog.pg_class c WHERE c.oid = t.typrelid))
AND     NOT EXISTS(SELECT 1 FROM pg_catalog.pg_type el WHERE el.oid = t.typelem AND el.typarray = t.oid)
AND     n.nspname NOT IN ('pg_catalog', 'information_schema')
