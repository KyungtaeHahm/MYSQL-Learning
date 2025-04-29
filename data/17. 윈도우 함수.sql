USE BaseballData;

-- 운영체제의 윈도우가 아님.
-- 행들의 서브 집합을 대상으로, 각 행별로 계산을 해서 스칼라(단일 고정)값을 출력하는 함수

-- 느낌상 GROUPING 이랑 비슷
-- SUM, COUNT, AVG 집계 함수

SELECT *
FROM salaries
ORDER BY salary DESC;


-- GROUPING
SELECT playerID, MAX(salary)	-- 그룹핑은 그룹핑 하는 함수예외 집계함수 예외는 뜨질 않음.
FROM salaries
GROUP BY playerID
ORDER BY MAX(salary) DESC

-- 이러한 단점을 커버한게 윈도우함수

-- ~OVER([PARTITION] [ORDER BY] [ROWS])	

-- 전체 데이터를 연봉 순서로 나열하고, 순위 표기

SELECT *,		-- OVER로 범위지정, 정렬순서만 적어놓음
	ROW_NUMBER() OVER (ORDER BY salary DESC),	-- 공동1등이 있을 경우 랜덤으로 숫자를 매김 행#번호
	RANK() OVER (ORDER BY salary DESC),			-- 랭킹. 공동 1등은 공동 1등이라고함.. 그 다음 등수는 공동의 인원에따라 3등부터...
	DENSE_RANK() OVER (ORDER BY salary DESC),	-- 랭킹. 공동 1등 뒤에 다음 등수는 2등.. 만약 공동일경우 공동2등.
	NTILE(100) OVER (ORDER BY salary DESC)		--  상위 몇 %인지
FROM salaries;

-- playerID 별 순위를 따로 하고 싶다면...
SELECT *,
	RANK() OVER (PARTITION BY playerID ORDER BY salary DESC)
FROM salaries
ORDER BY PlayerID;


-- LAG (바로 이전), LEAD (바로 다음)	, 이전값과 다음값을 알아야 할 때? 유용함
SELECT *,
	RANK() OVER (PARTITION BY playerID ORDER BY salary DESC),
	LAG(salary) OVER (PARTITION BY playerID ORDER BY salary DESC) AS prevSalary,
	LEAD(salary) OVER (PARTITION BY playerID ORDER BY salary DESC) AS nextSalary
FROM salaries
ORDER BY PlayerID;

-- FIRST_VALUE, LAST_VALUE
-- 여기서 rows를 활용 예정. 그냥 작성하면 행을 한개. 두개, 세개씩 순차적을 실행해서 최소 최대 연봉이 이상하게 나옴.  
-- FRAME : FIRST~CURRENT

SELECT *, 
	RANK() OVER (PARTITION BY playerID ORDER BY salary DESC),
	FIRST_VALUE(salary) OVER (PARTITION BY playerID 
								ORDER BY salary DESC
								ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW	-- 맨처음에서 현재까지의 범위
								) AS best,
	LAST_VALUE(salary) OVER (PARTITION BY playerID 
								ORDER BY salary DESC
								ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
								
								) AS worst
FROM salaries
ORDER BY PlayerID;
