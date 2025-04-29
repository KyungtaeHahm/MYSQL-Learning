USE Northwind;

-- 주문 상세 정보를 살펴보자
SELECT *
FROM [Order Details]
ORDER BY OrderID;

-- 임시 테스트 테이블을 만들고 데이터를 복사한다
SELECT *
INTO TestOrderDetails
FROM [Order Details];

SELECT*
FROM TestOrderDetails;

-- 복합 인덱스 추가
CREATE INDEX Index_TestOrderDetails
ON TestOrderDetails(OrderID, ProductID);	-- 쌍으로 인덱스를 걸겠다

-- 인덱스 정보 살펴보기
EXEC sp_helpindex 'TestOrderDetails';


-- (OrderID, ProductID)? OrderID? ProductID?
-- INDEX SCAN (INDEX FULL SCAN)-> BAD
-- INDEX SEEK -> GOOD

-- 인덱스 적용 테스트1 -> GOOD
SELECT *
FROM TestOrderDetails
WHERE OrderID = 10248 AND ProductID = 11;

-- 인덱스 적용 테스트2 -> GOOD
SELECT *
FROM TestOrderDetails
WHERE ProductID = 11 AND OrderID = 10248;

-- 인덱스 적용 테스트3 -> GOOD
SELECT *
FROM TestOrderDetails
WHERE OrderID = 10248;

-- 인덱스 적용 테스트4 -> BAD, 테이블스캔. 최악의 경우 2155개 행을 읽어야 할 수 있음
SELECT *
FROM TestOrderDetails
WHERE ProductID = 11;

-- INDEX 정보
DBCC IND('Northwind', 'TestOrderDetails', 2);

DBCC PAGE('Northwind', 1, 824, 3);

-- 따라서 인덱스 (A, B) 사용중이라면 인덱스(A) 없어도 무방
-- 하지만 B 로도 검색이 필요하면 -> 인덱스(B)는 별도로 걸어줘야 한다.

-- 인덱스는 데이터가 추가/갱신/삭제 유지되어야함
-- 데이터 50개를 강제로 넣어보자
-- 10248/11 10387/24

DECLARE @i INT = 0;
WHILE @i < 50
BEGIN
	INSERT INTO TestOrderDetails
	VALUES (10248, 100 + @i, 10, 1, 0)
	SET @i = @i+1;
END


-- INDEX 정보

DBCC IND('Northwind', 'TestOrderDetails', 2);

DBCC PAGE('Northwind', 1, 824, 3);
DBCC PAGE('Northwind', 1, 881, 3);
-- 결론 : 페이지 여유 공간이 없다면 -> 페이지 분할 (SPLIT) 발생

-- 가공 테스트
SELECT LastName
INTO TestEmployees
FROM Employees;

SELECT * FROM TestEmployees;

-- 인덱스 추가
CREATE INDEX Index_TestEmployees
ON TestEmployees(LastName);

-- INDEX SCAN -> BAD
SELECT *
FROM TestEmployees
WHERE SUBSTRING(LastName, 1, 2) = 'Bu';	-- 인덱스만 걸었다고 100% 찾는 보장이 없음. SUBSTRING으로 LastName이 어떻게 가공될지 모르니...
-- 키를 가공할 때 조심하자...

-- INDEX SEEK -> GOOD (IndexSeek 뜸)
SELECT *
FROM TestEmployees
WHERE LastName LIKE 'Bu%';

-- 오늘의 결론
-- 복합 인덱스(A, B)를 사용할 때 순서 주의 (A->B 순서로 검색을 하기에), A,B를 동시에 , A만 사용하는거 괜찮지만. B 만 사용하면 복합인덱스 사용이 불가능하다.
-- ㄴ 엉뚱하게 서칭하면 엉뚱하게 검색한다
-- 인덱스 사용 시, 데이터 추가로 인해 페이지 여유 공간이 없으면 SPLIT
-- 키 가공할 때 주의!