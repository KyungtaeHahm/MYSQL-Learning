USE BaseballData;

/*
-- ������ ��� ������ �м��ϰ� �ʹ� -> Grouping
-- �̷��� �ۼ��ϸ� �۵����� ����

SELECT *
FROM batting
WHERE yearID = 2004
GROUP BY teamID

=== �Ʒ��� ���� �ۼ�
SELECT teamID
FROM batting
WHERE yearID = 2004
GROUP BY teamID


-- 2004�⵵�� ���� ���� Ȩ���� ���� ����?

SELECT TOP 1 teamID, SUM(HR) AS HomeRun
FROM batting
WHERE yearID = 2004
GROUP BY teamID
ORDER BY HomeRun DESC;


-- 2004�⵵�� 200 Ȩ�� �̻��� ���� ���� ���?
-- SUM(HR) >= 200 �� �Ϸ��� ������ SELECT���� ���� ������ ������ �ȵ�
-- SELECT ���� ���� : FROM - WHERE - GROUP BY - HAVING - SELECCT - ORDER BY
-- HAVING�� ����

SELECT teamID, SUM(HR) AS HomeRun
FROM batting
WHERE yearID = 2004
GROUP BY teamID
HAVING SUM(HR) >= 200	-- �׷��⿡ Ǯ� ������� HomeRun�̶�� �ϸ� ������ ���� ����.
ORDER BY homeRun DESC;

-- �ٵ� ������ . ��𿡼� HomeRun�� ���� ��� HR�� �����.

FROM		å�󿡼�
WHERE		����
GROUP BY	���󺰷� �з��ؼ�
HAVING		�з��� �� ������ �������� �����ϰ�(�߰������� �Ŵ� ��)
SELECT		���� �ͼ�
ORDER BY	ũ�� ���� �������ּ���

�׸��� ������ ��� �ȵ�!

*/

SELECT *
FROM batting
WHERE yearID = 2004
ORDER BY teamID

-- ������ ��� ������ �м��ϰ� �ʹ� -> Grouping
-- GROUP BY ���� �򰥸�.
SELECT teamID, COUNT(teamID) AS playerCount, SUM(HR) AS HomeRun	-- �� �� ID ���� ������ � �ִ��� ���� (�ش� teamID�� �����)
FROM batting
WHERE yearID = 2004
GROUP BY teamID

-- 2004�⵵�� ���� ���� Ȩ���� ���� ����?

SELECT TOP 1 teamID, SUM(HR) AS HomeRun
FROM batting
WHERE yearID = 2004
GROUP BY teamID
ORDER BY HomeRun DESC;


-- 2004�⵵�� 200 Ȩ�� �̻��� ���� ���� ���?
-- SUM(HR) >= 200 �� �Ϸ��� ������ SELECT���� ���� ������ ������ �ȵ�
-- SELECT ���� ���� : FROM - WHERE - GROUP BY - HAVING - SELECCT - ORDER BY
-- HAVING�� ����

 

-- �ٵ� ������ . ��𿡼� HomeRun�� ���� ��� HR�� �����.

-- ���� �⵵�� ���� ���� Ȩ���� ���� ����?
SELECT teamID, SUM(HR) AS HomeRun
FROM batting
GROUP BY teamID, yearID
ORDER BY HomeRun DESC;

-- BOS 2004 / BOS 2005 �⵵�� �ٸ��� �ٸ��� �з��ϰ� ����