/*
- Ʈ�����

-- BEGIN TRAN;
-- COMMIT;
-- ROLLBACK;

�����ͺ��̽��� ������ �� �л��� �ϰ� ����.
�ٵ� �ϳ��� ���̺��� �ƴ� �� ���� ���̺��� ���ÿ� �����ϰ� ���� ���� ����.

PLAYER�� ������ salaries ���������� ���ÿ� �ְ� ���� ��


- ���ڼ�: ��� �۾��� �� ���� ó���ؾ��Ѵ� �׷��� ������ �������°� �߻��Ѵ�.
ALL OR NOTHING

-- �ŷ� (���� 1���� �����ߴµ� 2���� �Ǹ� ������ �߻���. �����ۺ���)
-- A�� �κ��丮���� ������ ����
-- B�� �κ��丮���ٰ� ������ �߰�
-- A�� ��� ����

 ��ȭ 
 - ��ȭ �ֹ��� ó���� �� ó���Ǿ��µ�
 - ���� ��ȭ��ġ�� �ö��� �ʴ� ������� ��.

 

*/

USE GameDB;

SELECT *
FROM accounts

-- TRAN�� ������� ������, �ڵ����� COMMIT
INSERT INTO accounts VALUES(1, 'rookiss', 100, GETUTCDATE())

DELETE accounts;

-- ���� BEGIN TRAN
	-- ���� ���ΰ�	COMMIT;
	-- ����� ���ΰ� ROLLBACK;

-- ���� / ���� ���ο� ���� COMMIT (= COMMIT�� �������� �ϰڴ�)
BEGIN TRAN;
	INSERT INTO accounts VALUES(2, 'rookiss2', 100, GETUTCDATE())
COMMIT;

-- ����
BEGIN TRY	-- ���� �� �� �ִ� ��Ȳ. ���� ����, ���� ���� ��...
	BEGIN TRAN;
	INSERT INTO accounts VALUES(1, 'rookiss', 100, GETUTCDATE())
	INSERT INTO accounts VALUES(3, 'rookiss3', 100, GETUTCDATE())
	COMMIT;
END TRY
BEGIN CATCH	-- �� ���� ���� �� �ϳ��� �����ϸ� CATCH�� ������ ��
	IF @@TRANCOUNT > 0 -- ���� Ȱ��ȭ�� Ʈ����� ���� ��ȯ
		ROLLBACK
	PRINT('ROLLBACK ����')
END CATCH

-- TRAN ����� �� ������ ��
-- TRAN �ȿ��� ��!!! ���������� ����� �ֵ鸸 ����
-- C# List<Player> List<Salary> ���������� �����ؾ��Ѵٸ� (2���� list�� ���ÿ� ���� ���� �� ��) -> lock�� ��� ���� -> (�����ϸ�) writelock (��ȣ��Ÿ���� ��) readlock (���� ��)


BEGIN TRAN;	-- ��Ʈ�� n���� ������ ���� SELECT* FROM accounts�� �ϸ� ������ ���� ����. ( ������ commit, ROLLBACK�� �����־ LOCK �ɸ� ���¿���)
	INSERT INTO accounts VALUES(1, 'rookiss', 100, GETUTCDATE())

	-- ���⼭ �� �� �ִ°� ���� �� ���� �ȿ� �۾��� ���� �ɸ��ٸ� ���ɻ� ���� �ɸ� �� ����
	ROLLBACK;