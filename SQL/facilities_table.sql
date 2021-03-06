USE CDWD;
DROP TABLE IF EXISTS FACILITIES;
CREATE TABLE FACILITIES (
	SUBMISSIONYEARQUARTER          VARCHAR(6),
	PWSID                          VARCHAR(9),
	FACILITY_ID                    VARCHAR(12),
	FACILITY_NAME                  VARCHAR(100),
	STATE_FACILITY_ID              VARCHAR(40),
	FACILITY_ACTIVITY_CODE         VARCHAR(1),
	FACILITY_DEACTIVATION_DATE     DATE,
	FACILITY_TYPE_CODE             VARCHAR(2),
	SUBMISSION_STATUS_CODE         VARCHAR(4),
	IS_SOURCE_IND                  VARCHAR(1),
	WATER_TYPE_CODE                VARCHAR(2),
	AVAILABILITY_CODE              VARCHAR(1),
	SELLER_TREATMENT_CODE          VARCHAR(4),
	SELLER_PWSID                   VARCHAR(9),
	SELLER_PWS_NAME                VARCHAR(100),
	FILTRATION_STATUS_CODE         VARCHAR(4),
	IS_SOURCE_TREATED_IND          VARCHAR(1),
	FIRST_REPORTED_DATE            DATE,
	LAST_REPORTED_DATE             DATE,
primary key(PWSID, FACILITY_ID)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/FACILITIES.csv'
INTO TABLE FACILITIES 
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@SUBMISSIONYEARQUARTER,@PWSID,@FACILITY_ID,@FACILITY_NAME,@STATE_FACILITY_ID,@FACILITY_ACTIVITY_CODE,@FACILITY_DEACTIVATION_DATE,@FACILITY_TYPE_CODE,@SUBMISSION_STATUS_CODE,@IS_SOURCE_IND,@WATER_TYPE_CODE,@AVAILABILITY_CODE,@SELLER_TREATMENT_CODE,@SELLER_PWSID,@SELLER_PWS_NAME,@FILTRATION_STATUS_CODE,@IS_SOURCE_TREATED_IND,@FIRST_REPORTED_DATE,@LAST_REPORTED_DATE)
SET
SUBMISSIONYEARQUARTER = IF(@SUBMISSIONYEARQUARTER = '', NULL, @SUBMISSIONYEARQUARTER),
PWSID = IF(@PWSID = '', NULL, @PWSID),
FACILITY_ID = IF(@FACILITY_ID = '', NULL, @FACILITY_ID),
FACILITY_NAME = IF(@FACILITY_NAME = '', NULL, @FACILITY_NAME),
STATE_FACILITY_ID = IF(@STATE_FACILITY_ID = '', NULL, @STATE_FACILITY_ID),
FACILITY_ACTIVITY_CODE = IF(@FACILITY_ACTIVITY_CODE = '', NULL, @FACILITY_ACTIVITY_CODE),
FACILITY_DEACTIVATION_DATE = IF(@FACILITY_DEACTIVATION_DATE = '', NULL, STR_TO_DATE(@FACILITY_DEACTIVATION_DATE, '%Y-%m-%d')),
FACILITY_TYPE_CODE = IF(@FACILITY_TYPE_CODE = '', NULL, @FACILITY_TYPE_CODE),
SUBMISSION_STATUS_CODE = IF(@SUBMISSION_STATUS_CODE = '', NULL, @SUBMISSION_STATUS_CODE),
IS_SOURCE_IND = IF(@IS_SOURCE_IND = '', NULL, @IS_SOURCE_IND),
WATER_TYPE_CODE = IF(@WATER_TYPE_CODE = '', NULL, @WATER_TYPE_CODE),
AVAILABILITY_CODE = IF(@AVAILABILITY_CODE = '', NULL, @AVAILABILITY_CODE),
SELLER_TREATMENT_CODE = IF(@SELLER_TREATMENT_CODE = '', NULL, @SELLER_TREATMENT_CODE),
SELLER_PWSID = IF(@SELLER_PWSID = '', NULL, @SELLER_PWSID),
SELLER_PWS_NAME = IF(@SELLER_PWS_NAME = '', NULL, @SELLER_PWS_NAME),
FILTRATION_STATUS_CODE = IF(@FILTRATION_STATUS_CODE = '', NULL, @FILTRATION_STATUS_CODE),
IS_SOURCE_TREATED_IND = IF(@IS_SOURCE_TREATED_IND = '', NULL, @IS_SOURCE_TREATED_IND),
FIRST_REPORTED_DATE = IF(@FIRST_REPORTED_DATE = '', NULL, STR_TO_DATE(@FIRST_REPORTED_DATE, '%Y-%m-%d')),
LAST_REPORTED_DATE = IF(@LAST_REPORTED_DATE = '', NULL, STR_TO_DATE(@LAST_REPORTED_DATE, '%Y-%m-%d'));

select count(*) from facilities;

-- Adding index for effective filtering using select query
ALTER TABLE FACILITIES
ADD INDEX idx_FACILITY_ACTIVITY_CODE (FACILITY_ACTIVITY_CODE);

ALTER TABLE FACILITIES
ADD INDEX idx_FACILITY_DEACTIVATION_DATE (FACILITY_DEACTIVATION_DATE);

ALTER TABLE FACILITIES
ADD INDEX idx_FACILITY_TYPE_CODE (FACILITY_TYPE_CODE);

ALTER TABLE FACILITIES
ADD INDEX idx_SUBMISSION_STATUS_CODE (SUBMISSION_STATUS_CODE);

ALTER TABLE FACILITIES
ADD INDEX idx_IS_SOURCE_IND (IS_SOURCE_IND);

ALTER TABLE FACILITIES
ADD INDEX idx_WATER_TYPE_CODE (WATER_TYPE_CODE);

ALTER TABLE FACILITIES
ADD INDEX idx_AVAILABILITY_CODE (AVAILABILITY_CODE);