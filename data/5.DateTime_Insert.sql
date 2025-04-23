USE [BaseballData]
GO

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



--SELECT CAST('20200425 05:03' AS DATETIME)

-- ����ð� ����
--SELECT GETDATE();	-- TSQL������ ��� ����
--SELECT CURRENT_TIMESTAMP -- ������, ǥ����

/*
- ��Ŭ�� - ���̺� ��ũ���� - Insert

Insert 

INSERT INTO [dbo].[DateTimeTest]
           ([time])
     VALUES
           (CURRENT_TIMESTAMP) �Ǵ� (CAST('20200425 05:03' AS DATETIME)) �־ ���۵�
GO

-----

INSERT INTO [dbo].[DateTimeTest]
           ([time])
     VALUES
           ('20200425 05:04')
GO

�ص� �Ȱ��� �۵���, [time]�̱⿡ Cast() As DATETIME�� ��������� ���� �ʾƵ� ������ ������ ����

- �̰��� �߿��� ����
�� ����� ������ �񱳸� �� �� �־! - ���Ŀ� ���

SELECT *
FROM DatetimeTest;

- ���²� �Է��ߴ� DateTimeTest�� ��µ�

SELECT *
FROM DatetimeTest
WHERE time >= CAST('20210101' AS DATETIME);

- 20210101 �̻��� time�� ǥ����. , ����� CAST('' AS DATETIME)�� �����ص� ������� ����

-- ���⼭ ������ �ð� ���� ������ �ӽ�(��ǻ��)���� �ٸ�. ��, ��������� �����ؾ���
-- �׷� �� GETDATE() ���� �Լ��� �ƴ϶� GETUTCDATE();�� �����

-- SELECT GETUTCDATE();
-- ������ UTC �ð��� ��ȯ��
-- GMT (Greenwich Mean Time)

-- �׷��� �ð��� �ٸ� �� UTCDATE�� Ȱ��
==============

-- �ð��� ���õ� ������

[ DATEADD(������ ������, �󸶳� ������, ��¥) ]

SELECT DATEADD(YEAR, 1, '20200426')	-- 1���� ����

SELECT DATEADD(DAY, 5, '20200426')

SELECT DATEADD(SECOND, 123123, '20200426')

SELECT DATEADD(SECOND, -123123, '20200426') -- ���⵵ ����

SELECT DATEDIFF(SECOND, '20200426', '20200503')	-- �� ������ �ð��� SECOND�� ����

SELECT DATEDIFF(SECOND, '20200826', '20200503')	-- ���� ��¥�� Ŭ ��� -�� �����

SELECT DATEPART(DAY, '20200826') -- �ش� ��¥���� �����ϱ� ���ϴ� ���� ���� (��,��,��,��,��,�� ��...)
 
 -- ���
SELECT YEAR('20200826')
SELECT DAY('20200826');


*/


INSERT INTO [dbo].[DateTimeTest]
           ([time])
     VALUES
           ('20070929')
GO

SELECT GETUTCDATE();

SELECT *
FROM DatetimeTest
WHERE time >= '20200101'


-- �ð��� ���õ� ������

SELECT DATEADD(YEAR, 1, '20200426')	-- 1���� ����

SELECT DATEADD(DAY, 5, '20200426')

SELECT DATEADD(SECOND, -123123, '20200426')

SELECT DATEDIFF(SECOND, '20200826', '20200503')	-- �� ������ �ð��� SECOND�� ����

SELECT DATEPART(DAY, '20200826') -- �ش� ��¥���� �����ϱ� ���ϴ� ���� ���� (��,��,��,��,��,�� ��...)
 
 -- ���
SELECT YEAR('20200826')
SELECT DAY('20200826');