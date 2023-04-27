CREATE TABLE FILEBOARD(
IDX NUMBER NOT NULL,
NAME VARCHAR(50) NOT NULL,
TITLE VARCHAR(200) NOT NULL,
CONTENT VARCHAR(2000) NOT NULL,
POSTDATE DATE DEFAULT SYSDATE NOT NULL,
OFILE VARCHAR2(200),
NFILE VARCHAR2(100),
DOWNCOUNT NUMBER(5,0) NOT NULL,
VISITCOUNT NUMBER NOT NULL,
PASS VARCHAR2(50) NOT NULL
);

DROP TABLE FILEBOARD;

ALTER TABLE FILEBOARD MODIFY DOWNCOUNT DEFAULT 0;
ALTER TABLE FILEBOARD MODIFY VISITCOUNT DEFAULT 0;

INSERT INTO FILEBOARD (IDX,NAME,TITLE,CONTENT,PASS)
VALUES (SEQ_BOARD_NUM.NEXTVAL,  '������', '�ڷ�Խ���' , '���̳���1', '1234');
INSERT INTO FILEBOARD (IDX,NAME,TITLE,CONTENT,PASS)
VALUES (SEQ_BOARD_NUM.NEXTVAL,  '�̼���', '�ڷ�Խ���' , '���̳���2', '1234');
INSERT INTO FILEBOARD (IDX,NAME,TITLE,CONTENT,PASS)
VALUES (SEQ_BOARD_NUM.NEXTVAL,  '���ν�Ÿ��', '�ڷ�Խ���' , '���̳���3', '1234');
INSERT INTO FILEBOARD (IDX,NAME,TITLE,CONTENT,PASS)
VALUES (SEQ_BOARD_NUM.NEXTVAL,  '����', '�ڷ�Խ���5' , '���̳���4', '1234');
commit;

SELECT COUNT(*)
FROM FILEBOARD
WHERE TITLE LIKE '%�ڷ�%';

insert into fileboard(idx,name,itle,content,ofile,nfile,pass)
values (seq_board_num.nextval, ?, ?, ?, ? ,?,?);

update fileboard set visitcount = visitcount+1
where idx=?;

CREATE TABLE ACCOUNTS(
ID VARCHAR2(10) PRIMARY KEY, 
pw VARCHAR2(20) 
);
INSERT INTO ACCOUNTS VALUES('sultan','pizza');
INSERT INTO ACCOUNTS VALUES('sisisi','1234');
INSERT INTO ACCOUNTS VALUES('sksksk','asdf');
INSERT INTO ACCOUNTS VALUES('<p>d</p>','<h1>d</h1>');
commit;


select * from accounts;

CREATE TABLE BASIC_BBS(
ID number(4) PRIMARY KEY, 
writer VARCHAR2(30),
title varchar2(100),
content varchar2(1000)
);

drop sequence basic_bbs_seq;
CREATE SEQUENCE basic_bbs_seq
MINVALUE 1000
NOMAXVALUE
INCREMENT BY 1 
START WITH 1000
NOCACHE
NOORDER  
NOCYCLE ;

insert into basic_bbs values(basic_bbs_seq.nextval,'<h2>����</h2>','<h1 style="color:red">����</h1>','�װ� ����.');
insert into basic_bbs values(basic_bbs_seq.nextval,'<h1>��</h1>','���ϳ�','�װ� ����.');
insert into basic_bbs values(basic_bbs_seq.nextval,'<mark>��</makr>','���ϳ�','�װ� ����.');

CREATE TABLE USER_LIST(
NAME VARCHAR2(30) PRIMARY KEY,
PASSWORD VARCHAR2(100),
AUTHORITY VARCHAR2(30),
ENABLED NUMBER(1,10)
);

--��ȣȭ�� ����� �־ �Է��ؾ���
insert into user_list values('user','','ROLE_USER',1);
insert into user_list values('admin','','ROLE_ADMIN',1);