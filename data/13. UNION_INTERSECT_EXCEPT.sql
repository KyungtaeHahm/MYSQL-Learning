USE BaseballData;

/*
- 합집합(UNION)

 RDBMS (Relational 관계형)
ㄴ 데이터를 집합으로 간주하다.
ㄴ 지금 테이블들도 관계가 있음

 복수의 테이블을 다루는 방법

 1) 커리어 평균 연봉이 3000000 이상인 선수들의 playerID를 추출


*/

-- 1) 커리어 평균 연봉이 3000000 이상인 선수들의 playerID를 추출

SELECT playerID, AVG(salary)
FROM salaries
GROUP BY playerID	-- 그룹을 할 경우 모든 정보를 다 표시할 수 없고 특정 정보만 표시할 수 있음
HAVING AVG(salary) >= 3000000

-- 2) 12월에 태어난 선수들의 playerID
SELECT playerID, birthMonth
FROM players
WHERE birthMonth = 12

-- 3) 커리어 평균 연봉이 3000000 이상 || 12월에 태어난 선수
-- UNION (합집합 (중복 제거 해줌)) / 중복제거를 허용하지 않을 경우 UNION ALL (중복 허용)

SELECT playerID
FROM salaries
GROUP BY playerID	-- 그룹을 할 경우 모든 정보를 다 표시할 수 없고 특정 정보만 표시할 수 있음
HAVING AVG(salary) >= 3000000

UNION ALL-- 열이 일치해야함. 한쪽이 정수고, 한쪽이 문자열이면 안됨

SELECT playerID
FROM players
WHERE birthMonth = 12
ORDER BY playerID	-- 유니온을 쓸 경우 orderby는 아래에 와야함

-- 게임 보상시 3시 5시에 UNION ALL로 써버리면 3시에도 지급 5시에도 지급되는 미친짓이 일어남



-- 커리어 평균 연봉이 3000000 이상 && 12월에 태어난 선수


SELECT playerID
FROM salaries
GROUP BY playerID
HAVING AVG(salary) >= 3000000

INTERSECT	-- 교집합

SELECT playerID
FROM players
WHERE birthMonth = 12
ORDER BY playerID



-- 커리어 평균 연봉이 3000000 이상 - 12월에 태어난 선수 (차집합)


SELECT playerID
FROM salaries
GROUP BY playerID
HAVING AVG(salary) >= 3000000

EXCEPT	-- 차집합

SELECT playerID
FROM players
WHERE birthMonth = 12
ORDER BY playerID