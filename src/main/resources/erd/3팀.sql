SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS BOARD_PHOTO_INFO;
DROP TABLE IF EXISTS MATCH_RESULT;
DROP TABLE IF EXISTS MATCH_DEAL_INFO;
DROP TABLE IF EXISTS MATCH_BOARD_INFO;
DROP TABLE IF EXISTS POST_MESSAGE_INFO;
DROP TABLE IF EXISTS POST_MESSAGE_ROOM_INFO;
DROP TABLE IF EXISTS TEAM_SIGN_USER_INFO;
DROP TABLE IF EXISTS TEAM_USER_INFO;
DROP TABLE IF EXISTS TEAM_INFO;
DROP TABLE IF EXISTS USER_INFO;




/* Create Tables */

CREATE TABLE BOARD_PHOTO_INFO
(
	BPI_INFO int NOT NULL AUTO_INCREMENT,
	MB_NUM int NOT NULL,
	BPI_FILE_NAME varchar(300) NOT NULL,
	BPI_FILE_PATH varchar(300) NOT NULL,
	PRIMARY KEY (BPI_INFO)
);


CREATE TABLE MATCH_BOARD_INFO
(
	MB_NUM int NOT NULL AUTO_INCREMENT,
	TA_NUM int NOT NULL,
	MB_ADDRESS varchar(300) NOT NULL,
	MB_ADDRESS_DETAIL varchar(300) NOT NULL,
	MB_MAP_X varchar(100) NOT NULL,
	MB_MAP_Y varchar(100) NOT NULL,
	MB_SIDO varchar(300) NOT NULL,
	MB_SIGUNGU varchar(300) NOT NULL,
	MB_TIME varchar(20) NOT NULL,
	MB_DATE varchar(20) NOT NULL,
	MB_CREDAT char(8) NOT NULL,
	MB_STATUS char(1) DEFAULT '0' NOT NULL,
	MB_DESC varchar(3000),
	MB_PAY int DEFAULT 0 NOT NULL,
	MB_TYPE varchar(20) NOT NULL,
	PRIMARY KEY (MB_NUM)
);


CREATE TABLE MATCH_DEAL_INFO
(
	MD_NUM int NOT NULL AUTO_INCREMENT,
	MB_NUM int NOT NULL,
	TA_HOME_NUM int NOT NULL,
	TA_AWAY_NUM int NOT NULL,
	MD_ADDRESS varchar(30),
	MD_TYPE varchar(30),
	MD_TIME char,
	MD_DATE varchar(30),
	MD_CREDAT char,
	MD_MATCH_STATUS char,
	PRIMARY KEY (MD_NUM)
);


CREATE TABLE MATCH_RESULT
(
	MR_NUM int NOT NULL AUTO_INCREMENT,
	MD_NUM int NOT NULL,
	TA_HOME_NUM int NOT NULL,
	TA_AWAY_NUM int NOT NULL,
	MR_HOME_SCORE varchar(30),
	MR_AWAY_SCORE varchar(30),
	MR_WIN_NUM int,
	MR_LOSE_NUM int,
	MR_HOME_MANNER_POINT int,
	MR_AWAY_MANNER_POINT int,
	MR_REQUEST_STATUS char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (MR_NUM)
);


CREATE TABLE POST_MESSAGE_INFO
(
	PM_NUM int NOT NULL AUTO_INCREMENT,
	PMR_NUM int NOT NULL,
	PM_SEND_NUM int NOT NULL,
	PM_MESSAGE varchar(3000) NOT NULL,
	PM_CREDAT char(8),
	PM_CRETIM char(8),
	PRIMARY KEY (PM_NUM)
);


CREATE TABLE POST_MESSAGE_ROOM_INFO
(
	PMR_NUM int NOT NULL AUTO_INCREMENT,
	PMR_OPPONENT_NUM int NOT NULL,
	PMR_LAST_POST_MESSAGE varchar(3000) NOT NULL,
	PMR_STATUS char(10) NOT NULL,
	TA_NUM int NOT NULL,
	PRIMARY KEY (PMR_NUM)
);


CREATE TABLE TEAM_INFO
(
	TA_NUM int NOT NULL AUTO_INCREMENT,
	UI_NUM int NOT NULL,
	TA_NAME varchar(100) NOT NULL,
	TA_BOUNDARY_SIDO varchar(300) NOT NULL,
	TA_BOUNDARY_SIGUNGU varchar(300) NOT NULL,
	TA_DESC varchar(50),
	TA_MANNER_POINT int(200) DEFAULT 0 NOT NULL,
	TA_STATUS char DEFAULT '1' NOT NULL,
	TA_TYPE varchar(100) NOT NULL,
	TA_MATCH_COUNT int(255) DEFAULT 0 NOT NULL,
	TA_FILE_PATH varchar(300),
	TA_FILE_NAME varchar(300),
	TA_POINT int(255) DEFAULT 0 NOT NULL,
	TA_GENDER char(1) DEFAULT 'A' NOT NULL,
	PRIMARY KEY (TA_NUM),
	UNIQUE (TA_NAME)
);


