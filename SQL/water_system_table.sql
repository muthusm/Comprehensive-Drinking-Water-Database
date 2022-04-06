-- Database Creation
DROP DATABASE IF EXISTS CDWD;
CREATE DATABASE CDWD;

USE CDWD;

DROP TABLE IF EXISTS pws;
CREATE TABLE pws (
	SUBMISSIONYEARQUARTER              VARCHAR(6),
	PWSID                              VARCHAR(9),
	PWS_NAME                           VARCHAR(100),
	PRIMACY_AGENCY_CODE                VARCHAR(2),
	EPA_REGION                         VARCHAR(3),
	SEASON_BEGIN_DATE                  VARCHAR(5),
	SEASON_END_DATE                    VARCHAR(5),
	PWS_ACTIVITY_CODE                  VARCHAR(1),
	PWS_DEACTIVATION_DATE              DATE,
	PWS_TYPE_CODE                      VARCHAR(6),
	DBPR_SCHEDULE_CAT_CODE             INT,
	CDS_ID                             VARCHAR(100),
	GW_SW_CODE                         VARCHAR(2),
	LT2_SCHEDULE_CAT_CODE              INT,
	OWNER_TYPE_CODE                    VARCHAR(1),
	POPULATION_SERVED_COUNT            INT,
	POP_CAT_2_CODE                     INT,
	POP_CAT_3_CODE                     INT,
	POP_CAT_4_CODE                     INT,
	POP_CAT_5_CODE                     INT,
	POP_CAT_11_CODE                    INT,
	PRIMACY_TYPE                       VARCHAR(20),
	PRIMARY_SOURCE_CODE                VARCHAR(4),
	IS_GRANT_ELIGIBLE_IND              VARCHAR(1),
	IS_WHOLESALER_IND                  VARCHAR(1),
	IS_SCHOOL_OR_DAYCARE_IND           VARCHAR(1),
	SERVICE_CONNECTIONS_COUNT          INT,
	SUBMISSION_STATUS_CODE             VARCHAR(4),
	ORG_NAME                           VARCHAR(100),
	ADMIN_NAME                         VARCHAR(100),
	EMAIL_ADDR                         VARCHAR(100),
	PHONE_NUMBER                       VARCHAR(15),
	PHONE_EXT_NUMBER                   VARCHAR(5),
	FAX_NUMBER                         VARCHAR(15),
	ALT_PHONE_NUMBER                   VARCHAR(20),
	ADDRESS_LINE1                      VARCHAR(200),
	ADDRESS_LINE2                      VARCHAR(200),
	CITY_NAME                          VARCHAR(40),
	ZIP_CODE                           VARCHAR(15),
	COUNTRY_CODE                       VARCHAR(255),
	FIRST_REPORTED_DATE                DATE,
	LAST_REPORTED_DATE                 DATE,
	STATE_CODE                         VARCHAR(2),
	SOURCE_WATER_PROTECTION_CODE       VARCHAR(2),
	SOURCE_PROTECTION_BEGIN_DATE       DATE,
	OUTSTANDING_PERFORMER              VARCHAR(2),
	OUTSTANDING_PERFORM_BEGIN_DATE     DATE,
	REDUCED_RTCR_MONITORING            VARCHAR(11),
	REDUCED_MONITORING_BEGIN_DATE      DATE,
	REDUCED_MONITORING_END_DATE        DATE,
	SEASONAL_STARTUP_SYSTEM            VARCHAR(255),
PRIMARY KEY (PWSID)
) ENGINE = InnoDB;


