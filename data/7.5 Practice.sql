USE BaseballData;
/*
playerID (���� ID)
yearID (����⵵)
teamID (�� ��Ī, 'BOS' = ������)
G_batting (���� ��� + Ÿ��)

AB(Ÿ��)
H (��Ÿ)
R (���)
2B (2��Ÿ)
3B (3��Ÿ)
HR (Ȩ��)
BB (����)

����
1) ������ �Ҽ� �������� �����鸸 ��� ���
2) ������ �Ҽ� �������� ���� �������? (��, playerID �ߺ��� ����)
3) ������ ���� 2004�⵵�� ģ Ȩ�� ����
4) ������ �� �Ҽ����� ���� �⵵ �ִ� Ȩ���� ģ ����� ����
*/
-- 1) ������ �Ҽ� �������� �����鸸 ��� ���
SELECT *
FROM batting
WHERE teamID = 'BOS'

-- 2) ������ �Ҽ� �������� ���� �������? (��, playerID �ߺ��� ����)
SELECT COUNT(DISTINCT playerID)
FROM batting
WHERE teamID = 'BOS'

-- 3) ������ ���� 2004�⵵�� ģ Ȩ�� ����
SELECT SUM(HR)
FROM batting
WHERE teamID = 'BOS' AND yearID = 2004

-- 4) ������ �� �Ҽ����� ���� �⵵ �ִ� Ȩ���� ģ ����� ����
SELECT TOP (1)*
FROM batting
WHERE teamID = 'BOS'
ORDER BY HR DESC

SELECT *
FROM players
WHERE playerID = 'ortizda01'

