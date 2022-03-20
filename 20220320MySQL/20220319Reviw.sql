mysql --version
brew services start mysql
show databases;
CREATE DATABASE hello_db;
use hello_db;
select database();
DROP DATABASE hello_db;

CREATE TABLE person (
    person_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    fname VARCHAR(100) NOT NULL DEFAULT 'anonymous',
    lname VARCHAR(100),
    sex ENUM('F', 'M'),
    birth_date DATE,
    CONSTRAINT pk_person_id PRIMARY KEY (person_id)
);

DESC person;

INSERT INTO
    person(fname, lname, sex, birth_date)
VALUES
    ('zhang', 'liang', 'F', '1990-01-02');

INSERT INTO
    person (fname, lname, sex, birth_date)
VALUES ('c', 'y', 'M', '1990-01-02');

INSERT INTO
    person (fname, lname, sex, birth_date)
VALUES
    ('chun', 'yan', 'F', '1990-10-01'),
    ('l','cx', 'M', '2011-01-01');

UPDATE person
SET birth_date = str_to_date('DEC-1-1989', '%b-%d-%Y')
WHERE person_id = 3;

CREATE TABLE favorite_food (
    person_id INT UNSIGNED,
    food VARCHAR(100),
    CONSTRAINT pk_person_food PRIMARY KEY (person_id, food),
    CONSTRAINT fk_person_id FOREIGN KEY (person_id) REFERENCES person (person_id)
);

INSERT INTO
    favorite_food (person_id, food)
VALUES
    (1, 'qjrs');

INSERT INTO
    favorite_food (person_id, food)
VALUES
    (4, 'pizza'),
    (4, 'nigiri');

SELECT food, CHAR_LENGTH(food) AS length
FROM favorite_food
ORDER BY length DESC LIMIT 1;

SELECT fname, lname,
    CASE
        WHEN sex = 'F' THEN 'female'
        ELSE 'male'
    END AS gender
FROM person;

SELECT fname, lname,
    CASE
        WHEN CHAR_LENGTH(fname) <= 2 THEN '*'
        WHEN CHAR_LENGTH(fname) > 2 && CHAR_LENGTH(fname) <= 4 THEN '**'
        ELSE '***'
    END AS 'star'
FROM person;

SELECT fname, lname,
    CASE
        WHEN CHAR_LENGTH(fname) <= 2 THEN '*'
        WHEN CHAR_LENGTH(fname) <= 4 THEN '**'
        ELSE '***'
    END AS 'star'
FROM person;

SELECT SUBSTRING('hello', 1, 1);

SELECT fname, lname
FROM person
WHERE fname LIKE 'c%' || fname LIKE 'z%';
