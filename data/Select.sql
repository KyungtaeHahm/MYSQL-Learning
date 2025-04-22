 -- SQL (RDBMS를 조작하기 위한 명령어)
 --  +@ T-SQL
 --			추가 읽고 업데이트  삭제
 -- CRUD (Create-Read-Update-Delete)

 -- Read : 유저가 접속했을 때 데이터를 읽고 실행중인 프로그램에 전달해야함
 -- ㄴ    다른 정보를 볼 때 조합해서 봐야할때도 필요
 -- ㄴ   DB 설계 계획은 정말 중요함

 -- AS 별칭

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

 -- WHERE birthYear = 1974 AND birthCountry != 'USA'; AND OR 로 써야함
  -- AND문이 OR문보다 우선순위가 높음
 -- 다음과 같음.							 WHERE birthYear = 1974 OR (birthCountry != 'USA' AND weight > 185);
 -- 그러기에 구분시 명시적으로 괄호로 작성

 -- NULL 값
 -- 만약 살아있는 사람을 볼 것이라면 DeathYear가 Null 인 사람만 보면 됨.
 --  WHERE deathYear != NULL 이라고 하면 안됨. NULL이 없는 값이라서...
 --  WHERE deathYear IS NULL / IS NOT NULL 이라고 해야 정상작동!

  -- WHERE birthCity Like 'New Yor_'; 
  -- 패턴 매칭 % : 임의의 문자열,  _ : 임의의 문자 1개

  -- DB에서 바로 Delete를 하는 게아니라 앞에 Deleted_로 붙이는 걸로 변경해서 DB 검색 안되게함. 그 이유는 나중에 실수라고 복원을 원한다면? 복원 해주기 위해 DELETE_ 찾고 복원시킴

 SELECT *
 FROM players
 WHERE birthCity Like 'New Yor_';

 

 SELECT nameFirst, nameLast, birthYear, birthCountry
 FROM players
 WHERE birthYear = 1974 OR birthCountry != 'USA' AND weight > 185;


