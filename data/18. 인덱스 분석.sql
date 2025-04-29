USE Northwind;

-- DB 정보 살펴보기

EXEC sp_helpdb 'Northwind';

-- 임시 테이블 만들자! (인덱스 테스트용)
CREATE TABLE Test
(
	EmployeeID	INT NOT NULL,
	LastName	NVARCHAR(20) NULL,
	FirstName	NVARCHAR(20) NULL,
	HireDate	DATETIME NULL
);
GO

INSERT INTO Test
SELECT EmployeeID, LastName, FirstName, HireDate
FROM Employees;

SELECT *
FROM Test;

-- FILLFACTOR (리프 페이지 공간 1%만 사용) - 100% 중에. 99% 는 비어두겠다.
-- PAD_INDEX (FILLFACTOR 중간 페이지 적용)
CREATE INDEX Test_Index ON Test(LastName)
WITH (FILLFACTOR = 1, PAD_INDEX = ON)
GO

-- 인덱스 번호 찾기
SELECT index_id, name
FROM sys.indexes
WHERE object_id = object_id('Test');

-- 2번 인덱스 정보 살펴보기
DBCC IND('Northwind', 'Test', 2);

-- Root(2) -> Branch(1) -> Leaf(0)

-- 데이터를 찾을 때 트리구조로 찾음.

-- Table[ {Page} {Page} {Page} {Page} {Page} ]
-- ㄴ RID를 이용해서 실제 정보 위치를 찾아서 Page를 찾아냄

-- 만약 Callahan이란 사람을 찾으면 트리구조로 찾음. 알파벳으로 값을 비교해서 왼쪽오른쪽으로 감.
-- 찾으면 RID 값을 추출할 수 있음. 그렇게 인덱스 저장 및 탐색구조를 알 수 있음 (EX) 이진트리형태)

-- HEAP RID([페이지 주소(4)][파일ID(2)][슬롯번호(2)] 조합한 ROW 식별자. 테이블에서 정보 추출)
DBCC PAGE('Northwind', 1 /*파일번호*/, 1016 /*페이지번호*/, 3/*출력옵션*/);
DBCC PAGE('Northwind', 1 /*파일번호*/, 1024 /*페이지번호*/, 3/*출력옵션*/);
DBCC PAGE('Northwind', 1 /*파일번호*/, 1025 /*페이지번호*/, 3/*출력옵션*/);

DBCC PAGE('Northwind', 1 /*파일번호*/, 1032 /*페이지번호*/, 3/*출력옵션*/);
DBCC PAGE('Northwind', 1 /*파일번호*/, 1033 /*페이지번호*/, 3/*출력옵션*/);
DBCC PAGE('Northwind', 1 /*파일번호*/, 1056 /*페이지번호*/, 3/*출력옵션*/);

-- Random Access (한 건 읽기 위해 한 페이지씩 접근)
-- Bookmark Loookup (RID를 통해 행을 찾는다)