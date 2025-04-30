USE Northwind;

/*
	- Hash Join
	-- 인덱스가 없을 때 강함!

*/

SELECT * INTO TestOrders FROM Orders;
SELECT * INTO TestCustomers FROM Customers;

SELECT * FROM TestOrders;		-- 830개
SELECT * FROM TestCustomers;	-- 91개

-- HASH를 이용한 방식
SELECT *
FROM TestOrders AS o
	INNER JOIN TestCustomers AS c
	ON o.CustomerID = c.CustomerID;

-- NL ( inner 테이블에 인덱스가 없어서 문제가 발생)
SELECT *
FROM TestOrders AS o		-- Outer Table
	INNER JOIN TestCustomers AS c	-- Inner Table // 현재 TestCustomers 에 인덱스가 안 걸려있는 상태
	ON o.CustomerID = c.CustomerID
	OPTION (FORCE ORDER, LOOP JOIN);

-- Merge (OUTER, INNER 모두 SORT 해야함. 유일성이 보장되지 않으니 MANY TO MANY 로 작업) - 비효율
SELECT *
FROM TestOrders AS o	
	INNER JOIN TestCustomers AS c	
	ON o.CustomerID = c.CustomerID
	OPTION (FORCE ORDER, MERGE JOIN);

-- HASH
	-- 작은 쪽을 HashTable로!
SELECT *
FROM TestOrders AS o
	INNER JOIN TestCustomers AS c
	ON o.CustomerID = c.CustomerID;

	-- 오늘의 결론 --

-- Hash 조인의 특징

-- 1) 정렬이 필요하지 않다 -> 데이터가 너무 많아서 Merge가 부담스러울 때, Hash가 대안이 될 수 있음
-- 2) 인덱스 유무에 영향을 받지 않는다 ★★★★★
-- ㄴ NL / Merge에 비해 확실한 장점!
-- ㄴ HashTable 만드는 비용을 무시하면 안 됨! (수행 빈도가 많으면 -> 결국 Index 추가해줘서 관리해야 할 수도 있다.)
-- 3) 랜덤 엑세스 위주로 수행되지 않는다.
-- 4) 데이터가 적은 쪽을 HashTable로 만드는 것이 유리하다