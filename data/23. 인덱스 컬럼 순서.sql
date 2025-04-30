USE Northwind;
/*
���� �ε��� �÷� ����
 Index(A, B, C)

 NonClustered

	1
2	3	4

 Clustered

	1
 2	3	4

 - Heap Table [ {Page} {Page} ]

 - �ϸ�ũ ���
 Leaf Page Ž���� ������ �����ϱ� ����

 [����, ����] �ε����� �ɾ��ٸ�, (56���� �޸�)�� ã�´ٸ�

�� Ŭ������ �ε��� �������δ� �����Ͱ� �ϳ��� �ִ´ٴ� �������� �����Ͱ� �� ���� ������ ��� �˻�
�� ������������ �� �f��� �� ���� �ִ�

���� ������ 56~60 �޸����� ����ȴٸ�?

��ĵ ������ �о����ٸ� Index ������ ū ������ ��ħ... �װ� ���� �н��Ѵ�.



*/

SELECT *
INTO TestOrders
FROM Orders

DECLARE @i INT = 1;
DECLARE @emp INT;
SELECT @emp = MAX(EmployeeID) FROM Orders;

-- ���� �����͸� ��û �ø��� �۾��� �Ұ��� (830 ���� ������ * 1000)


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

-- �� ���� ������ �� ���� �б�, ���� ��ȹ ��� ����
SELECT *
FROM TestOrders WITH(INDEX(idx_emp_ord))
WHERE EmployeeID = 1 AND OrderDate = CONVERT(DATETIME, '19970101');

SELECT *
FROM TestOrders WITH(INDEX(idx_ord_emp))
WHERE EmployeeID = 1 AND OrderDate = CONVERT(DATETIME, '19970101');

-- ���� ���캸��
SELECT *
FROM TestOrders
ORDER BY EmployeeID, OrderDate;

SELECT *
FROM TestOrders
ORDER BY OrderDate, EmployeeID;


-- ������ ã�´ٸ�?
-- �������� ġ�� �������� ������ �Ѹ��ٸ�
-- ���󿡼� �� ���� ���� �б⿡ ���̰� �־���. ����� �����б� 5, �ϴ��� �����б� 22. �ش� ������ 2020�⵵ �Կ��� ��
-- ���� 2025�⿡�� �����б� �� ���� 5�� ���̰� ����
SELECT *
FROM TestOrders WITH(INDEX(idx_emp_ord))
WHERE EmployeeID = 1 AND OrderDate BETWEEN '19970101' AND '19970103'
--OrderDate >= '19970101' AND OrderDate <= '19970103';

SELECT *
FROM TestOrders WITH(INDEX(idx_ord_emp))
WHERE EmployeeID = 1 AND OrderDate BETWEEN '19970101' AND '19970103'

-- [!] Index(a, b, c)�� �����Ǿ��� ��, ���࿡ between ��� = ������ �ε��� ��� X
-- �׷� BETWEEN ���� �񱳰� �����ϸ� �ε��� ������ ������ �ٲ��ָ� �ɱ�? -> NO!

-- BETWEEN ������ ���� �� -> IN-LIST�� ��ü�ϴ� ���� ��� (��ǻ� ������ = )
SET STATISTICS PROFILE ON;

-- ���� �����бⰡ 11�� ������
SELECT *
FROM TestOrders WITH(INDEX(idx_ord_emp))
WHERE EmployeeID = 1 AND OrderDate IN('19970101', '19970102', '19970103');

SELECT *
FROM TestOrders WITH(INDEX(idx_emp_ord))
WHERE EmployeeID = 1 AND OrderDate IN('19970101', '19970102', '19970103');

-- ������ ���

-- ���� �÷� �ε��� (����, ����) ������ ������ �� �� ���� .. �ٵ� ���� ���������� ���� �б� ���� ����..
-- BETWEEN, �ε�ȣ(> <) ���࿡ ����, ������ �ε��� ����� ���
-- BETWEEN ������ ������ IN-LIST�� ��ü�ϸ� ���� ��쵵 �ִ� (���࿡ BETWEEN)
-- ����=, ����BETWEEN�̶��, �ƹ��� ������ ���� ���� IN-LIST X