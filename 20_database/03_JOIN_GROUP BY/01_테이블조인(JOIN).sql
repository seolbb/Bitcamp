-- 박지성 고객ID
SELECT CUSTID FROM CUSTOMER WHERE NAME = '박지성'; --CUSTID : 1
-- 박지성이 구매한 책의 합계금액
SELECT * FROM ORDERS WHERE CUSTID = 1;
SELECT SUM(SALEPRICE) FROM ORDERS WHERE CUSTID = 1;

--서브쿼리(SUB QUERY) 방식
SELECT SUM(SALEPRICE) FROM ORDERS WHERE CUSTID = (SELECT CUSTID FROM CUSTOMER WHERE NAME = '박지성');
--=============================================================
-- 테이블 조인(JOIN) 방식
SELECT * FROM CUSTOMER WHERE CUSTID = 1; -- 박지성
SELECT * FROM ORDERS WHERE CUSTID = 1; -- 박지성

-- CUSTOMER, ORDERS 테이블 동시 조회
SELECT * FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
AND NAME = '박지성';
-------------------------------------
--테이블에 대한 별칭 사용으로 간단하게 표시하고 사용
SELECT * FROM CUSTOMER C, ORDERS O --테이블에 대한 별칭 사용
WHERE C.CUSTID = O.CUSTID --조인조건
AND C.NAME = '박지성'; --검색조건

--ANSI 표준 조인 쿼리
SELECT * 
FROM CUSTOMER C INNER JOIN ORDERS O
    ON C.CUSTID = O.CUSTID --조인조건
    WHERE C.NAME = '박지성' --검색조건
;
------------------------------------
--박지성이 구입한 합계금액
SELECT SUM(O.SALEPRICE)
--SELECT * 
FROM CUSTOMER C, ORDERS O --조인할 테이블
WHERE C.CUSTID = O.CUSTID --조인조건
AND C.NAME = '박지성'; --검색조건
------------------------------------
SELECT * FROM ORDERS;
-- 출판한 책중 판매된 책 목록(미디어로 끝나는 출판사)
SELECT *
FROM BOOK B, ORDERS O
WHERE B.BOOKID = O.BOOKID --조인조건
--AND B.PUBLISHER = '굿스포츠'
AND B.PUBLISHER LIKE '%미디어'
ORDER BY B.PUBLISHER, B.BOOKNAME
;
--============================================================
--(실습) 테이블 조인해서 요청데이터 찾기
--1.'야구를 부탁해'라는 책이 팔린내역 확인(책제목, 판매금액, 판매일자)
SELECT B.BOOKNAME, O.SALEPRICE, O.ORDERDATE FROM BOOK B, ORDERS O
WHERE B.BOOKID = O.BOOKID
AND B.BOOKNAME = '야구를 부탁해';

---
SELECT B.BOOKNAME, O.SALEPRICE, O.ORDERDATE
FROM BOOK B INNER JOIN ORDERS O
ON B.BOOKID = O.BOOKID
AND B.BOOKNAME = '야구를 부탁해';

--2. '야구를 부탁해'라는 책이 몇권이 팔렸는지 확인
SELECT COUNT(*)
FROM BOOK B, ORDERS O
WHERE B.BOOKID = O.BOOKID
AND B.BOOKNAME = '야구를 부탁해';

--3. '추신수'가 구입한 책값과 구입일자(책값, 구입일자)
SELECT O.SALEPRICE, O.ORDERDATE FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
AND C.NAME = '추신수';

--4. '추신수'가 구입한 합계금액 확인
SELECT SUM(O.SALEPRICE)
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
AND C.NAME = '추신수';

