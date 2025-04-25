USE BaseballData;

/*
- ������(UNION)

 RDBMS (Relational ������)
�� �����͸� �������� �����ϴ�.
�� ���� ���̺�鵵 ���谡 ����

 ������ ���̺��� �ٷ�� ���

 1) Ŀ���� ��� ������ 3000000 �̻��� �������� playerID�� ����


*/

-- 1) Ŀ���� ��� ������ 3000000 �̻��� �������� playerID�� ����

SELECT playerID, AVG(salary)
FROM salaries
GROUP BY playerID	-- �׷��� �� ��� ��� ������ �� ǥ���� �� ���� Ư�� ������ ǥ���� �� ����
HAVING AVG(salary) >= 3000000

-- 2) 12���� �¾ �������� playerID
SELECT playerID, birthMonth
FROM players
WHERE birthMonth = 12

-- 3) Ŀ���� ��� ������ 3000000 �̻� || 12���� �¾ ����
-- UNION (������ (�ߺ� ���� ����)) / �ߺ����Ÿ� ������� ���� ��� UNION ALL (�ߺ� ���)

SELECT playerID
FROM salaries
GROUP BY playerID	-- �׷��� �� ��� ��� ������ �� ǥ���� �� ���� Ư�� ������ ǥ���� �� ����
HAVING AVG(salary) >= 3000000

UNION ALL-- ���� ��ġ�ؾ���. ������ ������, ������ ���ڿ��̸� �ȵ�

SELECT playerID
FROM players
WHERE birthMonth = 12
ORDER BY playerID	-- ���Ͽ��� �� ��� orderby�� �Ʒ��� �;���

-- ���� ����� 3�� 5�ÿ� UNION ALL�� ������� 3�ÿ��� ���� 5�ÿ��� ���޵Ǵ� ��ģ���� �Ͼ



-- Ŀ���� ��� ������ 3000000 �̻� && 12���� �¾ ����


SELECT playerID
FROM salaries
GROUP BY playerID
HAVING AVG(salary) >= 3000000

INTERSECT	-- ������

SELECT playerID
FROM players
WHERE birthMonth = 12
ORDER BY playerID



-- Ŀ���� ��� ������ 3000000 �̻� - 12���� �¾ ���� (������)


SELECT playerID
FROM salaries
GROUP BY playerID
HAVING AVG(salary) >= 3000000

EXCEPT	-- ������

SELECT playerID
FROM players
WHERE birthMonth = 12
ORDER BY playerID