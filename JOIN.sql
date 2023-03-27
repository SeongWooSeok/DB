--JOIN
--CARTESIAN PRODUCT 카티션 곱 , 상호조인
SELECT *
FROM EMP A CROSS JOIN DEPT B;

--INNER JOIN
SELECT E.EMPNO, E.ENAME, E.JOB, D.DNAME
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO=D.DEPTNO
WHERE E.JOB='CLERK';

SELECT E.EMPNO, E.ENAME, E.JOB, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND E.JOB='CLERK';

--FULL OUTER JOIN
SELECT E.*, D.*
FROM EMP E FULL OUTER JOIN DEPT D
ON E. DEPTNO=D.DEPTNO;

--LEFT OUTER JOIN
SELECT E.*, D.*
FROM EMP E LEFT OUTER JOIN DEPT D
ON E.DEPTNO=D.DEPTNO;
--WHERE E.DEPTNO IS NULL;
SELECT E.*, D.*
FROM EMP E ,DEPT D
WHERE E.DEPTNO=D.DEPTNO(+);

--RIGHT OUTER JOIN
SELECT E.*, D.*
FROM EMP E RIGHT OUTER JOIN DEPT D
ON E.DEPTNO=D.DEPTNO;

SELECT E.*, D.*
FROM EMP E ,DEPT D
WHERE E.DEPTNO(+)=D.DEPTNO;

--SELF JOIN
SELECT A.EMPNO, A.ENAME, A.JOB, A.MGR
    ,D.DEPTNO, D.DNAME
    ,B.EMPNO,B.ENAME,B.JOB
FROM EMP A, EMP B, DEPT D
WHERE A.DEPTNO=D.DEPTNO AND A.MGR=B.EMPNO(+);

/*SUB QUERY
    SELECT / FROM / WHERE
*/
--SELECT 
SELECT E.ENAME
    , (SELECT D.DNAME
        FROM DEPT D
        WHERE D.DEPTNO=E.DEPTNO) AS DEPTNAME
FROM EMP E 
WHERE E.JOB='MANAGER';

--FROM INLINE VIEW 결과 반드시 하나의 테이블로 리턴
SELECT EMP_NAME, SALARY
FROM(
    SELECT E.ENAME AS EMP_NAME  ,E.SAL AS SALARY
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    AND D.DNAME='SALES'
    )
WHERE SALARY BETWEEN 1000 AND 2000;

--WHERE 행과 무관하게 단일 컬럼으로 리턴
SELECT * FROM DEPT D
WHERE D.DEPTNO IN(SELECT E.DEPTNO FROM EMP E WHERE E.SAL>2000);

SELECT ENAME, SAL FROM EMP
WHERE SAL>(SELECT AVG(SAL) FROM EMP);
    
SELECT ENAME, SAL FROM EMP
WHERE SAL>ALL(SELECT SAL FROM EMP WHERE DEPTNO=30);

SELECT ENAME, SAL FROM EMP
WHERE SAL>ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);

SELECT D.DNAME FROM DEPT D
WHERE EXISTS(SELECT E.ENAME FROM EMP E
                                WHERE E.DEPTNO=D.DEPTNO
                                AND E.SAL>3000);
                                
SELECT D.DNAME FROM DEPT D
WHERE NOT EXISTS(SELECT E.ENAME FROM EMP E
                                WHERE E.DEPTNO=D.DEPTNO
                                AND E.SAL>3000);

--Q1 부서코드 부서이름 사원번호 사원명 봉급
-- 사원의 봉급이 2000초과인 사원만 
SELECT D.DEPTNO , D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E
INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO
WHERE E.SAL>2000;
    
--Q2 부서별
--부서코드 부서명 급여평균 최대급여 최소급여 부서인원수
SELECT D.DEPTNO, D.DNAME, TRUNC(AVG(E.SAL)), MAX(E.SAL), MIN(E.SAL),COUNT(*)
FROM EMP E
INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO
GROUP BY D.DEPTNO , D.DNAME ;
    
--Q3 부서별 고용인의 정보 
--부서코드 부서명 사원번호 이름 직급 봉급
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E
INNER JOIN DEPT D ON E.DEPTNO=D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
ORDER BY D.DEPTNO DESC, D.DEPTNO ASC;
    
