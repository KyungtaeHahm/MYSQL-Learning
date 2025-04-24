/*
-- INSERT DELETE UPDATE

SELECT *
FROM salaries
ORDER BY yearID DESC;

-- INSERT INTO [���̺��] VALUES [��, ...]
INSERT INTO salaries
VALUES (2020, 'KOR', 'NL', 'rookiss', 9000000);

-- �����͸� �ϳ� ��������? -> Error

INSERT INTO salaries
VALUES (2020, 'KOR', 'NL', 'rookiss');

-- INSERT INTO [���̺��](��, ...) VALUES (��, ...)
INSERT INTO salaries(yearID, teamID, playerID, lgID, salary)
VALUES (2020, 'KOR', 'rookiss2', 'NL', 8000000);

-> 2�� �μ�Ʈ �ҽ� �Ʒ��� ���� PRIMARY KEY �������� ���� �߻� 
PRIMARY KEY ���� ���� 'PK__salaries__756A47DC8E9728D7'��(��) �����߽��ϴ�. ��ü 'dbo.salaries'�� �ߺ� Ű�� ������ �� �����ϴ�. 
�ߺ� Ű ���� (2020, KOR, NL, rookiss2)�Դϴ�.
-> �����ϰ� ���̺� �����ο��� Ű ǥ�ð� ���ִ� �࿡ �Ȱ��� ������ 2�� �̻� ������ �ȵ�


-- ������ ���̺� ���� Allow Nulls �� üũǥ�ð� �Ǿ������� ������ ���ϸ� NULL�� ä����.
-- �׷��� �Ʒ� ���Ӽ��� �⺻�� �Ǵ� ���ε��� NULL�� �⺻�ε� ���� 0���� �ٲٸ� 0���� �����

INSERT INTO salaries(yearID, teamID, playerID, lgID)
VALUES (2020, 'KOR', 'rookiss3', 'NL');

��> ���̺� ������ ���� �Է� ���ص� �Ǵ� ��찡 ����. �ᱹ ���� ������ �������� salary NULL�� ����



-- DELETE FROM[���̺��]
-- �� �̴�� ���� ���̺� ��� �� ����. ���� ����!

-- DELETE FROM [���̺��] WHERE[����]
-- �� �̿� ���� ���� ��� �ۼ��ؾ���
DELETE FROM salaries
WHERE playerID = 'rookiss3'

-- ���� �� rookiss3 ������ �����

-- 2020�� ���� ���� ������ ���̺� ����
DELETE FROM salaries
WHERE yearID >= 2020




-- UPDATE [���̺��] SET [�� = ��, ] WHERE [����]
UPDATE salaries
SET salary = salary * 2, yearID = yearID + 1  -- �������� ������.
WHERE teamID = 'KOR'

DELETE	  vs   UPDATE

���� ���� vs �� ����

���� �ѷ� �����ϸ� 30���� ������ ������ ����.
�� �׷� ��� �� ������ UPDATE.

- ���� �������� ���� DELETE�� �Ǿ��ٸ� ������ �Ұ�����

- ������ �������� ��ŷ�ϰ� ���� ��쵵 ��������. ���������� �����ϸ� LOG �м��� �����

*/


USE BaseballData;


-- INSERT DELETE UPDATE

SELECT *
FROM salaries
ORDER BY yearID DESC;

-- INSERT INTO [���̺��] VALUES [��, ...]
INSERT INTO salaries
VALUES (2020, 'KOR', 'NL', 'rookiss', 9000000);

-- INSERT INTO [���̺��](��, ...) VALUES (��, ...)
INSERT INTO salaries(yearID, teamID, playerID, lgID, salary)
VALUES (2020, 'KOR', 'rookiss2', 'NL', 8000000);

-- ������ ���̺� ���� Allow Nulls �� üũǥ�ð� �Ǿ������� ������ ���ϸ� NULL�� ä����.
-- �׷��� �Ʒ� ���Ӽ��� �⺻�� �Ǵ� ���ε��� NULL�� �⺻�ε� ���� 0���� �ٲٸ� 0���� �����

INSERT INTO salaries(yearID, teamID, playerID, lgID)
VALUES (2020, 'KOR', 'rookiss3', 'NL');



-- DELETE FROM[���̺��]
-- �� �̴�� ���� ���̺� ��� �� ����. ���� ����!

-- DELETE FROM [���̺��] WHERE[����]
-- �� �̿� ���� ���� ��� �ۼ��ؾ���
DELETE FROM salaries
WHERE playerID = 'rookiss3'

-- ���� �� rookiss3 ������ �����0


-- UPDATE [���̺��] SET [�� = ��, ] WHERE [����]
UPDATE salaries
SET salary = salary * 2, yearID = yearID + 1
WHERE teamID = 'KOR'

