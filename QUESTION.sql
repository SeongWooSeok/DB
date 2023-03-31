-- 1. ��� ����� �̸�(FIRST_NAME, LAST_NAME)�� ��ȸ�϶�.
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES;
-- 2. ��� ����� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES;
-- 3. ��� ���� ���� ��ȸ�϶�.
SELECT CITY FROM LOCATIONS;
-- 4. �̸�(FIRST_NAME)�� M ���� �����ϴ� ����� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%M'; 
-- 5. �̸�(FIRST_NAME)�� �� ��° ���ڰ� 'a'�� ����� �̸�(FIRST_NAME)�� ������ ��ȸ�϶�.
SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME LIKE'%_a';
-- 6. ���� ���� �������� �����϶�.
SELECT COUNTRY_NAME FROM COUNTRIES;
-- 7. �μ� ���� �������� �����϶�.
SELECT JOB_TITLE FROM JOBS ORDER BY JOB_TITLE DESC;
-- 8. ������ 7000 �̻��� ������� ��� ������ ������(��������)���� �����϶�.
SELECT * FROM EMPLOYEES WHERE SALARY > 7000;
-- 9. �μ�Ƽ��(COMMISSION_PCT)�� ���� �ʴ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL;
-- 10. �μ�Ƽ��(COMMISSION_PCT)�� �޴� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;
-- 11. 2007�� 06�� 21�Ͽ� �Ի��� ����� �����ȣ, �̸�(FIRST_NAME, LAST_NAME) 
--      �׸��� �μ���ȣ�� ��ȸ�϶�.
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE HIRE_DATE = TO_DATE( '2007-06-21','YYYY-MM-DD');
-- 12. 2006�⿡ �Ի��� ����� �����ȣ�� �Ի����� ��ȸ�϶�.
SELECT EMPLOYEE_ID, HIRE_DATE FROM EMPLOYEES WHERE 
HIRE_DATE >= TO_DATE( '2007-06-21','YYYY-MM-DD') AND HIRE_DATE <= TO_DATE( '2007-06-21','YYYY-MM-DD');
-- 13. �̸�(FIRST_NAME)�� ���̰� 5���� �̻��� ����� ��ȸ�϶�.
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE'_____%';
-- 14. �μ���ȣ�� ������� ��ȸ�϶�. (�μ���ȣ �������� ����)
SELECT DEPARTMENT_ID, COUNT(1) FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID DESC;
-- 15. ���� ���̵� ��� ������ ��ȸ�϶�. (���� ���̵� �������� ����)
SELECT E.JOB_ID, AVG(SALARY) FROM EMPLOYEES E GROUP BY JOB_ID ORDER BY JOB_ID DESC;
-- 16. ��簡 �ִ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL;
-- 17. ��簡 ���� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE MANAGER_ID IS NULL;
-- 18. ��� ������� �����ȣ, �̸�(FIRST_NAME, LAST_NAME), �μ���ȣ 
--   �׸��� �μ����� ��ȸ�϶�.
SELECT E.EMPLOYEE_ID , E.FIRST_NAME, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM EMPLOYEES E , DEPARTMENTS D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;
-- 19. ��� �μ��� �μ���� ���ø��� ��ȸ�϶�.
SELECT D.DEPARTMENT_NAME, L.CITY FROM DEPARTMENTS D, LOCATIONS L;
-- 20. ��� ������� �����ȣ, �μ���, �������� ��ȸ�϶�.
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_NAME, J.JOB_TITLE FROM EMPLOYEES E , DEPARTMENTS D, JOBS J
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND E.JOB_ID = J.JOB_ID;
-- 21. ��� ������� �����ȣ, �μ���, ������, ���ø��� ��ȸ�϶�.
SELECT  E.EMPLOYEE_ID , D.DEPARTMENT_NAME , J.JOB_TITLE , L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.JOB_ID = J.JOB_ID AND D.LOCATION_ID = L.LOCATION_ID;
-- 22. 10��, 20��, 30�� �μ����� �ٹ��ϴ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN (10,20,30);
-- 23. 6�� �̸��� ����� �ٹ��ϴ� �μ��� �̸��� ��ȸ�϶�.
SELECT  D.DEPARTMENT_NAME FROM DEPARTMENTS D
WHERE   D.DEPARTMENT_ID IN (
                                SELECT  E.DEPARTMENT_ID FROM EMPLOYEES E
                                GROUP   BY  E.DEPARTMENT_ID HAVING  COUNT(1) < 6);
-- 24. 4�� �̸��� ����� �ٹ��ϴ� �μ��� ��� ������ �μ����� ��ȸ�϶�.
SELECT AVG(TRUNC(E.SALARY,2)), D.DEPARTMENT_NAME FROM EMPLOYEES E, DEPARTMENTS D
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID 
GROUP BY D.DEPARTMENT_NAME HAVING COUNT(1) <4; 
-- 25. IT �μ��� ���� ������ ��ȸ�϶�.
SELECT SUM(E.SALARY) FROM EMPLOYEES E , DEPARTMENTS D
WHERE D.DEPARTMENT_NAME = 'IT' AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;
-- 26. �����(REGIONS)�� ������ ������ ��ȸ�϶�.
SELECT  R.REGION_NAME , COUNT(1) FROM    COUNTRIES C , REGIONS R, LOCATIONS L
WHERE   L.COUNTRY_ID = C.COUNTRY_ID AND R.REGION_ID = C.REGION_ID
GROUP   BY R.REGION_NAME;
-- 27. ���ø� �� �μ��� ������ ��ȸ�϶�.
SELECT  L.CITY , COUNT(1) FROM    LOCATIONS L, DEPARTMENTS D
WHERE   L.LOCATION_ID = D.LOCATION_ID GROUP   BY L.CITY;
-- 28. �μ��� �������� �ʴ� ���ø� ��ȸ�϶�.
SELECT L.CITY FROM LOCATIONS L WHERE L.LOCATION_ID NOT IN (
    SELECT D.LOCATION_ID FROM DEPARTMENTS D);
