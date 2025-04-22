

/*
[ 수치와 문자열 ]

-- 2021 - 1934 프로그래밍 해서 했던 사칙연산
-- +,-,/,*,% 연산 지원함


SELECT 2021 - birthYear AS koreanAge
FROM players 
WHERE deathYear IS NULL AND birthYear IS NOT NULL AND koreanAge <= 80
ORDER BY koreanAge

WHERE 구문에서 에러가 남.
ㄴ> 로직순서 문제로

-- FROM		책상에서
-- WHERE	빨간색 공을
-- SELECT	갖고 오고
-- ORDERBY	크기 순서로 정렬해라

SELECT에서 선언을 했으니 WHERE에 값이 없음

그래서 WHERE 구문에서 koreanAge가 아닌 birthYear로 써야함

SELECT 2021 - NULL , NULL은 존재하지 않는 값이므로 해당 연산의 값은 NULL로 나옴. 그러니 주의

SELECT 3 / 2;	-- 결과가 1이 나옴. 정수를 정수로 나눠서 .5가 잘림.
SELECT 3.0 / 2;	-- 결과는 1.5가 나옴. 하나만 소수일경우 소수로나옴.


- 그 외 다양한 함수가 있음. SIN - SQL에서 확인 가능함

SELECT ROUND(3.1414141414,3); -- 뒤에서 3번째까지 자름

SELECT POWER(2, 3)		-- 2^3

SELECT COS(0)

*/
USE BaseballData;





SELECT 2021 - birthYear AS koreanAge
FROM players 
WHERE deathYear IS NULL AND birthYear IS NOT NULL AND (2021 - birthYear) <= 80
ORDER BY koreanAge