-- CREATE TABLE EmployeeSkill(
-- 	empId 		INT NOT NULL,
--     skillId 	INT NOT NULL,
--     skillLevel	INT NULL,
--     CONSTRAINT empSkillPk PRIMARY KEY(empId, skillId)
-- );

DROP TABLE EmployeeSkill;

-- CREATE TABLE EmployeeSkill(
-- 	empId		INT NOT NULL,
--     skillId		INT NOT NULL,
--     skillLevel	INT	NULL,
--     CONSTRAINT empSkillPk PRIMARY KEY(empId, skillId),
--     CONSTRAINT empFk	  FOREIGN KEY(empId) REFERENCES employee(empId),
--     CONSTRAINT skillFk	  FOREIGN KEY(skillId) REFERENCES Skill(skillId)
-- );

CREATE TABLE EmployeeSkill(
	empId		INT NOT NULL,
    skillId		INT NOT NULL,
    skillLevel	INT NULL,
    CONSTRAINT empSkillPk	PRIMARY KEY(empId, skillId),
    CONSTRAINT empFk		FOREIGN KEY(empId) REFERENCES Employee(empId) ON DELETE CASCADE,
    CONSTRAINT skillFk		FOREIGN KEY(skillId) REFERENCES Skill(skillId) ON UPDATE CASCADE
);