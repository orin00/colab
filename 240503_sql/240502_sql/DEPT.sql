SELECT * FROM emp;
SELECT ENAME, JOB, HIREDATE, SAL, DEPTNO FROM emp;
SELECT DISTINCT JOB, DEPTNO FROM emp;
SELECT * FROM dept;
SELECT DNAME AS '부서명', LOC AS '부서위치' FROM dept;

-- EMP에서 ENAME이 A로 시작하는 사원의 ENAME과 JOB 검색
SELECT ENAME, JOB FROM emp WHERE ENAME LIKE 'A%';
-- EMP에서 ENAME이 N으로 끝나는 사원의 ENAME과 JOB 검색
SELECT ENAME, JOB FROM emp WHERE ENAME LIKE '%N';
-- EMP에서 ENAME이 4글자이면서 세번째 글자가 R인 사원의 ENAME과 DEPTNO 검색
SELECT ENAME, DEPTNO FROM emp WHERE ENAME LIKE '__R_';
-- EMP에서 ENAME의 두번째 글자가 I인 사원의 ENAME과 SAL 검색
SELECT ENAME, SAL FROM emp WHERE ENAME LIKE '_I%';

-- MGR의 EMPNO가 7839인 사원의 ENAME과 JOB 검색
SELECT ENAME, JOB FROM EMP WHERE MGR = '7839';
-- SAL이 3000이상인 사원의 DEPTNO와 JOB 검색
SELECT DEPTNO, JOB FROM EMP WHERE SAL >= 3000;
-- JOB가 'CLERK'와 'SALESMAN'이 아닌 사원의 ENAME, JOB, SAL 검색
SELECT ENAME, JOB, SAL FROM EMP WHERE JOB != 'CLERK' AND JOB != 'SALESMAN';
SELECT ENAME, JOB, SAL FROM EMP WHERE JOB NOT IN ('CLERK', 'SALESMAN');
-- MGR의 EMPNO가 7839 이거나 직무가 'ANALYST'인 사원의 SAL, DEPTNO 검색
SELECT SAL, DEPTNO FROM EMP WHERE MGR = '7839' OR JOB = 'ANALYST';
-- MGR의 EMPNO가 7698 또는 7839 이고 DEPTNO가 10인 사원의 모든 속성 검색
SELECT * FROM EMP WHERE (MGR = 7698 OR MGR = 7839) AND DEPTNO = 10;


-- MGR이 NULL인 사원의 ENAME, JOB, SAL 검색
SELECT ENAME, JOB, SAL FROM EMP WHERE MGR IS NULL;
-- COMM이 NULL인 사원의 ENAME, HIREDATE, SAL
SELECT ENAME, HIREDATE, SAL FROM EMP WHERE COMM IS NULL;
-- MGR이 NULL이 아니고 부서번호가 20인 사원의 모든 속성
SELECT * FROM EMP WHERE MGR IS NOT NULL AND DEPTNO = 20;
-- COMM이 NULL이 아니고 HIREDATE가 1981년 2월인 사원의 모든 속성
SELECT * FROM EMP WHERE COMM IS NOT NULL AND HIREDATE LIKE '1981-02%';

-- ENAME을 내림차순으로 정렬하여 모든 속성 검색
SELECT * FROM EMP ORDER BY ENAME DESC;
-- HIREDATE가 빠른 순으로 정렬하여 모든 속성 검색
SELECT * FROM EMP ORDER BY HIREDATE ASC;
-- DEPTNO를 내림차순으로 정렬하고 DEPTNO가 같은 경우 ENAME을 오름차순으로 정렬하여 모든 속성 검색
SELECT * FROM EMP ORDER BY DEPTNO DESC, ENAME ASC;
-- SAL이 높은 순으로 정렬하여 모든 속성 검색
SELECT * FROM EMP ORDER BY SAL DESC;

