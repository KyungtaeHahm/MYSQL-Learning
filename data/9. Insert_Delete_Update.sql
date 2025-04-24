/*
-- INSERT DELETE UPDATE

SELECT *
FROM salaries
ORDER BY yearID DESC;

-- INSERT INTO [테이블명] VALUES [값, ...]
INSERT INTO salaries
VALUES (2020, 'KOR', 'NL', 'rookiss', 9000000);

-- 데이터를 하나 빼먹으면? -> Error

INSERT INTO salaries
VALUES (2020, 'KOR', 'NL', 'rookiss');

-- INSERT INTO [테이블명](열, ...) VALUES (값, ...)
INSERT INTO salaries(yearID, teamID, playerID, lgID, salary)
VALUES (2020, 'KOR', 'rookiss2', 'NL', 8000000);

-> 2번 인설트 할시 아래와 같은 PRIMARY KEY 제약조건 오류 발생 
PRIMARY KEY 제약 조건 'PK__salaries__756A47DC8E9728D7'을(를) 위반했습니다. 개체 'dbo.salaries'에 중복 키를 삽입할 수 없습니다. 
중복 키 값은 (2020, KOR, NL, rookiss2)입니다.
-> 간단하게 테이블 디자인에서 키 표시가 되있는 행에 똑같은 정보가 2개 이상 있으면 안됨


-- 디자인 테이블에 들어가서 Allow Nulls 에 체크표시가 되어있으면 기입을 안하면 NULL로 채워짐.
-- 그런데 아래 열속성에 기본값 또는 바인딩이 NULL이 기본인데 만약 0으로 바꾸면 0으로 변경됨

INSERT INTO salaries(yearID, teamID, playerID, lgID)
VALUES (2020, 'KOR', 'rookiss3', 'NL');

ㄴ> 테이블 설정에 따라 입력 안해도 되는 경우가 있음. 결국 옆은 설정을 안했으면 salary NULL이 나옴



-- DELETE FROM[테이블명]
-- ㄴ 이대로 쓰면 테이블 모두 다 날라감. 절대 주의!

-- DELETE FROM [테이블명] WHERE[조건]
-- ㄴ 이와 같이 주의 깊게 작성해야함
DELETE FROM salaries
WHERE playerID = 'rookiss3'

-- 실행 후 rookiss3 정보가 사라짐

-- 2020년 이후 정보 삭제로 테이블 정리
DELETE FROM salaries
WHERE yearID >= 2020




-- UPDATE [테이블명] SET [열 = 값, ] WHERE [조건]
UPDATE salaries
SET salary = salary * 2, yearID = yearID + 1  -- 다중으로 가능함.
WHERE teamID = 'KOR'

DELETE	  vs   UPDATE

물리 삭제 vs 논리 삭제

예로 롤로 생각하면 30일이 지나도 복구가 가능.
ㄴ 그런 경우 논리 삭제인 UPDATE.

- 만약 물리적인 삭제 DELETE가 되었다면 복구가 불가능함

- 게임의 아이템을 해킹하고 떨군 경우도 마찬가지. 물리적으로 삭제하면 LOG 분석이 어려움

*/


USE BaseballData;


-- INSERT DELETE UPDATE

SELECT *
FROM salaries
ORDER BY yearID DESC;

-- INSERT INTO [테이블명] VALUES [값, ...]
INSERT INTO salaries
VALUES (2020, 'KOR', 'NL', 'rookiss', 9000000);

-- INSERT INTO [테이블명](열, ...) VALUES (값, ...)
INSERT INTO salaries(yearID, teamID, playerID, lgID, salary)
VALUES (2020, 'KOR', 'rookiss2', 'NL', 8000000);

-- 디자인 테이블에 들어가서 Allow Nulls 에 체크표시가 되어있으면 기입을 안하면 NULL로 채워짐.
-- 그런데 아래 열속성에 기본값 또는 바인딩이 NULL이 기본인데 만약 0으로 바꾸면 0으로 변경됨

INSERT INTO salaries(yearID, teamID, playerID, lgID)
VALUES (2020, 'KOR', 'rookiss3', 'NL');



-- DELETE FROM[테이블명]
-- ㄴ 이대로 쓰면 테이블 모두 다 날라감. 절대 주의!

-- DELETE FROM [테이블명] WHERE[조건]
-- ㄴ 이와 같이 주의 깊게 작성해야함
DELETE FROM salaries
WHERE playerID = 'rookiss3'

-- 실행 후 rookiss3 정보가 사라짐0


-- UPDATE [테이블명] SET [열 = 값, ] WHERE [조건]
UPDATE salaries
SET salary = salary * 2, yearID = yearID + 1
WHERE teamID = 'KOR'

