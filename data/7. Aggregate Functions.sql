/*
7. ���� �Լ�


USE BaseballData

-- COUNT
-- SUM
-- AVG
-- MIN
-- MAX

SELECT COUNT(*) -- ����� �� �̰� COUNT�� ������ ���� ������ �̾��ּ���. �� ����
FROM Players;

-- () �ȿ� *�� ���� �� �ִ� ���� COUNT�� ����

SELECT COUNT(birthYear)
FROM players;

-- ���� COUNT�� 16564 / �Ʒ� COUNT(birthYear)�� 16323�� ��
-- �� ������ �����Լ��� ������ null�̸� �����ϱ� ����


-- �ߺ����� birthCity�� ī��Ʈ�� ���� ���� �� DISTINCT �߰�
SELECT DISTINCT birthCity
FROM players;

-- �Ʒ��� ���� DISTINCT �� ���� �� Year, Month, Day 3���� �ߺ��� ���� ������ ����
-- ���� �ٸ� ������� ����� ���� ����� �� �� ����ϱ� ����.
SELECT DISTINCT birthYear, birthMonth, birthDay
FROM players
ORDER BY birthYear;

-- �Ʒ��� ��� DISTINCT�� �������� ����ä�� COUNT�� �߻���
-- �� ������ COUNT�� �켱������ �����ϱ� ���� 
SELECT DISTINCT COUNT(birthCity)
FROM players;

-- DISTINCT�� �ȿ� �־����
SELECT  COUNT(DISTINCT birthCity)
FROM players;


-- �������� ��� weight�� ���غ��� (pound ����)
SELECT AVG(weight)
FROM Players;

SELECT SUM(weight) / COUNT(weight)
FROM Players;

-- �������� ��� weight�� ���غ��� (pound ����)
-- weight = NULL�� ����� weight = 0�� ģ��
SELECT AVG(CASE WHEN weight IS NULL THEN 0 ELSE weight END)
FROM Players;

-- MIN MAX , ������ �ּ� ����, �ִ� ���Ը� ���� ���� ��
SELECT MIN(weight), MAX(weight)
FROM Players;



*/

USE BaseballData

-- COUNT
-- SUM
-- AVG
-- MIN
-- MAX


SELECT  COUNT(DISTINCT birthCity)
FROM players;


-- �������� ��� weight�� ���غ��� (pound ����)
SELECT AVG(weight)
FROM Players;

SELECT SUM(weight) / COUNT(weight)
FROM Players;

-- �������� ��� weight�� ���غ��� (pound ����)
-- weight = NULL�� ����� weight = 0�� ģ��
SELECT AVG(CASE WHEN weight IS NULL THEN 0 ELSE weight END)
FROM Players;

-- MIN MAX , ������ �ּ� ����, �ִ� ���Ը� ���� ���� ��
SELECT MIN(weight), MAX(weight)
FROM Players;
