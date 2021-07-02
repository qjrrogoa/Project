CREATE TABLE MEMBER
(
	id varchar2(50) PRIMARY KEY,
	pwd varchar2(10) NOT NULL,
	name nvarchar2(10) NOT NULL
);

CREATE TABLE REVIEW
(
	rvNo number PRIMARY KEY,
	id varchar2(50) references MEMBER(id) on delete cascade,
	rvTitle nvarchar2(20) NOT NULL,
	rvCtt clob,
	rvLikeCnt number DEFAULT 0,
	rvLat number,
	rvLng number
);


CREATE TABLE STAMP
(
	stNo number PRIMARY KEY,
	id varchar2(50) references MEMBER(id) on delete cascade,
	rvNo number references REVIEW(rvNo) on delete cascade,
	stDate date DEFAULT SYSDATE
);

CREATE TABLE RVLIKE
(
	id varchar2(50) references MEMBER(id) on delete cascade,
	rvNo number references REVIEW(rvNo) on delete cascade
);

CREATE TABLE FOLLOW
(
	followNo number PRIMARY KEY,
	follwerid varchar2(50) references MEMBER(id) on delete cascade,
	followId varchar2(50) references MEMBER(id) on delete cascade
);


CREATE SEQUENCE SEQ_REVIEW
nocache
nocycle;

CREATE SEQUENCE SEQ_FOLLOW
nocache
nocycle;

CREATE SEQUENCE SEQ_RVLIKE
nocache
nocycle;

CREATE SEQUENCE SEQ_STAMP
nocache
nocycle;


/* Drop Tables 

DROP TABLE ACHLIST CASCADE CONSTRAINTS;
DROP TABLE BADGELIST CASCADE CONSTRAINTS;
DROP TABLE DM CASCADE CONSTRAINTS;
DROP TABLE FAVORITE CASCADE CONSTRAINTS;
DROP TABLE FBCMNT CASCADE CONSTRAINTS;
DROP TABLE FBLIKE CASCADE CONSTRAINTS;
DROP TABLE FOLLOW CASCADE CONSTRAINTS;
DROP TABLE FREEBOARD CASCADE CONSTRAINTS;
DROP TABLE PROFILE CASCADE CONSTRAINTS;
DROP TABLE RVCMNT CASCADE CONSTRAINTS;
DROP TABLE RVLIKE CASCADE CONSTRAINTS;
DROP TABLE STAMP CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;

*/