-- 29. ����� �������� �ʴ� ������ ��ȸ�϶�.
SELECT COUNTRY_NAME FROM COUNTRIES WHERE COUNTRY_ID NOT IN(
    SELECT L.COUNTRY_ID FROM LOCATIONS L, DEPARTMENTS D, EMPLOYEES E
    WHERE L.LOCATION_ID = D.LOCATION_ID
    AND D.DEPARTMENT_ID = E.DEPARTMENT_ID);
-- 30. 150�� ������� ���� �Ի��� ��� �� ���� �ֽſ� �Ի��� ����� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID=149;
-- 31. ������ ��ȯ�� �̷��� �ִ� ����� ��� ������ ��ȸ�϶�.
SELECT  * FROM EMPLOYEES WHERE EMPLOYEE_ID IN(
     SELECT EMPLOYEE_ID FROM JOB_HISTORY);
-- 32. �μ��� �Ŵ������� �ִ� ����� ��� ������ �μ����� ��ȸ�϶�.
SELECT E.*, D.DEPARTMENT_NAME FROM EMPLOYEES E , DEPARTMENTS D
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID AND E.EMPLOYEE_ID IN
    (SELECT MANAGER_ID FROM DEPARTMENTS WHERE MANAGER_ID IS NOT NULL);
-- 33. �ٸ� ����� ����� ����� ��� ������ ��ȸ�϶�.
SELECT DISTINCT MANAGER.* FROM EMPLOYEES MANAGER , EMPLOYEES E
WHERE MANAGER.EMPLOYEE_ID = E.MANAGER_ID;
-- 34. �̸�(FIRST_NAME)�� C�� �����ϰ� s�� ������ 
--    ����� �μ���, ������, ���ø�, ������, ������� ��ȸ�϶�.
SELECT E.FIRST_NAME, D.DEPARTMENT_NAME, J.JOB_TITLE , L.CITY , C.COUNTRY_NAME , R.REGION_NAME
FROM EMPLOYEES E , DEPARTMENTS D , JOBS J , LOCATIONS L , COUNTRIES C , REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID AND J.JOB_ID = E.JOB_ID
AND D.LOCATION_ID = L.LOCATION_ID AND L.COUNTRY_ID = C.COUNTRY_ID
AND C.REGION_ID = R.REGION_ID AND E.FIRST_NAME LIKE 'C%s';
-- 35. ������ ��ȯ�� �̷��� ���� ����� ��� ������ ��ȸ�϶�.
SELECT  * FROM EMPLOYEES WHERE EMPLOYEE_ID NOT IN(
     SELECT EMPLOYEE_ID FROM JOB_HISTORY);
-- 36. �ڽ��� ��簡 �ڽ� ���� �ʰ� �Ի��� ����� ��� ������ ��ȸ�϶�.
SELECT E.* FROM EMPLOYEES E, EMPLOYEES MANAGER
WHERE E.MANAGER_ID = MANAGER.EMPLOYEE_ID
AND E.HIRE_DATE < MANAGER.HIRE_DATE;
-- 37. 100�� ����� ���� ���� �ΰ� �ִ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM EMPLOYEES WHERE MANAGER_ID=100;
-- 38. 100�� ����� ���� �ΰ� �ִ� ��� ������� ��� ������ ��ȸ�϶�.
--SELECT * FROM EMPLOYEES E , MANAGER M WHERE MANAGER_ID =100 
--AND NOT IN(
--    SELECT EMPLOYEES_ID FROM EMPLOYEES E , MANAGER M
--    WHERE E.MANAGER_ID = MANAGER.EMPLOYEE_ID);
SELECT E.* FROM EMPLOYEES E
START WITH E.MANAGER_ID = 100
CONNECT BY PRIOR E.EMPLOYEE_ID = E.MANAGER_ID;

/*������ ���� : �θ�, �ڽİ��� �������踦 Ʈ�� ���� ���·� �����ִ� ����
START WITH : Ʈ�� ������ �ֻ��� �� ���� 
CONNECT BY : �θ�, �ڽ��� ���踦 ����
PRIOR : CONNECT BY ���� ���Ǹ� PRIOR�� ������ �÷��� ������ �÷� ã�ư�
CONNECT BY PRIOR �ڽ��÷� = �θ��÷� : �θ� -> �ڽ� ������ �ݴ�� �ݴ�
*/

-- 38-1. 112�� ����� ������ ��� ��ȸ�ض�
SELECT E.* FROM EMPLOYEES E
START WITH E.EMPLOYEE_ID =112
CONNECT BY PRIOR E.MANAGER_ID=E.EMPLOYEE_ID;
-- 38-2. 150�� ����� ��� ������ �̸��� �μ����� ��ȸ�϶�
SELECT E.FIRST_NAME, D.DEPARTMENT_NAME FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
START WITH E.EMPLOYEE_ID =150
CONNECT BY PRIOR E.MANAGER_ID = E.EMPLOYEE_ID;
-- 39. ������� ���� ���� ������ �̸��� ��ȸ�϶�.
SELECT  A.CITY
FROM (
            SELECT  L.CITY, COUNT(1)
            FROM    EMPLOYEES E , DEPARTMENTS D, LOCATIONS L
            WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
            AND     L.LOCATION_ID = D.LOCATION_ID 
            GROUP   BY L.CITY
            ORDER   BY COUNT(1) DESC
        ) A
