-- MySQL

-- Help
    \h


-- databases
CREATE DATABASE testdb;

    SHOW DATABASES;

    USE testdb;



SHOW TABLES LIKE 'b%';  # Show tables begin with b


-- tables
    SHOW TABLES;

DROP TABLE testtable;
CREATE TABLE testtable (
        id int NOT NULL AUTO_INCREMENT,
        FirstName varchar(255) NOT NULL,
        PRIMARY KEY (id)
        );

INSERT INTO testtable (FirstName) VALUES ('foo');
INSERT INTO testtable (FirstName) VALUES ('bar');

INSERT INTO testtable (id, FirstName) VALUES (3, 'foo');

SELECT * FROM testdb.testtable;

SELECT DISTINCT FirstName FROM testdb.testtable;

SELECT COUNT(DISTINCT FirstName) FROM testdb.testtable;


# show status of all tables
SHOW TABLE STATUS [FROM <database>] [LIKE <pattern> | WHERE <expression>]


-- show process
SHOW FULL PROCESSLIST;


-- show engine type
SHOW TABLE STATUS WHERE Name = <table>;



# Filtering MySQL Table
SELECT * FROM my_table WHERE <field> LIKE '%query%' LIMIT 10;


    # show all tables, table row count
    SELECT TABLE_NAME, TABLE_ROWS FROM `information_schema`.`tables`
                                  WHERE `table_schema` = '<db name>';



-- update
UPDATE <table> SET <field>=<value>, <field2>=<value2> [WHERE clause]

SELECT * FROM tableA INNER JOIN tableB ON tableA.name = tableB.name



pager
=====

    # show page by page
    pager less

    # enable vertical mode
    pager less -SFX
    <query> \G

    # disable pager
    nopager RET
    \n RET


truncate
---------

```
truncate <table name>; # make table empty
```


-- reset root password

use mysql;

update user set password=PASSWORD("foo") where User='foo';

update user set authentication_string=PASSWORD("") where User='root';

-- set password resolving to default mechanism for root user
update user set plugin="mysql_native_password" where User='root';


flush privileges;
quit;


DROP User 'foo'@'localhost';

CREATE USER 'foo'@'%' IDENTIFIED BY 'bar';
GRANT ALL PRIVILEGES ON * . * TO 'sudheer'@'%';
