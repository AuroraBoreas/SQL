Last login: Sat Feb 12 23:10:12 on ttys001

The default interactive shell is now zsh.
To update your account to use zsh, please run `chsh -s /bin/zsh`.
For more details, please visit https://support.apple.com/kb/HT208050.

zhangliang@ZL-MBP:~$ brew install mysql
==> Installing dependencies for mysql: libcbor, libfido2, six and protobuf
==> Installing mysql dependency: libcbor
==> Pouring libcbor-0.9.0.monterey.bottle.tar.gz
🍺  /usr/local/Cellar/libcbor/0.9.0: 31 files, 161.6KB
==> Installing mysql dependency: libfido2
==> Pouring libfido2-1.10.0.monterey.bottle.tar.gz
🍺  /usr/local/Cellar/libfido2/1.10.0: 510 files, 1MB
==> Installing mysql dependency: six
==> Pouring six-1.16.0_2.all.bottle.1.tar.gz
🍺  /usr/local/Cellar/six/1.16.0_2: 20 files, 122.2KB
==> Installing mysql dependency: protobuf
==> Pouring protobuf-3.19.4.monterey.bottle.tar.gz
🍺  /usr/local/Cellar/protobuf/3.19.4: 270 files, 19.6MB
==> Installing mysql
==> Pouring mysql-8.0.28.monterey.bottle.tar.gz
==> /usr/local/Cellar/mysql/8.0.28/bin/mysqld --initialize-insecure --user=zhangliang --basedir=/usr
==> Caveats
We've installed your MySQL database without a root password. To secure it run:
    mysql_secure_installation

MySQL is configured to only allow connections from localhost by default

To connect run:
    mysql -uroot

To restart mysql after an upgrade:
  brew services restart mysql
Or, if you don't want/need a background service you can just run:
  /usr/local/opt/mysql/bin/mysqld_safe --datadir=/usr/local/var/mysql

zhangliang@ZL-MBP:~$ brew services start mysql
==> Tapping homebrew/services
Cloning into '/usr/local/Homebrew/Library/Taps/homebrew/homebrew-services'...
remote: Enumerating objects: 1878, done.
remote: Counting objects: 100% (385/385), done.
remote: Compressing objects: 100% (137/137), done.
remote: Total 1878 (delta 282), reused 285 (delta 243), pack-reused 1493
Receiving objects: 100% (1878/1878), 521.55 KiB | 18.00 KiB/s, done.
Resolving deltas: 100% (837/837), done.
Tapped 1 command (44 files, 666.6KB).
==> Successfully started `mysql` (label: homebrew.mxcl.mysql)

zhangliang@ZL-MBP:~$ mysql -uroot
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.28 Homebrew

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.01 sec)

mysql> quit
Bye
zhangliang@ZL-MBP:~$ mysql --version
mysql  Ver 8.0.28 for macos12.0 on x86_64 (Homebrew)
zhangliang@ZL-MBP:~$ brew services stop mysql
Stopping `mysql`... (might take a while)
==> Successfully stopped `mysql` (label: homebrew.mxcl.mysql)
zhangliang@ZL-MBP:~$ brew services start mysql
==> Successfully started `mysql` (label: homebrew.mxcl.mysql)
zhangliang@ZL-MBP:~$ mysql -uroot
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28 Homebrew

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE pantry_db;
Query OK, 1 row affected (0.05 sec)

mysql> USE pantry_db;
Database changed
mysql> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| pantry_db  |
+------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE pantries
    -> (name VARCHAR(100),
    -> quantity INT);
Query OK, 0 rows affected (0.02 sec)

mysql> show tables;
+---------------------+
| Tables_in_pantry_db |
+---------------------+
| pantries            |
+---------------------+
1 row in set (0.01 sec)

mysql> USE COLUMNS FROM pantries;
ERROR 1049 (42000): Unknown database 'columns'
mysql> USE COLUMN FROM pantries;
ERROR 1049 (42000): Unknown database 'column'
mysql> SHOW COLUMN FROM pantries;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'COLUMN FROM pantries' at line 1
mysql> DESC pantries;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| name     | varchar(100) | YES  |     | NULL    |       |
| quantity | int          | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
2 rows in set (0.02 sec)

