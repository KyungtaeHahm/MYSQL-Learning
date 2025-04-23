USE [BaseballData]
GO

/*
DATE 연 / 월 / 일 관리
TIME 시 / 분 / 초
DATETIME 연/월/일/시/분/초

 나라마다 년월일이 다른데 위의 예가 문제없이 동작한 이유
 YYYYMMDD 포맷1
 YYYYMMDD hh:mm:ss.nnn	년 월 일 시분초
 ㄴ SELECT CAST('20200425 05:03:02' AS DATETIME)
 ㄴ 참고로 뒤에 것을 잘라도 파싱이 됨. 근데 / 를 넣으면 변환 안되고...
 YYYY-MM-DDThh:mm

 -- 현재시간 추출
SELECT GETDATE();	-- TSQL에서만 사용 가능
SELECT CURRENT_TIMESTAMP -- 범용적, 표준임
*/



--SELECT CAST('20200425 05:03' AS DATETIME)

-- 현재시간 추출
--SELECT GETDATE();	-- TSQL에서만 사용 가능
--SELECT CURRENT_TIMESTAMP -- 범용적, 표준임

/*
- 우클릭 - 테이블 스크립팅 - Insert

Insert 

INSERT INTO [dbo].[DateTimeTest]
           ([time])
     VALUES
           (CURRENT_TIMESTAMP) 또는 (CAST('20200425 05:03' AS DATETIME)) 넣어도 동작됨
GO

-----

INSERT INTO [dbo].[DateTimeTest]
           ([time])
     VALUES
           ('20200425 05:04')
GO

해도 똑같이 작동함, [time]이기에 Cast() As DATETIME을 명시적으로 쓰지 않아도 이전과 동작이 같음

- 이것이 중요한 이유
ㄴ 년월일 가지고 비교를 할 수 있어서! - 추후에 배움

SELECT *
FROM DatetimeTest;

- 여태껏 입력했던 DateTimeTest가 출력됨

SELECT *
FROM DatetimeTest
WHERE time >= CAST('20210101' AS DATETIME);

- 20210101 이상의 time을 표시함. , 참고로 CAST('' AS DATETIME)을 생략해도 결과값은 같음

-- 여기서 함정은 시간 기준 각각의 머신(컴퓨터)마다 다름. 즉, 시차계산을 생각해야함
-- 그럴 땐 GETDATE() 같은 함수가 아니라 GETUTCDATE();를 사용함

-- SELECT GETUTCDATE();
-- 현재의 UTC 시간을 반환함
-- GMT (Greenwich Mean Time)

-- 그래서 시간을 다를 때 UTCDATE를 활용
==============

-- 시간과 관련된 연산자

[ DATEADD(무엇을 더할지, 얼마나 더할지, 날짜) ]

SELECT DATEADD(YEAR, 1, '20200426')	-- 1년을 더함

SELECT DATEADD(DAY, 5, '20200426')

SELECT DATEADD(SECOND, 123123, '20200426')

SELECT DATEADD(SECOND, -123123, '20200426') -- 빼기도 가능

SELECT DATEDIFF(SECOND, '20200426', '20200503')	-- 이 사이의 시간을 SECOND로 추출

SELECT DATEDIFF(SECOND, '20200826', '20200503')	-- 앞의 날짜가 클 경우 -로 추출됨

SELECT DATEPART(DAY, '20200826') -- 해당 날짜에서 추출하기 원하는 것을 추출 (년,월,일,시,분,초 중...)
 
 -- 축약
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


-- 시간과 관련된 연산자

SELECT DATEADD(YEAR, 1, '20200426')	-- 1년을 더함

SELECT DATEADD(DAY, 5, '20200426')

SELECT DATEADD(SECOND, -123123, '20200426')

SELECT DATEDIFF(SECOND, '20200826', '20200503')	-- 이 사이의 시간을 SECOND로 추출

SELECT DATEPART(DAY, '20200826') -- 해당 날짜에서 추출하기 원하는 것을 추출 (년,월,일,시,분,초 중...)
 
 -- 축약
SELECT YEAR('20200826')
SELECT DAY('20200826');