USE BaseballData;

SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SET STATISTICS PROFILE ON;

/*
- Merge(병합) Join = Sort Merge(정렬 병합) 조인
ㄴ 정렬하고 병합하는 Join

*/

-- MANY TO MANY = TRUE 임
SELECT *
FROM players p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID;

-- One-To-Many (outer가 unique 해야 함 => PK, Unique)
-- Merge 조인도 조건이 붙는다 
-- 일일히 Random Access-> Clustered Scan 후 정렬


SELECT *
FROM schools AS s
	INNER JOIN schoolsplayers AS p	-- 
	ON s.schoolID = p.schoolID; 
-- 결론
	-- MERGE -> Sort Mege 조인

/*
	1) 양쪽 집합을 Sort(정렬)하고 Merge(병합)한다
	ㄴ 이 미 정렬된 상태라면 Sort는 생략. 특히, Clustered로 물리적 정렬된 상태라면 Best)
	ㄴ 정렬할 데이터가 너무 많으면 Worst -> Hash가 대안임

	2) RandomAccess 위주로 수행되진 않는다
	
	3) Many-to-Many(다대다) 보다는 One-To-Many(일대다) 조인에 효과적임
		-- PK, UNIQUE에 붙을 때 효율적임
	
	
	*/