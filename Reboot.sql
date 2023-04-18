-- 1����������
CREATE TABLE INFO(
ID VARCHAR2(10) PRIMARY KEY, --���
DEPTN NUMBER NOT NULL,  -- �μ���
NAME VARCHAR2(20) NOT NULL, -- �����̸�
PASS VARCHAR2(20) DEFAULT 0000 NOT NULL, --����� ��й�ȣ(����Ʈ �� :0000)
GRADE NUMBER NOT NULL, --����(0:���� 1:���� 9:�����)
in_d DATE DEFAULT SYSDATE NOT NULL,--�Ի���
out_d DATE,--�����
bday DATE, -- �������
pnum NUMBER,-- ����ó 
ad VARCHAR2(50), -- �ּ�
dayoff DATE --������볯
);

DROP TABLE INFO;

-- 2-1�濵����
CREATE TABLE BM(--BUSINESS MANAGEMENT
ID VARCHAR2(10) PRIMARY KEY, --���
DEPTN NUMBER NOT NULL,  -- �μ���
NAME VARCHAR2(20) NOT NULL, -- �����̸�
sal NUMBER NOT NULL, -- ����
work_d NUMBER NOT NULL  -- �ٹ��ϼ�
);

-- 2-2�濵(���°���)
CREATE TABLE AM(--Attendance Management
off_count NUMBER NOT NULL, -- ���� ����Ƚ��
dayoff DATE, -- ������볯
work_d NUMBER NOT NULL, -- �ٹ��ϼ�
start_t TIMESTAMP, -- ��� �ð�
end_t TIMESTAMP --��� �ð�
);

-- 3-1������(����)
CREATE TABLE MEMBER(
ID VARCHAR2(10) PRIMARY KEY, --���
DEPTN NUMBER NOT NULL,  -- �μ���
NAME VARCHAR2(20) NOT NULL, -- �����̸�
PASS VARCHAR2(20) DEFAULT 0000 NOT NULL, --����� ��й�ȣ(����Ʈ �� :0000)
GRADE NUMBER NOT NULL, --����(0:���� 1:���� 9:�����)
in_d DATE DEFAULT SYSDATE NOT NULL,--�Ի���
out_d DATE,--�����
bday DATE, -- �������
pnum NUMBER,-- ����ó 
ad VARCHAR2(50), -- �ּ�
work_d NUMBER NOT NULL,-- �ٹ��ϼ�
sal NUMBER NOT NULL, -- ����
dayoff DATE, -- ������볯
off_count NUMBER NOT NULL -- ���� ����Ƚ��
);

DROP TABLE MEMBER;

-- 3-2������(����[������]����)
CREATE TABLE PM( --PAYMENT MANAGEMENT
ID VARCHAR2(10) PRIMARY KEY, --���
DEPTN NUMBER NOT NULL,  -- �μ���
NAME VARCHAR2(20) NOT NULL, -- �����̸�
GRADE NUMBER NOT NULL, --����(0:���� 1:���� 9:�����)
pnum NUMBER,-- ����ó
cf VARCHAR2(3000),--�����û��
cf_ok VARCHAR2(3000),-- ���������
cf_no VARCHAR2(3000), -- ����ݷ���
cf_w VARCHAR2(3000) -- �������� (��û�԰� ������� �ָ��� �����ϳ��� ���ִ°� �³��� ������)
);

--  ============================================================= 
-- ���� ���� ������
-- ����
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO INFO (ID, DEPTN,  GRADE, in_d)
    VALUES ('ID'||i, i, 'Name'||i, SYSDATE-i);
  END LOOP;
  COMMIT;
END;