/*
7. 집계 함수


USE BaseballData

-- COUNT
-- SUM
-- AVG
-- MIN
-- MAX

SELECT COUNT(*) -- 행들을 다 뽑고 COUNT를 했으니 행의 갯수를 뽑아주세요. 와 같음
FROM Players;

-- () 안에 *을 넣을 수 있는 것은 COUNT가 유일

SELECT COUNT(birthYear)
FROM players;

-- 위에 COUNT는 16564 / 아래 COUNT(birthYear)는 16323이 뜸
-- 그 이유는 집계함수는 집합이 null이면 무시하기 때문


-- 중복없이 birthCity의 카운트를 세고 싶을 때 DISTINCT 추가
SELECT DISTINCT birthCity
FROM players;

-- 아래와 같이 DISTINCT 를 썼을 때 Year, Month, Day 3개가 중복이 되지 않으면 읽음
-- 각기 다른 생년월일 목록을 가진 사람을 셀 때 사용하기 좋다.
SELECT DISTINCT birthYear, birthMonth, birthDay
FROM players
ORDER BY birthYear;

-- 아래의 경우 DISTINCT가 동작하지 않은채로 COUNT가 발생함
-- 그 이유는 COUNT가 우선순위로 동작하기 때문 
SELECT DISTINCT COUNT(birthCity)
FROM players;

-- DISTINCT를 안에 넣어야함
SELECT  COUNT(DISTINCT birthCity)
FROM players;


-- 선수들의 평균 weight를 구해보자 (pound 단위)
SELECT AVG(weight)
FROM Players;

SELECT SUM(weight) / COUNT(weight)
FROM Players;

-- 선수들의 평균 weight를 구해보자 (pound 단위)
-- weight = NULL인 경우라면 weight = 0로 친다
SELECT AVG(CASE WHEN weight IS NULL THEN 0 ELSE weight END)
FROM Players;

-- MIN MAX , 선수의 최소 무게, 최대 무게를 보고 싶을 때
SELECT MIN(weight), MAX(weight)
FROM Players;



*/

USE BaseballData

-- COUNT
-- SUM
-- AVG
-- MIN
-- MAX


SELECT  COUNT(DISTINCT birthCity)
FROM players;


-- 선수들의 평균 weight를 구해보자 (pound 단위)
SELECT AVG(weight)
FROM Players;

SELECT SUM(weight) / COUNT(weight)
FROM Players;

-- 선수들의 평균 weight를 구해보자 (pound 단위)
-- weight = NULL인 경우라면 weight = 0로 친다
SELECT AVG(CASE WHEN weight IS NULL THEN 0 ELSE weight END)
FROM Players;

-- MIN MAX , 선수의 최소 무게, 최대 무게를 보고 싶을 때
SELECT MIN(weight), MAX(weight)
FROM Players;
