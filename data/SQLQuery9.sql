SELECT TOP (1000) [yearID]
      ,[teamID]
      ,[lgID]
      ,[playerID]
      ,[salary]
  FROM [BaseballData].[dbo].[salaries]

 -- SQL (RDBMS를 조작하기 위한 명령어)
 --  +@ T-SQL
 --			추가 읽고 업데이트  삭제
 -- CRUD (Create-Read-Update-Delete)

 -- Read : 유저가 접속했을 때 데이터를 읽고 실행중인 프로그램에 전달해야함
 -- ㄴ    다른 정보를 볼 때 조합해서 봐야할때도 필요
 -- ㄴ   DB 설계 계획은 정말 중요함