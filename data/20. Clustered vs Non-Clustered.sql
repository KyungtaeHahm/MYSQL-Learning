USE Northwind;

-- �ε��� ����

-- Clustered(���� ����) vs Non-Clustered(����)

-- Clustered
	-- ������ Leaf Page�� ��. Data Page �� ������ ���嵵 ��
	-- �����ʹ� Clustered Index Ű ������ ����

-- Non-Clustered ? (��� Clustered Index ������ ���� �ٸ��� ����)
-- 1) Clustered Index�� ���� ���
	-- Clustered Index�� ������ Heap Table�̶�� ���� ����
	-- Heap RID -> Heap Table�� �����ؼ� �����͸� ����


-- 2) Clustered Index�� �ִ� ���
	-- Heap Table�� ����. Leaf Table�� ���� �����Ͱ� �ִ�.
	-- Clustered Index�� ���� Ű ���� ��� �ִ´�.


-- �ӽ� �׽�Ʈ ���̺��� ����� �����͸� ����
SELECT *
INTO TestOrderDetails
FROM [Order Details];

SELECT *
FROM TestOrderDetails;

-- �ε��� �߰�
CREATE INDEX Index_OrderDetails
ON TestOrderDetails(OrderID, ProductID);

-- �ε��� ����
EXEC sp_helpindex 'TestOrderDetails'; 

-- �ε��� ��ȣ ã��
SELECT index_id, name	-- �ε��� id�� name�� ���ؼ�
FROM sys.indexes
WHERE object_id = object_id('TestOrderDetails');

-- ��ȸ 
-- PageType 1(DATA PAGE) 2(INDEX PAGE)
--		, ���̺��̸�, �����ͺ��̽�
DBCC IND('Northwind','TestOrderDetails',2);

--			1048 (root node)
--	1008 1016 1017 1018 1019 1020
-- ���� Heap RID �� �ְ� Heap RID���� ([�������ּ�(4byte)][����ID(2)][����(2)] ROW)
-- Heap RID�� ������ ROW�� �ĺ��� ������ ���༭
-- Heap Table�� �Ϸ��� �����Ͱ� �ִµ�, �� �߿��� � �������� ��� ���Կ� �ִ����� Heap RID�� �˰� �ֱ⿡. Heap RID ������ ������ Ž��
DBCC PAGE('Northwind', 1, 1008, 3);	-- HEAP RID�� �̿��ؼ� �����Ͱ� �ִ� �����̺��� �����͸� ����



-- Clustered �ε��� �߰�
	-- OrderID�� �ߺ��� ��� ���������� ������ �� �ְ� UNIQUIFIER (key)�� ���� �־��� 0���� ����..
CREATE CLUSTERED INDEX Index_OrderDetails_Clustered
ON TestOrderDetails(OrderID);

DBCC PAGE('Northwind', 1, 1024, 3);

-- ��ȸ
-- PageType 1(DATA PAGE) 2(INDEX PAGE)
DBCC IND('Northwind', 'TestOrderDetails', 1);

-- �ε��� ����

--						9184
-- 9144 9152 9153 9154 9155 9156 9157 8158 9159 8160