WHERE ROWNUM=1;

-- 40. ������ ������ ���� ���� �μ��� �̸��� ��ȸ�϶�. -- ROWNUM�� ���� �ߺ����� ������� �̾����� ���� �̷���� MAX�� RANK�� �Ẹ��
SELECT A.DEPARTMENT_NAME 
FROM (
            SELECT D.DEPARTMENT_NAME, COUNT(1)
            FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
            WHERE E.JOB_ID = J.JOB_ID AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
            GROUP BY D.DEPARTMENT_NAME
            ORDER BY COUNT(1) DESC
            ) A
WHERE ROWNUM=1;
-- 41. ��� ������ �ִ� ������ �ް� �ִ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM    EMPLOYEES E , JOBS J
WHERE E.JOB_ID = J.JOB_ID AND J.MAX_SALARY = E.SALARY;
-- 42. ��� ������ �ּ� ������ �ް� �ִ� ������� ��� ������ ��ȸ�϶�.
SELECT * FROM    EMPLOYEES E , JOBS J
WHERE E.JOB_ID = J.JOB_ID AND J.MIN_SALARY = E.SALARY;
-- 43. �μ��� ������ �ִ뿬��, �ּҿ���, ������� ��ȸ�϶�.
SELECT MAX(E.SALARY) , MIN(E.SALARY) , COUNT(*)
FROM JOBS J , EMPLOYEES E , DEPARTMENTS D
WHERE  J.JOB_ID = E.JOB_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP   BY  J.JOB_ID , D.DEPARTMENT_ID;
-- 44. ������� ���� ���� ���ÿ��� �ٹ��ϴ� ��� ������� ���� ������ ��ȸ�϶�. \\\\\\\
SELECT SUM(E.SALARY) SUM_SALARY
FROM ( 
            SELECT SUM(SALARY), COUNT(1)
            FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
            WHERE D.LOCATION_ID = L.LOCATION_ID AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
            GROUP BY L.LOCATION_ID
            ORDER BY COUNT(1) DESC
            ), EMPLOYEES E;
-- 45. ������� ���� ���� ���ÿ��� �ٹ��ϴ� ��� ������� �μ��� �� ������ ��� ������ ��ȸ�϶�.

-- 46. �Ի����� ���� ������ ����� ��ȸ�϶�.
SELECT * 
FROM (
            SELECT HIRE_DATE
            FROM EMPLOYEES
            GROUP BY HIRE_DATE
            ORDER BY HIRE_DATE
            )
WHERE ROWNUM =1;
-- 47. �Ի����� ���� �ֱ��� ����� ��ȸ�϶�.
SELECT * 
FROM (
            SELECT HIRE_DATE
            FROM EMPLOYEES
            GROUP BY HIRE_DATE
            ORDER BY HIRE_DATE DESC
            )
WHERE ROWNUM =1;
-- 48. ���� �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� ������ ����� ��ȸ�϶�.

-- 49. ���� �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� �ð����� ����� ��ȸ�϶�.

