USE CDWD;

-- ACTIVITY_CODE
DROP TABLE IF EXISTS ACTIVITY_CODE;
CREATE TABLE ACTIVITY_CODE (
	ACTIVITY_CODE  VARCHAR(40),
	DESCRIPTION    VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/ACTIVITY_CODE.csv'
INTO TABLE ACTIVITY_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- AGENCY_TYPE_CODE
DROP TABLE IF EXISTS AGENCY_TYPE_CODE;
CREATE TABLE AGENCY_TYPE_CODE (
	AGENCY_TYPE_CODE  VARCHAR(40),
	DESCRIPTION       VARCHAR(100)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/AGENCY_TYPE_CODE.csv'
INTO TABLE AGENCY_TYPE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- AREA_TYPE_CODE
DROP TABLE IF EXISTS AREA_TYPE_CODE;
CREATE TABLE AREA_TYPE_CODE (
	AREA_TYPE_CODE  VARCHAR(40),
	DESCRIPTION     VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/AREA_TYPE_CODE.csv'
INTO TABLE AREA_TYPE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- AVAILABILITY_CODE 
DROP TABLE IF EXISTS AVAILABILITY_CODE;
CREATE TABLE AVAILABILITY_CODE (
	AVAILABILITY_CODE  VARCHAR(40),
	DESCRIPTION        VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/AVAILABILITY_CODE.csv'
INTO TABLE AVAILABILITY_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- COMPLIANCE_STATUS_CODE
DROP TABLE IF EXISTS COMPLIANCE_STATUS_CODE;
CREATE TABLE COMPLIANCE_STATUS_CODE (
	COMPLIANCE_STATUS_CODE  VARCHAR(40),
	DESCRIPTION             VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/COMPLIANCE_STATUS_CODE.csv'
INTO TABLE COMPLIANCE_STATUS_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- CONTAMINANT_CODE
DROP TABLE IF EXISTS CONTAMINANT_CODE;
CREATE TABLE CONTAMINANT_CODE (
	CONTAMINANT_CODE  VARCHAR(40),
	DESCRIPTION       VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/CONTAMINANT_CODE.csv'
INTO TABLE CONTAMINANT_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@CONTAMINANT_CODE,@DESCRIPTION)
SET
CONTAMINANT_CODE = IF(@CONTAMINANT_CODE = '', NULL, @CONTAMINANT_CODE),
DESCRIPTION = IF(@DESCRIPTION = '', NULL, @DESCRIPTION);


-- COORDINATE_SOURCE_CODE
DROP TABLE IF EXISTS COORDINATE_SOURCE_CODE;
CREATE TABLE COORDINATE_SOURCE_CODE (
	COORDINATE_SOURCE_CODE  VARCHAR(40),
	DESCRIPTION             VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/COORDINATE_SOURCE_CODE.csv'
INTO TABLE COORDINATE_SOURCE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- DBPR_SCHEDULE_CAT_CODE
DROP TABLE IF EXISTS DBPR_SCHEDULE_CAT_CODE;
CREATE TABLE DBPR_SCHEDULE_CAT_CODE (
	DBPR_SCHEDULE_CAT_CODE  INT,
	DESCRIPTION             VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/DBPR_SCHEDULE_CAT_CODE.csv'
INTO TABLE DBPR_SCHEDULE_CAT_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- DRINKING_WATER_RULE_CODE
DROP TABLE IF EXISTS DRINKING_WATER_RULE_CODE;
CREATE TABLE DRINKING_WATER_RULE_CODE (
	DRINKING_WATER_RULE_CODE  VARCHAR(40),
	DESCRIPTION               VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/DRINKING_WATER_RULE_CODE.csv'
INTO TABLE DRINKING_WATER_RULE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- ENFORCEMENT_ACTION_TYPE_CODE
DROP TABLE IF EXISTS ENFORCEMENT_ACTION_TYPE_CODE;
CREATE TABLE ENFORCEMENT_ACTION_TYPE_CODE (
	ENFORCEMENT_ACTION_TYPE_CODE  VARCHAR(40),
	DESCRIPTION                   VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/ENFORCEMENT_ACTION_TYPE_CODE.csv'
INTO TABLE ENFORCEMENT_ACTION_TYPE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- EPA_REGION
DROP TABLE IF EXISTS EPA_REGION;
CREATE TABLE EPA_REGION (
	EPA_REGION   VARCHAR(40),
	DESCRIPTION  VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/EPA_REGION.csv'
INTO TABLE EPA_REGION
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- EVENT_MILESTONE_CODE
DROP TABLE IF EXISTS EVENT_MILESTONE_CODE;
CREATE TABLE EVENT_MILESTONE_CODE (
	EVENT_MILESTONE_CODE  VARCHAR(40),
	DESCRIPTION           VARCHAR(100)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/EVENT_MILESTONE_CODE.csv'
INTO TABLE EVENT_MILESTONE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- EVENT_REASON_CODE
DROP TABLE IF EXISTS EVENT_REASON_CODE;
CREATE TABLE EVENT_REASON_CODE (
	EVENT_REASON_CODE  VARCHAR(40),
	DESCRIPTION        VARCHAR(100)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/EVENT_REASON_CODE.csv'
INTO TABLE EVENT_REASON_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- FACILITY_TYPE_CODE
DROP TABLE IF EXISTS FACILITY_TYPE_CODE;
CREATE TABLE FACILITY_TYPE_CODE (
	FACILITY_TYPE_CODE  VARCHAR(40),
	DESCRIPTION         VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/FACILITY_TYPE_CODE.csv'
INTO TABLE FACILITY_TYPE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- FILTRATION_STATUS_CODE
DROP TABLE IF EXISTS FILTRATION_STATUS_CODE;
CREATE TABLE FILTRATION_STATUS_CODE (
	FILTRATION_STATUS_CODE  VARCHAR(40),
	DESCRIPTION             VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/FILTRATION_STATUS_CODE.csv'
INTO TABLE FILTRATION_STATUS_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- GEOMETRY_TYPE_CODE
DROP TABLE IF EXISTS GEOMETRY_TYPE_CODE;
CREATE TABLE GEOMETRY_TYPE_CODE (
	GEOMETRY_TYPE_CODE  VARCHAR(40),
	DESCRIPTION         VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/GEOMETRY_TYPE_CODE.csv'
INTO TABLE GEOMETRY_TYPE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- GW_SW_CODE
DROP TABLE IF EXISTS GW_SW_CODE;
CREATE TABLE GW_SW_CODE (
	GW_SW_CODE   VARCHAR(40),
	DESCRIPTION  VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/GW_SW_CODE.csv'
INTO TABLE GW_SW_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- HORIZ_COLL_METHOD_CODE
DROP TABLE IF EXISTS HORIZ_COLL_METHOD_CODE;
CREATE TABLE HORIZ_COLL_METHOD_CODE (
	HORIZ_COLL_METHOD_CODE  VARCHAR(40),
	DESCRIPTION             VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/HORIZ_COLL_METHOD_CODE.csv'
INTO TABLE HORIZ_COLL_METHOD_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- HORIZ_REF_DATUM_CODE
DROP TABLE IF EXISTS HORIZ_REF_DATUM_CODE;
CREATE TABLE HORIZ_REF_DATUM_CODE (
	HORIZ_REF_DATUM_CODE  VARCHAR(40),
	DESCRIPTION           VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/HORIZ_REF_DATUM_CODE.csv'
INTO TABLE HORIZ_REF_DATUM_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- LT2_SCHEDULE_CAT_CODE
DROP TABLE IF EXISTS LT2_SCHEDULE_CAT_CODE;
CREATE TABLE LT2_SCHEDULE_CAT_CODE (
	LT2_SCHEDULE_CAT_CODE  INT,
	DESCRIPTION            VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/LT2_SCHEDULE_CAT_CODE.csv'
INTO TABLE LT2_SCHEDULE_CAT_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- ORIGINATOR_CODE
DROP TABLE IF EXISTS ORIGINATOR_CODE;
CREATE TABLE ORIGINATOR_CODE (
	ORIGINATOR_CODE  VARCHAR(40),
	DESCRIPTION      VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/ORIGINATOR_CODE.csv'
INTO TABLE ORIGINATOR_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- OWNER_TYPE_CODE 
DROP TABLE IF EXISTS OWNER_TYPE_CODE ;
CREATE TABLE OWNER_TYPE_CODE (
	OWNER_TYPE_CODE  VARCHAR(1),
	DESCRIPTION      VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/OWNER_TYPE_CODE.csv'
INTO TABLE OWNER_TYPE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- POP_CAT_2_CODE
DROP TABLE IF EXISTS POP_CAT_2_CODE;
CREATE TABLE POP_CAT_2_CODE (
	POP_CAT_2_CODE  INT,
	DESCRIPTION     VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/POP_CAT_2_CODE.csv'
INTO TABLE POP_CAT_2_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- POP_CAT_3_CODE
DROP TABLE IF EXISTS POP_CAT_3_CODE;
CREATE TABLE POP_CAT_3_CODE (
	POP_CAT_3_CODE  INT,
	DESCRIPTION     VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/POP_CAT_3_CODE.csv'
INTO TABLE POP_CAT_3_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- POP_CAT_4_CODE
DROP TABLE IF EXISTS POP_CAT_4_CODE;
CREATE TABLE POP_CAT_4_CODE (
	POP_CAT_4_CODE  INT,
	DESCRIPTION     VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE '/Users/audacious/Desktop/CDWD/Uploads/POP_CAT_4_CODE.csv'
INTO TABLE POP_CAT_4_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- POP_CAT_5_CODE
DROP TABLE IF EXISTS POP_CAT_5_CODE;
CREATE TABLE POP_CAT_5_CODE (
	POP_CAT_5_CODE  INT,
	DESCRIPTION     VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/POP_CAT_5_CODE.csv'
INTO TABLE POP_CAT_5_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- POP_CAT_11_CODE
DROP TABLE IF EXISTS POP_CAT_11_CODE;
CREATE TABLE POP_CAT_11_CODE (
	POP_CAT_11_CODE  INT,
	DESCRIPTION      VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/POP_CAT_11_CODE.csv'
INTO TABLE POP_CAT_11_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- PRIMACY_AGENCY_CODE
DROP TABLE IF EXISTS PRIMACY_AGENCY_CODE;
CREATE TABLE PRIMACY_AGENCY_CODE (
	PRIMACY_AGENCY_CODE  VARCHAR(2),
	DESCRIPTION          VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/PRIMACY_AGENCY_CODE.csv'
INTO TABLE PRIMACY_AGENCY_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- PRIMARY_SOURCE_CODE
DROP TABLE IF EXISTS PRIMARY_SOURCE_CODE;
CREATE TABLE PRIMARY_SOURCE_CODE (
	PRIMARY_SOURCE_CODE  VARCHAR(4),
	DESCRIPTION          VARCHAR(100)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/PRIMARY_SOURCE_CODE.csv'
INTO TABLE PRIMARY_SOURCE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- PWS_TYPE_CODE
DROP TABLE IF EXISTS PWS_TYPE_CODE;
CREATE TABLE PWS_TYPE_CODE (
	PWS_TYPE_CODE  VARCHAR(8),
	DESCRIPTION    VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/PWS_TYPE_CODE.csv'
INTO TABLE PWS_TYPE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- REFERENCE_POINT_CODE
DROP TABLE IF EXISTS REFERENCE_POINT_CODE;
CREATE TABLE REFERENCE_POINT_CODE (
	REFERENCE_POINT_CODE  VARCHAR(40),
	DESCRIPTION           VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/REFERENCE_POINT_CODE.csv'
INTO TABLE REFERENCE_POINT_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- RESULT_SIGN_CODE
DROP TABLE IF EXISTS RESULT_SIGN_CODE;
CREATE TABLE RESULT_SIGN_CODE (
	RESULT_SIGN_CODE  VARCHAR(2),
	DESCRIPTION       VARCHAR(100)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/RESULT_SIGN_CODE.csv'
INTO TABLE RESULT_SIGN_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- RULE_CODE
DROP TABLE IF EXISTS RULE_CODE;
CREATE TABLE RULE_CODE (
	RULE_CODE    INT,
	DESCRIPTION  VARCHAR(100)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/RULE_CODE.csv'
INTO TABLE RULE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- RULE_FAMILY_CODE
DROP TABLE IF EXISTS RULE_FAMILY_CODE;
CREATE TABLE RULE_FAMILY_CODE (
	RULE_FAMILY_CODE  INT,
	DESCRIPTION       VARCHAR(100)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/RULE_FAMILY_CODE.csv'
INTO TABLE RULE_FAMILY_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- RULE_GROUP_CODE
DROP TABLE IF EXISTS RULE_GROUP_CODE;
CREATE TABLE RULE_GROUP_CODE (
	RULE_GROUP_CODE  INT,
	DESCRIPTION      VARCHAR(100)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/RULE_GROUP_CODE.csv'
INTO TABLE RULE_GROUP_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- SELLER_TREATMENT_CODE
DROP TABLE IF EXISTS SELLER_TREATMENT_CODE;
CREATE TABLE SELLER_TREATMENT_CODE (
	SELLER_TREATMENT_CODE  VARCHAR(4),
	DESCRIPTION            VARCHAR(100)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SELLER_TREATMENT_CODE.csv'
INTO TABLE SELLER_TREATMENT_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- SERVICE_AREA_TYPE_CODE
DROP TABLE IF EXISTS SERVICE_AREA_TYPE_CODE;
CREATE TABLE SERVICE_AREA_TYPE_CODE (
	SERVICE_AREA_TYPE_CODE  VARCHAR(4),
	DESCRIPTION             VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SERVICE_AREA_TYPE_CODE.csv'
INTO TABLE SERVICE_AREA_TYPE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- SITE_VISIT_EVAL_TYPE_CODE
DROP TABLE IF EXISTS SITE_VISIT_EVAL_TYPE_CODE;
CREATE TABLE SITE_VISIT_EVAL_TYPE_CODE (
	SITE_VISIT_EVAL_TYPE_CODE  VARCHAR(40),
	DESCRIPTION                VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SITE_VISIT_EVAL_TYPE_CODE.csv'
INTO TABLE SITE_VISIT_EVAL_TYPE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- SOURCE_MAP_SCALE_CODE
DROP TABLE IF EXISTS SOURCE_MAP_SCALE_CODE;
CREATE TABLE SOURCE_MAP_SCALE_CODE (
	SOURCE_MAP_SCALE_CODE  VARCHAR(40),
	DESCRIPTION            VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SOURCE_MAP_SCALE_CODE.csv'
INTO TABLE SOURCE_MAP_SCALE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- SUBMISSION_STATUS_CODE
DROP TABLE IF EXISTS SUBMISSION_STATUS_CODE;
CREATE TABLE SUBMISSION_STATUS_CODE (
	SUBMISSION_STATUS_CODE  VARCHAR(4),
	DESCRIPTION             VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SUBMISSION_STATUS_CODE.csv'
INTO TABLE SUBMISSION_STATUS_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- TREATMENT_OBJECTIVE_CODE
DROP TABLE IF EXISTS TREATMENT_OBJECTIVE_CODE;
CREATE TABLE TREATMENT_OBJECTIVE_CODE (
	TREATMENT_OBJECTIVE_CODE  VARCHAR(40),
	DESCRIPTION               VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/TREATMENT_OBJECTIVE_CODE.csv'
INTO TABLE TREATMENT_OBJECTIVE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- TREATMENT_PROCESS_CODE
DROP TABLE IF EXISTS TREATMENT_PROCESS_CODE;
CREATE TABLE TREATMENT_PROCESS_CODE (
	TREATMENT_PROCESS_CODE  VARCHAR(40),
	DESCRIPTION             VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/TREATMENT_PROCESS_CODE.csv'
INTO TABLE TREATMENT_PROCESS_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- TRIBAL_CODE
DROP TABLE IF EXISTS TRIBAL_CODE;
CREATE TABLE TRIBAL_CODE (
	TRIBAL_CODE  VARCHAR(40),
	DESCRIPTION  VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/TRIBAL_CODE.csv'
INTO TABLE TRIBAL_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- UNIT_OF_MEASURE
DROP TABLE IF EXISTS UNIT_OF_MEASURE;
CREATE TABLE UNIT_OF_MEASURE (
	UNIT_OF_MEASURE  VARCHAR(20),
	DESCRIPTION      VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/UNIT_OF_MEASURE.csv'
INTO TABLE UNIT_OF_MEASURE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- VERIFICATION_METHOD_CODE
DROP TABLE IF EXISTS VERIFICATION_METHOD_CODE;
CREATE TABLE VERIFICATION_METHOD_CODE (
	VERIFICATION_METHOD_CODE  VARCHAR(40),
	DESCRIPTION               VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/VERIFICATION_METHOD_CODE.csv'
INTO TABLE VERIFICATION_METHOD_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- VERT_COLL_METHOD_CODE
DROP TABLE IF EXISTS VERT_COLL_METHOD_CODE;
CREATE TABLE VERT_COLL_METHOD_CODE (
	VERT_COLL_METHOD_CODE  VARCHAR(40),
	DESCRIPTION            VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/VERT_COLL_METHOD_CODE.csv'
INTO TABLE VERT_COLL_METHOD_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- VERT_REF_DATUM_CODE
DROP TABLE IF EXISTS VERT_REF_DATUM_CODE;
CREATE TABLE VERT_REF_DATUM_CODE (
	VERT_REF_DATUM_CODE  VARCHAR(40),
	DESCRIPTION          VARCHAR(255)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/VERT_REF_DATUM_CODE.csv'
INTO TABLE VERT_REF_DATUM_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- VIOLATION_CATEGORY_CODE
DROP TABLE IF EXISTS VIOLATION_CATEGORY_CODE;
CREATE TABLE VIOLATION_CATEGORY_CODE (
	VIOLATION_CATEGORY_CODE  VARCHAR(5),
	DESCRIPTION              VARCHAR(40)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/VIOLATION_CATEGORY_CODE.csv'
INTO TABLE VIOLATION_CATEGORY_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- VIOLATION_CODE
DROP TABLE IF EXISTS VIOLATION_CODE;
CREATE TABLE VIOLATION_CODE (
	VIOLATION_CODE  VARCHAR(2),
	DESCRIPTION     VARCHAR(100)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/VIOLATION_CODE.csv'
INTO TABLE VIOLATION_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- VISIT_REASON_CODE
DROP TABLE IF EXISTS VISIT_REASON_CODE;
CREATE TABLE VISIT_REASON_CODE (
	VISIT_REASON_CODE  VARCHAR(4),
	DESCRIPTION        VARCHAR(100)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/VISIT_REASON_CODE.csv'
INTO TABLE VISIT_REASON_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- WATER_TYPE_CODE
DROP TABLE IF EXISTS WATER_TYPE_CODE;
CREATE TABLE WATER_TYPE_CODE (
	WATER_TYPE_CODE  VARCHAR(2),
	DESCRIPTION      VARCHAR(100)
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/WATER_TYPE_CODE.csv'
INTO TABLE WATER_TYPE_CODE
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;



