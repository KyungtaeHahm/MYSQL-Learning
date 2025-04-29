USE Northwind;

/*
	북마크 룩업

	인덱스를 활용하는데 어떻게 느릴 수가 있을까?

	1) NonClustered
			1
		2 3 4 5 6
		- 데이터를 찾을 수 있는 열쇠를 들고 있음. heap table을 이용
	2) Clustered
			1
		2 3 4 5 6
		- 데이터가 실제로 leaf page에 있고

	Heap Table [ {Page} {Page} ]

	-- Clustered의 경우 Index Seek가 느릴 수가 없다
	-- NonClustered의 경우, 데이터가 Leaf Page에 없다
	-- 따라서 한번 더 타고 가야함
	1) RID를 이용해 Hip Table을 이용하거나	-> Bookmark Lookup
	2) Key를 이용해 Clustered를 이용하거나

*/

SELECT *
INTO TestOrders
FROM Orders;

SELECT *
FROM TestOrders

CREATE NONCLUSTERED INDEX Orders_Index01
ON TestOrders(CustomerID);

-- 인덱스 번호
SELECT index_id, name
FROM sys.indexes
WHERE object_id = object_id('TestOrders');

-- 조회
-- Northwind 테이블의 TestOrders에서 2번 인덱스의 정보를 보고 싶다.
DBCC IND('Northwind', 'TestOrders', 2);

--			1048
--   1008	1016	1017

-- 클러스터 페이지를 만들지 않았으니 Heap Table [ {Page} {Page} ]이 있을 것


SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SET STATISTICS PROFILE ON; -- 실제로 실행된 순서를 보여줌

-- 기본 탐색을 해보자
	-- 논리적 읽기가 20이 나옴. 테이블스캔
SELECT *
FROM TestOrders
WHERE CustomerID = 'QUICK';


-- 강제로 인덱스를 이용하게 해보자
	-- 논리적 읽기 30이 나옴.
SELECT *
FROM TestOrders WITH(INDEX(Orders_Index01))
WHERE CustomerID = 'QUICK';

-- 룩업을 줄이기 위한 몸부림
SELECT *
FROM TestOrders WITH(INDEX(Orders_Index01))
WHERE CustomerID = 'QUICK' AND ShipVia = 3;

DROP INDEX TestOrders.Orders_Index01;

-- 룩업을 줄이기 위한 몸부림
-- Covered Index
CREATE NONCLUSTERED INDEX Orders_Index01
ON TestOrders(CustomerID, ShipVia);

-- 8번 룩업을 시도해서 8번 다 꽝없이 찾음
SELECT *
FROM TestOrders WITH(INDEX(Orders_Index01))
WHERE CustomerID = 'QUICK' AND ShipVia = 3;

-- Q) 그럼 조건1 AND 조건2 필요하면, 무조건 INDEX(조건1, 조건2)를 추가해주면 장땡?
-- A) NO! 꼭 그렇지는 않다. DML 연산(Insert, Update, Delete) 작업 부하가 증가된다.

DROP INDEX TestOrders.Orders_Index01;

-- 룩업을 줄이기 위한 몸부림
CREATE NONCLUSTERED INDEX Orders_Index01
ON TestOrders(CustomerID) INCLUDE (ShipVia);

-- 8번 룩업을 시도해서 8번 다 꽝없이 찾음
SELECT *
FROM TestOrders WITH(INDEX(Orders_Index01))
WHERE CustomerID = 'QUICK' AND ShipVia = 3;

-- 위와 같은 눈물겨운 노력에도 답이 없다면...
-- Clustered Index 활용을 고려 할 수 있다.
-- 그러나 클러스터드 인덱스는 테이블당 1개만 사용할 수 있다.

-- 결론

-- NonClustered Index가 악영향을 주는 경우?
	-- 북마크 룩업이 심각한 부하를 야기할 때

--대안?
	-- 옵션1) Covered Index (검색할 모든 컬럼을 포함하겠다)
	-- 옵션2) Index에다가 Include로 힌트를 남긴다
	-- 옵션3) Clustered 고려 (단, 1번만 사용할 수 있는 궁극기..) -> NonClustered 악영향을 줄 수 있음