USE BaseballData;



-- 1) ����
-- 2) ORDER BY
-- ������ �Ͼ�� ���� : order by ������ ������ �ؾ� �ϴѱ�!
SELECT *
FROM players
ORDER BY college;

-- SORT�� �Ȱɸ�
SELECT *
FROM batting
ORDER BY playerID, yearID



-- 3) GROUP BY
-- ������ �߻��ϴ� ���� college ������ �����ؾ��ϴ�.
-- ����) ���踦 �ϱ� ����
SELECT college, COUNT(college)
FROM players
WHERE college LIKE 'C%'
GROUP BY college;

-- ������ ������. �ε����� ��������... �׷��� GROUP BY�� ������ �� �ε����� ��� Ȯ���ؾ���
SELECT playerID, COUNT(playerID)
FROM players
WHERE playerID LIKE 'C%'
GROUP BY playerID;

-- 4) DISTINCT
-- ����) SORT�� �ߺ����ſ뵵�� ����
-- DISTINCT�� �ʿ����� �� �����غ�����.
SELECT DISTINCT college
FROM players
WHERE college LIKE 'C%'


-- 5) UNION
-- ���Ͽ� Ư���� Distinct (�ߺ� ����) ����� ����

SELECT college
FROM players
WHERE college LIKE 'B%'
UNION	-- ���� �ڵ忡���� ��ĥ ���� ���� B, C �� �����ϴ� �̷� ��� UNION ALL�� �����ؼ� SORT�� ����.
SELECT DISTINCT college
FROM players
WHERE college LIKE 'C%'

-- 6) ���� ������ �Լ�
-- ����) ���踦 �ϱ� ���ؼ�
SELECT ROW_NUMBER() OVER (ORDER BY college)
FROM players;

-- �ε��� ������ �ߵǾ��ִ� PLAYER ID�� �ٲٸ� SORT�� ������
SELECT ROW_NUMBER() OVER (ORDER BY playerID)
FROM players;


-- ������ ���

-- Sorting (����) �� ������!

-- O(N Log N) -> �Ϲ������� ũ�� ������ ������ �ƴ�����... DB������ �����Ͱ� ���ϰ� ���⿡
-- �� DB�� �ʹ� �뷮�� Ŀ�� ���� �޸𸮷� Ŀ���� �� �Ǵ� ��찡 ����.
--	�� �׷��� �޸𸮰� �����ϸ� ��ũ���� ã�ư��� SORTING�� ��...
--    �� �޸𸮿� ���ٰ� ��ũ ������ �ӵ��� ��û ��������..
--			��쿡 ���� �ε��� ������ �ϰų� sorting�� �ʿ����� ����ؾ��Ѵ�.

-- Sorting�� ���� �Ͼ���� �ľ��ϰ� �־�� ��


-- Sorting�� �Ͼ ��
-- 1) Sort Merge Join
	-- Sort�� �Ͼ�� ���� ) �˰��� Ư���� Merge�ϱ� ���� Sort�� �ؾ���
-- 2) ORDER BY 
-- 3) GROUP BY
-- 4) DISTINCT
-- 5) UNION
-- 6) RANKING WINDOWS FUNCTION
-- 7) MIN MAX



-- index�� �� Ȱ���ϸ�, Sorting �� ���� ���� �ʾƵ� �� -- ��, ������ ���� �ִ�.

