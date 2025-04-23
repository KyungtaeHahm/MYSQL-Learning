USE BaseballData;
/*
-- case문 내가 태어난 달에 따라 birthSeason이 정해진다.
-- case문은 꼭 SELECT 아래만 작성해야 되는 게 아니어서 어디든 유용하게 사용가능
SELECT *,
	CASE birthMonth
		WHEN 1 THEN N'겨울'
		WHEN 2 THEN N'겨울'
		WHEN 3 THEN N'봄'
		WHEN 4 THEN N'봄'
		WHEN 5 THEN N'봄'
		WHEN 6 THEN N'여름'
		WHEN 7 THEN N'여름'
		WHEN 8 THEN N'여름'
		WHEN 9 THEN N'가을'
		WHEN 10 THEN N'가을'
		WHEN 11 THEN N'가을'
		WHEN 12 THEN N'겨울'
		ELSE N'미정'
	END AS birthSeason
FROM players;


-- if-elseif 느낌
SELECT *,
	CASE
		WHEN birthMonth <= 2 THEN N'겨울'
		WHEN birthMonth <= 5 THEN N'봄'
		WHEN birthMonth <= 8 THEN N'여름'
		WHEN birthMonth <= 11 THEN N'가을'
		ELSE N'겨울'
	END AS birthSeason
	FROM players;


*/

	-- 만약에 ELSE 가 없고 조건문에 맞지 않는 값이 들어온다면 해당 값은 NULL이 들어옴

SELECT *,
	CASE birthMonth
		WHEN 1 THEN N'겨울'
		WHEN 2 THEN N'겨울'
		WHEN 3 THEN N'봄'
		WHEN 4 THEN N'봄'
		WHEN 5 THEN N'봄'
	END AS birthSeason
FROM players;



-- if-elseif 느낌
SELECT *,
	CASE
		WHEN birthMonth <= 2 THEN N'겨울'
		WHEN birthMonth <= 5 THEN N'봄'
		WHEN birthMonth <= 8 THEN N'여름'
		WHEN birthMonth <= 11 THEN N'가을'
		WHEN birthMonth IS NULL THEN N'미정' -- 절대 NULL은 = 으로 하면 안됨. 비교하는 순간 NULL일경우 NULL 값
		ELSE N'겨울'
	END AS birthSeason
	FROM players;

