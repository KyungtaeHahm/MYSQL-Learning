/*
- 정규화

3개의 테이블로 나누어서 작업. 중복된 걸 방지 할 수 있음.


- INDEX(색인)

- 책을 볼 때 INDEX(색인)을 참고하면, 쉽게 찾을 수 있다.
ㄴ 근데 책이랑은 다른게 데이터베이스는 실시간으로 갱신이 되서 달라짐.


- DB는 이진검색트리

1) 왼쪽을 타고 가면 현재 값보다 작다
2) 오른쪽을 타고 가면 현재 값보다 크다

우리가 이해해야할 건 인덱스를 만들면 이진검색트리를 이용해 빨리 검색된다


- 인덱스가 필요한 경우

1) 귓말을 예시로 인덱스가 없을경우 모든 유저를 찾아야되서 엄청 오래걸림 

2) 인덱스를 걸면 항상 좋을까?

3) 색인을 한다고 무조건 좋은 게 아니라 중복되는 데이터가 없어야한다.
ㄴ 데이터가 여러개 있으면 안됨


[ Primary Key? Index? ]

INDEX는 CLUSTERED와 NON CLUSTERED 2가지 종류가 있다

-PRIMARY KEY = 대부분 CLUSTERED INDEX
ㄴ 테이블 당 1개만 존재!
ㄴ 제일 좋고 빠르다. 공간도 적게 차지

- 나머지 = NON-CLUSTERED INDEX
ㄴ 별다른 제한 없음


- CLUSTERED INDEX
인덱스 보다 더 좋은게 영한사전이라고 생각.
이미 알파벳부터 다 정렬되어있음

인덱스 (색인)은 색인을 확인하고 해당 페이지로 가는 방식

클러스터 인덱스는 정렬된 상태로 저장되어 있어서 바로 찾을 수 있음

차이점

클러스터 인덱스는 데이터가 이미 순서대로 저장되어있어서 별도의 인덱스가 필요없음.
ㄴ다만 물리적으로 정렬이 되있다는건 기준이 하나가 있다는 것(?)

- 클러스터는 유일성이 보장되어야함. EX) ID

ㄴ ID순서대로 저장이 가능


INDEX(색인)은 데이터를 빨리 찾을 수 있게 보조해준다

1) PRIMARY KEY (CLUSTERED INDEX)

물리적인 데이터 저장 순서의 기준 영한사전

2) 일반 INDEX (NON-CLUSTERED INDEX)

따로 관리하는 일종의 LOOKUP 테이블 책 후반에 나오는 색인

테이블 안의 '키' 폴더와 '인덱스' 폴더를 보면 키가 있는지 나옴.

*/
USE GameDB;

ALTER TABLE accounts
ADD CONSTRAINT PK_Account PRIMARY KEY (accountId);

-- 인덱스 CREATE INDEX / DROP INDEX

CREATE INDEX i1 ON accounts(accountName);	-- 인덱스 폴더에 들어가면 i1이란 비고유(NON Unique), 비클러스터형이 생김

CREATE UNIQUE INDEX i1 ON accounts(accountName);	-- 앞에 유니크를 붙이면 고유 (유니크)가 생김
													-- 인덱스를 걸어주긴 할건데 겹치는 건 없다!

CREATE UNIQUE INDEX i1 ON accounts(accountName, coins); -- 두 개 필드로도 쓸 수 있음

DROP INDEX accounts.i1;	-- 삭제

CREATE CLUSTERED INDEX i1 ON accounts(accountName); -- 테이블 'accounts'에 클러스터형 인덱스를 둘 이상 만들 수 없습니다. - 두가지 방법으로 정렬을 하는 건 말도 안되기에!
													--다른 클러스터형 인덱스를 만들려면 기존 클러스터형 인덱스 'PK_Account'을(를) 삭제하십시오.