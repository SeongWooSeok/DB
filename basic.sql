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
