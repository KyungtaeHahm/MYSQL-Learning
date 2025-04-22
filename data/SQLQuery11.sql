

/*
[ ���� ]

SELECT *
FROM players;

������ �� �� �� �� ��ܿ� USE BaseballData; �� ����

���� �н� �� ���� Order by ( ���� )

WHERE birthYear IS NOT NULL		-- ORDER BY�� ����� ���� �ֻ�ܿ� NULL ���� �켱����
ORDER BY birthYear DESC, birthMonth DESC, birthDay DESC;		-- ASC : ���� -> ū / DESC : ASC�� ���� / �̱��Խ� �ڵ����� ASC
�������� ����

SELECT TOP (10) * -- TOP 10�� ���� ���� ��
SELECT TOP 1 PERCENT *	-- ��ü�� 1%�� �����ּ���
���� MYSQL���� ��ɾ �ٸ� / ġ������ ����. TOP 100�� ����ϰ� ���� �� 100~200 �߰��� ���� �� ����� ����. TOP�̱� ������....

�ذ��� : OFFSET 100 ROWS FETCH NEXT 100 ROWS ONLY;	-- 100 ���� ���� �ǳʶٰ� �� ���� 100���� ��������
*/
USE BaseballData;

-- 100~200

SELECT *	-- ��ü�� 1%�� �����ּ���

FROM players
WHERE birthYear IS NOT NULL		-- ORDER BY�� ����� ���� �ֻ�ܿ� NULL ���� �켱����
ORDER BY birthYear DESC, birthMonth DESC, birthDay DESC	-- ASC : ���� -> ū / DESC : ASC�� ���� / �̱��Խ� �ڵ����� ASC
OFFSET 100 ROWS FETCH NEXT 100 ROWS ONLY;	-- 100 ���� ���� �ǳʶٰ� �� ���� 100���� ��������