mysql> SHOW COLUMNS FROM pantries;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| name     | varchar(100) | YES  |     | NULL    |       |
| quantity | int          | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> DROP TABLE pantries;
Query OK, 0 rows affected (0.02 sec)

mysql> DROP pantry_db;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'pantry_db' at line 1
mysql> DROP DATABASE pantry_db;
Query OK, 0 rows affected (0.02 sec)

mysql> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| NULL       |
+------------+
1 row in set (0.00 sec)

mysql> SHOW databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

mysql> show databases
    -> ;
ERROR 4031 (HY000): The client was disconnected by the server because of inactivity. See wait_timeout and interactive_timeout for configuring this behavior.
No connection. Trying to reconnect...
Connection id:    9
Current database: *** NONE ***

+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.01 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

mysql> CREATE DATABASE hello_db;
Query OK, 1 row affected (0.01 sec)

mysql> USE DATABASE hello_db;
ERROR 1049 (42000): Unknown database 'database'
mysql> USE hello_db;
Database changed
mysql> SELECT database();
+------------+
| database() |
+------------+
| hello_db   |
+------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE person (
    -> person_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    -> fname VARCHAR(100) NOT NULL DEFAULT 'anonymous',
    -> lname VARCHAR(100),
    -> sex ENUM('F', 'M'),
    -> birth_date Date
    -> );
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> CREATE TABLE person ( person_id INT UNSIGNED NOT NULL AUTO_INCREMENT, fname VARCHAR(100) NOT NULL DEFAULT 'anonymous', lname VARCHAR(100), sex ENUM('F', 'M'), birth_date Date);
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> CREATE TABLE person ( person_id INT UNSIGNED NOT NULL AUTO_INCREMENT, fname VARCHAR(100) NOT NULL DEFAULT 'anonymous', lname VARCHAR(100), sex ENUM('F', 'M'), birth_date Date, CONSTRAINT pk_person_id PRIMARY KEY (person_id));
Query OK, 0 rows affected (0.02 sec)

mysql> SHOW COLUMN FROM perosn;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'COLUMN FROM perosn' at line 1
mysql> SHOW COLUMN FROM person;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'COLUMN FROM person' at line 1
mysql> SHOW COLUMNS FROM person;
+------------+---------------+------+-----+-----------+----------------+
| Field      | Type          | Null | Key | Default   | Extra          |
+------------+---------------+------+-----+-----------+----------------+
| person_id  | int unsigned  | NO   | PRI | NULL      | auto_increment |
| fname      | varchar(100)  | NO   |     | anonymous |                |
| lname      | varchar(100)  | YES  |     | NULL      |                |
| sex        | enum('F','M') | YES  |     | NULL      |                |
| birth_date | date          | YES  |     | NULL      |                |
+------------+---------------+------+-----+-----------+----------------+
5 rows in set (0.00 sec)

mysql> ALTER TABLE person
    -> SET fname VARCHAR;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SET fname VARCHAR' at line 2
mysql> ALTER TABLE person SET fname VARCHAR(100);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SET fname VARCHAR(100)' at line 1
mysql> DESC person.
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> DESC person;
+------------+---------------+------+-----+-----------+----------------+
| Field      | Type          | Null | Key | Default   | Extra          |
+------------+---------------+------+-----+-----------+----------------+
| person_id  | int unsigned  | NO   | PRI | NULL      | auto_increment |
| fname      | varchar(100)  | NO   |     | anonymous |                |
| lname      | varchar(100)  | YES  |     | NULL      |                |
| sex        | enum('F','M') | YES  |     | NULL      |                |
| birth_date | date          | YES  |     | NULL      |                |
+------------+---------------+------+-----+-----------+----------------+
5 rows in set (0.00 sec)

mysql> ALTER TABLE person
    -> fname VARCHAR(100);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'fname VARCHAR(100)' at line 2
