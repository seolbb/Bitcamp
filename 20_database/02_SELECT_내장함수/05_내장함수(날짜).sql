/* 날짜관련 내장함수
날짜값 연산가능
DATE타입 + 숫자(정수) : 숫자만큼 일자 증가
DATE타입 - 숫자(정수) : 숫자만큼 일자 감소

ADD_MONTHS(날짜, 개월수) : 개월수 만큼 월이 증가 또는 감소
LAST_DAY(날짜) : 날짜가 속한 달의 마지막 날짜 구하기
NEXT_DAY(날짜, 요일) : 요일 날짜 구하기, 날짜 다음에 오는 첫번째 요일날짜 구하기
MONTHS_BETWEEN(날짜1, 날짜2) : 기간 구하기(개월) 연산방식(날짜1 - 날짜2)

*****************************/
SELECT SYSDATE, SYSDATE - 1, SYSDATE + 1 FROM DUAL;
--ADD_MONTH(날짜, 개월수) : 개월수 만큼 월이 증가 또는 감소
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 2) FROM DUAL;
SELECT SYSDATE, ADD_MONTHS(SYSDATE, -2) FROM DUAL;
--LAST_DAY(날짜) : 날짜가 속한 달의 마지막 날짜 구하기
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;
SELECT SYSDATE, ADD_MONTHS(SYSDATE, -1),
    LAST_DAY(ADD_MONTHS(SYSDATE, -1)),
        LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1
FROM DUAL;
--NEXT_DAY(날짜, 요일) : 요일 날짜 구하기, 날짜 다음에 오는 첫번째 요일날짜 구하기
SELECT SYSDATE, NEXT_DAY(SYSDATE, '화') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '수') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '토요일') FROM DUAL;
--MONTHS_BETWEEN(날짜1, 날짜2) : 기간 구하기(개월) 연산방식(날짜1 - 날짜2)
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 2) FROM DUAL;
SELECT MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE, 2)) FROM DUAL; -- -2 
SELECT MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 2), SYSDATE) FROM DUAL; -- 2
SELECT MONTHS_BETWEEN(ADD_MONTHS(SYSDATE-10, 2), SYSDATE) FROM DUAL;
--==============================
-- 1 : 1일 -> 24시간, 1시간 : 1일 / 24시간 --> 1시간
-- 1시간 : 60분 ---> 1시간 / 60분 ---> 1분 ::: 1 / 24 / 60 --> 1분
-- 1분 : 60초 ---> 1분 / 60초 -> 1초 ::: 1 / 24 / 60 / 60 --> 1초
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
    , TO_CHAR(SYSDATE + 1, 'YYYY-MM-DD HH24:MI:SS') 
    , TO_CHAR(SYSDATE + (1/24), 'YYYY-MM-DD HH24:MI:SS')  -- 1/24 : 1시간
    , TO_CHAR(SYSDATE + (1/24)*5, 'YYYY-MM-DD HH24:MI:SS') -- 5 시간뒤
FROM DUAL;

--1일 : 86400초, 1440분
SELECT 1*60 "1분(초)", 60*60 "1시간(초)", 24*60*60 "1일(초)", 24*60 "1일(분)"  -- 특수문자(괄호 등) 넣을때는 ""
FROM DUAL;

-- 1일, 1시간, 1분, 1초
SELECT 1, 1/24, 1/24/60, 1/24/60/60 FROM DUAL;
SELECT 1, 1/24, 1/(24*60), 1/(24*60*60) FROM DUAL;









