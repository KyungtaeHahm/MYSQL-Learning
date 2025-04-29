USE BaseballData;

---------------- ���� ---------------

DECLARE @i AS INT = 10;	-- ����� ���ÿ� �ʱ�ȭ

DECLARE @j AS INT;  -- ���� ����
SET @J = 10;		-- ���� �ʱ�ȭ

-- ����) ���� �ְ� ������ ���� ���� �̸�?
DECLARE @firstName AS NVARCHAR(15);
DECLARE @lastName AS NVARCHAR(15);

SET @firstName = (SELECT TOP 1 nameFirst
					FROM players AS p
						INNER JOIN salaries AS s
						ON p.playerID = s.playerID	-- ������ �÷��̾� ID�� ��ġ�� ��
					ORDER BY s.salary DESC);

-- SQL SERVER�� �����ϴ� ����
SELECT TOP 1 @firstName = p.nameFirst, @lastName = p.nameLast
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID	-- ������ �÷��̾� ID�� ��ġ�� ��
ORDER BY s.salary DESC

SELECT @firstName, @lastName



---------------- ��ġ(batch) ---------------
GO
-- GO ���ķδ� �ٸ� ����

-- ��ġ�� �̿��� ������ ��ȿ���� ���� ���� { }
DECLARE @i AS INT = 10;

-- ��ġ�� �ϳ��� �������� �м��ǰ� ����Ǵ� ��ɾ� ����

SELECT *
FOM players;

GO -- GO ���� ������ ���������� ������ ���� ������  GO ���� ������ ������ ��.

SELECT *
FROM salaries;



---------------- �帧 ���� ---------------

-- IF ELSE ��
GO
DECLARE @i AS INT = 6;

IF @i = 10
	PRINT('BINGO!');
ELSE
	PRINT('NO');

IF @i = 10
BEGIN	-- ���� ���� �ۼ��Ϸ��� BEGIN END�� �����������
	PRINT('BINGO!');
	PRINT('BINGO!');	
END
	
ELSE
BEGIN
	PRINT('NO');
END



-- WHILE

GO

DECLARE @i AS INT = 0;
WHILE @i <= 10
BEGIN
	PRINT @i;
	SET @i = @i + 1;
	IF @i = 6 BREAK;	-- C#�̶� ������
	IF @I = 5 CONTINUE; -- CONTINUE�� ��������
END



---------------- ���̺� ���� ---------------

-- �ӽ÷� ����� ���̺��� ������ ���� �� �ִ�.

-- testA, testB ����� ���� -> NO!
-- DECLARE�� ��� -> tempdb �����ͺ��̽��� �ӽ� ����

GO

DECLARE @test TABLE
(
	name VARCHAR(50) NOT NULL,
	salary INT NOT NULL
);

INSERT INTO @test
SELECT p.nameFirst + ' ' + p.nameLast, s.salary
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID;

SELECT *
FROM @test;

-- MNO ������ ���� �� ��������� ���޶�� �� ���� ����
-- ������ ���� �� �ӽ����̺��� ���� ���� ����� Ȯ�� �� �� ����