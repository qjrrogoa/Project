
/* Drop Tables 

DROP TABLE NEW_TABLE CASCADE CONSTRAINTS;
DROP TABLE STAMP CASCADE CONSTRAINTS;
DROP TABLE BBS CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;

*/


/* Create Tables */

CREATE TABLE BBS
(
	NO number NOT NULL,
	ID varchar2(30) references member(id),
	TITLE nvarchar2(50) NOT NULL,
	CONTENT nvarchar2(100),
	LIKECOUNT number,
	LAT number,
	LNG number,
	PRIMARY KEY (NO)
);


CREATE TABLE MEMBER
(
	ID varchar2(30) NOT NULL,
	PWD varchar2(10) NOT NULL,
	NAME nvarchar2(10) NOT NULL,
	PRIMARY KEY (ID)
);


CREATE TABLE LIKETO
(
	ID varchar2(10) ,
	NO number references bbs(no) on delete cascade
);


CREATE TABLE STAMP
(
	NO number references bbs(no) on delete cascade,
	LAT number,
	LNG number,
	SNO number,
	STAMPDATE date DEFAULT SYSDATE
);


CREATE SEQUENCE seq_bbs
nocache
nocycle;

CREATE SEQUENCE seq_stamp
nocache
nocycle;


/* Create Foreign Keys 

ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (NO)
	REFERENCES BBS (NO)
;


ALTER TABLE STAMP
	ADD FOREIGN KEY (NO)
	REFERENCES BBS (NO)
;


ALTER TABLE BBS
	ADD FOREIGN KEY (ID)
	REFERENCES MEMBER (ID)
;


ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (ID)
	REFERENCES MEMBER (ID)
;
*/