-- 50. ������ 12000 �̻�Ǵ� �������� LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT E.LAST_NAME, E.SALARY FROM EMPLOYEES E WHERE SALARY>12000; 
-- 51. �����ȣ�� 176 �� ����� LAST_NAME �� �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = 176;
-- 52. ������ 5000 ���� 12000�� ���� �̿��� ������� LAST_NAME �� ������ ��ȸ����.
SELECT LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY BETWEEN 5000 AND 12000;
-- 53. 2000/02/20 �Ϻ��� 2010/05/01 ���̿� ���� ������� LAST_NAME ���, ������ڸ� ��ȸ�Ѵ�.
SELECT HIRE_DATE, LAST_NAME, EMPLOYEE_ID FROM EMPLOYEES 
WHERE HIRE_DATE BETWEEN TO_DATE( '2000-02-20','YYYY-MM-DD') AND TO_DATE( '2010-05-01','YYYY-MM-DD');
-- 54. 20 �� �� 50 �� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� 
--   �μ� ��ȣ�� ���ĺ������� ��ȸ�Ѵ�.
SELECT LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(20,50)
ORDER BY LAST_NAME ASC;
-- 55. 20 �� �� 50 �� �μ��� �ٹ��ϸ�, ������ 5000 ~ 12,000 ������ 
--   ������� LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT LAST_NAME, SALARY FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(20,50) AND SALARY BETWEEN 5000 AND 12000;
-- 56. 2005�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ѵ�.
SELECT LAST_NAME, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE = 2005;
-- 57. �Ŵ����� ���� ������� LAST_NAME �� JOB_ID �� ��ȸ�Ѵ�.
SELECT LAST_NAME, JOB_ID FROM EMPLOYEES WHERE MANAGER_ID IS NULL;
-- 58. �Ŵ����� �ִ� ������� LAST_NAME �� JOB_ID �� ��ȸ�Ѵ�.
SELECT LAST_NAME, JOB_ID FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL;
-- 59. Ŀ�̼��� ���� ��� ������� LAST_ANME, ���� �� Ŀ�̼��� ��ȸ�Ѵ�.
--    ���� ����, Ŀ�̼� �������� �����Ѵ�.
SELECT LAST_NAME, SALARY, COMMISSION_PCT FROM EMPLOYEES ORDER BY SALARY DESC, COMMISSION_PCT ASC;
-- 60. LAST_NAME �� �׹�° ���ڰ� a �� ������� LAST_NAME �� ��ȸ�Ѵ�.
SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE'___a%';
-- 61. LAST_NAME �� a ��(OR) e ���ڰ� �ִ� ������� LAST_NAME �� ��ȸ�Ѵ�.
SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE'%a%' OR LAST_NAME LIKE'%e%';
-- 62. ������ 2,500, 3,500, 7000 �� �ƴϸ� 
-- ������ SA_REP �̳� ST_CLERK �� ������� ��ȸ�Ѵ�.
SELECT * FROM EMPLOYEES WHERE SALARY NOT IN(2500,3500,7000) AND JOB_ID IN('SA_REP', 'ST_CLERK'); 
-- 63.  ������ AD_PRES �� ����� A �����, 
--  ST_MAN �� ����� B �����, IT_PROG �� ����� C �����,
--  SA_REP �� ����� D �����, ST_CLERK �� ����� E ����� 
--  ��Ÿ�� 0 �� �ο��Ͽ� ��ȸ�Ѵ�.
SELECT JOB_ID ,
CASE
WHEN JOB_ID = 'AD_PRES' THEN 'A'
WHEN JOB_ID = 'ST_MAN' THEN 'B'
WHEN JOB_ID = 'IT_PROG' THEN 'C'
WHEN JOB_ID = 'SA_REP' THEN 'D'
WHEN JOB_ID = 'ST_CLERK' THEN 'E'
ELSE '0'
END AS JOB_GRADE
FROM EMPLOYEES;
-- 64. ��� ������� LAST_NAME, �μ� �̸� �� �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, E.DEPARTMENT_ID FROM EMPLOYEES E , DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;
-- 65. �μ���ȣ 30 ���� ��� �������� ������ �������� ��ȸ�Ѵ�. 90 �μ� ���� �����Ѵ�.
SELECT DEPARTMENT_NAME FROM DEPARTMENTS WHERE DEPARTMENT_ID IN (10,20,30,90);
-- 66. Ŀ�̼��� ���� ��� ������� LAST_NAME, �μ� ��, ���� ID �� ���� ���� ��ȸ�Ѵ�.
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, L.COUNTRY_ID, L.CITY FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.COMMISSION_PCT IS NOT NULL AND E.DEPARTMENT_ID(+) = D.DEPARTMENT_ID 
AND D.LOCATION_ID = L.LOCATION_ID;
-- 66-1. �þ�Ʋ�� ��� ��� �� Ŀ�̼��� ���� ��� ������� LAST_NAME, �μ� ��, ���� ID �� ���� ���� ��ȸ�Ѵ�.
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID(+) = D.DEPARTMENT_ID AND D.LOCATION_ID = L.LOCATION_ID AND E.COMMISSION_PCT IS NOT NULL
AND L.CITY='SEATTLE';
-- 67. LAST_NAME �� DAVIES �� ������� �Ŀ� ���� ������� LAST_NAME �� HIRE_DATE �� ��ȸ�Ѵ�.
SELECT E.HIRE_DATE, E.LAST_NAME 
FROM EMPLOYEES E, 
            (SELECT *
            FROM EMPLOYEES
            WHERE LAST_NAME = 'Davies'
            )E1
WHERE E.EMPLOYEE_ID > E1.EMPLOYEE_ID;
-- 68. �ڽ��� �Ŵ������� ���� ���� ������� LAST_NAME �� ������� ��ȸ�Ѵ�.
SELECT E.HIRE_DATE, E.LAST_NAME FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID = M.EMPLOYEE_ID AND E.HIRE_DATE < M.HIRE_DATE;
-- 69. ȸ�� ��ü�� �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ�Ѵ�. TRUNC
SELECT MAX(SALARY) MAX_SALARY, MIN(SALARY) MIN_SALARY, SUM(SALARY) SUM_SALARY,
TRUNC(AVG(SALARY),0) AVG_SALARY FROM EMPLOYEES;
-- 70. �� JOB_ID ��, �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ�Ѵ�.
SELECT JOB_ID ,MAX(SALARY) MAX_SALARY, MIN(SALARY) MIN_SALARY, SUM(SALARY) SUM_SALARY,
TRUNC(AVG(SALARY),0) AVG_SALARY FROM EMPLOYEES GROUP BY JOB_ID ORDER BY JOB_ID;
-- 71. ������ ������ ���� ������� �� ���� ��ȸ�Ѵ�.
SELECT JOB_ID , COUNT(*) FROM EMPLOYEES GROUP BY JOB_ID ORDER BY JOB_ID; 
-- 72. �Ŵ����� �ٹ��ϴ� ������� �� ���� ��ȸ�Ѵ�.
SELECT COUNT(A.MANAGER)
FROM(
            SELECT COUNT(DISTINCT MANAGER_ID) MANAGER 
            FROM EMPLOYEES GROUP BY MANAGER_ID
            )A;