mysql> ALTER TABLE person (fname VARCHAR(100));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(fname VARCHAR(100))' at line 1
mysql> ALTER TABLE person
    -> MODIFY fname VARCHAR(100);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC person;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| person_id  | int unsigned  | NO   | PRI | NULL    | auto_increment |
| fname      | varchar(100)  | YES  |     | NULL    |                |
| lname      | varchar(100)  | YES  |     | NULL    |                |
| sex        | enum('F','M') | YES  |     | NULL    |                |
| birth_date | date          | YES  |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> INSERT INTO person (fname, lname, sex, birth_date)
    -> VALUES ('zhang', 'liang', 'F', '1990-01-02')
    -> ;
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM person;
+-----------+-------+-------+------+------------+
| person_id | fname | lname | sex  | birth_date |
+-----------+-------+-------+------+------------+
|         1 | zhang | liang | F    | 1990-01-02 |
+-----------+-------+-------+------+------------+
1 row in set (0.00 sec)

mysql> INSERT INTO person (fname, lname, sex, birth_date) VALUES ('c', 'y', 'M', '1990-01-02');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM person;
+-----------+-------+-------+------+------------+
| person_id | fname | lname | sex  | birth_date |
+-----------+-------+-------+------+------------+
|         1 | zhang | liang | F    | 1990-01-02 |
|         2 | c     | y     | M    | 1990-01-02 |
+-----------+-------+-------+------+------------+
2 rows in set (0.00 sec)

mysql> DELETE person
    -> WHERE person_id = 2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE person_id = 2' at line 2
