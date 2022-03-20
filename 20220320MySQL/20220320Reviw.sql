CREATE TABLE customers (
    customer_id INT UNSIGNED AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT pk_customer_id PRIMARY KEY (customer_id)
);

CREATE TABLE orders (
    order_id INT UNSIGNED AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(10,2),
    customer_id INT UNSIGNED,
    CONSTRAINT pk_order_id PRIMARY KEY (order_id),
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);

INSERT INTO
    customers (first_name, last_name, email)
VALUES
    ('Boy', 'George', 'george@gmail.com'),
    ('George', 'Michael', 'gm@gmail.com'),
    ('Divid', 'Bowie', 'divid@gmail.com'),
    ('Blue', 'Stell', 'blue@gmail.com'),
    ('Bette', 'Davis', 'bette@gmail.com');

INSERT INTO
    orders (order_date, amount, customer_id)
VALUES
    ('2016/02/10', 99.99, 1),
    ('2017/11/11', 35.50, 1),
    ('2014/12/12', 800.67, 2),
    ('2015/01/03', 12.5, 2),
    ('1999/04/11', 450.25, 5);

-- cross product
-- all in one:: implicit inner join
SELECT * FROM customers, orders;

-- filter
SELECT * FROM customers, orders
WHERE customers.customer_id = orders.customer_id;

-- refine
SELECT first_name, last_name, order_date, amount
FROM customers, orders
WHERE customers.customer_id = orders.customer_id;

-- explicit inner join
SELECT first_name, last_name, order_date, amount
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;

-- fancier
SELECT first_name, last_name, SUM(amount) AS total_spent
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY total_spent;
