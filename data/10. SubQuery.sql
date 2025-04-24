USE BaseballData;
/*
SubQuery (�������� / ��������)
- SQL ��ɹ� �ȿ� �����ϴ� �Ϻ� SELECT (SELECT�� �� �� �� ����Ѵ�?)


-- ������ ��������� ���� ������ ������ ����
SELECT TOP 1*
FROM salaries
ORDER BY salary DESC;

--�ش� ���� ã�ƺ���
SELECT *
FROM players
WHERE playerID = 'rodrial01'

===============================

-- �̰��� �� ���� �Ϸ���?
SELECT *
FROM players
WHERE playerID = (SELECT TOP 1 playerID FROM salaries ORDER BY salary DESC)	-- ���ο� �ִ� ���������� ���� ����Ǽ� playerID�� ����ǰ� SELECT �������� �۾�


-- �������� IN�� ����Ѵ�! ���
-- playerID = ���ϰ�
SELECT *
FROM players
WHERE playerID IN (SELECT TOP 20 playerID FROM salaries ORDER BY salary DESC) --   = ��� IN ���

-- �ϳ��� �ƴ� �������� ���. TOP20�� ����ε� 9���� ��� �Ǵµ�, �� ������ �˷��� �ε帮�Խ��� ������ �����ؼ�..


-- ���������� WHERE���� ���� ��� (80% �̻�), ������ ���������� ��� ����
SELECT (SELECT COUNT(*) FROM players) AS playerCount, (SELECT COUNT(*) FROM batting) AS battingCount;

-- INSERT������ ��� ����
SELECT *
FROM salaries
ORDER BY yearID DESC

-- INSERT INTO -- �ִ뿬�������� �Է�
	-- ���⼭ ���������� �Ϲ� ����� �ٲ�ġ�� �Ѵٰ� �����ϸ� ����. �ش� ������ Ư���� ������ �ʿ��ϴٸ� ��ü �� �� �ִ�(?) �� �����ϸ� ����
INSERT INTO salaries
VALUES (2020, 'KOR', 'NL', 'rookiss', (SELECT MAX(salary) FROM salaries))


-- INSERT SELECT
INSERT INTO salaries
SELECT 2020, 'KOR', 'NL', 'rookiss2', (SELECT MAX(salary) FROM salaries); 

-- ���̺��� �����ϰ� ���� �� ���.
	-- salaries ���� yearID, playerID, salary�� SELECT�ؼ� �����ؼ� salaries_temp�� �ִ´�.
INSERT INTO salaries_temp
SELECT yearID, playerID, salary FROM salaries;

SELECT*
FROM salaries_temp


-- ��� ���� ��������
-- EXISTS, NOT EXISTS
-- ���� ��������� ����� ���ص� �Ǵϱ� -> ��︸ �ϸ��!

-- 1) ����Ʈ ���� Ÿ�ݿ� ������ ������ ���
-- battingpost�� ������ playerID�� ����!
SELECT *
FROM players
WHERE playerID IN (SELECT playerID FROM battingpost); 

-- ������踦 �̿��Ѵٸ�
SELECT *
FROM players
WHERE (SELECT playerID FROM battingpost WHERE battingpost.playerID = players.playerID) -- ������踦 �� ��� ���������� ���� X
-- �� ������ battingpost.playerID�� ������ ������ player.playerID�� ���������� �ƴ� ������ �̾ƿ� ���̱� ���� (������ ����!)

- �Ʒ��� ���� ���۵Ǳ� ����(�ϵ��ڵ� �����)
WHERE (SELECT playerID FROM battingpost WHERE battingpost.playerID = 'rodrial01')


-- ������踦 �̿��Ѵٸ�
SELECT *
FROM players
WHERE EXISTS (SELECT playerID FROM battingpost WHERE battingpost.playerID = players.playerID)
-- EXISTS : ������ EXIST �ϰ� ������ SKIP �ض�.
-- battingpost.playerID �� �ִ� ���� players.playerID �� �ִ� ���̸� EXIST�ϰ� ������ NULL ��ȯ



*/

-- ������ ��������� ���� ������ ������ ����
SELECT TOP 1*
FROM salaries
ORDER BY salary DESC;

--�ش� ���� ã�ƺ���
SELECT *
FROM players
WHERE playerID = 'rodrial01'

-- ������ ��������� ���� ������ ������ ����
SELECT TOP 1*
FROM salaries
ORDER BY salary DESC;

--�ش� ���� ã�ƺ���
SELECT *
FROM players
WHERE playerID = 'rodrial01'


-- �������� IN�� ����Ѵ�! ���
-- playerID = ���ϰ�
SELECT *
FROM players
WHERE playerID IN (SELECT TOP 20 playerID FROM salaries ORDER BY salary DESC) --   = ��� IN ���

-- �ϳ��� �ƴ� �������� ���. TOP20�� ����ε� 9���� ��� �Ǵµ�, �� ������ �˷��� �ε帮�Խ��� ������ �����ؼ�..


-- ���������� WHERE���� ���� ��� (80% �̻�), ������ ���������� ��� ����
SELECT (SELECT COUNT(*) FROM players) AS playerCount, (SELECT COUNT(*) FROM batting) AS battingCount;

-- INSERT������ ��� ����
SELECT *
FROM salaries
ORDER BY yearID DESC

-- INSERT INTO -- �ִ뿬�������� �Է�
	-- ���⼭ ���������� �Ϲ� ����� �ٲ�ġ�� �Ѵٰ� �����ϸ� ����. �ش� ������ Ư���� ������ �ʿ��ϴٸ� ��ü �� �� �ִ�(?) �� �����ϸ� ����
INSERT INTO salaries
VALUES (2020, 'KOR', 'NL', 'rookiss', (SELECT MAX(salary) FROM salaries))


-- INSERT SELECT
INSERT INTO salaries
SELECT 2020, 'KOR', 'NL', 'rookiss2', (SELECT MAX(salary) FROM salaries); 

-- ���̺��� �����ϰ� ���� �� ���.
	-- salaries ���� yearID, playerID, salary�� SELECT�ؼ� �����ؼ� salaries_temp�� �ִ´�.
INSERT INTO salaries_temp
SELECT yearID, playerID, salary FROM salaries;

SELECT*
FROM salaries_temp


-- ��� ���� ��������
-- EXISTS, NOT EXISTS
-- ���� ��������� ����� ���ص� �Ǵϱ� -> ��︸ �ϸ��!

-- 1) ����Ʈ ���� Ÿ�ݿ� ������ ������ ���
-- battingpost�� ������ playerID�� ����!
SELECT *
FROM players
WHERE playerID IN (SELECT playerID FROM battingpost); 

-- ������踦 �̿��Ѵٸ�
SELECT *
FROM players
WHERE EXISTS (SELECT playerID FROM battingpost WHERE battingpost.playerID = players.playerID)
-- EXISTS : ������ EXIST �ϰ� ������ SKIP �ض�.
-- battingpost.playerID �� �ִ� ���� players.playerID �� �ִ� ���̸� EXIST�ϰ� ������ NULL ��ȯ

