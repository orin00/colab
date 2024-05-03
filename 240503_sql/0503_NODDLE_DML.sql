SELECT * FROM noodle;

-- 제조사별 개수 조회 (숫자 뒤에 N개 붙이기)
SELECT COMPANY 기업명, CONCAT(COUNT(*), '개') '제조사별 개수' FROM NOODLE GROUP BY COMPANY;

-- 1번 오름차순
SELECT COMPANY 기업명, CONCAT(COUNT(*), '개') '제조사별 개수' FROM NOODLE GROUP BY COMPANY ORDER BY COUNT(*) ASC;

-- 1번 갯수 3개 이상인거 찾기
SELECT COMPANY 기업명, CONCAT(COUNT(*), '개') '제조사별 개수' FROM NOODLE GROUP BY COMPANY HAVING COUNT(*) >= 3 ORDER BY '제조사별 개수' ASC;

-- 라면의 종류가 M이고 가격이 800이상인 데이터 찾기
SELECT NAME, COMPANY, E_DATE FROM NOODLE WHERE KIND = 'M' AND PRICE >= 800;

-- 4번의 E-DATE를 '00년 00월 00일'로 출력하시오
SELECT NAME, COMPANY, date_format(E_DATE, '%y년%m월%d일') E_DATE FROM NOODLE WHERE KIND = 'M' AND PRICE >= 800;

-- 제조사별 최소 가격을 내림차순으로 조회(가격 뒤에 "원" 붙이기)
SELECT COMPANY 기업명, CONCAT(MIN(PRICE), '원') '제조사별 최소가격' FROM NOODLE GROUP BY COMPANY ORDER BY MIN(PRICE) DESC;

-- 제조사별 제품 가격 합계(원), 평균(정수로)(원) 조회
SELECT COMPANY 기업명, CONCAT(SUM(PRICE), '원') 'SUM', CONCAT(ROUND(AVG(PRICE)), '원') 'AVG' FROM NOODLE GROUP BY COMPANY ORDER BY COMPANY ASC;



SELECT * FROM ACCIDENT;
-- ACCIDENT
-- 요일별 교통사고 사망자수 집계
SELECT WEEK, SUM(DIE) FROM ACCIDENT GROUP BY WEEK;
-- 지역별(시/도)0 교통사고 사망자 수 집계
SELECT AREA1, SUM(DIE) FROM ACCIDENT GROUP BY AREA1;
-- 지역별(시/도, 구/군/시) 교통사고 사망자 수 집계
SELECT CONCAT(AREA1, AREA2), SUM(DIE) FROM ACCIDENT GROUP BY CONCAT(AREA1, AREA2);
-- 많이 발생한 사고 유형순으로 집계 1~5위까지
SELECT KIND, COUNT(*) ACC_CNT FROM ACCIDENT GROUP BY KIND ORDER BY ACC_CNT DESC LIMIT 0,5;
-- 교통사고가 가장 적게 발생한 요일
SELECT COUNT(DIE), WEEK FROM ACCIDENT GROUP BY WEEK ORDER BY COUNT(DIE) ASC LIMIT 0,1; 


SELECT * FROM visitor_tb;
-- 방문 횟수가 2번 이상인 IP 현황
SELECT COUNT(*) IP_CNT, IP_ADDRESS FROM visitor_tb GROUP BY IP_ADDRESS HAVING COUNT(*) >= 2 ORDER BY IP_CNT DESC;
-- 연도별 방문자 현황
SELECT date_format(VST_TIME, '%y년') '연도', COUNT(date_format(VST_TIME, '%y년')) '방문자 현황' FROM visitor_tb GROUP BY date_format(VST_TIME, '%y년');
-- 전체기간 중 월별 방문자 현황
SELECT date_format(VST_TIME, '%m월') '월별', COUNT(date_format(VST_TIME, '%m월')) '방문자 현황' FROM visitor_tb GROUP BY date_format(VST_TIME, '%m월') ORDER BY date_format(VST_TIME, '%m월') ASC;
-- 방문 경로별 방문자 현황
SELECT VST_PATH, COUNT(VST_PATH), 
CASE VST_PATH 
WHEN 1 THEN '검색' 
WHEN 2 THEN '부산관광공사' 
END VS123
FROM visitor_tb 
GROUP BY VST_PATH;



-- JOIN





