/* Create Tables

CREATE TABLE ACHLIST
(
	achId nvarchar2(20) PRIMARY KEY ,
	id varchar2(50) references MEMBER(id) on delete cascade,
	achDate date DEFAULT SYSDATE
);


CREATE TABLE BADGELIST
(
	bgId nvarchar2(20) PRIMARY KEY,
	id varchar2(50) references MEMBER(id) on delete cascade,
	bgDate date DEFAULT SYSDATE
);


CREATE TABLE DM
(
	dmNo number PRIMARY KEY,
	id varchar2(50) references MEMBER(id) on delete cascade,
	dmToId varchar2(50) references MEMBER(id) on delete cascade,
	dmCnt nvarchar2(100),
	dmDate date DEFAULT SYSDATE,
	dmChecked number DEFAULT 1
);


CREATE TABLE FAVORITE
(
	favoriteNo number PRIMARY KEY ,
	id varchar2(50) references MEMBER(id) on delete cascade,
	rvNo number references REVIEW(rvNo) on delete cascade,
	FavoriteRegiDate date DEFAULT SYSDATE
);


CREATE TABLE FBCMNT
(
	fbcNo number PRIMARY KEY,
	id varchar2(50) references MEMBER(id) on delete cascade,
	fbNo number references FREEBOARD(fbNo) on delete cascade,
	fbCmnt clob,
	fbcDate date DEFAULT SYSDATE
);


CREATE TABLE FBLIKE
(
	fblNo number PRIMARY KEY,
	id varchar2(50) references MEMBER(id) on delete cascade,
	fbNo number references FREEBOARD(fbNo) on delete cascade,
	fblDate date DEFAULT SYSDATE
);


CREATE TABLE FOLLOW
(
	followNo number PRIMARY KEY,
	follwerid varchar2(50) references MEMBER(id) on delete cascade,
	followId varchar2(50) references MEMBER(id) on delete cascade
);


CREATE TABLE FREEBOARD
(
	fbNo number PRIMARY KEY,
	id varchar2(50) references MEMBER(id) on delete cascade,
	fbTitle nvarchar2(20),
	fbCtt clob,
	fbDate date DEFAULT SYSDATE,
	fbVisitCnt number DEFAULT 0,
	fbCategory nvarchar2(8),
	fbLikeCnt number DEFAULT 0
);


CREATE TABLE MEMBER
(
	id varchar2(50) PRIMARY KEY,
	pwd varchar2(10) NOT NULL,
	name nvarchar2(10) NOT NULL,
	regiDate date DEFAULT SYSDATE,
	gender nvarchar2(8),
	mail nvarchar2(100),
	phone nvarchar2(15),
	birth nvarchar2(15)
);


CREATE TABLE PROFILE
(
	id varchar2(50) references MEMBER(id) on delete cascade,
	nickname nvarchar2(15) UNIQUE,
	trvPrpns nvarchar2(20),
	exp number DEFAULT 0,
	level number DEFAULT 0,
	pr nvarchar2(100),
	openPrf number DEFAULT 1,
	prfImage clob
);


CREATE TABLE REVIEW
(
	rvNo number PRIMARY KEY,
	id varchar2(50) references MEMBER(id) on delete cascade,
	rvTitle nvarchar2(20) NOT NULL,
	rvCtt clob,
	rvLikeCnt number DEFAULT 0,
	rvDate date DEFAULT SYSDATE,
	rvCategory1 nvarchar2(20),
	rvCategory2 nvarchar2(20),
	rvLat number,
	rvLng number,
	rvVisitCnt number DEFAULT 0,
	rvFile clob,
	rvLikeCheck number DEFAULT 0
);


CREATE TABLE RVCMNT
(
	rvcNo number PRIMARY KEY,
	id varchar2(50) references MEMBER(id) on delete cascade,
	rvNo number references REVIEW(rvNo) on delete cascade,
	rvCmnt clob,
	rvcDate date DEFAULT SYSDATE
);


CREATE TABLE RVLIKE
(
	rvlNo number PRIMARY KEY,
	id varchar2(50) references MEMBER(id) on delete cascade,
	rvNo number references REVIEW(rvNo) on delete cascade,
	rvDate date DEFAULT SYSDATE
);


CREATE TABLE STAMP
(
	stNo number PRIMARY KEY,
	id varchar2(50) references MEMBER(id) on delete cascade,
	rvNo number references REVIEW(rvNo) on delete cascade,
	stDate date DEFAULT SYSDATE,
	stIsExpired number DEFAULT 1
);




ALTER TABLE FBCMNT
	ADD FOREIGN KEY (fbNo)
	REFERENCES FREEBOARD (fbNo)
;


ALTER TABLE FBLIKE
	ADD FOREIGN KEY (fbNo)
	REFERENCES FREEBOARD (fbNo)
;


ALTER TABLE ACHLIST
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE BADGELIST
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE DM
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE DM
	ADD FOREIGN KEY (dmToId)
	REFERENCES MEMBER (id)
;


ALTER TABLE FAVORITE
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE FBCMNT
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE FBLIKE
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE FOLLOW
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE FOLLOW
	ADD FOREIGN KEY (followId)
	REFERENCES MEMBER (id)
;


ALTER TABLE FREEBOARD
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE PROFILE
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE RVCMNT
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE RVLIKE
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE STAMP
	ADD FOREIGN KEY (id)
	REFERENCES MEMBER (id)
;


ALTER TABLE FAVORITE
	ADD FOREIGN KEY (rvNo)
	REFERENCES REVIEW (rvNo)
;


ALTER TABLE RVCMNT
	ADD FOREIGN KEY (rvNo)
	REFERENCES REVIEW (rvNo)
;


ALTER TABLE RVLIKE
	ADD FOREIGN KEY (rvNo)
	REFERENCES REVIEW (rvNo)
;


ALTER TABLE STAMP
	ADD FOREIGN KEY (rvNo)
	REFERENCES REVIEW (rvNo)
;

CREATE SEQUENCE SEQ_REVIEW
nocache
nocycle;

CREATE SEQUENCE SEQ_FBCMNT
nocache
nocycle;

CREATE SEQUENCE SEQ_FREEBOARD
nocache
nocycle;

CREATE SEQUENCE SEQ_BADGELIST
nocache
nocycle;

CREATE SEQUENCE SEQ_DM
nocache
nocycle;

CREATE SEQUENCE SEQ_ACHLIST
nocache
nocycle;

CREATE SEQUENCE SEQ_FOLLOW
nocache
nocycle;

CREATE SEQUENCE SEQ_RVLIKE
nocache
nocycle;

CREATE SEQUENCE SEQ_FAVORITE
nocache
nocycle;

CREATE SEQUENCE SEQ_RVCMNT
nocache
nocycle;

CREATE SEQUENCE SEQ_STAMP
nocache
nocycle;
 */