--Q4 부서별 
--부서코드 부서명 사번 사원명 관리자사번 봉급
--해당 사원의 급여등급 등급최저급여 등급최고급여
SELECT D.DEPTNO,D.DNAME,E.EMPNO,E.MGR,E.SAL,S.GRADE, S.LOSAL, S.HISAL
FROM EMP E
JOIN DEPT D ON E.DEPTNO=D.DEPTNO
     JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
ORDER BY GRADE DESC;
--위에 ORDER BY는 GRADE DESC를 기준으로 JOB ASC를 한다.

--표준 방식
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.MGR,
                E2.ENAME AS MGR_ENAME, E.SAL, S.GRADE, S.LOSAL, S.HISAL
FROM EMP E
RIGHT OUTER JOIN DEPT D ON E.DEPTNO=D.DEPTNO
JOIN SALGRADE S ON E.SAL >=S.LOSAL AND E.SAL <=S.HISAL
LEFT JOIN EMP E2 ON E.MGR =E2.EMPNO
ORDER BY D.DEPTNO, E.EMPNO;

--오라클 방식
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.MGR,
                E2.ENAME AS MGR_ENAME, E.SAL, S.GRADE, S.LOSAL, S.HISAL
FROM EMP E, DEPT D, SALGRADE S, EMP E2
WHERE E.DEPTNO(+) =D.DEPTNO
AND E.SAL >=S.LOSAL(+) AND E.SAL <=S.HISAL(+)
AND E.MGR=E2.EMPNO(+)
ORDER BY D.DEPTNO, E.EMPNO;

SELECT R1.DEPTNO, R1.DNAME, R1.EMPNO, R1.ENAME, R1.MGR      
                , R1.MGR_NAME, R1.SAL, S.GRADE, S.LOSAL , S.HISAL
FROM 
(
SELECT R0.DEPTNO, R0.DNAME, R0.EMPNO, R0.ENAME, R0.MGR,
                E1.ENAME AS MGR_NAME, R0.SAL
FROM 
 (
     SELECT D0.DEPTNO, D0.DNAME, E0.EMPNO, E0.ENAME, E0.MGR, E0.SAL
     FROM DEPT D0
     LEFT OUTER JOIN EMP E0 ON D0.DEPTNO=E0.DEPTNO
     ORDER BY D0.DEPTNO, E0.ENAME
 ) R0
 LEFT OUTER JOIN EMP E1 ON R0.MGR=E1.EMPNO
 ) R1
LEFT OUTER JOIN SALGRADE S ON (R1.SAL BETWEEN S.LOSAL AND S.HISAL)
ORDER BY R1.DEPTNO, R1.EMPNO
 ;
 
 /*
 VIEW
    WITH
    별칭 AS SELECT ...
    
    SELECT
    FROM 별칭
 */
 
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM ( SELECT * FROM EMP WHERE DEPTNO=10) E10, (SELECT * FROM DEPT) D
WHERE E10.DEPTNO=D.DEPTNO;    

WITH 
E10 AS(SELECT * FROM EMP WHERE DEPTNO=10),
D AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO=D.DEPTNO;

--Q1 ALLEN 사원의 직급과 동일한 사원들의  
--직급 사번 사원명 봉급 부서코드 부서명
--A AS(SELECT JOB FROM EMP WHERE ENAME=ALLEN)
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND E.JOB = (SELECT E1.JOB FROM EMP E1 WHERE E1.ENAME='ALLEN');

--Q2 전체 평균 급여보다 많이 받는 사원의
-- 사번 사원명 입사일(YYYY-MM-DD) 부서명 부서위치 급여 급여등급
SELECT E.EMPNO, E.ENAME, TO_CHAR(E.HIREDATE, 'YYYY-MM-DD') HIREDATE
               , D.DNAME, D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO=D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL
AND E.SAL>(SELECT AVG(SAL) FROM EMP)
ORDER BY E.SAL DESC, E.ENAME;

--Q3 10번 부서의 인원중 30번 부서에 없는 직급을 가진 직원의
--사번 사원명 직급 부서코드 부서명 부서위치
SELECT E.EMPNO, E.ENAME, E.JOB, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO 
AND E.DEPTNO=10
AND NOT E.JOB IN(SELECT DISTINCT E.JOB FROM EMP E WHERE E.DEPTNO=30);
--AND E.JOB <> ALL(...)
--Q4 SALESMAN의 최대급여보다 많이 급여를 받는 사람들의 
--사번 사원명 급여 급여등급
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO=D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL
AND (SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN')< E.SAL; 










    
    
    