-- 73. �系�� �ִ� ���� �� �ּ� ������ ���̸� ��ȸ�Ѵ�.
--SELECT MIN(SALARY), MAX(SALARY) , (MAX-MIN) AS DIFFER FROM EMPLOYEES;
SELECT (A.MAX_SALARY-A.MIN_SALARY) AS DIFFER
FROM 
        (SELECT MIN(SALARY) MIN_SALARY, MAX(SALARY) MAX_SALARY
          FROM EMPLOYEES
          ) A;
-- 74. �Ŵ����� ��� �� �� �Ŵ��� �� ����� �� �ּ� ������ �޴� ����� ������ ��ȸ�Ѵ�.
--     �Ŵ����� ���� ������� �����Ѵ�.
--     �ּ� ������ 6000 �̸��� ���� �����Ѵ�.
--     ���� ���� �������� ��ȸ�Ѵ�.
SELECT MIN(SALARY) MIN_SALARY, MAX(SALARY) MAX_SALARY
FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL
AND SALARY>6000 ORDER BY SALARY DESC;
-- 75. �μ� ��, ��ġ ID, �� �μ� �� ��� �� ��, �� �μ� �� ��� ������ ��ȸ�Ѵ�.
--     ��� ������ �Ҽ��� 2 �ڸ������� ǥ���Ѵ�.
SELECT D.DEPARTMENT_NAME, L.LOCATION_ID, COUNT(D.DEPARTMENT_ID), TRUNC(AVG(E.SALARY),2)
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE D.LOCATION_ID = L.LOCATION_ID AND E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME, L.LOCATION_ID;
-- 76. �� ��� �� �� 1995, 1996, 1997, 1998 �⵵ �� ���� ������� �� ���� ������ ���� ��ȸ�Ѵ�. 03 04 05 06���� �ٲ� @@@@@@@@
SELECT  (
                SELECT COUNT(1)FROM EMPLOYEES)TOTAL ,
                ( SELECT COUNT(1) FROM EMPLOYEES 
                WHERE HIRE_DATE BETWEEN TO_DATE('2003-01-01','YYYY-MM-DD') AND TO_DATE('2003-12-31','YYYY-MM-DD')) A,
                ( SELECT COUNT(1) FROM EMPLOYEES 
                WHERE HIRE_DATE BETWEEN TO_DATE('2004-01-01','YYYY-MM-DD') AND TO_DATE('2004-12-31','YYYY-MM-DD')) B,
                ( SELECT COUNT(1) FROM EMPLOYEES 
                WHERE HIRE_DATE BETWEEN TO_DATE('2004-01-01','YYYY-MM-DD') AND TO_DATE('2005-12-31','YYYY-MM-DD')) C,
                ( SELECT COUNT(1) FROM EMPLOYEES 
                WHERE HIRE_DATE BETWEEN TO_DATE('2005-01-01','YYYY-MM-DD') AND TO_DATE('2006-12-31','YYYY-MM-DD')) D
FROM EMPLOYEES;

SELECT COUNT(*) FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'YY')='01'; --������ �̷������� �ٲٸ��
-- 77.  �� �μ��� �� ���� �� ���� �� ���� ��ȸ�Ѵ�. 
SELECT A.DP_SARALY, B.JOB_SARALY
FROM (
            SELECT SUM(E.SALARY) DP_SARALY
            FROM EMPLOYEES E, DEPARTMENTS D
            WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
            ) A,
            (SELECT SUM(E.SALARY) JOB_SARALY
            FROM EMPLOYEES E, JOBS J
            WHERE E.JOB_ID = J.JOB_ID
            ) B;
-- 78. LAST_NAME �� Zlotkey �� ������ �μ��� �ٹ��ϴ� ��� ������� ��� �� ��볯¥�� ��ȸ�Ѵ�.
--     ��������� Zlotkey �� �����Ѵ�.
SELECT LAST_NAME, HIRE_DATE FROM EMPLOYEES
WHERE DEPARTMENT_ID =(
    SELECT DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE LAST_NAME ='Zlotkey'
    )
AND NOT LAST_NAME='Zlotkey';
-- 79. ȸ�� ��ü ��� �������� �� �޴� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.
SELECT EMPLOYEE_ID, LAST_NAME 
FROM ( 
            SELECT AVG(SALARY) AVG_SALARY
            FROM EMPLOYEES
            ) A , EMPLOYEES
WHERE SALARY > A.AVG_SALARY;
-- 80. LAST_NAME �� u �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.
SELECT E.EMPLOYEE_ID, E.LAST_NAME
FROM(
            SELECT *
            FROM EMPLOYEES
            WHERE LAST_NAME LIKE '%u%'
            ) A, EMPLOYEES E
WHERE A.DEPARTMENT_ID = E.DEPARTMENT_ID;
-- 81. (VIEW �̿�) LAST_NAME �� u �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.
SELECT E.EMPLOYEE_ID, E.LAST_NAME
FROM(
            SELECT *
            FROM EMPLOYEES
            WHERE LAST_NAME LIKE '%u%'
            ) A, EMPLOYEES E
WHERE A.DEPARTMENT_ID = E.DEPARTMENT_ID;
-- 82. ��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ�Ѵ�.
SELECT LAST_NAME ,D.DEPARTMENT_ID ,JOB_ID
FROM EMPLOYEES E ,DEPARTMENTS D
WHERE D.DEPARTMENT_ID =  E.DEPARTMENT_ID AND D.LOCATION_ID = 1700;
-- 83. (VIEW �̿�)��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ�Ѵ�. @@@@@@
SELECT E.JOB_ID, E.DEPARTMENT_ID, E.LAST_NAME 
FROM
    (SELECT *
     FROM DEPARTMENTS
     WHERE LOCATION_ID = 1700
     ) A, DEPARTMENTS D, EMPLOYEES E
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID; 

