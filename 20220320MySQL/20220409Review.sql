-- trigger
CREATE TABLE trigger_test(
    message VARCHAR(100)
);

DELIMITER $$
CREATE TRIGGER my_trigger4
    BEFORE INSERT
    ON students
        FOR EACH ROW BEGIN
        INSERT INTO trigger_test(message) VALUES('added new student');
        END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER my_trigger3
    AFTER DELETE
    ON students
        FOR EACH ROW BEGIN
            INSERT INTO trigger_test(message) VALUES(CONCAT('deleted', OLD.name));
        END$$
DELIMITER ;
