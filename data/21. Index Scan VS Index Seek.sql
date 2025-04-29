USE Northwind;
/*
-- 인덱스 접근 방식 (Access)
-- Index Scan VS Index Seek

- 쉽게 생각하면 Index Seek가 뜨면 활용이 되는거여서 좋은거고, Index Scan이 뜨면 활용이 안되니 나쁜 것.
ㄴ 100% 이분법적인 것이 아니기에 오늘 강의에서 배움

*/

CREATE TABLE TestAccess
(
	id INT NOT NULL,
	name NCHAR(50) NOT NULL,
	dummy NCHAR(1000) NULL
);
GO


CREATE CLUSTERED INDEX TestAccess_CI
ON TestAccess(id);
GO

CREATE NONCLUSTERED INDEX TestAccess_NCI
ON TestAccess(name);
GO

DECLARE @i INT;
SET @i = 1;

WHILE (@i <= 500)
BEGIN
	INSERT INTO TestAccess
	VALUES (@i, 'Name' + CONVERT(VARCHAR, @i), 'Hello World ' + CONVERT(VARCHAR, @i));
	SET @i = @i + 1;
END

-- 실습
-- 인덱스 정보
EXEC sp_helpindex 'TestAccess';

-- 인덱스 번호 살펴보기
SELECT index_id, name
FROM sys.indexes
WHERE object_id = object_id('TestAccess');

-- 조회
DBCC IND('Northwind', 'TestAccess', 1);
DBCC IND('Northwind', 'TestAccess', 2);

-- CLUSTERED(1) : id
--						1536 
-- 1008 ~ 9215


-- NONCLUSTERED(2) : name
--			1512
-- 1472 1473 ~1519

-- 논리적 읽기 -> 실제 데이터를 찾기 위해 읽은 페이지 수
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- INDEX SCAN = LEAF PAGE 순차적으로 검색
SELECT *
FROM TestAccess;


-- 실행했는데 경과시간이 0초..
-- INDEX SEEK, 논리적 읽기 7
-- 자기가 원하는 것 키값만 있으면 그거 하나만 바로 꺼내서 찾음
SELECT *
FROM TestAccess
WHERE id = 104;

-- Index Seek 뿐만 아니라 Key Lookup도 해야함.
-- 논리적 읽기 11
-- INDEX SEEK + KEY LOOKUP
SELECT *
FROM TestAccess
WHERE name = 'name5'; 


-- INDEX SCAN + KEY LOOKUP
-- n * 2 + @
-- 경우에 따라 INDEX SCAN이 나쁜게 아니기도 함. 지금과 같은 상황
-- 경과시간이 0, 논리적 읽기 22
SELECT TOP 10 *
FROM TestAccess
ORDER BY name;

-- 결론적으로 INDEX SCAN, INDEX SEEK 이 무조건 좋고 나쁜게 아니고, 상황별마다 다르다