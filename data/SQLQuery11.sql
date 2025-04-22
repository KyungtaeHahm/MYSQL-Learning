

/*
[ 복습 ]

SELECT *
FROM players;

실행이 안 될 때 맨 상단에 USE BaseballData; 를 기입

금일 학습 할 것은 Order by ( 정렬 )

WHERE birthYear IS NOT NULL		-- ORDER BY를 실행시 정렬 최상단에 NULL 값이 우선순위
ORDER BY birthYear DESC, birthMonth DESC, birthDay DESC;		-- ASC : 작은 -> 큰 / DESC : ASC의 역순 / 미기입시 자동으로 ASC
다항으로 가능

SELECT TOP (10) * -- TOP 10명만 보고 싶을 때
SELECT TOP 1 PERCENT *	-- 전체의 1%만 보여주세요
문제 MYSQL가면 명령어가 다름 / 치명적인 문제. TOP 100을 출력하고 싶을 때 100~200 중간을 원할 때 방법이 없음. TOP이기 때문에....

해결방법 : OFFSET 100 ROWS FETCH NEXT 100 ROWS ONLY;	-- 100 개의 행을 건너뛰고 그 다음 100개만 추출해줘
*/
USE BaseballData;

-- 100~200

SELECT *	-- 전체의 1%만 보여주세요

FROM players
WHERE birthYear IS NOT NULL		-- ORDER BY를 실행시 정렬 최상단에 NULL 값이 우선순위
ORDER BY birthYear DESC, birthMonth DESC, birthDay DESC	-- ASC : 작은 -> 큰 / DESC : ASC의 역순 / 미기입시 자동으로 ASC
OFFSET 100 ROWS FETCH NEXT 100 ROWS ONLY;	-- 100 개의 행을 건너뛰고 그 다음 100개만 추출해줘