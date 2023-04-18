-- 1정보관리팀
CREATE TABLE INFO(
ID VARCHAR2(10) PRIMARY KEY, --사번
DEPTN NUMBER NOT NULL,  -- 부서명
NAME VARCHAR2(20) NOT NULL, -- 팀원이름
PASS VARCHAR2(20) DEFAULT 0000 NOT NULL, --사용자 비밀번호(디폴트 값 :0000)
GRADE NUMBER NOT NULL, --권한(0:팀장 1:팀원 9:퇴사자)
in_d DATE DEFAULT SYSDATE NOT NULL,--입사일
out_d DATE,--퇴사일
bday DATE, -- 생년월일
pnum NUMBER,-- 연락처 
ad VARCHAR2(50), -- 주소
dayoff DATE --연차사용날
);

DROP TABLE INFO;

-- 2-1경영관리
CREATE TABLE BM(--BUSINESS MANAGEMENT
ID VARCHAR2(10) PRIMARY KEY, --사번
DEPTN NUMBER NOT NULL,  -- 부서명
NAME VARCHAR2(20) NOT NULL, -- 팀원이름
sal NUMBER NOT NULL, -- 연봉
work_d NUMBER NOT NULL  -- 근무일수
);

-- 2-2경영(근태관리)
CREATE TABLE AM(--Attendance Management
off_count NUMBER NOT NULL, -- 남은 연차횟수
dayoff DATE, -- 연차사용날
work_d NUMBER NOT NULL, -- 근무일수
start_t TIMESTAMP, -- 출근 시간
end_t TIMESTAMP --퇴근 시간
);

-- 3-1업무팀(개인)
CREATE TABLE MEMBER(
ID VARCHAR2(10) PRIMARY KEY, --사번
DEPTN NUMBER NOT NULL,  -- 부서명
NAME VARCHAR2(20) NOT NULL, -- 팀원이름
PASS VARCHAR2(20) DEFAULT 0000 NOT NULL, --사용자 비밀번호(디폴트 값 :0000)
GRADE NUMBER NOT NULL, --권한(0:팀장 1:팀원 9:퇴사자)
in_d DATE DEFAULT SYSDATE NOT NULL,--입사일
out_d DATE,--퇴사일
bday DATE, -- 생년월일
pnum NUMBER,-- 연락처 
ad VARCHAR2(50), -- 주소
work_d NUMBER NOT NULL,-- 근무일수
sal NUMBER NOT NULL, -- 연봉
dayoff DATE, -- 연차사용날
off_count NUMBER NOT NULL -- 남은 연차횟수
);

DROP TABLE MEMBER;

-- 3-2업무팀(결재[조직도]관리)
CREATE TABLE PM( --PAYMENT MANAGEMENT
ID VARCHAR2(10) PRIMARY KEY, --사번
DEPTN NUMBER NOT NULL,  -- 부서명
NAME VARCHAR2(20) NOT NULL, -- 팀원이름
GRADE NUMBER NOT NULL, --권한(0:팀장 1:팀원 9:퇴사자)
pnum NUMBER,-- 연락처
cf VARCHAR2(3000),--결재요청함
cf_ok VARCHAR2(3000),-- 결재승인함
cf_no VARCHAR2(3000), -- 결재반려함
cf_w VARCHAR2(3000) -- 결재대기함 (요청함과 대기함이 애매함 둘중하나를 없애는게 맞나고 생각함)
);

--  ============================================================= 
-- 각종 더미 데이터
-- 팀원
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO INFO (ID, DEPTN,  GRADE, in_d)
    VALUES ('ID'||i, i, 'Name'||i, SYSDATE-i);
  END LOOP;
  COMMIT;
END;