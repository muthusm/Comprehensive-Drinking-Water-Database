USE CDWD;

DROP TABLE IF EXISTS violation;
CREATE TABLE violation (
	SUBMISSIONYEARQUARTER         VARCHAR(6),
	PWSID                         VARCHAR(9),
	VIOLATION_ID                  VARCHAR(20),
	COMPL_PER_BEGIN_DATE          DATE,
	COMPL_PER_END_DATE            DATE,
	VIOLATION_CODE                VARCHAR(4),
	VIOLATION_CATEGORY_CODE       VARCHAR(5),
	IS_HEALTH_BASED_IND           VARCHAR(1),
	CONTAMINANT_CODE              VARCHAR(255),
	VIOL_MEASURE                  INT,
	UNIT_OF_MEASURE               VARCHAR(19),
	FEDERAL_MCL                   VARCHAR(255),
	STATE_MCL                     VARCHAR(15),
	IS_MAJOR_VIOL_IND             VARCHAR(1),
	SEVERITY_IND_CNT              INT,
	CALCULATED_RTC_DATE           DATE,
	VIOLATION_STATUS              VARCHAR(11),
	PUBLIC_NOTIFICATION_TIER      INT,
	CALCULATED_PUB_NOTIF_TIER     INT,
	VIOL_ORIGINATOR_CODE          VARCHAR(4),
	SAMPLE_RESULT_ID              VARCHAR(20),
	CORRECTIVE_ACTION_ID          VARCHAR(50),
	RULE_CODE                     INT,
	RULE_GROUP_CODE               INT,
	RULE_FAMILY_CODE              INT,
	VIOL_FIRST_REPORTED_DATE      DATE,
	VIOL_LAST_REPORTED_DATE       DATE
) ENGINE = InnoDB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/VIOLATIONS.csv'
INTO TABLE violation
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@SUBMISSIONYEARQUARTER,@PWSID,@VIOLATION_ID,@COMPL_PER_BEGIN_DATE,@COMPL_PER_END_DATE,@VIOLATION_CODE,@VIOLATION_CATEGORY_CODE,@IS_HEALTH_BASED_IND,@CONTAMINANT_CODE,@VIOL_MEASURE,@UNIT_OF_MEASURE,@FEDERAL_MCL,@STATE_MCL,@IS_MAJOR_VIOL_IND,@SEVERITY_IND_CNT,@CALCULATED_RTC_DATE,@VIOLATION_STATUS,@PUBLIC_NOTIFICATION_TIER,@CALCULATED_PUB_NOTIF_TIER,@VIOL_ORIGINATOR_CODE,@SAMPLE_RESULT_ID,@CORRECTIVE_ACTION_ID,@RULE_CODE,@RULE_GROUP_CODE,@RULE_FAMILY_CODE,@VIOL_FIRST_REPORTED_DATE,@VIOL_LAST_REPORTED_DATE)
SET
SUBMISSIONYEARQUARTER = IF(@SUBMISSIONYEARQUARTER = '', NULL, @SUBMISSIONYEARQUARTER),
PWSID = IF(@PWSID = '', NULL, @PWSID),
VIOLATION_ID = IF(@VIOLATION_ID = '', NULL, @VIOLATION_ID),
COMPL_PER_BEGIN_DATE = IF(@COMPL_PER_BEGIN_DATE = '', NULL, STR_TO_DATE(@COMPL_PER_BEGIN_DATE, '%Y-%m-%d')),
COMPL_PER_END_DATE = IF(@COMPL_PER_END_DATE = '', NULL, STR_TO_DATE(@COMPL_PER_END_DATE, '%Y-%m-%d')),
VIOLATION_CODE = IF(@VIOLATION_CODE = '', NULL, @VIOLATION_CODE),
VIOLATION_CATEGORY_CODE = IF(@VIOLATION_CATEGORY_CODE = '', NULL, @VIOLATION_CATEGORY_CODE),
IS_HEALTH_BASED_IND = IF(@IS_HEALTH_BASED_IND = '', NULL, @IS_HEALTH_BASED_IND),
CONTAMINANT_CODE = IF(@CONTAMINANT_CODE = '', NULL, @CONTAMINANT_CODE),
VIOL_MEASURE = IF(@VIOL_MEASURE = '', NULL, @VIOL_MEASURE),
UNIT_OF_MEASURE = IF(@UNIT_OF_MEASURE = '', NULL, @UNIT_OF_MEASURE),
FEDERAL_MCL = IF(@FEDERAL_MCL = '', NULL, @FEDERAL_MCL),
STATE_MCL = IF(@STATE_MCL = '', NULL, @STATE_MCL),
IS_MAJOR_VIOL_IND = IF(@IS_MAJOR_VIOL_IND = '', NULL, @IS_MAJOR_VIOL_IND),
SEVERITY_IND_CNT = IF(@SEVERITY_IND_CNT = '', NULL, @SEVERITY_IND_CNT),
CALCULATED_RTC_DATE = IF(@CALCULATED_RTC_DATE = '', NULL, STR_TO_DATE(@CALCULATED_RTC_DATE, '%Y-%m-%d')),
VIOLATION_STATUS = IF(@VIOLATION_STATUS = '', NULL, @VIOLATION_STATUS),
PUBLIC_NOTIFICATION_TIER = IF(@PUBLIC_NOTIFICATION_TIER = '', NULL, @PUBLIC_NOTIFICATION_TIER),
CALCULATED_PUB_NOTIF_TIER = IF(@CALCULATED_PUB_NOTIF_TIER = '', NULL, @CALCULATED_PUB_NOTIF_TIER),
VIOL_ORIGINATOR_CODE = IF(@VIOL_ORIGINATOR_CODE = '', NULL, @VIOL_ORIGINATOR_CODE),
SAMPLE_RESULT_ID = IF(@SAMPLE_RESULT_ID = '', NULL, @SAMPLE_RESULT_ID),
CORRECTIVE_ACTION_ID = IF(@CORRECTIVE_ACTION_ID = '', NULL, @CORRECTIVE_ACTION_ID),
RULE_CODE = IF(@RULE_CODE = '', NULL, @RULE_CODE),
RULE_GROUP_CODE = IF(@RULE_GROUP_CODE = '', NULL, @RULE_GROUP_CODE),
RULE_FAMILY_CODE = IF(@RULE_FAMILY_CODE = '', NULL, @RULE_FAMILY_CODE),
VIOL_FIRST_REPORTED_DATE = IF(@VIOL_FIRST_REPORTED_DATE = '', NULL, STR_TO_DATE(@VIOL_FIRST_REPORTED_DATE, '%Y-%m-%d')),
VIOL_LAST_REPORTED_DATE = IF(@VIOL_LAST_REPORTED_DATE = '', NULL, STR_TO_DATE(@VIOL_LAST_REPORTED_DATE, '%Y-%m-%d'));
