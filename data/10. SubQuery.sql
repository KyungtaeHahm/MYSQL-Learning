USE BaseballData;
/*
SubQuery (서브쿼리 / 하위쿼리)
- SQL 명령문 안에 지정하는 하부 SELECT (SELECT를 한 번 더 사용한다?)


-- 연봉이 역대급으로 높은 선수의 정보를 추출
SELECT TOP 1*
FROM salaries
ORDER BY salary DESC;

--해당 선수 찾아보기
SELECT *
FROM players
WHERE playerID = 'rodrial01'

===============================

-- 이것을 한 번에 하려면?
SELECT *
FROM players
WHERE playerID = (SELECT TOP 1 playerID FROM salaries ORDER BY salary DESC)	-- 내부에 있는 하위쿼리가 먼저 실행되서 playerID가 실행되고 SELECT 구문까지 작업


-- 다중행은 IN을 사용한다! 기억
-- playerID = 단일값
SELECT *
FROM players
WHERE playerID IN (SELECT TOP 20 playerID FROM salaries ORDER BY salary DESC) --   = 대신 IN 사용

-- 하나가 아닌 여러개가 출력. TOP20개 출력인데 9개만 출력 되는데, 그 이유는 알렉스 로드리게스가 여러번 등장해서..


-- 서브쿼리는 WHERE에서 많이 사용 (80% 이상), 나머지 구문에서도 사용 가능
SELECT (SELECT COUNT(*) FROM players) AS playerCount, (SELECT COUNT(*) FROM batting) AS battingCount;

-- INSERT에서도 사용 가능
SELECT *
FROM salaries
ORDER BY yearID DESC

-- INSERT INTO -- 최대연봉추출후 입력
	-- 여기서 서브쿼리는 일반 값대신 바꿔치기 한다고 생각하면 편함. 해당 값에서 특수한 조건이 필요하다면 대체 할 수 있다(?) 로 생각하면 편함
INSERT INTO salaries
VALUES (2020, 'KOR', 'NL', 'rookiss', (SELECT MAX(salary) FROM salaries))


-- INSERT SELECT
INSERT INTO salaries
SELECT 2020, 'KOR', 'NL', 'rookiss2', (SELECT MAX(salary) FROM salaries); 

-- 테이블끼리 복사하고 싶을 때 사용.
	-- salaries 에서 yearID, playerID, salary를 SELECT해서 추출해서 salaries_temp에 넣는다.
INSERT INTO salaries_temp
SELECT yearID, playerID, salary FROM salaries;

SELECT*
FROM salaries_temp


-- 상관 관계 서브쿼리
-- EXISTS, NOT EXISTS
-- 당장 자유자재로 사용은 못해도 되니까 -> 기억만 하면됨!

-- 1) 포스트 시즌 타격에 참여한 선수들 목록
-- battingpost에 참가한 playerID를 추출!
SELECT *
FROM players
WHERE playerID IN (SELECT playerID FROM battingpost); 

-- 상관관계를 이용한다면
SELECT *
FROM players
WHERE (SELECT playerID FROM battingpost WHERE battingpost.playerID = players.playerID) -- 상관관계를 할 경우 독립적으로 실행 X
-- 그 이유는 battingpost.playerID는 문제가 없지만 player.playerID는 서브쿼리가 아닌 위에서 뽑아온 것이기 때문 (순서를 생각!)

- 아래와 같이 동작되길 원함(하드코딩 방식임)
WHERE (SELECT playerID FROM battingpost WHERE battingpost.playerID = 'rodrial01')


-- 상관관계를 이용한다면
SELECT *
FROM players
WHERE EXISTS (SELECT playerID FROM battingpost WHERE battingpost.playerID = players.playerID)
-- EXISTS : 있으면 EXIST 하고 없으면 SKIP 해라.
-- battingpost.playerID 에 있는 값이 players.playerID 에 있는 값이면 EXIST하고 없으면 NULL 반환



*/

-- 연봉이 역대급으로 높은 선수의 정보를 추출
SELECT TOP 1*
FROM salaries
ORDER BY salary DESC;

--해당 선수 찾아보기
SELECT *
FROM players
WHERE playerID = 'rodrial01'

-- 연봉이 역대급으로 높은 선수의 정보를 추출
SELECT TOP 1*
FROM salaries
ORDER BY salary DESC;

--해당 선수 찾아보기
SELECT *
FROM players
WHERE playerID = 'rodrial01'


-- 다중행은 IN을 사용한다! 기억
-- playerID = 단일값
SELECT *
FROM players
WHERE playerID IN (SELECT TOP 20 playerID FROM salaries ORDER BY salary DESC) --   = 대신 IN 사용

-- 하나가 아닌 여러개가 출력. TOP20개 출력인데 9개만 출력 되는데, 그 이유는 알렉스 로드리게스가 여러번 등장해서..


-- 서브쿼리는 WHERE에서 많이 사용 (80% 이상), 나머지 구문에서도 사용 가능
SELECT (SELECT COUNT(*) FROM players) AS playerCount, (SELECT COUNT(*) FROM batting) AS battingCount;

-- INSERT에서도 사용 가능
SELECT *
FROM salaries
ORDER BY yearID DESC

-- INSERT INTO -- 최대연봉추출후 입력
	-- 여기서 서브쿼리는 일반 값대신 바꿔치기 한다고 생각하면 편함. 해당 값에서 특수한 조건이 필요하다면 대체 할 수 있다(?) 로 생각하면 편함
INSERT INTO salaries
VALUES (2020, 'KOR', 'NL', 'rookiss', (SELECT MAX(salary) FROM salaries))


-- INSERT SELECT
INSERT INTO salaries
SELECT 2020, 'KOR', 'NL', 'rookiss2', (SELECT MAX(salary) FROM salaries); 

-- 테이블끼리 복사하고 싶을 때 사용.
	-- salaries 에서 yearID, playerID, salary를 SELECT해서 추출해서 salaries_temp에 넣는다.
INSERT INTO salaries_temp
SELECT yearID, playerID, salary FROM salaries;

SELECT*
FROM salaries_temp


-- 상관 관계 서브쿼리
-- EXISTS, NOT EXISTS
-- 당장 자유자재로 사용은 못해도 되니까 -> 기억만 하면됨!

-- 1) 포스트 시즌 타격에 참여한 선수들 목록
-- battingpost에 참가한 playerID를 추출!
SELECT *
FROM players
WHERE playerID IN (SELECT playerID FROM battingpost); 

-- 상관관계를 이용한다면
SELECT *
FROM players
WHERE EXISTS (SELECT playerID FROM battingpost WHERE battingpost.playerID = players.playerID)
-- EXISTS : 있으면 EXIST 하고 없으면 SKIP 해라.
-- battingpost.playerID 에 있는 값이 players.playerID 에 있는 값이면 EXIST하고 없으면 NULL 반환