/* Load raw data into the "pws" table created above */
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SDWA_PUB_WATER_SYSTEMS.csv'
INTO TABLE pws
FIELDS TERMINATED BY ','
ESCAPED BY ''
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@SUBMISSIONYEARQUARTER,@PWSID,@PWS_NAME,@PRIMACY_AGENCY_CODE,@EPA_REGION,@SEASON_BEGIN_DATE,@SEASON_END_DATE,@PWS_ACTIVITY_CODE,@PWS_DEACTIVATION_DATE,@PWS_TYPE_CODE,@DBPR_SCHEDULE_CAT_CODE,@CDS_ID,@GW_SW_CODE,@LT2_SCHEDULE_CAT_CODE,@OWNER_TYPE_CODE,@POPULATION_SERVED_COUNT,@POP_CAT_2_CODE,@POP_CAT_3_CODE,@POP_CAT_4_CODE,@POP_CAT_5_CODE,@POP_CAT_11_CODE,@PRIMACY_TYPE,@PRIMARY_SOURCE_CODE,@IS_GRANT_ELIGIBLE_IND,@IS_WHOLESALER_IND,@IS_SCHOOL_OR_DAYCARE_IND,@SERVICE_CONNECTIONS_COUNT,@SUBMISSION_STATUS_CODE,@ORG_NAME,@ADMIN_NAME,@EMAIL_ADDR,@PHONE_NUMBER,@PHONE_EXT_NUMBER,@FAX_NUMBER,@ALT_PHONE_NUMBER,@ADDRESS_LINE1,@ADDRESS_LINE2,@CITY_NAME,@ZIP_CODE,@COUNTRY_CODE,@FIRST_REPORTED_DATE,@LAST_REPORTED_DATE,@STATE_CODE,@SOURCE_WATER_PROTECTION_CODE,@SOURCE_PROTECTION_BEGIN_DATE,@OUTSTANDING_PERFORMER,@OUTSTANDING_PERFORM_BEGIN_DATE,@REDUCED_RTCR_MONITORING,@REDUCED_MONITORING_BEGIN_DATE,@REDUCED_MONITORING_END_DATE,@SEASONAL_STARTUP_SYSTEM)
SET
SUBMISSIONYEARQUARTER = IF(@SUBMISSIONYEARQUARTER = '', NULL, @SUBMISSIONYEARQUARTER),
PWSID = IF(@PWSID = '', NULL, @PWSID),
PWS_NAME = IF(@PWS_NAME = '', NULL, @PWS_NAME),
PRIMACY_AGENCY_CODE = IF(@PRIMACY_AGENCY_CODE = '', NULL, @PRIMACY_AGENCY_CODE),
EPA_REGION = IF(@EPA_REGION = '', NULL, @EPA_REGION),
SEASON_BEGIN_DATE = IF(@SEASON_BEGIN_DATE = '', NULL, @SEASON_BEGIN_DATE),
SEASON_END_DATE = IF(@SEASON_END_DATE = '', NULL, @SEASON_END_DATE),
PWS_ACTIVITY_CODE = IF(@PWS_ACTIVITY_CODE = '', NULL, @PWS_ACTIVITY_CODE),
PWS_DEACTIVATION_DATE = IF(@PWS_DEACTIVATION_DATE = '', NULL, STR_TO_DATE(@PWS_DEACTIVATION_DATE, '%m/%d/%Y')),
# PWS_DEACTIVATION_DATE = IF(@PWS_DEACTIVATION_DATE = '', NULL, @PWS_DEACTIVATION_DATE),
PWS_TYPE_CODE = IF(@PWS_TYPE_CODE = '', NULL, @PWS_TYPE_CODE),
DBPR_SCHEDULE_CAT_CODE = IF(@DBPR_SCHEDULE_CAT_CODE = '', NULL, @DBPR_SCHEDULE_CAT_CODE),
CDS_ID = IF(@CDS_ID = '', NULL, @CDS_ID),
GW_SW_CODE = IF(@GW_SW_CODE = '', NULL, @GW_SW_CODE),
LT2_SCHEDULE_CAT_CODE = IF(@LT2_SCHEDULE_CAT_CODE = '', NULL, @LT2_SCHEDULE_CAT_CODE),
OWNER_TYPE_CODE = IF(@OWNER_TYPE_CODE = '', NULL, @OWNER_TYPE_CODE),
POPULATION_SERVED_COUNT = IF(@POPULATION_SERVED_COUNT = '', NULL, @POPULATION_SERVED_COUNT),
POP_CAT_2_CODE = IF(@POP_CAT_2_CODE = '', NULL, @POP_CAT_2_CODE),
POP_CAT_3_CODE = IF(@POP_CAT_3_CODE = '', NULL, @POP_CAT_3_CODE),
POP_CAT_4_CODE = IF(@POP_CAT_4_CODE = '', NULL, @POP_CAT_4_CODE),
POP_CAT_5_CODE = IF(@POP_CAT_5_CODE = '', NULL, @POP_CAT_5_CODE),
POP_CAT_11_CODE = IF(@POP_CAT_11_CODE = '', NULL, @POP_CAT_11_CODE),
PRIMACY_TYPE = IF(@PRIMACY_TYPE = '', NULL, @PRIMACY_TYPE),
PRIMARY_SOURCE_CODE = IF(@PRIMARY_SOURCE_CODE = '', NULL, @PRIMARY_SOURCE_CODE),
IS_GRANT_ELIGIBLE_IND = IF(@IS_GRANT_ELIGIBLE_IND = '', NULL, @IS_GRANT_ELIGIBLE_IND),
IS_WHOLESALER_IND = IF(@IS_WHOLESALER_IND = '', NULL, @IS_WHOLESALER_IND),
IS_SCHOOL_OR_DAYCARE_IND = IF(@IS_SCHOOL_OR_DAYCARE_IND = '', NULL, @IS_SCHOOL_OR_DAYCARE_IND),
SERVICE_CONNECTIONS_COUNT = IF(@SERVICE_CONNECTIONS_COUNT = '', NULL, @SERVICE_CONNECTIONS_COUNT),
SUBMISSION_STATUS_CODE = IF(@SUBMISSION_STATUS_CODE = '', NULL, @SUBMISSION_STATUS_CODE),
ORG_NAME = IF(@ORG_NAME = '', NULL, @ORG_NAME),
ADMIN_NAME = IF(@ADMIN_NAME = '', NULL, @ADMIN_NAME),
EMAIL_ADDR = IF(@EMAIL_ADDR = '', NULL, @EMAIL_ADDR),
PHONE_NUMBER = IF(@PHONE_NUMBER = '', NULL, @PHONE_NUMBER),
PHONE_EXT_NUMBER = IF(@PHONE_EXT_NUMBER = '', NULL, @PHONE_EXT_NUMBER),
FAX_NUMBER = IF(@FAX_NUMBER = '', NULL, @FAX_NUMBER),
ALT_PHONE_NUMBER = IF(@ALT_PHONE_NUMBER = '', NULL, @ALT_PHONE_NUMBER),
ADDRESS_LINE1 = IF(@ADDRESS_LINE1 = '', NULL, @ADDRESS_LINE1),
ADDRESS_LINE2 = IF(@ADDRESS_LINE2 = '', NULL, @ADDRESS_LINE2),
CITY_NAME = IF(@CITY_NAME = '', NULL, @CITY_NAME),
ZIP_CODE = IF(@ZIP_CODE = '', NULL, @ZIP_CODE),
COUNTRY_CODE = IF(@COUNTRY_CODE = '', NULL, @COUNTRY_CODE),
FIRST_REPORTED_DATE = IF(@FIRST_REPORTED_DATE = '', NULL, STR_TO_DATE(@FIRST_REPORTED_DATE, '%m/%d/%Y')),
# FIRST_REPORTED_DATE = IF(@FIRST_REPORTED_DATE = '', NULL, @FIRST_REPORTED_DATE),
LAST_REPORTED_DATE = IF(@LAST_REPORTED_DATE = '', NULL, STR_TO_DATE(@LAST_REPORTED_DATE, '%m/%d/%Y')),
# LAST_REPORTED_DATE = IF(@LAST_REPORTED_DATE = '', NULL, @LAST_REPORTED_DATE),
STATE_CODE = IF(@STATE_CODE = '', NULL, @STATE_CODE),
SOURCE_WATER_PROTECTION_CODE = IF(@SOURCE_WATER_PROTECTION_CODE = '', NULL, @SOURCE_WATER_PROTECTION_CODE),
SOURCE_PROTECTION_BEGIN_DATE = IF(@SOURCE_PROTECTION_BEGIN_DATE = '', NULL, STR_TO_DATE(@SOURCE_PROTECTION_BEGIN_DATE, '%m/%d/%Y')),
# SOURCE_PROTECTION_BEGIN_DATE = IF(@SOURCE_PROTECTION_BEGIN_DATE = '', NULL, @SOURCE_PROTECTION_BEGIN_DATE),
OUTSTANDING_PERFORMER = IF(@OUTSTANDING_PERFORMER = '', NULL, @OUTSTANDING_PERFORMER),
OUTSTANDING_PERFORM_BEGIN_DATE = IF(@OUTSTANDING_PERFORM_BEGIN_DATE = '', NULL, STR_TO_DATE(@OUTSTANDING_PERFORM_BEGIN_DATE, '%m/%d/%Y')),
# OUTSTANDING_PERFORM_BEGIN_DATE = IF(@OUTSTANDING_PERFORM_BEGIN_DATE = '', NULL, @OUTSTANDING_PERFORM_BEGIN_DATE),
REDUCED_RTCR_MONITORING = IF(@REDUCED_RTCR_MONITORING = '', NULL, @REDUCED_RTCR_MONITORING),
REDUCED_MONITORING_BEGIN_DATE = IF(@REDUCED_MONITORING_BEGIN_DATE = '', NULL, STR_TO_DATE(@REDUCED_MONITORING_BEGIN_DATE, '%m/%d/%Y')),
# REDUCED_MONITORING_BEGIN_DATE = IF(@REDUCED_MONITORING_BEGIN_DATE = '', NULL, @REDUCED_MONITORING_BEGIN_DATE),
REDUCED_MONITORING_END_DATE = IF(@REDUCED_MONITORING_END_DATE = '', NULL, STR_TO_DATE(@REDUCED_MONITORING_END_DATE, '%m/%d/%Y')),
# REDUCED_MONITORING_END_DATE = IF(@REDUCED_MONITORING_END_DATE = '', NULL, @REDUCED_MONITORING_END_DATE),
SEASONAL_STARTUP_SYSTEM = IF(@SEASONAL_STARTUP_SYSTEM = '', NULL, @SEASONAL_STARTUP_SYSTEM);
