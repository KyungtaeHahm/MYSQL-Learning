/*
DATE �� / �� / �� ����
TIME �� / �� / ��
DATETIME ��/��/��/��/��/��

 ���󸶴� ������� �ٸ��� ���� ���� �������� ������ ����
 YYYYMMDD ����1
 YYYYMMDD hh:mm:ss.nnn	�� �� �� �ú���
 �� SELECT CAST('20200425 05:03:02' AS DATETIME)
 �� ����� �ڿ� ���� �߶� �Ľ��� ��. �ٵ� / �� ������ ��ȯ �ȵǰ�...
 YYYY-MM-DDThh:mm

 -- ����ð� ����
SELECT GETDATE();	-- TSQL������ ��� ����
SELECT CURRENT_TIMESTAMP -- ������, ǥ����
*/

SELECT CAST('20200425 05:03' AS DATETIME)

-- ����ð� ����
SELECT GETDATE();	-- TSQL������ ��� ����
SELECT CURRENT_TIMESTAMP -- ������, ǥ����

