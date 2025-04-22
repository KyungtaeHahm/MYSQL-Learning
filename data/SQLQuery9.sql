 -- SQL (RDBMS를 조작하기 위한 명령어)
 --  +@ T-SQL
 --			추가 읽고 업데이트  삭제
 -- CRUD (Create-Read-Update-Delete)

 -- Read : 유저가 접속했을 때 데이터를 읽고 실행중인 프로그램에 전달해야함
 -- ㄴ    다른 정보를 볼 때 조합해서 봐야할때도 필요
 -- ㄴ   DB 설계 계획은 정말 중요함

 -- AS 별칭

 SELECT *
 FROM players

 SELECT nameFirst, nameLast, birthYear, birthCountry
 FROM players
 WHERE birthYear = 1974 AND birthCountry != 'USA';

 -- 영어여서 SELECT가 먼저인게 맞음.
 -- FROM 책상에서 
 -- SELECT ~을 갖고와주세요

 -- ;은 무엇을 의미하는건가?
 -- select - from - where 순서대로 맞춰야함. 서로 다르게 하면 안됨.
 -- 코드 실행 로직은
 -- FROM 책상에서
 -- WHERE 빨간색 물체를
 -- SELECT 갖고와주세요

 -- 일부분만 동작시키고 싶다면 해당 구문을 드래그하고 F5를 누르면된다.

 -- SQL 명령어는 대문자,소문자, 섞어서 써도 동작에 문제가 없다. 하지만 보기 좋게 대문자로 작성 SELECT, select, SelecT 