-- 84. King �� �Ŵ����� �ΰ� �ִ� ��� ������� LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT LAST_NAME, SALARY FROM EMPLOYEES WHERE MANAGER_ID IN(
    SELECT EMPLOYEE_ID
    FROM EMPLOYEES
    WHERE LAST_NAME ='King');
-- 85. EXECUTIVE �μ��� �ٹ��ϴ� ��� ������� �μ� ��ȣ, LAST_NAME, JOB_ID �� ��ȸ�Ѵ�.
SELECT E.JOB_ID, E.LAST_NAME, E.DEPARTMENT_ID FROM DEPARTMENTS D , EMPLOYEES E
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID AND DEPARTMENT_NAME = 'Executive';
-- 86. ȸ�� ��ü ��� ���� ���� �� ���� ����� �� LAST_NAME �� u �� �ִ� �������
--       �ٹ��ϴ� �μ����� �ٹ��ϴ� ������� ���, LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT LAST_NAME , SALARY
FROM ( SELECT AVG(SALARY) AVG_SALARY
            FROM EMPLOYEES
            ) A, EMPLOYEES E
WHERE A.AVG_SALARY < E.SALARY AND LAST_NAME LIKE '%u%';
-- 88. ST_CLERK �� ���� ID �� ���� ����� ���� �μ� ID �� ��ȸ�Ѵ�.
--       NULL ���� �����Ѵ�. (NOT EXISTS ���)
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES E
WHERE NOT EXISTS(
    SELECT *
    FROM EMPLOYEES E1
    WHERE E.DEPARTMENT_ID = E1.DEPARTMENT_ID
    AND JOB_ID = 'ST_CLERK'
    )
AND DEPARTMENT_ID IS NOT NULL;
-- 90. ��ġ�� �μ��� ���� ���� ID �� ���� �̸��� ��ȸ����.(NOT EXISTS ���)
SELECT COUNTRY_ID, COUNTRY_NAME FROM COUNTRIES C
WHERE C.COUNTRY_ID IN(
    SELECT COUNTRY_ID
    FROM LOCATIONS L 
    WHERE NOT EXISTS(
        SELECT *
        FROM DEPARTMENTS D
        WHERE L.LOCATION_ID = D.LOCATION_ID
        )
    );
-- 91. ��ġ�� �μ��� �ִ� ���� ID �� ���� �̸��� ��ȸ����.(EXISTS ���)
SELECT COUNTRY_ID, COUNTRY_NAME FROM COUNTRIES C
WHERE C.COUNTRY_ID IN(
    SELECT COUNTRY_ID
    FROM LOCATIONS L 
    WHERE EXISTS(
        SELECT *
        FROM DEPARTMENTS D
        WHERE L.LOCATION_ID = D.LOCATION_ID
        )
    );
-- 92. ������ ������ ������ ������ �ִ� ������� ��� �� JOB_ID �� ��ȸ�Ѵ�.
SELECT JOB_ID, EMPLOYEE_ID FROM EMPLOYEES E
WHERE EMPLOYEE_ID NOT IN(
    SELECT EMPLOYEE_ID
    FROM JOB_HISTORY J
    WHERE J.EMPLOYEE_ID = E.EMPLOYEE_ID
    );
-- 93. Ŀ�̼��� ���� ������� �μ��� ������ ������ ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.
SELECT E.LAST_NAME, E.DEPARTMENT_ID, E.SALARY FROM EMPLOYEES E
WHERE E.COMMISSION_PCT IS NOT NULL AND E.DEPARTMENT_ID IN (
    SELECT E1.DEPARTMENT_ID
    FROM EMPLOYEES E1
    WHERE E1.DEPARTMENT_ID = E.DEPARTMENT_ID) AND E.SALARY IN (
    SELECT E1.SALARY
    FROM EMPLOYEES E1
    WHERE E1.SALARY = E.SALARY);
-- 94. ��ġ ID �� 1700 �� ������� ������ Ŀ�̼��� ������ ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�. 1700���� �غ��� �ȳ���
SELECT E.* FROM DEPARTMENTS D ,EMPLOYEES E WHERE D.LOCATION_ID=2500 AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;
SELECT LAST_NAME ,DEPARTMENT_ID ,SALARY FROM EMPLOYEES
WHERE (SALARY, COMMISSION_PCT) IN (
    SELECT SALARY, COMMISSION_PCT
    FROM EMPLOYEES E ,DEPARTMENTS D
    WHERE D. DEPARTMENT_ID = E. DEPARTMENT_ID    
    AND D. LOCATION_ID = 1700);
-- 95. LAST_NAME �� 'Kochhar' �� ����� ������ ���� �� Ŀ�̼��� ���� ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.

-- 96. ���� ID �� SA_MAN �� ������� ���� �� �ִ� �ִ� ���� ���� ���� �޴� ������� LAST_NAME, JOB_ID �� ������ ��ȸ�Ѵ�.

-- 97. ���� �̸��� T �� �����ϴ� ������ ��� ������� ���, LAST_NAME �� �μ� ��ȣ�� ��ȸ�Ѵ�.

