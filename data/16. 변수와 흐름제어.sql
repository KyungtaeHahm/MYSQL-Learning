USE BaseballData;

---------------- 변수 ---------------

DECLARE @i AS INT = 10;	-- 선언과 동시에 초기화

DECLARE @j AS INT;  -- 변수 선언
SET @J = 10;		-- 변수 초기화

-- 예제) 역대 최고 연봉을 받은 선수 이름?
DECLARE @firstName AS NVARCHAR(15);
DECLARE @lastName AS NVARCHAR(15);

SET @firstName = (SELECT TOP 1 nameFirst
					FROM players AS p
						INNER JOIN salaries AS s
						ON p.playerID = s.playerID	-- 서로의 플레이어 ID가 일치할 때
					ORDER BY s.salary DESC);

-- SQL SERVER만 지원하는 문법
SELECT TOP 1 @firstName = p.nameFirst, @lastName = p.nameLast
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID	-- 서로의 플레이어 ID가 일치할 때
ORDER BY s.salary DESC

SELECT @firstName, @lastName



---------------- 배치(batch) ---------------
GO
-- GO 이후로는 다른 영역

-- 배치를 이용해 변수의 유효범위 설정 가능 { }
DECLARE @i AS INT = 10;

-- 배치는 하나의 묶음으로 분석되고 실행되는 명령어 집합

SELECT *
FOM players;

GO -- GO 이전 영역은 에러가나서 실행이 되지 않지만  GO 이후 영역은 실행이 됨.

SELECT *
FROM salaries;



---------------- 흐름 제어 ---------------

-- IF ELSE 문
GO
DECLARE @i AS INT = 6;

IF @i = 10
	PRINT('BINGO!');
ELSE
	PRINT('NO');

IF @i = 10
BEGIN	-- 여러 줄을 작성하려면 BEGIN END를 선언해줘야함
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
	IF @i = 6 BREAK;	-- C#이랑 유사함
	IF @I = 5 CONTINUE; -- CONTINUE도 마찬가지
END



---------------- 테이블 변수 ---------------

-- 임시로 사용할 테이블을 변수로 만들 수 있다.

-- testA, testB 만들고 삭제 -> NO!
-- DECLARE를 사용 -> tempdb 데이터베이스에 임시 저장

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

-- MNO 서버를 만들 때 유저목록을 봐달라고 할 때가 있음
-- 엑셀로 받은 후 임시테이블을 만들어서 유저 목록을 확인 할 수 있음