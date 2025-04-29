USE Northwind;
/*
-- �ε��� ���� ��� (Access)
-- Index Scan VS Index Seek

- ���� �����ϸ� Index Seek�� �߸� Ȱ���� �Ǵ°ſ��� �����Ű�, Index Scan�� �߸� Ȱ���� �ȵǴ� ���� ��.
�� 100% �̺й����� ���� �ƴϱ⿡ ���� ���ǿ��� ���

*/

CREATE TABLE TestAccess
(
	id INT NOT NULL,
	name NCHAR(50) NOT NULL,
	dummy NCHAR(1000) NULL
);
GO


CREATE CLUSTERED INDEX TestAccess_CI
ON TestAccess(id);
GO

CREATE NONCLUSTERED INDEX TestAccess_NCI
ON TestAccess(name);
GO

DECLARE @i INT;
SET @i = 1;

WHILE (@i <= 500)
BEGIN
	INSERT INTO TestAccess
	VALUES (@i, 'Name' + CONVERT(VARCHAR, @i), 'Hello World ' + CONVERT(VARCHAR, @i));
	SET @i = @i + 1;
END

-- �ǽ�
-- �ε��� ����
EXEC sp_helpindex 'TestAccess';

-- �ε��� ��ȣ ���캸��
SELECT index_id, name
FROM sys.indexes
WHERE object_id = object_id('TestAccess');

-- ��ȸ
DBCC IND('Northwind', 'TestAccess', 1);
DBCC IND('Northwind', 'TestAccess', 2);

-- CLUSTERED(1) : id
--						1536 
-- 1008 ~ 9215


-- NONCLUSTERED(2) : name
--			1512
-- 1472 1473 ~1519

-- ���� �б� -> ���� �����͸� ã�� ���� ���� ������ ��
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- INDEX SCAN = LEAF PAGE ���������� �˻�
SELECT *
FROM TestAccess;


-- �����ߴµ� ����ð��� 0��..
-- INDEX SEEK, ���� �б� 7
-- �ڱⰡ ���ϴ� �� Ű���� ������ �װ� �ϳ��� �ٷ� ������ ã��
SELECT *
FROM TestAccess
WHERE id = 104;

-- Index Seek �Ӹ� �ƴ϶� Key Lookup�� �ؾ���.
-- ���� �б� 11
-- INDEX SEEK + KEY LOOKUP
SELECT *
FROM TestAccess
WHERE name = 'name5'; 


-- INDEX SCAN + KEY LOOKUP
-- n * 2 + @
-- ��쿡 ���� INDEX SCAN�� ���۰� �ƴϱ⵵ ��. ���ݰ� ���� ��Ȳ
-- ����ð��� 0, ���� �б� 22
SELECT TOP 10 *
FROM TestAccess
ORDER BY name;

-- ��������� INDEX SCAN, INDEX SEEK �� ������ ���� ���۰� �ƴϰ�, ��Ȳ������ �ٸ���