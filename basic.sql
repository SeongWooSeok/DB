/*
CREATE TABLE TABLE_NAME(
    COLUMN_NAME DATA_TYPE(LENGTH)
    ....
    );
)
*/
DROP TABLE EMP_DDL;

CREATE TABLE EMP_DDL(
EMPNO NUMBER(4),
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR NUMBER(4),
HIREADATE DATE,
SAL NUMBER(7,2),
COMM NUMBER(7,2),
DEPTNO NUMBER(2)
);
DESC EMP_DDL;

CREATE TABLE DEPT_DDL
AS SELECT * FROM DEPT;
DESC DEPT_DDL;

CREATE TABLE SALGRADE_DDL
AS SELECT * FROM SALGRADE;
--as 별칭과는 다르게 위 as는 그냥 복사하는 구문
DESC SALGRADE_DDL;

/* ALTER TABLE TABLE_NAME
    1.ADD COLNAME DATATYPE;
    2.DROP COLNAME;
    3.MODIFY COLNAME DATATYPE;
    4.RENAME COLUMN OLD_COLNAME TO NEW _COLNAME;
*/

ALTER TABLE SALGRADE_DDL
ADD PARTY VARCHAR2(20);

ALTER TABLE SALGRADE_DDL
RENAME COLUMN PARTY TO HOME;
DESC SALGRADE_DDL;

ALTER TABLE SALGRADE_DDL
DROP COLUMN HOME;
DESC SALGRADE_DDL;

RENAME SALGRADE_DDL TO SALZIP;

DESC SALZIP;
SELECT * FROM SALZIP;

TRUNCATE TABLE SALZIP;
DROP TABLE SALZIP;

/*
COMMENT ON TABLE <TABLE_NAME> IS <COMMENT>;
COMMENT ON COLUMN <TABLE_NAME>.<COLNAME> IS < COMMENT>; 
*/

COMMENT ON TABLE DEPT_DDL IS 'DDL연습테이블';
COMMENT ON COLUMN DEPT_DDL.LOC IS '부서위치';

/*
CONSTRAINT
NOT NULL/ UNIQUE/ PRIMARY KEY/ FOREIGN KEY/ CHECK / DEFAULT
*/

/*SELECT name AS 이름, age AS 나이
FROM people
WHERE name = "철수";
*/
DROP TABLE PERSONS;
DROP TABLE PERSONS2;

CREATE TABLE PERSONS2(
    ID VARCHAR(4),
    NAME VARCHAR(20),
    AGE VARCHAR(100),
    ADDR VARCHAR2(100) DEFAULT 'SEOUL',
    BDAY DATE DEFAULT SYSDATE,
    CONSTRAINT PK_PERSON2 PRIMARY KEY(ID),
    CONSTRAINT UN_PERSON2 UNIQUE(NAME),
    CONSTRAINT CHK_PERSON2 CHECK(AGE>=18)
);
ALTER TABLE PERSONS2
MODIFY ADDR DEFAULT 'PARIS';

ALTER TABLE PERSONS2
DROP CONSTRAINT CHK_PERSON2;
ALTER TABLE PERSONS2
ADD CONSTRAINT CHK_P2 CHECK(AGE>50);

CREATE TABLE PLAYS(
    PLAY_ID NUMBER(10) PRIMARY KEY,
    PLAY_RESULT VARCHAR2(100),
    PERSONS_ID VARCHAR2(4),
    CONSTRAINT FK_PLAYS FOREIGN KEY(PERSONS_ID)
    REFERENCES PERSONS2(ID) ON DELETE CASCADE
);
--ON DELETE SET NULL

CREATE TABLE PKTABLE(
    PKVAL VARCHAR2(10),
    CONSTRAINT PK_KEY PRIMARY KEY(PKVAL)
);
CREATE TABLE FKTABLE(
    PKVAL VARCHAR2(10),
    FKVAL VARCHAR2(10)
);

ALTER TABLE FKTABLE
ADD CONSTRAINT FK_KEY FOREIGN KEY(FKVAL) REFERENCES PKTABEL(PKVAL)
ON DELETE CASCADE;

ALTER TABLE FKTABLE
ADD CONSTRAINT FKT_PK_KEY PRIMARY KEY(PKVAL);

INSERT INTO PKTABLE VALUES('PK1');
INSERT INTO PKTABLE VALUES('PK2');
INSERT INTO PKTABLE VALUES('PK3');
SELECT * FROM PKTABLE;

INSERT INTO FKTABLE VALUES('PK1-VAL1','PK1');
INSERT INTO FKTABLE VALUES('PK1-VAL2','PK1');
INSERT INTO FKTABLE VALUES('PK1-VAL1','PK2');
INSERT INTO FKTABLE VALUES('PK1-VAL2','PK2');
INSERT INTO FKTABLE VALUES('PK1-VAL1','PK3');
INSERT INTO FKTABLE VALUES('PK1-VAL2','PK3');

DELETE FROM PKTABLE WHERE PKVAL='PK1';
SELECT * FROM PKTABLE;
SELECT * FROM FKTABLE;

--Q1 EMP_HW TABLE생성
CREATE TABLE EMP_HW(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE DEFAULT SYSDATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
);

ALTER TABLE EMP_HW
ADD CONSTRAINT S_PK_EMP PRIMARY KEY(EMPNO)
ADD CONSTRAINT S_FK_DEPTNO FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO)
ON DELETE CASCADE;

-- Q2 EMP_HW 컬럼 BIGO 추가 VARCHAR2(20)
ALTER TABLE EMP_HW ADD BIGO VARCHAR2(20);
-- Q3 BIGO 컬럼의 타입 VARCHAR2(40)
ALTER TABLE EMP_HW MODIFY BIGO VARCHAR2(40);
-- Q4 BIGO 컬럼의 이름을 REMARK로 변경
ALTER TABLE EMP_HW RENAME BIGO TO REMARK;
-- Q5 EMP_HW 테이블 삭제
DROP TABLE EMP_HW;




























