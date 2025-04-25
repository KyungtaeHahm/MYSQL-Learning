/*
- 트랜잭션

-- BEGIN TRAN;
-- COMMIT;
-- ROLLBACK;

데이터베이스를 관리할 때 분산을 하고 있음.
근데 하나의 테이블이 아닌 두 개의 테이블을 동시에 갱신하고 싶을 때가 있음.

PLAYER의 정보와 salaries 연봉정보를 동시에 넣고 싶을 때


- 원자성: 모든 작업이 다 같이 처리해야한다 그렇지 않으면 문제사태가 발생한다.
ALL OR NOTHING

-- 거래 (만약 1번이 실패했는데 2번이 되면 문제가 발생됨. 아이템복사)
-- A의 인벤토리에서 아이템 제거
-- B의 인벤토리에다가 아이템 추가
-- A의 골드 감소

 강화 
 - 강화 주문서 처리는 잘 처리되었는데
 - 무기 강화수치가 올라가지 않는 문제라는 등.

 

*/

USE GameDB;

SELECT *
FROM accounts

-- TRAN을 명시하지 않으면, 자동으로 COMMIT
INSERT INTO accounts VALUES(1, 'rookiss', 100, GETUTCDATE())

DELETE accounts;

-- 메일 BEGIN TRAN
	-- 보낼 것인가	COMMIT;
	-- 취소할 것인가 ROLLBACK;

-- 성공 / 실패 여부에 따라 COMMIT (= COMMIT을 수동으로 하겠다)
BEGIN TRAN;
	INSERT INTO accounts VALUES(2, 'rookiss2', 100, GETUTCDATE())
COMMIT;

-- 응용
BEGIN TRY	-- 실패 할 수 있는 상황. 연결 에러, 구문 에러 등...
	BEGIN TRAN;
	INSERT INTO accounts VALUES(1, 'rookiss', 100, GETUTCDATE())
	INSERT INTO accounts VALUES(3, 'rookiss3', 100, GETUTCDATE())
	COMMIT;
END TRY
BEGIN CATCH	-- 두 개의 연산 중 하나라도 실패하면 CATCH로 들어오게 됨
	IF @@TRANCOUNT > 0 -- 현재 활성화된 트랜잭션 수를 반환
		ROLLBACK
	PRINT('ROLLBACK 했음')
END CATCH

-- TRAN 사용할 때 주의할 점
-- TRAN 안에는 꼭!!! 원자적으로 실행될 애들만 넣자
-- C# List<Player> List<Salary> 원자적으로 수정해야한다면 (2개의 list를 동시에 접근 성공 할 때) -> lock을 잡고 실행 -> (개선하면) writelock (상호배타적인 락) readlock (공유 락)


BEGIN TRAN;	-- 컨트롤 n으로 새문서 열고 SELECT* FROM accounts를 하면 동작을 하지 않음. ( 이유는 commit, ROLLBACK을 안해주어서 LOCK 걸린 상태여서)
	INSERT INTO accounts VALUES(1, 'rookiss', 100, GETUTCDATE())

	-- 여기서 알 수 있는건 만약 이 구문 안에 작업이 오래 걸린다면 성능상 오래 걸릴 수 있음
	ROLLBACK;