USE BaseballData;



-- 1) 생략
-- 2) ORDER BY
-- 소팅이 일어나는 이유 : order by 순서로 정렬을 해야 하닌깐!
SELECT *
FROM players
ORDER BY college;

-- SORT가 안걸림
SELECT *
FROM batting
ORDER BY playerID, yearID



-- 3) GROUP BY
-- 소팅이 발생하는 이유 college 끼리는 정렬해야하니.
-- 원인) 집계를 하기 위해
SELECT college, COUNT(college)
FROM players
WHERE college LIKE 'C%'
GROUP BY college;

-- 소팅이 없어짐. 인덱스의 영향으로... 그러니 GROUP BY를 실행할 때 인덱스가 어떤지 확인해야함
SELECT playerID, COUNT(playerID)
FROM players
WHERE playerID LIKE 'C%'
GROUP BY playerID;

-- 4) DISTINCT
-- 원인) SORT가 중복제거용도로 사용됨
-- DISTINCT는 필요한지 꼭 생각해봐야함.
SELECT DISTINCT college
FROM players
WHERE college LIKE 'C%'


-- 5) UNION
-- 유니온 특성중 Distinct (중복 제거) 기능이 있음

SELECT college
FROM players
WHERE college LIKE 'B%'
UNION	-- 현재 코드에서는 겹칠 수가 없음 B, C 로 시작하니 이럴 경우 UNION ALL로 변경해서 SORT를 방지.
SELECT DISTINCT college
FROM players
WHERE college LIKE 'C%'

-- 6) 순위 윈도우 함수
-- 원인) 집계를 하기 위해서
SELECT ROW_NUMBER() OVER (ORDER BY college)
FROM players;

-- 인덱스 정리가 잘되어있는 PLAYER ID로 바꾸면 SORT가 없어짐
SELECT ROW_NUMBER() OVER (ORDER BY playerID)
FROM players;


-- 오늘의 결론

-- Sorting (정렬) 을 줄이자!

-- O(N Log N) -> 일반적으로 크게 느리다 개념은 아니지만... DB에서는 데이터가 어마어마하게 많기에
-- ㄴ DB는 너무 용량이 커서 가용 메모리로 커버가 안 되는 경우가 생김.
--	ㄴ 그러면 메모리가 부족하면 디스크까지 찾아가서 SORTING을 함...
--    ㄴ 메모리에 접근과 디스크 접근의 속도가 엄청 느려진다..
--			경우에 따라 인덱스 정리를 하거나 sorting이 필요한지 고민해야한다.

-- Sorting이 언제 일어나는지 파악하고 있어야 함


-- Sorting이 일어날 때
-- 1) Sort Merge Join
	-- Sort가 일어나는 원인 ) 알고리즘 특성상 Merge하기 전에 Sort를 해야함
-- 2) ORDER BY 
-- 3) GROUP BY
-- 4) DISTINCT
-- 5) UNION
-- 6) RANKING WINDOWS FUNCTION
-- 7) MIN MAX



-- index를 잘 활용하면, Sorting 을 굳이 하지 않아도 됨 -- 즉, 생략할 수도 있다.

