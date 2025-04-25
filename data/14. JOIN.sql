USE GameDB;

/*
JOIN ��û �߿�. ������ �� �� ���� �����ϴ� ���� INDEX�� JOIN

JOIN ( ���� )

-- CROSS JOIN (���� ����)

*/

CREATE TABLE testA
(
	a INTEGER
)
CREATE TABLE testB
(
	b VARCHAR(10)
)

-- A(1, 2, 3)
INSERT INTO testA VALUES(1);
INSERT INTO testA VALUES(2);
INSERT INTO testA VALUES(3);

-- B(A, B, C)
INSERT INTO testB VALUES('A');
INSERT INTO testB VALUES('B');
INSERT INTO testB VALUES('C');


-- CROSS JOIN (���� ����) - ���� ���� ����
	-- ���� ������ �ϸ鼭 �ϳ��� ����. 2���� �迭�� ����. �� 9���� ����
		-- �����Ͱ� ���� 100���� �ִٰ� �ϸ� 10000���� ������.
--1) ���
SELECT *
FROM testA
CROSS JOIN testB

--2) ���
SELECT *
FROM testA, testB


----------------------
USE BaseballData;

SELECT *
FROM players
ORDER BY playerID;
SELECT *
FROM salaries
ORDER BY playerID; 

-- INNER JOIN ( �� ���� ���̺��� ���η� ���� + ���� ������ ON���� )
-- playerID�� players, salaries ���ʿ� �� �ְ� ��ġ�ϴ� �ֵ��� ����

SELECT *
FROM players AS p				-- players���� �̾ƿðǵ� �װ� p��� �ϰ�
	INNER JOIN salaries AS s	-- �׳� �̾ƿ��°� �ƴ϶� players�� salaries ���̺��̶� innerjoin�� �Ұǵ�
	ON p.playerID = s.playerID;	-- ���� ���̺��� playerID�� ���� �� �� �̾ƴ޶�

-- OUTER JOIN (�ܺ� ����)
	-- LEFT / RIGHT
	-- ��� ���ʿ��� �����ϴ� ������ -> ��å?

-- LEFT JOIN ( �� ���� ���̺��� ���η� ���� + ���� ������ ON���� )
-- playerID�� ����(LEFT)�� ������ ������ ǥ��. ������(salaries)�� ������ ������ ������ NULL�� ä��
-- INNER JOIN�� ���ʿ� �� �־���ϰ�, OUTER JOIN�� ��� ���ʿ��� ������ ������ ����.

SELECT *
FROM players AS p			
	LEFT JOIN salaries AS s	
	ON p.playerID = s.playerID;

-- RIGHT JOIN (�� ���� ���̺��� ���η� ���� + ���� ������ ON����)
-- PlayerID�� ������(Right)�� ������ ������ ǥ��. ����(player)�� ������ ���� ������ NULL�� ä��
SELECT *
FROM players AS p			
	RIGHT JOIN salaries AS s	
	ON p.playerID = s.playerID;
