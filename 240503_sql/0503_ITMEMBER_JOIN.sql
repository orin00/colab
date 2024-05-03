SELECT * FROM it_member;

-- FROM에 붙어있는게 LEFT, JOIN 에 붙어있는게 RIGHT

-- 교집합
SELECT * 
FROM it_member
JOIN course02 ON it_member.COURSE_NO = course02.COURSE_NO;

-- LEFT 여집합
SELECT * 
FROM it_member
LEFT JOIN course02 ON it_member.COURSE_NO = course02.COURSE_NO;

-- RIGHT 여집합
SELECT * 
FROM it_member
RIGHT JOIN course02 ON it_member.COURSE_NO = course02.COURSE_NO;

-- 합집합
SELECT * 
FROM it_member
LEFT JOIN course02 ON it_member.COURSE_NO = course02.COURSE_NO
UNION
SELECT * 
FROM it_member
RIGHT JOIN course02 ON it_member.COURSE_NO = course02.COURSE_NO;

-- RIGHT - LEFT
SELECT * 
FROM it_member
RIGHT JOIN course02 ON it_member.COURSE_NO = course02.COURSE_NO
WHERE it_member.COURSE_NO IS NULL;

-- LEFT - RIGHT
SELECT * 
FROM it_member
LEFT JOIN course02 ON it_member.COURSE_NO = course02.COURSE_NO
WHERE course02.COURSE_NO IS NULL;