-- 98.  �� �μ��� ��� �������� �� �޴� ���Ϻμ� �ٹ��������
--      LAST_NAME, ����, �μ���ȣ �� �ش� �μ��� ��� ������ ��ȸ�Ѵ�.
--      ����� �μ��� ������ �������� �����Ѵ�.

-- 99. �ҼӺμ��� ��� �������� ���� ���� ������� last_name �� ��ȸ�Ѵ�.

-- 100. �� ��� �� �ҼӺμ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� ����� �����ϴ� ��� ������� last_name �� ��ȸ�Ѵ�.

--101. ��å(Job Title)�� Sales Manager�� ������� �Ի�⵵�� �Ի�⵵(hire_date)�� ��� �޿��� ����Ͻÿ�. 
--   ��� �� �⵵�� �������� �������� �����Ͻÿ�. 

--102. �� ����(city)�� �ִ� ��� �μ� �������� ��ձ޿��� ��ȸ�ϰ��� �Ѵ�. 
--   ��ձ޿��� ���� ���� ���ú��� ���ø�(city)�� ��տ���, �ش� ������ �������� ����Ͻÿ�. 
--   ��, ���ÿ� �� ���ϴ� ������ 10�� �̻��� ���� �����ϰ� ��ȸ�Ͻÿ�.

--103. ��Public  Accountant���� ��å(job_title)���� ���ſ� �ٹ��� ���� �ִ� ��� ����� ����� �̸��� ����Ͻÿ�. 
--   (���� ��Public Accountant���� ��å(job_title)���� �ٹ��ϴ� ����� ��� ���� �ʴ´�.)      
--   �̸��� first_name, last_name�� �Ʒ��� �������� ���� ����Ѵ�.

--104. �ڽ��� �Ŵ������� ����(salary)�� ���� �޴� �������� ��(last_name)�� ����(salary)�� �� ���Ͻÿ�. 

--105. 2007�⿡ �Ի�(hire_date)�� �������� ���(employee_id), �̸�(first_name), ��(last_name), 
--   �μ���(department_name)�� ��ȸ�մϴ�.  
--   �̶�, �μ��� ��ġ���� ���� ������ ���, ��<Not Assigned>���� ����Ͻÿ�. 

--106. ������(job_title)�� ��Sales Representative���� ���� �߿��� ����(salary)�� 9,000�̻�, 10,000 ������ 
--   �������� �̸�(first_name), ��(last_name)�� ����(salary)�� ����Ͻÿ�

--107. �μ����� ���� ���� �޿��� �ް� �ִ� ������ �̸�, �μ��̸�, �޿��� ����Ͻÿ�. 
--   �̸��� last_name�� ����ϸ�, �μ��̸����� �������� �����ϰ�, 
--   �μ��� ���� ��� �̸��� ���� ���� �������� �����Ͽ� ����մϴ�. 

--108. EMPLOYEES ���̺��� �޿��� ���� �޴� ������� ��ȸ���� �� ���ó�� 6��°���� 10 ��°���� 
--   5���� last_name, first_name, salary�� ��ȸ�ϴ� sql������ �ۼ��Ͻÿ�.

--109. ����� �μ��� ���� ����(city)�� ��Seattle���� ����� �̸�, �ش� ����� �Ŵ��� �̸�, ��� �� �μ��̸��� ����Ͻÿ�. 
--   �̶� ����� �Ŵ����� ���� ��� ��<����>���̶�� ����Ͻÿ�. �̸��� last_name�� ����ϸ�, 
--   ����� �̸��� ������������ �����Ͻÿ�. 

--110. �� ����(job) ���� ����(salary)�� ������ ���ϰ��� �Ѵ�. ���� ������ ���� ���� �������� 
--    ������(job_title)�� ���� ������ ��ȸ�Ͻÿ�. �� ���������� 30,000���� ū ������ ����Ͻÿ�. 

--111. �� ���(employee)�� ���ؼ� ���(employee_id), �̸�(first_name), ������(job_title), 
--    �μ� ��(department_name)�� ��ȸ�Ͻÿ�. 
--    �� ���ø�(city)�� ��Seattle���� ����(location)�� �μ� (department)�� �ٹ��ϴ� ������ �����ȣ �������������� ����Ͻÿ�.

--112. 2001~20003����̿� �Ի��� ������ �̸�(first_name), �Ի���(hire_date), �����ڻ�� (employee_id), 
--    ������ �̸�(fist_name)�� ��ȸ�մϴ�. ��, �����ڰ� ���� ��������� ��� ����� ���Խ��� ����Ѵ�.

--113. ��Sales�� �μ��� ���� ������ �̸�(first_name), �޿�(salary), �μ��̸�(department_name)�� ��ȸ�Ͻÿ�. 
--    ��, �޿��� 100�� �μ��� ��պ��� ���� �޴� ���� ������ ��µǾ�� �Ѵ�. 

--114. Employees ���̺��� �Ի��Ѵ�(hire_date)���� �ο����� ��ȸ�Ͻÿ�.

--115. �μ��� �������� �ִ�, �ּ�, ��ձ޿��� ��ȸ�ϵ�, 
--    ��ձ޿��� ��IT�� �μ��� ��ձ޿����� ����, ��Sales�� �μ��� ��պ��� ���� �μ� ������ ����Ͻÿ�. 

--116. �� �μ����� ������ �Ѹ� �ִ� �μ��� ��ȸ�Ͻÿ�. 
--    ��, ������ ���� �μ��� ���ؼ��� ��<�Ż��μ�>����� ���ڿ��� ��µǵ��� �ϰ�,
--    ��°���� ������ ���� �μ����� �������� ���� ���ĵǾ���Ѵ�. 

