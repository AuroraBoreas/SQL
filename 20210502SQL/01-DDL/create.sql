CREATE TABLE employee(
    empId   INT NOT NULL,
    empName VARCHAR(255),
    CONSTRAINT empPk PRIMARY KEY(empId)
);

CREATE TABLE skill(
    skillId     INT NOT NULL,
    skillName   VARCHAR(255) NOT NULL,
    CONSTRAINT skillPk PRIMARY KEY(skillId)
);

CREATE TABLE employeeSkill(
    empId       INT NOT NULL,
    skillId     INT NOT NULL,
    skillLevel  INT NULL,
    CONSTRAINT empSkillPk   PRIMARY KEY(empId, skillId),
    CONSTRAINT empFk        FOREIGN KEY(empId)      REFERENCES empoyee(empId) ON DELETE CASCADE,
    CONSTRAINT skillFk      FOREIGN KEY(skillId)    REFERENCES skill(skillId) ON UPDATE CASCADE
);