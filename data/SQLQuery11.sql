

/*
[ ��ġ�� ���ڿ� ]

-- 2021 - 1934 ���α׷��� �ؼ� �ߴ� ��Ģ����
-- +,-,/,*,% ���� ������


SELECT 2021 - birthYear AS koreanAge
FROM players 
WHERE deathYear IS NULL AND birthYear IS NOT NULL AND koreanAge <= 80
ORDER BY koreanAge

WHERE �������� ������ ��.
��> �������� ������

-- FROM		å�󿡼�
-- WHERE	������ ����
-- SELECT	���� ����
-- ORDERBY	ũ�� ������ �����ض�

SELECT���� ������ ������ WHERE�� ���� ����

�׷��� WHERE �������� koreanAge�� �ƴ� birthYear�� �����

SELECT 2021 - NULL , NULL�� �������� �ʴ� ���̹Ƿ� �ش� ������ ���� NULL�� ����. �׷��� ����

SELECT 3 / 2;	-- ����� 1�� ����. ������ ������ ������ .5�� �߸�.
SELECT 3.0 / 2;	-- ����� 1.5�� ����. �ϳ��� �Ҽ��ϰ�� �Ҽ��γ���.


- �� �� �پ��� �Լ��� ����. SIN - SQL���� Ȯ�� ������

SELECT ROUND(3.1414141414,3); -- �ڿ��� 3��°���� �ڸ�

SELECT POWER(2, 3)		-- 2^3

SELECT COS(0)

*/
USE BaseballData;





SELECT 2021 - birthYear AS koreanAge
FROM players 
WHERE deathYear IS NULL AND birthYear IS NOT NULL AND (2021 - birthYear) <= 80
ORDER BY koreanAge