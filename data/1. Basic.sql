/*

SELECT '�ȳ��ϼ���' 
�� ����� ???? �� ����.
��> �ѱ��� �����ڵ� 2����Ʈ�̱⿡ �տ� N Ű���带 �־�� ������

SELECT N'�ȳ��ϼ���'

SELECT 'Hello ' + 'World' - Ȱ��!

SELECT SUBSTRING('20200425', 1, 4);	-- 2��° �Ű������� �������� 3��° �Ű��������� ���� �������� ���� ��.

SELECT TRIM('            Helloworld'); -- ���� ���ڸ� ������

�������� ������ 0�� �ƴ϶� 1 ��!

*/

USE BaseballData;


SELECT nameFirst + ' ' + nameLast AS fullName
FROM players
WHERE nameFirst IS NOT NULL AND nameLast IS NOT NULL;