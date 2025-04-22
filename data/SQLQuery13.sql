/*

SELECT '안녕하세요' 
ㄴ 결과가 ???? 로 나옴.
ㄴ> 한글은 유니코드 2바이트이기에 앞에 N 키워드를 넣어야 정상동작

SELECT N'안녕하세요'

SELECT 'Hello ' + 'World' - 활용!

SELECT SUBSTRING('20200425', 1, 4);	-- 2번째 매개변수를 기준으로 3번째 매개변수까지 값을 가져오고 싶을 때.

SELECT TRIM('            Helloworld'); -- 공백 문자를 제거함

주의점은 시작이 0이 아니라 1 임!

*/

USE BaseballData;


SELECT nameFirst + ' ' + nameLast AS fullName
FROM players
WHERE nameFirst IS NOT NULL AND nameLast IS NOT NULL;