CREATE TABLE TEAM_SIGN_USER_INFO
(
	TSU_NUM int NOT NULL AUTO_INCREMENT,
	TA_NUM int NOT NULL,
	UI_NUM int NOT NULL,
	TSU_STATUS char(1) DEFAULT '0' NOT NULL,
	PRIMARY KEY (TSU_NUM)
);


CREATE TABLE TEAM_USER_INFO
(
	TU_NUM int NOT NULL AUTO_INCREMENT,
	UI_NUM int NOT NULL,
	TA_NUM int NOT NULL,
	TU_ROLE varchar(30),
	PRIMARY KEY (TU_NUM)
);


CREATE TABLE USER_INFO
(
	UI_NUM int NOT NULL AUTO_INCREMENT,
	UI_ID varchar(30) NOT NULL,
	UI_PWD varchar(30) NOT NULL,
	UI_NAME varchar(30) NOT NULL,
	UI_BIRTH tinyint DEFAULT 0 NOT NULL,
	UI_ADDRESS varchar(200) NOT NULL,
	UI_PHONE_NUM char(11) NOT NULL,
	UI_EMAIL varchar(30) NOT NULL,
	UI_GENDER char(1) DEFAULT '1' NOT NULL,
	UI_CREDAT char(8) NOT NULL,
	UI_CRETIM char(6) NOT NULL,
	PRIMARY KEY (UI_NUM),
	UNIQUE (UI_ID)
);



/* Create Foreign Keys */

ALTER TABLE BOARD_PHOTO_INFO
	ADD FOREIGN KEY (MB_NUM)
	REFERENCES MATCH_BOARD_INFO (MB_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE MATCH_DEAL_INFO
	ADD FOREIGN KEY (MB_NUM)
	REFERENCES MATCH_BOARD_INFO (MB_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE MATCH_RESULT
	ADD FOREIGN KEY (MD_NUM)
	REFERENCES MATCH_DEAL_INFO (MD_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE POST_MESSAGE_INFO
	ADD FOREIGN KEY (PMR_NUM)
	REFERENCES POST_MESSAGE_ROOM_INFO (PMR_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE MATCH_BOARD_INFO
	ADD FOREIGN KEY (TA_NUM)
	REFERENCES TEAM_INFO (TA_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE MATCH_DEAL_INFO
	ADD FOREIGN KEY (TA_AWAY_NUM)
	REFERENCES TEAM_INFO (TA_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE MATCH_DEAL_INFO
	ADD FOREIGN KEY (TA_HOME_NUM)
	REFERENCES TEAM_INFO (TA_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE MATCH_RESULT
	ADD FOREIGN KEY (MR_WIN_NUM)
	REFERENCES TEAM_INFO (TA_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE MATCH_RESULT
	ADD FOREIGN KEY (MR_LOSE_NUM)
	REFERENCES TEAM_INFO (TA_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE MATCH_RESULT
	ADD FOREIGN KEY (TA_HOME_NUM)
	REFERENCES TEAM_INFO (TA_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE MATCH_RESULT
	ADD FOREIGN KEY (TA_AWAY_NUM)
	REFERENCES TEAM_INFO (TA_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE POST_MESSAGE_INFO
	ADD FOREIGN KEY (PM_SEND_NUM)
	REFERENCES TEAM_INFO (TA_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE POST_MESSAGE_ROOM_INFO
	ADD FOREIGN KEY (TA_NUM)
	REFERENCES TEAM_INFO (TA_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE POST_MESSAGE_ROOM_INFO
	ADD FOREIGN KEY (PMR_OPPONENT_NUM)
	REFERENCES TEAM_INFO (TA_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE TEAM_SIGN_USER_INFO
	ADD FOREIGN KEY (TA_NUM)
	REFERENCES TEAM_INFO (TA_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE TEAM_USER_INFO
	ADD FOREIGN KEY (TA_NUM)
	REFERENCES TEAM_INFO (TA_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE TEAM_INFO
	ADD FOREIGN KEY (UI_NUM)
	REFERENCES USER_INFO (UI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE TEAM_SIGN_USER_INFO
	ADD FOREIGN KEY (UI_NUM)
	REFERENCES USER_INFO (UI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE TEAM_USER_INFO
	ADD FOREIGN KEY (UI_NUM)
	REFERENCES USER_INFO (UI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



