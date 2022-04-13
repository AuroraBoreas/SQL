CREATE TABLE products(
    category INT NOT NULL,
    id INT NOT NULL,
    price DECIMAL(9,2)
);

ALTER TABLE products
MODIFY COLUMN category INT;

explain TABLE products;
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table    | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | products | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    1 |   100.00 | NULL  |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

show CREATE TABLE products;
+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table    | Create Table                                                                                                                                                                         |
+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| products | CREATE TABLE `products` (
  `category` int DEFAULT NULL,
  `id` int NOT NULL,
  `price` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.01 sec)

ALTER TABLE products
ADD CONSTRAINT pk_cat_id PRIMARY KEY(category, id);

CREATE INDEX idx_cat_id ON products(category, id);

show CREATE TABLE products;
+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table    | Create Table                                                                                                                                                                                                                                            |
+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| products | CREATE TABLE `products` (
  `category` int NOT NULL,
  `id` int NOT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`category`,`id`),
  KEY `idx_cat_id` (`category`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

ALTER TABLE products
ADD COLUMN barcode VARCHAR(100);

ALTER TABLE products
ADD CONSTRAINT uni_barcode UNIQUE(barcode);

INSERT INTO products(category, id, price, barcode)
VALUES(1,2,30.99,'hell world!'),
(1,3,40.05,'fuckyou world!'),
(2,1,99,'goodbye world!');

INSERT INTO products(category, id, price, barcode)
VALUES(2,2,33,NULL);

INSERT INTO products(category, id, price, barcode) VALUES(2,4,13,NULL);

ALTER TABLE products
ADD check_price (price > 0);
ALTER TABLE products ADD CHECK(price > 0);

SELECT * FROM products;
+----------+----+-------+----------------+
| category | id | price | barcode        |
+----------+----+-------+----------------+
|        1 |  2 | 30.99 | hell world!    |
|        1 |  3 | 40.05 | fuckyou world! |
|        2 |  1 | 99.00 | goodbye world! |
|        2 |  2 | 33.00 | NULL           |
|        2 |  4 | 13.00 | NULL           |
+----------+----+-------+----------------+
5 rows in set (0.00 sec)

INSERT INTO products(category, id, price, barcode)
VALUES(3,1,-1,'test');

CREATE VIEW view_products AS (
SELECT * FROM products);

SELECT * FROM view_products;

INSERT INTO products(category, id, price, barcode)
VALUES(3, 1, 110, "CNM");

SELECT * FROM view_products;
+----------+----+--------+----------------+
| category | id | price  | barcode        |
+----------+----+--------+----------------+
|        1 |  2 |  30.99 | hell world!    |
|        1 |  3 |  40.05 | fuckyou world! |
|        2 |  1 |  99.00 | goodbye world! |
|        2 |  2 |  33.00 | NULL           |
|        2 |  4 |  13.00 | NULL           |
|        3 |  1 | 110.00 | CNM            |
+----------+----+--------+----------------+
6 rows in set (0.00 sec)

START TRANSACTION;
INSERT INTO products(category, id, price, barcode) VALUES(4,1,11,'cy');
SELECT * FROM view_products;
COMMIT;

SELECT * FROM view_products;
+----------+----+--------+----------------+
| category | id | price  | barcode        |
+----------+----+--------+----------------+
|        1 |  2 |  30.99 | hell world!    |
|        1 |  3 |  40.05 | fuckyou world! |
|        2 |  1 |  99.00 | goodbye world! |
|        2 |  2 |  33.00 | NULL           |
|        2 |  4 |  13.00 | NULL           |
|        3 |  1 | 110.00 | CNM            |
|        4 |  1 |  11.00 | cy             |
+----------+----+--------+----------------+
7 rows in set (0.00 sec)

START TRANSACTION;
DELETE FROM products;
SELECT * FROM view_products;
Empty set (0.00 sec)

ROLLBACK;

SELECT * FROM view_products;
+----------+----+--------+----------------+
| category | id | price  | barcode        |
+----------+----+--------+----------------+
|        1 |  2 |  30.99 | hell world!    |
|        1 |  3 |  40.05 | fuckyou world! |
|        2 |  1 |  99.00 | goodbye world! |
|        2 |  2 |  33.00 | NULL           |
|        2 |  4 |  13.00 | NULL           |
|        3 |  1 | 110.00 | CNM            |
|        4 |  1 |  11.00 | cy             |
+----------+----+--------+----------------+
7 rows in set (0.00 sec)
