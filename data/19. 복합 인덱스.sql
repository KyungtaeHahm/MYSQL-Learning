USE Northwind;

-- �ֹ� �� ������ ���캸��
SELECT *
FROM [Order Details]
ORDER BY OrderID;

-- �ӽ� �׽�Ʈ ���̺��� ����� �����͸� �����Ѵ�
SELECT *
INTO TestOrderDetails
FROM [Order Details];

SELECT*
FROM TestOrderDetails;

-- ���� �ε��� �߰�
CREATE INDEX Index_TestOrderDetails
ON TestOrderDetails(OrderID, ProductID);	-- ������ �ε����� �ɰڴ�

-- �ε��� ���� ���캸��
EXEC sp_helpindex 'TestOrderDetails';


-- (OrderID, ProductID)? OrderID? ProductID?
-- INDEX SCAN (INDEX FULL SCAN)-> BAD
-- INDEX SEEK -> GOOD

-- �ε��� ���� �׽�Ʈ1 -> GOOD
SELECT *
FROM TestOrderDetails
WHERE OrderID = 10248 AND ProductID = 11;

-- �ε��� ���� �׽�Ʈ2 -> GOOD
SELECT *
FROM TestOrderDetails
WHERE ProductID = 11 AND OrderID = 10248;

-- �ε��� ���� �׽�Ʈ3 -> GOOD
SELECT *
FROM TestOrderDetails
WHERE OrderID = 10248;

-- �ε��� ���� �׽�Ʈ4 -> BAD, ���̺�ĵ. �־��� ��� 2155�� ���� �о�� �� �� ����
SELECT *
FROM TestOrderDetails
WHERE ProductID = 11;

-- INDEX ����
DBCC IND('Northwind', 'TestOrderDetails', 2);

DBCC PAGE('Northwind', 1, 824, 3);

-- ���� �ε��� (A, B) ������̶�� �ε���(A) ��� ����
-- ������ B �ε� �˻��� �ʿ��ϸ� -> �ε���(B)�� ������ �ɾ���� �Ѵ�.

-- �ε����� �����Ͱ� �߰�/����/���� �����Ǿ����
-- ������ 50���� ������ �־��
-- 10248/11 10387/24

DECLARE @i INT = 0;
WHILE @i < 50
BEGIN
	INSERT INTO TestOrderDetails
	VALUES (10248, 100 + @i, 10, 1, 0)
	SET @i = @i+1;
END


-- INDEX ����

DBCC IND('Northwind', 'TestOrderDetails', 2);

DBCC PAGE('Northwind', 1, 824, 3);
DBCC PAGE('Northwind', 1, 881, 3);
-- ��� : ������ ���� ������ ���ٸ� -> ������ ���� (SPLIT) �߻�

-- ���� �׽�Ʈ
SELECT LastName
INTO TestEmployees
FROM Employees;

SELECT * FROM TestEmployees;

-- �ε��� �߰�
CREATE INDEX Index_TestEmployees
ON TestEmployees(LastName);

-- INDEX SCAN -> BAD
SELECT *
FROM TestEmployees
WHERE SUBSTRING(LastName, 1, 2) = 'Bu';	-- �ε����� �ɾ��ٰ� 100% ã�� ������ ����. SUBSTRING���� LastName�� ��� �������� �𸣴�...
-- Ű�� ������ �� ��������...

-- INDEX SEEK -> GOOD (IndexSeek ��)
SELECT *
FROM TestEmployees
WHERE LastName LIKE 'Bu%';

-- ������ ���
-- ���� �ε���(A, B)�� ����� �� ���� ���� (A->B ������ �˻��� �ϱ⿡), A,B�� ���ÿ� , A�� ����ϴ°� ��������. B �� ����ϸ� �����ε��� ����� �Ұ����ϴ�.
-- �� �����ϰ� ��Ī�ϸ� �����ϰ� �˻��Ѵ�
-- �ε��� ��� ��, ������ �߰��� ���� ������ ���� ������ ������ SPLIT
-- Ű ������ �� ����!