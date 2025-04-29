USE Northwind;

/*
	�ϸ�ũ ���

	�ε����� Ȱ���ϴµ� ��� ���� ���� ������?

	1) NonClustered
			1
		2 3 4 5 6
		- �����͸� ã�� �� �ִ� ���踦 ��� ����. heap table�� �̿�
	2) Clustered
			1
		2 3 4 5 6
		- �����Ͱ� ������ leaf page�� �ְ�

	Heap Table [ {Page} {Page} ]

	-- Clustered�� ��� Index Seek�� ���� ���� ����
	-- NonClustered�� ���, �����Ͱ� Leaf Page�� ����
	-- ���� �ѹ� �� Ÿ�� ������
	1) RID�� �̿��� Hip Table�� �̿��ϰų�	-> Bookmark Lookup
	2) Key�� �̿��� Clustered�� �̿��ϰų�

*/

SELECT *
INTO TestOrders
FROM Orders;

SELECT *
FROM TestOrders

CREATE NONCLUSTERED INDEX Orders_Index01
ON TestOrders(CustomerID);

-- �ε��� ��ȣ
SELECT index_id, name
FROM sys.indexes
WHERE object_id = object_id('TestOrders');

-- ��ȸ
-- Northwind ���̺��� TestOrders���� 2�� �ε����� ������ ���� �ʹ�.
DBCC IND('Northwind', 'TestOrders', 2);

--			1048
--   1008	1016	1017

-- Ŭ������ �������� ������ �ʾ����� Heap Table [ {Page} {Page} ]�� ���� ��


SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SET STATISTICS PROFILE ON; -- ������ ����� ������ ������

-- �⺻ Ž���� �غ���
	-- ���� �бⰡ 20�� ����. ���̺�ĵ
SELECT *
FROM TestOrders
WHERE CustomerID = 'QUICK';


-- ������ �ε����� �̿��ϰ� �غ���
	-- ���� �б� 30�� ����.
SELECT *
FROM TestOrders WITH(INDEX(Orders_Index01))
WHERE CustomerID = 'QUICK';

-- ����� ���̱� ���� ���θ�
SELECT *
FROM TestOrders WITH(INDEX(Orders_Index01))
WHERE CustomerID = 'QUICK' AND ShipVia = 3;

DROP INDEX TestOrders.Orders_Index01;

-- ����� ���̱� ���� ���θ�
-- Covered Index
CREATE NONCLUSTERED INDEX Orders_Index01
ON TestOrders(CustomerID, ShipVia);

-- 8�� ����� �õ��ؼ� 8�� �� �ξ��� ã��
SELECT *
FROM TestOrders WITH(INDEX(Orders_Index01))
WHERE CustomerID = 'QUICK' AND ShipVia = 3;

-- Q) �׷� ����1 AND ����2 �ʿ��ϸ�, ������ INDEX(����1, ����2)�� �߰����ָ� �嶯?
-- A) NO! �� �׷����� �ʴ�. DML ����(Insert, Update, Delete) �۾� ���ϰ� �����ȴ�.

DROP INDEX TestOrders.Orders_Index01;

-- ����� ���̱� ���� ���θ�
CREATE NONCLUSTERED INDEX Orders_Index01
ON TestOrders(CustomerID) INCLUDE (ShipVia);

-- 8�� ����� �õ��ؼ� 8�� �� �ξ��� ã��
SELECT *
FROM TestOrders WITH(INDEX(Orders_Index01))
WHERE CustomerID = 'QUICK' AND ShipVia = 3;

-- ���� ���� �����ܿ� ��¿��� ���� ���ٸ�...
-- Clustered Index Ȱ���� ��� �� �� �ִ�.
-- �׷��� Ŭ�����͵� �ε����� ���̺�� 1���� ����� �� �ִ�.

-- ���

-- NonClustered Index�� �ǿ����� �ִ� ���?
	-- �ϸ�ũ ����� �ɰ��� ���ϸ� �߱��� ��

--���?
	-- �ɼ�1) Covered Index (�˻��� ��� �÷��� �����ϰڴ�)
	-- �ɼ�2) Index���ٰ� Include�� ��Ʈ�� �����
	-- �ɼ�3) Clustered ��� (��, 1���� ����� �� �ִ� �ñر�..) -> NonClustered �ǿ����� �� �� ����