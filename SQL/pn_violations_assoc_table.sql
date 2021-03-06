USE CDWD;

DROP TABLE IF EXISTS PN_VIOLATIONS_ASSOC;
CREATE TABLE PN_VIOLATIONS_ASSOC (
	SUBMISSIONYEARQUARTER     VARCHAR(6),
	PWSID                     VARCHAR(9),
	PN_VIOLATION_ID           VARCHAR(40),
	RELATED_VIOLATION_ID      VARCHAR(40),
	COMPL_PER_BEGIN_DATE      DATE,
	COMPL_PER_END_DATE        DATE,
	VIOLATION_CODE            VARCHAR(2),
	CONTAMINANT_CODE          VARCHAR(4),
	FIRST_REPORTED_DATE       DATE,
	LAST_REPORTED_DATE        DATE,
PRIMARY KEY(PWSID, PN_VIOLATION_ID, RELATED_VIOLATION_ID)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/PN_VIOLATIONS_ASSOC.csv'
INTO TABLE PN_VIOLATIONS_ASSOC 
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@SUBMISSIONYEARQUARTER,@PWSID,@PN_VIOLATION_ID,@RELATED_VIOLATION_ID,@COMPL_PER_BEGIN_DATE,@COMPL_PER_END_DATE,@VIOLATION_CODE,@CONTAMINANT_CODE,@FIRST_REPORTED_DATE,@LAST_REPORTED_DATE)
SET
SUBMISSIONYEARQUARTER = IF(@SUBMISSIONYEARQUARTER = '', NULL, @SUBMISSIONYEARQUARTER),
PWSID = IF(@PWSID = '', NULL, @PWSID),
PN_VIOLATION_ID = IF(@PN_VIOLATION_ID = '', NULL, @PN_VIOLATION_ID),
RELATED_VIOLATION_ID = IF(@RELATED_VIOLATION_ID = '', NULL, @RELATED_VIOLATION_ID),
COMPL_PER_BEGIN_DATE = IF(@COMPL_PER_BEGIN_DATE = '', NULL, STR_TO_DATE(@COMPL_PER_BEGIN_DATE, '%Y-%m-%d')),
COMPL_PER_END_DATE = IF(@COMPL_PER_END_DATE = '', NULL, STR_TO_DATE(@COMPL_PER_END_DATE, '%Y-%m-%d')),
VIOLATION_CODE = IF(@VIOLATION_CODE = '', NULL, @VIOLATION_CODE),
CONTAMINANT_CODE = IF(@CONTAMINANT_CODE = '', NULL, @CONTAMINANT_CODE),
FIRST_REPORTED_DATE = IF(@FIRST_REPORTED_DATE = '', NULL, STR_TO_DATE(@FIRST_REPORTED_DATE, '%Y-%m-%d')),
LAST_REPORTED_DATE = IF(@LAST_REPORTED_DATE = '', NULL, STR_TO_DATE(@LAST_REPORTED_DATE, '%Y-%m-%d'));


-- Adding index for effective filtering using select query
ALTER TABLE PN_VIOLATIONS_ASSOC
ADD INDEX idx_violation_code (VIOLATION_CODE);

ALTER TABLE PN_VIOLATIONS_ASSOC
ADD INDEX idx_contaminant_code (CONTAMINANT_CODE);