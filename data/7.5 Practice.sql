USE BaseballData;
/*
playerID (선수 ID)
yearID (시즌년도)
teamID (팀 명칭, 'BOS' = 보스턴)
G_batting (출전 경기 + 타석)

AB(타수)
H (안타)
R (출루)
2B (2루타)
3B (3루타)
HR (홈런)
BB (볼넷)

과제
1) 보스턴 소속 선수들의 정보들만 모두 출력
2) 보스턴 소속 선수들의 수는 몇명인지? (단, playerID 중복은 제거)
3) 보스턴 팀이 2004년도에 친 홈런 갯수
4) 보스턴 팀 소속으로 단일 년도 최다 홈런을 친 사람의 정보
*/
-- 1) 보스턴 소속 선수들의 정보들만 모두 출력
SELECT *
FROM batting
WHERE teamID = 'BOS'

-- 2) 보스턴 소속 선수들의 수는 몇명인지? (단, playerID 중복은 제거)
SELECT COUNT(DISTINCT playerID)
FROM batting
WHERE teamID = 'BOS'

-- 3) 보스턴 팀이 2004년도에 친 홈런 갯수
SELECT SUM(HR)
FROM batting
WHERE teamID = 'BOS' AND yearID = 2004

-- 4) 보스턴 팀 소속으로 단일 년도 최다 홈런을 친 사람의 정보
SELECT TOP (1)*
FROM batting
WHERE teamID = 'BOS'
ORDER BY HR DESC

SELECT *
FROM players
WHERE playerID = 'ortizda01'

