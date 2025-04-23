USE BaseballData;

/*
-- 팀별로 묶어서 뭔가를 분석하고 싶다 -> Grouping
-- 이렇게 작성하면 작동하지 않음

SELECT *
FROM batting
WHERE yearID = 2004
GROUP BY teamID

=== 아래와 같이 작성
SELECT teamID
FROM batting
WHERE yearID = 2004
GROUP BY teamID


-- 2004년도에 가장 많이 홈런을 날릴 팀은?

SELECT TOP 1 teamID, SUM(HR) AS HomeRun
FROM batting
WHERE yearID = 2004
GROUP BY teamID
ORDER BY HomeRun DESC;


-- 2004년도에 200 홈런 이상을 날린 팀의 목록?
-- SUM(HR) >= 200 을 하려고 했으나 SELECT문의 로직 순서로 실행이 안됨
-- SELECT 실행 순서 : FROM - WHERE - GROUP BY - HAVING - SELECCT - ORDER BY
-- HAVING의 등장

SELECT teamID, SUM(HR) AS HomeRun
FROM batting
WHERE yearID = 2004
GROUP BY teamID
HAVING SUM(HR) >= 200	-- 그러기에 풀어서 써줘야함 HomeRun이라고 하면 동작을 하지 않음.
ORDER BY homeRun DESC;

-- 근데 난잡함 . 어디에선 HomeRun을 쓰고 어디선 HR로 사용함.

FROM		책상에서
WHERE		공을
GROUP BY	색상별로 분류해서
HAVING		분류를 한 다음에 빨간색은 제외하고(추가조건을 거는 것)
SELECT		갖고 와서
ORDER BY	크기 별로 나열해주세요

그리고 순서를 섞어선 안됨!

*/

SELECT *
FROM batting
WHERE yearID = 2004
ORDER BY teamID

-- 팀별로 묶어서 뭔가를 분석하고 싶다 -> Grouping
-- GROUP BY 사용법 헷갈림.
SELECT teamID, COUNT(teamID) AS playerCount, SUM(HR) AS HomeRun	-- 각 팀 ID 별로 정보가 몇개 있는지 추출 (해당 teamID가 몇개인지)
FROM batting
WHERE yearID = 2004
GROUP BY teamID

-- 2004년도에 가장 많이 홈런을 날릴 팀은?

SELECT TOP 1 teamID, SUM(HR) AS HomeRun
FROM batting
WHERE yearID = 2004
GROUP BY teamID
ORDER BY HomeRun DESC;


-- 2004년도에 200 홈런 이상을 날린 팀의 목록?
-- SUM(HR) >= 200 을 하려고 했으나 SELECT문의 로직 순서로 실행이 안됨
-- SELECT 실행 순서 : FROM - WHERE - GROUP BY - HAVING - SELECCT - ORDER BY
-- HAVING의 등장

 

-- 근데 난잡함 . 어디에선 HomeRun을 쓰고 어디선 HR로 사용함.

-- 단일 년도에 가장 많은 홈런을 날린 팀은?
SELECT teamID, SUM(HR) AS HomeRun
FROM batting
GROUP BY teamID, yearID
ORDER BY HomeRun DESC;

-- BOS 2004 / BOS 2005 년도가 다르면 다르게 분류하게 가능