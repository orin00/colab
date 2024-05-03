-- ROUND
SELECT ROUND(10.12345,2); -- 소수 자리 반올림
SELECT ROUND(10.12345,0); -- 정수만 표시
SELECT ROUND(999.12345,-1); -- 정수 자리 반올림

-- TRUNCATE
SELECT TRUNCATE(10.123, 2); -- 소수 자리 버림
SELECT TRUNCATE(10.123, 0); -- 정수만 표시

SELECT ROUND(단가 / 3, 2) AS 반올림 FROM 제품;
SELECT TRUNCATE(단가 / 3, 0) AS 버림 FROM 제품;

-- MOD
SELECT MOD(5, 2);
SELECT 5 % 2;

-- 문자열
SELECT LOWER('AAA');
SELECT UPPER('aaa');

-- 문자열 함수
SELECT COUNT(*) FROM 제품;
SELECT COUNT('가나다라'); -- 문자열은 COUNT 못씀
SELECT LENGTH('가나다라마바') / 3; -- 한글 1글자 =초성 중성 종성 => 3바이트, 문자열 한글은 바이트 갯수가 나옴. 
SELECT INSTR('대한민국', '대');
SELECT INSTR('HELLO SQL', 'E'); -- 특정 글자가 어디에 있는지 찾아줌.
SELECT SUBSTR('HELLO SQL', 7); -- 특정 위치에 무슨 글자가 있는지 알려줌.
SELECT SUBSTR('HELLO SQL', 7, 2); -- 특정 위치에 무슨 글자가 있는지 알려줌, 2글자만.
SELECT CONCAT(335, 'KG'); -- 두개 합침
SELECT LPAD('123', 5, '@'); -- 문장의 왼쪽을 @로 채움, 5자리
SELECT RPAD('123', 5, '@'); -- 문장의 오른쪽을 @로 채움, 5자리

-- DATETIME
SELECT NOW(); -- 현재시간(SQL이 갖고 있는 시간을 갖고 오는 것)
SELECT SYSDATE(); -- 현재시간(컴퓨터에 있는 시간을 갖고 오는 것)

SELECT DATE_FORMAT(NOW(), '%Y년%m월%d일--%h시%i분%s초'); -- 날짜 포맷팅

-- CASE
SELECT SCHOOL_NUM,
CASE WHEN SCHOOL_NUM = 1 THEN '서울대'
WHEN SCHOOL_NUM= 2 THEN'중앙대'
WHEN SCHOOL_NUM= 3 THEN'동아대'
WHEN SCHOOL_NUM= 4 THEN'부산대' END SCHOOL
FROM COURSE01;

SELECT *, CASE 
WHEN 등급 = 'SILVER' THEN  '일반 고객'
WHEN 등급 = 'GOLD' THEN '우수 고객'
WHEN 등급 = 'VIP' THEN '최우수 고객' END '고객 등급'
FROM 고객;

-- 집계 함수
SELECT AVG(단가) FROM 제품;
SELECT SUM(재고량) FROM 제품 WHERE 제조업체 = '한빛제과';

SELECT * FROM 고객;
SET SQL_SAFE_UPDATES = 0; -- 안전 모드 해제
DELETE FROM 고객 WHERE 고객이름 LIKE '%린';

-- 제품에서 한빛제과인 제품의 개수
SELECT * FROM 제품;
SELECT COUNT(*) FROM 제품 WHERE 제조업체 = '한빛제과';

-- 제품 테이블에 단가가 2500원 이상인 데이터의 개수
SELECT COUNT(*) FROM 제품 WHERE 단가 >= 2500;

-- 제품 테이블에 제조업체가 한빛제과인 상품들의 재고와 단가를 곱해서 총합을 구하시오.
SELECT SUM(재고량*단가) FROM 제품 WHERE 제조업체 = '한빛제과';


