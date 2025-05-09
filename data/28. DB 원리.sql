/*
데이터베이스 원리

데이터 베이스를 물류창고로 비유하면

1) 고객이 물건을 물류창고에 직원을 통해 위탁을함

2) 직원은 물류창고에 옮기고 직원이 고객에게 옮겼다고 ok사인을 보냄

3) 고객이 필요하면 직원이 물류창고에 꺼내서 물건을 꺼내서 고객에게 전달

--- 그러나 이건 고객이 1명일 때 쉽게 되지만 많아지면 변수들이 발생하게 됨

-- 그래서 초일류 물류창고가 되기 위해. 많은 고객을 받고, 안전을 최우선시로 한 상태에서 창고에 물건을 많이 받고, 빠르게 받고주고,

1. 많이란. 고객을 많이 받는 것. 고객이 많으면 받는 물건이 많아짐

2. 빠르게. 응답 처리를 빠르게하기위해서 고객과 직원사이의 전달 ok 사인을 빠르게 끝내는 것
ㄴ 식당에서 고객은 음식만 빨리 나오면 장땡임.

3. 안전하게. 물류창고에 물건이 안전하게 보관된 상태.
ㄴ 근데 1,2와 상충이 됨. 안전하게 하려면 물건이 안전한 공간까지 가기위해서 느려질 수 있음.
ㄴ 직원을 많이 고용해서 물건을 많이 많이 받으면... 멀티쓰레딩을 비유하면 부하가 발생하게 됨.
 ㄴ 락의 개념도 들어가고...

 즉, 3가지 조건이 다 만족하면 좋지만 현실상은 상충되는 개념임.


 데이터베이스를 기준으로 보면

 1) 병렬 처리
 2) 응답 속도
 3) 커밋한 데이터를 지킨다.

 물건 : 데이터 / 창고 : 데이터 베이스 / 쓰레드 : 직원 / 클라(고객) : 고객

 클라의 역할이 GameServer가 됨.

 - 응답속도가 빠르면 좋겠지만, 안전을 안 지키고 하면 문제가 발생되고...

 - 응답속도가 빠르게 하기 애매했던게, 데이터를 지킨상태에서 클라한테 전송하면.. 얼마나 느리지?
 ㄴ 쓰레드가 빠르게 달려갔다가 빨리 고객한테 전달하면 빠르지 않을까?

 -> 그러니 DB를 사용할 때, 어디에 저장되는지 알아야한다.

 RAM : 휘발성 메모리. 컴퓨터를 켰다가 전원을 내려버리면, 정보가 다 날라간다

 Hard Drive : 전원이 꺼져도 데이터가 안전하게 남음.

 그래서 데이터를 안전하게 저장하기 위해 RAM 뿐만아니라 Hard Drive 까지 가야한다.


 [FULL SCAN과 SEQUENTIAL 접근]

 - FULL SCAN은 모든 데이터 영역을 싸그리 모으는 것

 - 풀 스캔은 하드가 느리더라도 효율적인 동작 방식임. 문제는... 모든 데이터를 다 읽으면 무식한 방식이긴함...

 [INDEX와 RANDOM ACCESS]

 INDEX는 우리가 필요한 정보를 미리 알 수 있고...

 문제는 RANDOM ACCESS...
 ㄴ 하드 디스크는 순차적으로 읽을 수 없기에.. 한바퀴 도는 걸 기다려야하고. 뭔가 띄엄띄엄 읽는 것이 느림.
 ㄴ 그래서 인덱스를 사용한다고 속도가 빨라진다는 보장이 없음. 그래서 풀스캔 때리는 이유가 이런 이유임. 

 그리고 우리가 접근하는 데이터가 15% 이하로 내려가면 INDEX로 접근하는 게 낫다고 하고 
 15% 이상 넘어가서 사용량이 많다면 FULL SCAN으로 때리는 효율이 좋다는 통계근거가 있긴 함.



 [ 그러면 데이터를 안전하게 저장한다는게? 얼마나 안전하게? ]

 1. 차원이 다른.. .안정성을 보장해야한다.

 1) 물리적으로 CPU나 메모리가 박살나도.. 전원이 갑자기 꺼지더라도 데이터가 안전하게 보장되야한다

 2) 게임말고 은행권도 DB를 사용함. 그래서 안정성이 보장되야함

 - 그래서 RAM에 저장을 하지 않겠고, 전원이 꺼지면 사라지니

 - 데이터 안정성을 위해 디스크에 저장을 해야함

 - 그렇다고 필요할 때마다 진짜로 모든 데이터를 디스크에 저장하면 너무 느리다!!
*/