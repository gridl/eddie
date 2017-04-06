-- postgres / psql



    ### install
```
# uninstall
sudo apt-get --purge remove postgresql postgresql-doc postgresql-common

# install
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib

# restart
sudo service postgresql restart
```






    ### users

```
# for password less login
sudo -u user_name psql db_name

# change to "postgres" Linux user
sudo su - postgres

# start the psql shell
psql

# check connection
postgres-# \conninfo

# create user
CREATE USER mycroft WITH PASSWORD 'mycroft';

# to reset the password if you have forgotten
ALTER USER "user_name" WITH PASSWORD 'new_password';

# give permissions to createdb
sudo -u postgres psql -c 'alter user kuser with createdb' postgres

#upgrade a user to be a superuser
ALTER USER myuser WITH SUPERUSER;

# delete user
DROP USER <USER>;
```




    ### databases

# create
create database <foo>;

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
    \d tablename_id_seq

SELECT MAX(id) FROM tablename

SELECT setval('tablename_id_seq', (SELECT MAX(id) FROM tablename)+1)



-- connection
select count(*) from pg_stat_activity;

SELECT sum(numbackends) FROM pg_stat_database;
