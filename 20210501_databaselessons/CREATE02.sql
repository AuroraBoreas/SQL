-- DROP TABLE Skill;

CREATE TABLE Skill(
	skillId		INT NOT NULL,
    skillName	VARCHAR(255),
    
    CONSTRAINT skillPk PRIMARY KEY(skillId)
);