CREATE TABLE UNIT_OF_MEASURE (
	UNIT_OF_MEASURE  VARCHAR(40),
	DESCRIPTION      VARCHAR(4)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/UNIT_OF_MEASURE.csv'
INTO TABLE EVENTS_MILESTONES
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\
'
IGNORE 1 ROWS