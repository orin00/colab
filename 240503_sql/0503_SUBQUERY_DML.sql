SELECT 제품명, 제조업체
FROM 제품
WHERE 제품번호 IN (
    SELECT 주문제품
    FROM 주문
    WHERE 주문고객 = 'banana'
);

-- 달콤 비스켓이라는 걸 만든 회사를 찾아서 그 회사가 만든 제품명과 단가를 출력
SELECT 제품명, 단가
FROM 제품
WHERE 제조업체 = (
	SELECT 제조업체
    FROM 제품
    WHERE 제품명 = '달콤비스켓'
);

-- UPDATE(수정) 명령
SELECT * FROM 제품;

UPDATE 제품
SET 제품명 = '찰떡파이'
WHERE 제품번호 = 'p03';

-- 제품 테이블 모든 제품 단가 10% 인상
UPDATE 제품
SET 단가 = 단가 * 1.1
WHERE 제품번호 LIKE 'p%';


-- DELETE
SELECT * FROM 제품;
DELETE FROM 주문
WHERE 주문번호 = 'o10';









