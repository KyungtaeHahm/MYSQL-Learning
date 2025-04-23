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

SELECT CAST('20200425 05:03' AS DATETIME)

-- 현재시간 추출
SELECT GETDATE();	-- TSQL에서만 사용 가능
SELECT CURRENT_TIMESTAMP -- 범용적, 표준임