--117. �μ��� �Ի���� �������� ����Ͻÿ�. 
--    ��, �������� 5�� �̻��� �μ��� ��µǾ�� �ϸ� ��°���� �μ��̸� ������ �Ѵ�.

--118. ����(country_name) �� ����(city)�� �������� ��ȸ�Ͻÿ�. 
--    ��, �μ��� �������� ���� ���� �� �ֱ� ������ 106���� ������ ����� �ȴ�. 
--    �μ������� ���� ������ ������� ���ø� ��ſ� ��<�μ�����>���� ��µǵ��� �Ͽ� 107�� ��� ��µǰ� �Ѵ�.

--119. �� �μ��� �ִ� �޿����� ���̵�(employee_id), �̸�(first_name), �޿�(salary)�� ����Ͻÿ�. 
--    ��, �ִ� �޿��ڰ� ���� �μ��� ��ձ޿��� ���������� ����Ͽ� ��ձ޿��� ���� �� �ְ� �� ��.

--120. Ŀ�̼�(commission_pct)�� �������� ��ȸ�Ͻÿ�. 
--    Ŀ�̼��� �Ʒ�������ó�� 0.2, 0.25�� ��� .2��, 0.3, 0.35�� .3 ���·� ��µǾ�� �Ѵ�. 
--    ��, Ŀ�̼� ������ ���� �����鵵 �ִ� �� Ŀ�̼��� ���� ���� �׷��� ��<Ŀ�̼� ����>���� ��µǰ� �Ѵ�.

--121. Ŀ�̼�(commission_pct)�� ���� ���� ���� ���� 4���� �μ���(department_name), 
--    ������ (first_name), �޿�(salary), Ŀ�̼�(commission_pct) ������ ��ȸ�Ͻÿ�. 
--    ��°���� Ŀ�̼� �� ���� �޴� ������ ����ϵ� ������ Ŀ�̼ǿ� ���ؼ��� �޿��� ���� ������ ���� ��� �ǰ� �Ѵ�.

--Q1 �μ���, ������(first_name),�޿�,Ŀ�̼� �÷��� ���� �並 �ۼ��Ͻÿ�.
--�� Ŀ�̼� ����Ʈ�� ���� ��� 0���� ��ȯ
CREATE OR REPLACE VIEW EXVIEW AS
SELECT D.DEPARTMENT_NAME ,E.FIRST_NAME, E.SALARY, NVL(E.COMMISSION_PCT,0) AS COMMISSION_PCT
FROM EMPLOYEES E , DEPARTMENTS D;
--Q2 �μ���, ��å, ������, �Ի����� ���� �並 �ۼ��Ͻÿ�.
CREATE OR REPLACE VIEW EXVIEW1 AS
SELECT D.DEPARTMENT_NAME, J.JOB_TITLE, E.LAST_NAME, E.HIRE_DATE
FROM EMPLOYEES E , DEPARTMENTS D, JOBS J;
--Q3 �μ����̺��� �����Ͽ� �� ���̺��� ����� �� ���̺� ������ �÷��� �߰��ϰ� �ʱⰪ�� ������ �� 
--������ �Ի� �� ���� ������ �÷��� �����ϴ� Ʈ���Ÿ� �ۼ��Ͻÿ�
CREATE TABLE DEPARTMENTS_1 AS SELECT * FROM DEPARTMENTS;
ALTER TABLE DEPARTMENTS_1 ADD EMPLOYEE_COUNT VARCHAR2(1000);
--CREATE OR REPLACE TRIGGER EMPLOYEE_COUNT_UPDATE
--AFTER INSERT OR DELETE ON DEPARTMENTS_1
--FOR EACH ROW
--DECLARE
--   I_COUNT NUMBER;
--BEGIN
--   SELECT COUNT(*) INTO I_COUNT FROM DEPARTMENTS_1;
--   UPDATE D SET employee_count = l_count;
--END;
--Q4 �μ�ID�� �Է��ϸ� �μ����� ��ȯ�ϴ� �Լ��� �ۼ��Ͻÿ�.
CREATE OR REPLACE FUNCTION GET_DEPARTMENT_NAME (P_DEPARTMENT_ID IN NUMBER)
RETURN VARCHAR2
IS
  L_DEPARTMENT_NAME VARCHAR2(30);
BEGIN
  SELECT DEPARTMENT_NAME INTO L_DEPARTMENT_NAME
  FROM DEPARTMENTS_1
  WHERE DEPARTMENT_ID = P_DEPARTMENT_ID;
  
  RETURN L_DEPARTMENT_NAME;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;
SELECT DEPARTMENT_ID FROM DEPARTMENTS_1;
--Q5 �μ�ID�� �Է��ϸ� �ش� �μ��� ���� ����� ����ϴ� ���ν����� �ۼ��Ͻÿ�.
CREATE OR REPLACE PROCEDURE LIST_EMPLOYEES_BY_DEPARTMENT (P_DEPARTMENT_ID IN NUMBER)
IS
BEGIN
  FOR EMP IN (SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
              FROM EMPLOYEES E
              JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
              WHERE E.DEPARTMENT_ID = P_DEPARTMENT_ID)
  LOOP
    DBMS_OUTPUT.PUT_LINE(EMP.EMPLOYEE_ID || ' ' || EMP.FIRST_NAME || ' ' || EMP.LAST_NAME);
  END LOOP;
END;