USE Northwind;

-- 인덱스 종류

-- Clustered(영한 사전) vs Non-Clustered(색인)

-- Clustered
	-- 저장이 Leaf Page에 됨. Data Page 에 실제로 저장도 됨
	-- 데이터는 Clustered Index 키 순서로 정렬

-- Non-Clustered ? (사실 Clustered Index 유무에 따라서 다르게 동작)
-- 1) Clustered Index가 없는 경우
	-- Clustered Index가 없으면 Heap Table이라는 곳에 저장
	-- Heap RID -> Heap Table에 접근해서 데이터를 추출


-- 2) Clustered Index가 있는 경우
	-- Heap Table이 없음. Leaf Table에 실제 데이터가 있다.
	-- Clustered Index의 실제 키 값을 들고 있는다.


-- 임시 테스트 테이블을 만들고 데이터를 복사
SELECT *
INTO TestOrderDetails
FROM [Order Details];

SELECT *
FROM TestOrderDetails;

-- 인덱스 추가
CREATE INDEX Index_OrderDetails
ON TestOrderDetails(OrderID, ProductID);

-- 인덱스 정보
EXEC sp_helpindex 'TestOrderDetails'; 

-- 인덱스 번호 찾기
SELECT index_id, name	-- 인덱스 id랑 name을 비교해서
FROM sys.indexes
WHERE object_id = object_id('TestOrderDetails');

-- 조회 
-- PageType 1(DATA PAGE) 2(INDEX PAGE)
--		, 테이블이름, 데이터베이스
DBCC IND('Northwind','TestOrderDetails',2);

--			1048 (root node)
--	1008 1016 1017 1018 1019 1020
-- 각각 Heap RID 가 있고 Heap RID에는 ([페이지주소(4byte)][파일ID(2)][슬롯(2)] ROW)
-- Heap RID만 있으면 ROW에 식별자 역할을 해줘서
-- Heap Table은 일련의 데이터가 있는데, 그 중에서 어떤 데이터의 몇번 슬롯에 있는지는 Heap RID가 알고 있기에. Heap RID 정보를 가지고 탐색
DBCC PAGE('Northwind', 1, 1008, 3);	-- HEAP RID를 이용해서 데이터가 있는 힙테이블에서 데이터를 꺼냄



-- Clustered 인덱스 추가
	-- OrderID가 중복일 경우 내부적으로 구별할 수 있게 UNIQUIFIER (key)가 따로 주어짐 0부터 시작..
CREATE CLUSTERED INDEX Index_OrderDetails_Clustered
ON TestOrderDetails(OrderID);

DBCC PAGE('Northwind', 1, 1024, 3);

-- 조회
-- PageType 1(DATA PAGE) 2(INDEX PAGE)
DBCC IND('Northwind', 'TestOrderDetails', 1);

-- 인덱스 레벨

--						9184
-- 9144 9152 9153 9154 9155 9156 9157 8158 9159 8160