mysql> DELETE FROM person
    -> WHERE person_id = 2;
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM person;
+-----------+-------+-------+------+------------+
| person_id | fname | lname | sex  | birth_date |
+-----------+-------+-------+------+------------+
|         1 | zhang | liang | F    | 1990-01-02 |
+-----------+-------+-------+------+------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE favorite_food (
    -> person_id INT UNSIGNED,
    -> food VARCHAR(100),
    -> CONSTRAINT pk_person_food PRIMARY KEY (person_id, food),
    -> CONSTRAINT fk_person_id FOREIGN KEY person (person_id)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 6
mysql> CREATE TABLE favorite_food (
    -> person_id INT UNSIGNED,
    -> food VARCHAR(100),
    -> CONSTRAINT pk_person_food PRIMARY KEY (person_id, food),
    -> CONSTRAINT fk_person_id FOREIGN KEY person (person_id)
    ->
    ->
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 5
mysql> CREATE TABLE favorite_food ( person_id INT UNSIGNED, food VARCHAR(100), CONSTRAINT pk_person_food PRIMARY KEY (person_id, food), CONSTRAINT fk_person_id FOREIGN KEY (person_id) REFERENCES person (person_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> DESC person
    -> ;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| person_id  | int unsigned  | NO   | PRI | NULL    | auto_increment |
| fname      | varchar(100)  | YES  |     | NULL    |                |
| lname      | varchar(100)  | YES  |     | NULL    |                |
| sex        | enum('F','M') | YES  |     | NULL    |                |
| birth_date | date          | YES  |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> DESC favorite_food;
ERROR 1146 (42S02): Table 'hello_db.favorite_food' doesn't exist
mysql> CREATE TABLE favorite_food (
    -> person_id INT UNSIGNED,
    -> food VARCHAR(100),
    -> CONSTRAINT pk_person_food PRIMARY KEY (person_id, food),
    -> CONSTRAINT fk_person_id FOREIGN KEY (person_id) REFERENCES person (person_id)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> INSERT INTO favorite_food (person_id, food)
    -> VALUES (1, 'qjrs');
Query OK, 1 row affected (0.00 sec)

mysql> DESC person;
+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| person_id  | int unsigned  | NO   | PRI | NULL    | auto_increment |
| fname      | varchar(100)  | YES  |     | NULL    |                |
| lname      | varchar(100)  | YES  |     | NULL    |                |
| sex        | enum('F','M') | YES  |     | NULL    |                |
| birth_date | date          | YES  |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM perosn;
ERROR 1146 (42S02): Table 'hello_db.perosn' doesn't exist
mysql> SELECT * FROM person;
+-----------+-------+-------+------+------------+
| person_id | fname | lname | sex  | birth_date |
+-----------+-------+-------+------+------------+
|         1 | zhang | liang | F    | 1990-01-02 |
+-----------+-------+-------+------+------------+
1 row in set (0.00 sec)

mysql> INSERT INTO person (fname, lname, sex, birth_date)
    -> VALUES ('chun', 'yan', 'F', '1990-10-01'),
    -> ('l','cx', 'M', '2011-01-01');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> UPDATE FROM person
    -> SET birth_date = str_to_date('DEC-Jan-1989')
    -> WHERE person_id = 3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM person
SET birth_date = str_to_date('DEC-Jan-1989')
WHERE person_id = 3' at line 1
mysql> UPDATE person SET birth_date = str_to_date('DEC-Jan-1989') WHERE person_id = 3;
ERROR 1582 (42000): Incorrect parameter count in the call to native function 'str_to_date'
mysql> UPDATE person SET birth_date = str_to_date('DEC-Jan-1989', '%b-%d-%Y') WHERE person_id = 3;
ERROR 1411 (HY000): Incorrect datetime value: 'DEC-Jan-1989' for function str_to_date
mysql> UPDATE person SET birth_date = str_to_date('DEC 01 1989', '%b-%d-%Y') WHERE person_id = 3;
ERROR 1411 (HY000): Incorrect datetime value: 'DEC 01 1989' for function str_to_date
mysql> UPDATE person SET birth_date = str_to_date('DEC/1/1989', '%b-%d-%Y') WHERE person_id = 3;
ERROR 1411 (HY000): Incorrect datetime value: 'DEC/1/1989' for function str_to_date
mysql> UPDATE person SET birth_date = str_to_date('DEC-1-1989', '%b-%d-%Y') WHERE person_id = 3;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM person;
+-----------+-------+-------+------+------------+
| person_id | fname | lname | sex  | birth_date |
+-----------+-------+-------+------+------------+
|         1 | zhang | liang | F    | 1990-01-02 |
|         3 | chun  | yan   | F    | 1989-12-01 |
|         4 | l     | cx    | M    | 2011-01-01 |
+-----------+-------+-------+------+------------+
3 rows in set (0.00 sec)

mysql> show Warnings;
Empty set (0.01 sec)

mysql> INSERT INTO favorite_food (person_id, food)
    -> VALUES (4, 'pizza'),
    -> (4, 'nigiri');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM person
    -> WHERE person_id = 4;
+-----------+-------+-------+------+------------+
| person_id | fname | lname | sex  | birth_date |
+-----------+-------+-------+------+------------+
|         4 | l     | cx    | M    | 2011-01-01 |
+-----------+-------+-------+------+------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM favorite_food WHERE person_id = 4;
+-----------+--------+
| person_id | food   |
+-----------+--------+
|         4 | nigiri |
|         4 | pizza  |
+-----------+--------+
2 rows in set (0.01 sec)

mysql> SELECT food FROM favorite_food
    -> WHERE food LIKE "%i%";
ERROR 4031 (HY000): The client was disconnected by the server because of inactivity. See wait_timeout and interactive_timeout for configuring this behavior.
No connection. Trying to reconnect...
Connection id:    10
Current database: hello_db

+--------+
| food   |
+--------+
| nigiri |
| pizza  |
+--------+
2 rows in set (0.06 sec)

mysql> SELECT food FROM favorite_food ORDERED BY 1 WHERE food LIKE "%i%";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'BY 1 WHERE food LIKE "%i%"' at line 1
mysql> SELECT food FROM favorite_food ORDER BY 1 WHERE food LIKE "%i%";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE food LIKE "%i%"' at line 1
mysql> SELECT food FROM favorite_food ORDERED BY food WHERE food LIKE "%i%";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'BY food WHERE food LIKE "%i%"' at line 1
mysql> SELECT food FROM favorite_food WHERE food LIKE "%i%" ORDERED BY food;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ORDERED BY food' at line 1
mysql> SELECT food FROM favorite_food WHERE food LIKE "%i%" ORDER BY food;
+--------+
| food   |
+--------+
| nigiri |
| pizza  |
+--------+
2 rows in set (0.00 sec)

mysql> SELECT food FROM favorite_food ORDER BY food WHERE food LIKE "%i%";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE food LIKE "%i%"' at line 1
mysql> SELECT food FROM favorite_food WHERE food LIKE "%i%" ORDER BY food;
+--------+
| food   |
+--------+
| nigiri |
| pizza  |
+--------+
2 rows in set (0.00 sec)

mysql> SELECT food FROM favorite_food WHERE food LIKE "%i%" ORDER BY food DESC;
+--------+
| food   |
+--------+
| pizza  |
| nigiri |
+--------+
2 rows in set (0.00 sec)

mysql> SELECT food FROM favorite_food WHERE food LIKE "%i%" ORDER BY food DESC LIMIT 0, 1;
+-------+
| food  |
+-------+
| pizza |
+-------+
1 row in set (0.00 sec)

mysql> SELECT food FROM favorite_food WHERE CHAR_LENGTH(food) = MAX(CHAR_LENGTH(food);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> SELECT food FROM favorite_food WHERE CHAR_LENGTH(food) = MAX(CHAR_LENGTH(food));
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT food FROM favorite_food WHERE CHAR_LENGTH(food) >= 4;
+--------+
| food   |
+--------+
| qjrs   |
| nigiri |
| pizza  |
+--------+
3 rows in set (0.00 sec)

mysql> SELECT food FROM favorite_food WHERE CHAR_LENGTH(food) >= 5;
+--------+
| food   |
+--------+
| nigiri |
| pizza  |
+--------+
2 rows in set (0.00 sec)

mysql> SELECT food FROM favorite_food WHERE CHAR_LENGTH(food) >= 6;
+--------+
| food   |
+--------+
| nigiri |
+--------+
1 row in set (0.00 sec)

mysql> SELECT food, CHAR_LENGTH(food) AS length FROM favorite_food;
+--------+--------+
| food   | length |
+--------+--------+
| qjrs   |      4 |
| nigiri |      6 |
| pizza  |      5 |
+--------+--------+
3 rows in set (0.00 sec)

mysql> SELECT food, CHAR_LENGTH(food) AS length FROM favorite_food
    -> WHERE MAX(length);
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT food, CHAR_LENGTH(food) AS length FROM favorite_food ORDER BY length DESC LIMIT 1;
+--------+--------+
| food   | length |
+--------+--------+
| nigiri |      6 |
+--------+--------+
1 row in set (0.00 sec)

mysql> SELECT CHAR_LENGTH(food) AS length, max(length) AS max_len FROM food;
ERROR 4031 (HY000): The client was disconnected by the server because of inactivity. See wait_timeout and interactive_timeout for configuring this behavior.
No connection. Trying to reconnect...
Connection id:    11
Current database: hello_db

ERROR 1146 (42S02): Table 'hello_db.food' doesn't exist
mysql> SELECT CHAR_LENGTH(food) AS length, max(length) AS max_len FROM food;
ERROR 1146 (42S02): Table 'hello_db.food' doesn't exist
mysql> show databases
    -> p
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'p' at line 2
mysql> show tables
    -> ;
+--------------------+
| Tables_in_hello_db |
+--------------------+
| favorite_food      |
| person             |
+--------------------+
2 rows in set (0.00 sec)

mysql> SELECT CHAR_LENGTH(food) AS length, max(length) AS max_len FROM favorite_food;
ERROR 1054 (42S22): Unknown column 'length' in 'field list'
mysql> SELECT food, CHAR_LENGTH(food) AS length FROM favorite_food ORDER BY length DESC;
+--------+--------+
| food   | length |
+--------+--------+
| nigiri |      6 |
| pizza  |      5 |
| qjrs   |      4 |
+--------+--------+
3 rows in set (0.01 sec)

mysql> SELECT food, CHAR_LENGTH(food) AS length FROM favorite_food ORDER BY length DESC LIMIT 0,1;
+--------+--------+
| food   | length |
+--------+--------+
| nigiri |      6 |
+--------+--------+
1 row in set (0.01 sec)

mysql> SELECT * FROM favorite_food
    -> ;
+-----------+--------+
| person_id | food   |
+-----------+--------+
|         1 | qjrs   |
|         4 | nigiri |
|         4 | pizza  |
+-----------+--------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM favorite_food
    ->
    -> ;
+-----------+--------+
| person_id | food   |
+-----------+--------+
|         1 | qjrs   |
|         4 | nigiri |
|         4 | pizza  |
+-----------+--------+
3 rows in set (0.00 sec)

mysql> SELECT food, CHAR_LENGTH(food) AS length FROM food
    -> ;
ERROR 1146 (42S02): Table 'hello_db.food' doesn't exist
mysql> desc person;
ERROR 4031 (HY000): The client was disconnected by the server because of inactivity. See wait_timeout and interactive_timeout for configuring this behavior.
No connection. Trying to reconnect...
Connection id:    12
Current database: hello_db

+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| person_id  | int unsigned  | NO   | PRI | NULL    | auto_increment |
| fname      | varchar(100)  | YES  |     | NULL    |                |
| lname      | varchar(100)  | YES  |     | NULL    |                |
| sex        | enum('F','M') | YES  |     | NULL    |                |
| birth_date | date          | YES  |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
5 rows in set (0.05 sec)

mysql> DESC person;
ERROR 4031 (HY000): The client was disconnected by the server because of inactivity. See wait_timeout and interactive_timeout for configuring this behavior.
No connection. Trying to reconnect...
Connection id:    13
Current database: hello_db

+------------+---------------+------+-----+---------+----------------+
| Field      | Type          | Null | Key | Default | Extra          |
+------------+---------------+------+-----+---------+----------------+
| person_id  | int unsigned  | NO   | PRI | NULL    | auto_increment |
| fname      | varchar(100)  | YES  |     | NULL    |                |
| lname      | varchar(100)  | YES  |     | NULL    |                |
| sex        | enum('F','M') | YES  |     | NULL    |                |
| birth_date | date          | YES  |     | NULL    |                |
+------------+---------------+------+-----+---------+----------------+
5 rows in set (0.06 sec)

mysql> SELECT fname, lname,
    -> CASE
    ->   WHEN sex = 'F' then 'female'
    ->   ELSE 'male'
    -> END AS gender
    -> FROM person;
+-------+-------+--------+
| fname | lname | gender |
+-------+-------+--------+
| zhang | liang | female |
| chun  | yan   | female |
| l     | cx    | male   |
+-------+-------+--------+
3 rows in set (0.00 sec)

mysql> SELECT 10 MOD 3;
+----------+
| 10 MOD 3 |
+----------+
|        1 |
+----------+
1 row in set (0.04 sec)

mysql> SELECT MOD(5, 3);
+-----------+
| MOD(5, 3) |
+-----------+
|         2 |
+-----------+
1 row in set (0.00 sec)

mysql> SELECT fname, lname,
    -> CASE
    ->   WHEN CHAR_LENGTH(fname) <= 2 THEN *
    ->   WHEN CHAR_LENGTH(fname) > 2 && CHAR_LENGTH(fname) <= 4 THEN **
    ->   ELSE ***
    -> END AS star
    -> FROM person;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '*
  WHEN CHAR_LENGTH(fname) > 2 && CHAR_LENGTH(fname) <= 4 THEN **
  ELSE ***
EN' at line 3
mysql> SELECT fname, lname, CASE   WHEN CHAR_LENGTH(fname) <= 2 THEN '*'   WHEN CHAR_LENGTH(fname) > 2 && CHAR_LENGTH(fname) <= 4 THEN '**'   ELSE '***' END AS star FROM person;
+-------+-------+------+
| fname | lname | star |
+-------+-------+------+
| zhang | liang | ***  |
| chun  | yan   | **   |
| l     | cx    | *    |
+-------+-------+------+
3 rows in set, 1 warning (0.00 sec)

mysql> SELECT fname, lname
    -> CASE
    ->   WHEN CHAR_LENGTH(lname) <= 2 THEN '*'
    ->   WHEN CHAR_LENGTH(lname) <= 4 THEN '**'
    ->   ELSE '***'
    -> END AS 'star'
    -> FROM person;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CASE
  WHEN CHAR_LENGTH(lname) <= 2 THEN '*'
  WHEN CHAR_LENGTH(lname) <= 4 THEN' at line 2
mysql> SELECT fname, lname CASE   WHEN CHAR_LENGTH(lname) <= 2 THEN '*'   WHEN CHAR_LENGTH(lname) <= 4 THEN '**'   ELSE '***' END AS 'star' FROM person;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CASE   WHEN CHAR_LENGTH(lname) <= 2 THEN '*'   WHEN CHAR_LENGTH(lname) <= 4 THEN' at line 1
mysql> SELECT fname, lname, CASE   WHEN CHAR_LENGTH(fname) <= 2 THEN '*'   WHEN CHAR_LENGTH(fname) > 2 && CHAR_LENGTH(fname) <= 4 THEN '**'   ELSE '***' END AS star FROM person;
+-------+-------+------+
| fname | lname | star |
+-------+-------+------+
| zhang | liang | ***  |
| chun  | yan   | **   |
| l     | cx    | *    |
+-------+-------+------+
3 rows in set, 1 warning (0.00 sec)

mysql> SELECT fname, lname
    -> CASE
    ->   WHEN CHAR_LENGTH(fname) <= 2 THEN '*'
    ->   WHEN CHAR_LENGTH(fname) <= 4 THEN '**'
    ->   ELSE '***'
    -> END AS star
    -> FROM person;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CASE
  WHEN CHAR_LENGTH(fname) <= 2 THEN '*'
  WHEN CHAR_LENGTH(fname) <= 4 THEN' at line 2
mysql> SELECT fname, lname,
    -> CASE
    ->   WHEN CHAR_LENGTH(fname) <= 2 THEN '*'
    ->   WHEN CHAR_LENGTH(fname) <= 4 THEN '**'
    ->   ELSE '***'
    -> END AS 'star'
    -> FROM person;
+-------+-------+------+
| fname | lname | star |
+-------+-------+------+
| zhang | liang | ***  |
| chun  | yan   | **   |
| l     | cx    | *    |
+-------+-------+------+
3 rows in set (0.01 sec)

mysql> SELECT 1 > 2;
+-------+
| 1 > 2 |
+-------+
|     0 |
+-------+
1 row in set (0.00 sec)

mysql> SELECT 1 = 1;
+-------+
| 1 = 1 |
+-------+
|     1 |
+-------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTRING('hello', 0, 1);
+--------------------------+
| SUBSTRING('hello', 0, 1) |
+--------------------------+
|                          |
+--------------------------+
1 row in set (0.01 sec)

mysql> SELECT SUBSTRING('hello', 1, 2);
+--------------------------+
| SUBSTRING('hello', 1, 2) |
+--------------------------+
| he                       |
+--------------------------+
1 row in set (0.00 sec)

mysql> SELECT SUBSTRING('hello', 1, 1);
+--------------------------+
| SUBSTRING('hello', 1, 1) |
+--------------------------+
| h                        |
+--------------------------+
1 row in set (0.00 sec)

mysql> SELECT fname, lname
    -> FROM person
    -> WHERE fname LIKE 'c%' || fname LIKE 'z%';
+-------+-------+
| fname | lname |
+-------+-------+
| zhang | liang |
| chun  | yan   |
+-------+-------+
2 rows in set, 1 warning (0.00 sec)

mysql> select database();
+------------+
| database() |
+------------+
| hello_db   |
+------------+
1 row in set (0.01 sec)

mysql> CREATE TABLE customers (
    -> customer_id INT UNSIGNED AUTO_INCREMENT,
    -> first_name VARCHAR(100) NOT NULL,
    -> last_name VARCHAR(100) NOT NULL,
    -> email VARCHAR(100) NOT NULL,
    -> CONSTRAINT pk_customer_id PRIMARY KEY (customer_id)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> CREATE TABLE orders (
    -> order_id INT UNSIGNED AUTO_INCREMENT,
    -> order_date Date,
    -> amount DECIMAL(10,2),
    -> customer_id INT UNSIGNED,
    -> CONSTRAINT pk_order_id PRIMARY KEY (order_id),
    -> CONSTRAINT fk_customer_id FOREIGN KEY customer_id REFERENCES customer (customer_id)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'REFERENCES customer (customer_id)
)' at line 7
mysql> CREATE TABLE orders ( order_id INT UNSIGNED AUTO_INCREMENT, order_date Date, amount DECIMAL(10,2), customer_id INT UNSIGNED, CONSTRAINT pk_order_id PRIMARY KEY (order_id), CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer (customer_id) );
ERROR 1824 (HY000): Failed to open the referenced table 'customer'
mysql> CREATE TABLE orders ( order_id INT UNSIGNED AUTO_INCREMENT, order_date Date, amount DECIMAL(10,2), customer_id INT UNSIGNED, CONSTRAINT pk_order_id PRIMARY KEY (order_id), CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers (customer_id) );
Query OK, 0 rows affected (0.03 sec)

mysql> desc customers;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| customer_id | int unsigned | NO   | PRI | NULL    | auto_increment |
| first_name  | varchar(100) | NO   |     | NULL    |                |
| last_name   | varchar(100) | NO   |     | NULL    |                |
| email       | varchar(100) | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> desc orders
    -> ;
+-------------+---------------+------+-----+---------+----------------+
| Field       | Type          | Null | Key | Default | Extra          |
+-------------+---------------+------+-----+---------+----------------+
| order_id    | int unsigned  | NO   | PRI | NULL    | auto_increment |
| order_date  | date          | YES  |     | NULL    |                |
| amount      | decimal(10,2) | YES  |     | NULL    |                |
| customer_id | int unsigned  | YES  | MUL | NULL    |                |
+-------------+---------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> INSERT INTO customers (first_name, last_name, email)
    -> VALUES (
    -> 'Boy', 'George', 'george@gmail.com'),
    -> ('George', 'Michael', 'gm@gmail.com'),
    -> ('Divid', 'Bowie', 'divid@gmail.com'),
    -> ('Blue', 'Stell', 'blue@gmail.com'),
    -> ('Bette', 'Davis', 'bette@gmail.com');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> INSERT INTO orders (order_date, amount, customer_id)
    -> VALUES ('2016/02/10', 99.99, 1),
    -> ('2017/11/11', 35.50, 1),
    -> ('2014/12/12', 800.67, 2),
    -> ('2015/01/03', 12.5, 2),
    -> ('1999/04/11', 450.25, 5);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM customers;
+-------------+------------+-----------+------------------+
| customer_id | first_name | last_name | email            |
+-------------+------------+-----------+------------------+
|           1 | Boy        | George    | george@gmail.com |
|           2 | George     | Michael   | gm@gmail.com     |
|           3 | Divid      | Bowie     | divid@gmail.com  |
|           4 | Blue       | Stell     | blue@gmail.com   |
|           5 | Bette      | Davis     | bette@gmail.com  |
+-------------+------------+-----------+------------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM orders;
+----------+------------+--------+-------------+
| order_id | order_date | amount | customer_id |
+----------+------------+--------+-------------+
|        1 | 2016-02-10 |  99.99 |           1 |
|        2 | 2017-11-11 |  35.50 |           1 |
|        3 | 2014-12-12 | 800.67 |           2 |
|        4 | 2015-01-03 |  12.50 |           2 |
|        5 | 1999-04-11 | 450.25 |           5 |
+----------+------------+--------+-------------+
5 rows in set (0.00 sec)

mysql>
