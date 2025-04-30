USE BaseballData;
/*
Join ����

1) Nested Loop(NL) Join
2) Merge(����) Join
3) Hash(�ؽ�) Join

- NonClustered
	1
2	3	4

- Clustered 
	1
2	3	4	-- 2,3,4 ������ �ϳ��ϳ� ��Ī��. ���� ���ο� ����



*/
-- Merge. �Ʒ� �ڵ�� Merge Join�� �ϰ� ����
SELECT *
FROM players AS p
	INNER JOIN salaries AS s	-- �̳������� ����ϸ� �� �÷��̾ ���� ���ߵ� �����˻��� ����
	ON p.playerID = s.playerID;


-- NL. �Ʒ� �ڵ�� Nested Loops �� ������ �ѱ۷δ� ��ø ����
SELECT TOP 5*
FROM players AS p
	INNER JOIN salaries AS s	-- �̳������� ����ϸ� �� �÷��̾ ���� ���ߵ� �����˻��� ����
	ON p.playerID = s.playerID;


-- Hash ���
SELECT*
FROM salaries AS s
	INNER JOIN teams AS t
	ON s.teamID = t.teamID;


	-- ���⼱ NL�� ��� ��
	-- NL�� �������� �˱� ���ؼ� C#�ڵ�� �����ϸ� ���� �� �� ����
SELECT *
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID
	OPTION(LOOP JOIN);

	-- ��ø���� - ��ø���� - Clustgered Index Scan 
--						   �� Index Seek (NonClustered) -> ��ųʸ� ��İ� �����
--			    �� Key Lookup



SELECT *
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID
	OPTION(FORCE ORDER, LOOP JOIN);


-- Ư�� �������� ��Ī�Ѵٰ� �ϸ� NL�� ���� ����!
SELECT TOP 5*
FROM players AS p
	INNER JOIN salaries AS s	-- �̳������� ����ϸ� �� �÷��̾ ���� ���ߵ� �����˻��� ����
	ON p.playerID = s.playerID;


-- ������ ���

-- NL�� Ư¡
-- ���� �׼����� (OUTER) ���̺��� �ο츦 �������� ��ĵ�ϸ鼭  �¸���� (INNER)���̺� ���� �������� ��
-- (INNER) ���̺� �ε����� ������ ���... (�̷� ��� NL�� ���� �ȵ�)
-- �κ� ���� ó���� ���� (ex. Top 5)