--5. '박지성', '추신수'가 구입한 내역을 확인(이름, 판매금액, 판매일자)
SELECT C.NAME, O.SALEPRICE, O.ORDERDATE FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
AND C.NAME IN ('박지성', '추신수');
--AND (C.NAME = '추신수' OR C.NAME = '박지성');
--============================================================
--3개 테이블 조인해서 데이터 조회
--고객명, 책제목, 출판사명, 판매가격, 판매일자,
-- A=B, A=C
SELECT C.NAME, B.BOOKNAME, B.PUBLISHER, O.SALEPRICE, O.ORDERDATE FROM ORDERS O, BOOK B, CUSTOMER C
WHERE O.BOOKID = B.BOOKID --조인조건
AND O.CUSTID = C.CUSTID;   --조인조건
-- A=B, B=C
SELECT C.NAME, B.BOOKNAME, B.PUBLISHER, O.SALEPRICE, O.ORDERDATE FROM ORDERS O, BOOK B, CUSTOMER C
WHERE B.BOOKID = O.BOOKID --조인조건
AND O.CUSTID = C.CUSTID;   --조인조건
--안시표준
SELECT C.NAME, B.BOOKNAME, B.PUBLISHER, O.SALEPRICE, O.ORDERDATE 
FROM BOOK B INNER JOIN ORDERS O
ON B.BOOKID = O.BOOKID
INNER JOIN CUSTOMER C
ON O.CUSTID = C.CUSTID;

--------------------------------------------------------
--(실습) BOOK, CUSTOMER, ORDERS 테이블 데이터 조회
--1. 장미란이 구입한 책제목, 구입가격, 구입일자, 출판사
SELECT B.BOOKNAME, O.SALEPRICE, O.ORDERDATE, B.PUBLISHER FROM BOOK B, ORDERS O, CUSTOMER C
WHERE C.CUSTID = O.CUSTID
AND O.BOOKID = B.BOOKID
AND C.NAME = '장미란';

--2. 장미란이 구입한 책 중에 2014-01-01 ~ 2014-07-08까지 구입한 내역
SELECT ORDERDATE, TO_CHAR(ORDERDATE, 'YYY-MM-DD HH24:MI:SS') FROM ORDERS;  -- ORDERDATE 시분초 확인
SELECT * FROM BOOK B, ORDERS O, CUSTOMER C
WHERE C.CUSTID = O.CUSTID
AND O.BOOKID = B.BOOKID
AND C.NAME = '장미란'
AND ORDERDATE >= TO_DATE('2014-01-01','YYYY-MM-DD') AND ORDERDATE <= TO_DATE('2014-07-08','YYYY-MM-DD');
--=
SELECT * FROM BOOK B, ORDERS O, CUSTOMER C
WHERE C.CUSTID = O.CUSTID
AND O.BOOKID = B.BOOKID
AND C.NAME = '장미란'
AND ORDERDATE BETWEEN TO_DATE('2014-01-01','YYYY-MM-DD') AND TO_DATE('2014-07-08','YYYY-MM-DD');

--3. '야구를 부탁해'라는 책을 구입한 사람과 구입일자를 확인
SELECT C.NAME, O.ORDERDATE FROM BOOK B, ORDERS O, CUSTOMER C
WHERE C.CUSTID = O.CUSTID
AND O.BOOKID = B.BOOKID
AND B.BOOKNAME = '야구를 부탁해';

--4. 추신수, 장미란이 구입한 책제목, 구입금액, 구입일자 확인
----(정렬: 고객명, 구입일자 순으로)
SELECT C.NAME, B.BOOKNAME, O.SALEPRICE, O.ORDERDATE FROM BOOK B, ORDERS O, CUSTOMER C
WHERE C.CUSTID = O.CUSTID
AND O.BOOKID = B.BOOKID
AND C.NAME IN ('추신수', '장미란')
ORDER BY C.NAME, O.ORDERDATE;
--ORDER BY 1, 4 -- 이렇게도 가능

--5. 추신수가 구입한 책갯수, 합계금액, 평균값, 가장 비싼 책 금액, 가장 싼 책 금액
SELECT COUNT(*), SUM(O.SALEPRICE), AVG(O.SALEPRICE), MAX(O.SALEPRICE), MIN(O.SALEPRICE) FROM ORDERS O, CUSTOMER C  -- 2개 테이블만 조인
WHERE C.CUSTID = O.CUSTID
AND C.NAME = '추신수';

-- 5-1.사람별로 보고싶을때
-- 그룹함수 + 특정 컬럼 은 셀렉에 넣으면 오류가 남 -- > GROUP BY 해줘야함
SELECT C.NAME, COUNT(*), SUM(O.SALEPRICE), ROUND(AVG(O.SALEPRICE)), MAX(O.SALEPRICE), MIN(O.SALEPRICE) FROM ORDERS O, CUSTOMER C 
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME;
--------------------------------------------------------
















