USE BaseballData;

/*
- DB 설계

-- 우선 데이터베이스를 만들어야 한다.
-- 참고 ) 데이터베이스를 Schema(스키마) 라고도 함


CREATE DATABASE GameDB;

USE GameDB;


-- 테이블 생성(CREATE) / 삭제 (DROP) / 변경 (ALTER)

-- CREATE TABLE 테이블명(열이름 자료형 [DEFAULT 기본값] [NULL | NOT NULL], ...)

-- 디자인에 들어가서 직접 만드는 걸 코드로도 작성이 가능하다!
CREATE TABLE accounts(
	accountId INTEGER NOT NULL,
	accountName VARCHAR(10) NOT NULL,
	coins INTEGER DEFAULT 0,
	createdTime DATETIME
);

SELECT *
FROM accounts;


-- 테이블 삭제
	-- 조심해야함. 물리적인 삭제이기에 한 번 삭제되면 복구가 불가능함
DROP TABLE accounts;

-- 테이블 변경(ALTER)

-- 어느 때 사용되는가?
	-- 열 추가(ADD) / 삭제(DROP) / 변경(ALTER)

-- 추가
ALTER TABLE accounts
ADD lastEnterTime DATETIME;

-- 삭제
ALTER TABLE accounts
DROP COLUMN lastEnterTime;

-- 변경
ALTER TABLE accounts
ALTER COLUMN accountName VARCHAR(20) NOT NULL;


-- C# class Player() { }
-- List<Player>
-- 리스트로 관리하면 데이터가 적을 때 관리하기 편함, 많아지면 100만개 들고있다 하면 속도측면에서 문제가 됨...
-- Dictionary<int, Player>
-- 그래서 어떤 변수로 정할지는 잘 생각하고 정해야 함


-- 제약(CONSTRAINT) 추가/삭제
-- NOT NULL
-- UNIQUE			같은 값이 겹치면 안된다 (유니크 해야한다)
-- PRIMARY KEY		디자인에서 보이는 열쇠 표시임. UI상에선 화살표 클릭 후 SET PRIMARY KEY 누르면 키 모양이 달림.
-- FOREIGN KEY
-- 제약사항을 걸어두면 accountID 를 찾을 때 바로 찾을 수 있어서 빠름, 키값으로 찾으니 O(1) 인가?
-- 처음에 설계를 잘하면 accountId INTEGER NOT NULL PRIMARY KEY, 로 설계가 가능

또는

CREATE TABLE accounts(
	accountId INTEGER NOT NULL,
	accountName VARCHAR(10) NOT NULL,
	coins INTEGER DEFAULT 0,
	createdTime DATETIME
	PRIMARY KEY(accountId)
);


-- 프라이머리 키 생성.. 문제가 삭제시 컨스트레인트 이름이 필요함
ALTER TABLE accounts
ADD PRIMARY KEY (accountId);

-- 그래서 이름이 필요함. 바로만들면안되고
ALTER TABLE accounts
ADD CONSTRAINT PK_Account PRIMARY KEY (accountId);

-- 프라이머리 키 삭제, 문제가 컨스트레인트 이름이 필요함....
ALTER TABLE accounts
DROP CONSTRAINT PK_Account




*/

CREATE DATABASE GameDB;

USE GameDB;


-- 테이블 생성(CREATE) / 삭제 (DROP) / 변경 (ALTER)

-- CREATE TABLE 테이블명(열이름 자료형 [DEFAULT 기본값] [NULL | NOT NULL], ...)

-- 디자인에 들어가서 직접 만드는 걸 코드로도 작성이 가능하다!
CREATE TABLE accounts(
	accountId INTEGER NOT NULL,
	accountName VARCHAR(10) NOT NULL,
	coins INTEGER DEFAULT 0,
	createdTime DATETIME
);

SELECT *
FROM accounts;


-- 테이블 삭제
	-- 조심해야함. 물리적인 삭제이기에 한 번 삭제되면 복구가 불가능함
DROP TABLE accounts;

-- 테이블 변경(ALTER)

-- 어느 때 사용되는가?
	-- 열 추가(ADD) / 삭제(DROP) / 변경(ALTER)

-- 추가
ALTER TABLE accounts
ADD lastEnterTime DATETIME;

-- 삭제
ALTER TABLE accounts
DROP COLUMN lastEnterTime;

-- 변경
ALTER TABLE accounts
ALTER COLUMN accountName VARCHAR(20) NOT NULL;


-- C# class Player() { }
-- List<Player>
-- 리스트로 관리하면 데이터가 적을 때 관리하기 편함, 많아지면 100만개 들고있다 하면 속도측면에서 문제가 됨...
-- Dictionary<int, Player>
-- 그래서 어떤 변수로 정할지는 잘 생각하고 정해야 함


-- 제약(CONSTRAINT) 추가/삭제
-- NOT NULL
-- UNIQUE			같은 값이 겹치면 안된다 (유니크 해야한다)
-- PRIMARY KEY		디자인에서 보이는 열쇠 표시임. UI상에선 화살표 클릭 후 SET PRIMARY KEY 누르면 키 모양이 달림.
-- FOREIGN KEY
-- 제약사항을 걸어두면 accountID 를 찾을 때 바로 찾을 수 있어서 빠름, 키값으로 찾으니 O(1) 인가?
-- 처음에 설계를 잘하면 accountId INTEGER NOT NULL PRIMARY KEY, 로 설계가 가능

-- 프라이머리 키 생성.. 문제가 삭제시 컨스트레인트 이름이 필요함
ALTER TABLE accounts
ADD PRIMARY KEY (accountId);

-- 그래서 이름이 필요함. 바로만들면안되고
ALTER TABLE accounts
ADD CONSTRAINT PK_Account PRIMARY KEY (accountId);

-- 프라이머리 키 삭제, 문제가 컨스트레인트 이름이 필요함....
ALTER TABLE accounts
DROP CONSTRAINT PK_Account

-- 해당 구문을 실행 후 ctrl + L 키를 누르면 Execution plan을 볼 수 있음.
-- 프라이머리 키가 있을 경우 클러스터형 인덱스 검색이 나옴.

-- 프라이머리 키가 없을 경우 테이블 스캔이 나옴 ( 한숨 쉬어야함. 엄청 느린 것임 )
SELECT *
FROM accounts
WHERE accountId = 1111;

-- 프라이머리키를 사용하냐 아니냐는.
-- List<Account> 
-- Dictionary<int, Account> 를 쓸 것이냐 차이로 보면 편함