USE BaseballData;
/*
Join 원리

1) Nested Loop(NL) Join
2) Merge(병합) Join
3) Hash(해시) Join

- NonClustered
	1
2	3	4

- Clustered 
	1
2	3	4	-- 2,3,4 리프를 하나하나 서칭함. 이후 내부에 접근



*/
-- Merge. 아래 코드는 Merge Join을 하고 있음
SELECT *
FROM players AS p
	INNER JOIN salaries AS s	-- 이너조인을 사용하면 각 플레이어를 퍼즐 맞추듯 연봉검색이 가능
	ON p.playerID = s.playerID;


-- NL. 아래 코드는 Nested Loops 가 등장함 한글로는 중첩 루프
SELECT TOP 5*
FROM players AS p
	INNER JOIN salaries AS s	-- 이너조인을 사용하면 각 플레이어를 퍼즐 맞추듯 연봉검색이 가능
	ON p.playerID = s.playerID;


-- Hash 방식
SELECT*
FROM salaries AS s
	INNER JOIN teams AS t
	ON s.teamID = t.teamID;


	-- 여기선 NL을 배울 것
	-- NL이 무엇인지 알기 위해선 C#코드로 구현하면 쉽게 알 수 있음
SELECT *
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID
	OPTION(LOOP JOIN);

	-- 중첩루프 - 중첩루프 - Clustgered Index Scan 
--						   ㄴ Index Seek (NonClustered) -> 딕셔너리 방식과 비슷함
--			    ㄴ Key Lookup



SELECT *
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID
	OPTION(FORCE ORDER, LOOP JOIN);


-- 특정 범위만을 서칭한다고 하면 NL이 좋은 선택!
SELECT TOP 5*
FROM players AS p
	INNER JOIN salaries AS s	-- 이너조인을 사용하면 각 플레이어를 퍼즐 맞추듯 연봉검색이 가능
	ON p.playerID = s.playerID;


-- 오늘의 결론

-- NL의 특징
-- 먼저 액세스한 (OUTER) 테이블의 로우를 차례차례 스캔하면서  걔를들고 (INNER)테이블에 랜덤 엑세스를 함
-- (INNER) 테이블에 인덱스가 없으면 노답... (이럴 경우 NL을 쓰면 안됨)
-- 부분 범위 처리에 좋다 (ex. Top 5)
