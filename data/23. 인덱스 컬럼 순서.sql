USE Northwind;
/*
복합 인덱스 컬럼 순서
 Index(A, B, C)

 NonClustered

	1
2	3	4

 Clustered

	1
 2	3	4

 - Heap Table [ {Page} {Page} ]

 - 북마크 룩업
 Leaf Page 탐색은 여전히 존재하기 때문

 [레벨, 종족] 인덱스를 걸었다면, (56레벨 휴먼)을 찾는다면

ㄴ 클러스터 인덱스 기준으로는 데이터가 하나만 있는다는 기준으로 데이터가 안 맞을 때까지 계속 검색
ㄴ 리프페이지상 쭉 훓어야 할 수도 있다

만약 조건을 56~60 휴먼으로 변경된다면?

스캔 범위가 넓어진다면 Index 순서는 큰 영향을 미침... 그걸 오늘 학습한다.



*/

SELECT *
INTO TestOrders
FROM Orders

DECLARE @i INT = 1;
DECLARE @emp INT;
SELECT @emp = MAX(EmployeeID) FROM Orders;

-- 더미 데이터를 엄청 늘리는 작업을 할거임 (830 현재 데이터 * 1000)


WHILE (@i < 1000)
BEGIN
	INSERT INTO TestOrders(CustomerID, EmployeeID, OrderDate)
	SELECT CustomerID, @emp + @i, OrderDate
	FROM Orders;
	SET @i = @i + 1;
END

CREATE NONCLUSTERED INDEX idx_emp_ord
ON TestOrders(EmployeeID, OrderDate);

CREATE NONCLUSTERED INDEX idx_ord_emp
ON TestOrders(EmployeeID, OrderDate);

SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- 두 개를 비교했을 때 논리적 읽기, 실행 계획 모두 같음
SELECT *
FROM TestOrders WITH(INDEX(idx_emp_ord))
WHERE EmployeeID = 1 AND OrderDate = CONVERT(DATETIME, '19970101');

SELECT *
FROM TestOrders WITH(INDEX(idx_ord_emp))
WHERE EmployeeID = 1 AND OrderDate = CONVERT(DATETIME, '19970101');

-- 직접 살펴보자
SELECT *
FROM TestOrders
ORDER BY EmployeeID, OrderDate;

SELECT *
FROM TestOrders
ORDER BY OrderDate, EmployeeID;


-- 범위로 찾는다면?
-- 게임으로 치면 아이템을 여러개 뿌린다면
-- 영상에선 이 둘의 논리적 읽기에 차이가 있었음. 상단이 논리적읽기 5, 하단이 논리적읽기 22. 해당 영상은 2020년도 촬영한 것
-- 현재 2025년에는 논리적읽기 가 서로 5로 차이가 없음
SELECT *
FROM TestOrders WITH(INDEX(idx_emp_ord))
WHERE EmployeeID = 1 AND OrderDate BETWEEN '19970101' AND '19970103'
--OrderDate >= '19970101' AND OrderDate <= '19970103';

SELECT *
FROM TestOrders WITH(INDEX(idx_ord_emp))
WHERE EmployeeID = 1 AND OrderDate BETWEEN '19970101' AND '19970103'

-- [!] Index(a, b, c)로 구성되었을 때, 선행에 between 사용 = 후행은 인덱스 기능 X
-- 그럼 BETWEEN 같은 비교가 등장하면 인덱스 순서만 무조건 바꿔주면 될까? -> NO!

-- BETWEEN 범위가 작을 때 -> IN-LIST로 대체하는 것을 고려 (사실상 여러번 = )
SET STATISTICS PROFILE ON;

-- 현재 논리적읽기가 11로 동일함
SELECT *
FROM TestOrders WITH(INDEX(idx_ord_emp))
WHERE EmployeeID = 1 AND OrderDate IN('19970101', '19970102', '19970103');

SELECT *
FROM TestOrders WITH(INDEX(idx_emp_ord))
WHERE EmployeeID = 1 AND OrderDate IN('19970101', '19970102', '19970103');

-- 오늘의 결론

-- 복합 컬럼 인덱스 (선행, 후행) 순서가 영향을 줄 수 있음 .. 근데 현재 버전에서는 논리적 읽기 수가 같음..
-- BETWEEN, 부등호(> <) 선행에 들어가면, 후행은 인덱스 기능을 상실
-- BETWEEN 범위가 적으면 IN-LIST로 대체하면 좋은 경우도 있다 (선행에 BETWEEN)
-- 선행=, 후행BETWEEN이라면, 아무런 문제가 없기 때문 IN-LIST X