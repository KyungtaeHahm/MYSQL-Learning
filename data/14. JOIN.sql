USE GameDB;

/*
JOIN 엄청 중요. 서버로 들어갈 때 많이 질문하는 것이 INDEX와 JOIN

JOIN ( 결합 )

-- CROSS JOIN (교차 결합)

*/

CREATE TABLE testA
(
	a INTEGER
)
CREATE TABLE testB
(
	b VARCHAR(10)
)

-- A(1, 2, 3)
INSERT INTO testA VALUES(1);
INSERT INTO testA VALUES(2);
INSERT INTO testA VALUES(3);

-- B(A, B, C)
INSERT INTO testB VALUES('A');
INSERT INTO testB VALUES('B');
INSERT INTO testB VALUES('C');


-- CROSS JOIN (교차 결합) - 자주 쓰진 않음
	-- 서로 교차를 하면서 하나씩 결합. 2차원 배열을 생각. 총 9개가 나옴
		-- 데이터가 서로 100개씩 있다고 하면 10000개가 생성됨.
--1) 방법
SELECT *
FROM testA
CROSS JOIN testB

--2) 방법
SELECT *
FROM testA, testB


----------------------
USE BaseballData;

SELECT *
FROM players
ORDER BY playerID;
SELECT *
FROM salaries
ORDER BY playerID; 

-- INNER JOIN ( 두 개의 테이블을 가로로 결합 + 결합 기준을 ON으로 )
-- playerID가 players, salaries 양쪽에 다 있고 일치하는 애들을 결합

SELECT *
FROM players AS p				-- players에서 뽑아올건데 그걸 p라고 하고
	INNER JOIN salaries AS s	-- 그냥 뽑아오는게 아니라 players랑 salaries 테이블이랑 innerjoin을 할건데
	ON p.playerID = s.playerID;	-- 각각 테이블의 playerID가 같은 것 만 뽑아달라

-- OUTER JOIN (외부 결합)
	-- LEFT / RIGHT
	-- 어느 한쪽에만 존재하는 데이터 -> 정책?

-- LEFT JOIN ( 두 개의 테이블을 가로로 결합 + 결합 기준을 ON으로 )
-- playerID가 왼쪽(LEFT)에 있으면 무조건 표시. 오른쪽(salaries)에 없으면 오른쪽 정보는 NULL로 채움
-- INNER JOIN은 양쪽에 다 있어야하고, OUTER JOIN은 어느 한쪽에만 있으면 문제가 없다.

SELECT *
FROM players AS p			
	LEFT JOIN salaries AS s	
	ON p.playerID = s.playerID;

-- RIGHT JOIN (두 개의 테이블을 가로로 결합 + 결합 기준을 ON으로)
-- PlayerID가 오른쪽(Right)에 있으면 무조건 표시. 왼쪽(player)에 없으면 왼쪽 정보는 NULL로 채움
SELECT *
FROM players AS p			
	RIGHT JOIN salaries AS s	
	ON p.playerID = s.playerID;
