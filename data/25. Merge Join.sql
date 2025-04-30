USE BaseballData;

SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SET STATISTICS PROFILE ON;

/*
- Merge(����) Join = Sort Merge(���� ����) ����
�� �����ϰ� �����ϴ� Join

*/

-- MANY TO MANY = TRUE ��
SELECT *
FROM players p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID;

-- One-To-Many (outer�� unique �ؾ� �� => PK, Unique)
-- Merge ���ε� ������ �ٴ´� 
-- ������ Random Access-> Clustered Scan �� ����


SELECT *
FROM schools AS s
	INNER JOIN schoolsplayers AS p	-- 
	ON s.schoolID = p.schoolID; 
-- ���
	-- MERGE -> Sort Mege ����

/*
	1) ���� ������ Sort(����)�ϰ� Merge(����)�Ѵ�
	�� �� �� ���ĵ� ���¶�� Sort�� ����. Ư��, Clustered�� ������ ���ĵ� ���¶�� Best)
	�� ������ �����Ͱ� �ʹ� ������ Worst -> Hash�� �����

	2) RandomAccess ���ַ� ������� �ʴ´�
	
	3) Many-to-Many(�ٴ��) ���ٴ� One-To-Many(�ϴ��) ���ο� ȿ������
		-- PK, UNIQUE�� ���� �� ȿ������
	
	
	*/