-- GROUP BY
SELECT 제조업체, SUM(재고량*단가) AS 총금액 FROM 제품 GROUP BY 제조업체;
SELECT 주문제품, SUM(수량) 주문수량 FROM 주문 GROUP BY 주문제품;
-- 제품 테이블에서 제조업체별로 제조한 제품의 개수와 제품중 최고가 검색
SELECT 제조업체, COUNT(*) 제품수, MAX(단가) 최고가 FROM 제품 GROUP BY 제조업체;
-- GROUP BY 절에서 조건을 걸고 싶으면 HAVING절을 사용하면 된다
SELECT 제조업체, COUNT(*) 제품수, MAX(단가) 최고가 FROM 제품 GROUP BY 제조업체 HAVING 제품수 >= 3;
-- 고객 테이블에서 적립금 평균이 1000원 이상인 등급에 대해서 등급별 고객수와 적립금 평균 구하기.
SELECT * FROM 고객;
SELECT 등급, COUNT(*) 고객수, AVG(적립금) 평균적립금 FROM 고객 GROUP BY 등급 HAVING AVG(적립금) >= 1000;
-- 주문 테이블에서 각 주문 고객이 주문한 제품의 총 주문수량을 주문 제품별로 구하시오.
SELECT * FROM 주문;
SELECT 주문제품, 주문고객, SUM(수량) 총주문수량 FROM 주문 GROUP BY 주문제품, 주문고객;

-- EMP 테이블의 모든 사원의 수
SELECT COUNT(*) FROM EMP;
-- MGR이 없는 사원을 제외한 사원의 수
SELECT COUNT(ENAME) FROM EMP WHERE MGR IS NOT NULL;
-- SAL이 2000 이하인 사원들의 급여 합계
SELECT SUM(SAL) FROM EMP WHERE SAL <= 2000;
-- JOB이 MANAGER인 사원들의 수와 급여 평균
SELECT COUNT(ENAME), SUM(SAL)/COUNT(SAL) FROM EMP WHERE JOB = 'MANAGER';
-- 가장 급여가 낮은 사원의 급여 검색
SELECT MIN(SAL) FROM EMP;
-- 30번 DEPTNO에서 근무하는 사원중 가장 급여가 높은 사원의 급여
SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30;
-- 회사의 현재 모든 직무수
SELECT COUNT(distinct JOB) FROM EMP;



-- 240503
-- 각 부서의 사원수와 부서번호(dept) 검색
SELECT COUNT(ENAME) 사원수, DEPTNO FROM EMP GROUP BY DEPTNO;
-- 각 직무별 사원수와 직무(job) 검색
SELECT COUNT(ENAME) 사원수, JOB FROM EMP GROUP BY JOB;
-- 각 직무별 사원들의 평균 급여(sal)과 직무(job)검색
SELECT ROUND(AVG(SAL), 0) 평균급여, JOB 직무 FROM EMP GROUP BY JOB;
-- 각 부서별 사원들의 급여(sal) 합계와 부서번호(deptno) 검색
SELECT SUM(SAL) 합계급여, DEPTNO 부서번호 FROM EMP GROUP BY DEPTNO;
-- 각 부서, 각 직무로 분류한 후 사원수, 부서(deptno), 직무(job) 검색
SELECT COUNT(ENAME) 사원수, DEPTNO 부서번호, JOB 직무 FROM EMP GROUP BY DEPTNO, JOB;
-- 직무별 사원이 3명 이상인 직무와 사원수 검색
SELECT COUNT(ENAME), JOB FROM EMP GROUP BY JOB HAVING COUNT(ENAME) >= 3;
-- 사원수가 4명 이하인 부서와 부서의 부서번호와 사원수 검색
SELECT DEPTNO 부서번호, COUNT(ENAME) 사원수 FROM EMP GROUP BY DEPTNO HAVING COUNT(ENAME) <= 4;
-- 부하직원이 1명인 매니저(MGR)의 사원번호(empno) 검색 (직속상관이 없는 매니저는 제외)
SELECT MGR, COUNT(*) AS MGR_CNT 
FROM EMP 
WHERE MGR IS NOT NULL 
GROUP BY MGR 
HAVING MGR_CNT = 1;
-- sub query 쿼리 안에 쿼리문 쓰는 거