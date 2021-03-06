/* *************************
SELECT [* | DISTINCT] {컬럼명, 컬럼명, ...}
  FROM 테이블명
[WHERE 조건절]
[GROUP BY {컬럼명, ....}
    [HAVING 조건] ] --GROUP BY 절에 대한 조건
[ORDER BY {컬럼명 [ASC | DESC], ....}] --ASC : 오름차순(기본/생략가능)
                                      --DESC : 내림차순
---------------------------
■ GROUP BY : 데이터를 그룹핑해서 처리할 경우 사용
■ GROUP BY 문을 사용할 때 SELECT 항목에 사용할 수 있는 것은
   GROUP BY 절에 사용된 컬럼 또는 그룹함수(COUNT, SUM, AVG, MAX, MIN) 만 사용할 수 있다
***************************/
-- 구매 고객별로 구매금액의 합계를 구하시오
SELECT CUSTID, SUM(SALEPRICE) FROM ORDERS
GROUP BY CUSTID;
--
SELECT C.NAME, SUM(SALEPRICE)
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
ORDER BY C.NAME;
--
SELECT C.NAME, SUM(SALEPRICE)
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
ORDER BY SUM(SALEPRICE);
--ORDER BY 2  --> SELECT 절의 2번째 항목으로 정렬
---------------------------------
--주문 테이블의 고객별 데이터 조회(건수, 합계, 평균, 최소, 최대)
SELECT C.NAME, COUNT(*), TRUNC(AVG(O.SALEPRICE)), MIN(O.SALEPRICE), MAX(O.SALEPRICE) FROM ORDERS O, CUSTOMER C
WHERE O.CUSTID = C.CUSTID
GROUP BY C.NAME
ORDER BY C.NAME;

-- 고객명 기준으로 고객별 데이터 조회(건수, 합계, 평균, 최소, 최대)
-- 추신수, 장미란, 고객 2명만 조회
SELECT C.NAME, SUM(SALEPRICE), TRUNC(AVG(SALEPRICE)), MIN(SALEPRICE), MAX(SALEPRICE) FROM CUSTOMER C ,ORDERS O
WHERE C.CUSTID = O.CUSTID
AND C.NAME IN ('추신수', '장미란')
GROUP BY C.NAME
ORDER BY 1;
--ANSI 표준
SELECT C.NAME, SUM(SALEPRICE), TRUNC(AVG(SALEPRICE)), MIN(SALEPRICE), MAX(SALEPRICE) 
FROM CUSTOMER C INNER JOIN ORDERS O
ON C.CUSTID = O.CUSTID
WHERE C.NAME IN ('추신수', '장미란')
GROUP BY C.NAME
ORDER BY C.NAME;
--==============================================
-- HAVING 절 : GROUP BY 절에 의해서 만들어진 데이터에서 검색조건 부여
-- HAVING 절은 단독으로 사용될 수 없고, 반드시 GROUP BY 절과 함께 사용
-------------
-- 3건 이상 구매한 고객 조회
SELECT C.NAME, COUNT(*) AS CNT
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
HAVING COUNT(*) >= 3; -- 그룹핑된 데이터에서 원하는 데이터 검색
-------------
-- 구매한 책중에서 20000원 이상인 책을 구입한 사람의 통계데이터 (건수, 합계, 평균, 최소, 최대)
SELECT C.NAME, SUM(SALEPRICE), TRUNC(AVG(SALEPRICE)), MIN(SALEPRICE), MAX(SALEPRICE) FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
HAVING MAX(O.SALEPRICE) >= 20000; -- 그룹핑 결과를 구하고 2만원 이상 구입한 사람찾기
--=
--주의 : WHERE 절에 사용되는 찾을 조건(테이블 데이터 기준)
-- HAVING 절에서 사용되는 조건은 그룹핑된 데이터 기준으로 검색
-- (결과값이 다르게 처리되므로 찾을 데이터가 무엇인지 명확히 판단하고 사용할 것)
SELECT C.NAME, SUM(SALEPRICE), TRUNC(AVG(SALEPRICE)), MIN(SALEPRICE), MAX(SALEPRICE) FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
AND O.SALEPRICE >= 20000 -- 2만원 이상인 책 구입 내역을 대상으로
GROUP BY C.NAME;
--==============================================
-- 필요시 GROUP BY ~ HAVING 구문을 사용해서 처리
-- 1. 고객이 주문한 도서의 총판매건수, 판매액, 평균값, 최저가, 최고가 구하기
SELECT COUNT(*) AS "TOTAL COUNT"
    , SUM(SALEPRICE) AS "판매액 합계" -- AS "한글" : 사용 가능하지만 안쓰는게 좋음
    , TRUNC(AVG(SALEPRICE)) 평균값AVG
    , MIN(SALEPRICE) 최저가_MIN  -- 언더바(_) 사용가능
    , MAX(SALEPRICE)  "최고가(MAX)"
FROM ORDERS;

-- 2. 고객별로 주문한 도서의 총수량, 총판매액 구하기
SELECT C.NAME, COUNT(*) AS CNT, SUM(O.SALEPRICE) AS SUM_PRICE FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
--ORDER BY SUM(O.SALEPRICE) DESC -- 적용된 그룹함수로 정렬
--ORDER BY 3 DESC -- 컬럼 위치값으로 정렬
ORDER BY SUM_PRICE DESC; -- 별칭(ALIAS)으로 정렬

-- 3. 고객의 이름과 고객이 주문한 도서의 판매가격, 책이름을 검색
SELECT C.NAME, O.SALEPRICE, B.BOOKNAME FROM CUSTOMER C, ORDERS O, BOOK B
WHERE C.CUSTID = O.CUSTID
AND O.BOOKID = B.BOOKID;

-- 4. 고객별로 주문한 모든 도서의 총판매액을 구하고, 고객명으로 정렬
SELECT C.NAME, SUM(O.SALEPRICE) FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
ORDER BY C.NAME;

-- 5. 고객별로 주문한 건수, 합계금액, 평균금액을 구하고(3권 미만으로 구입한 사람 검색)
SELECT C.NAME, COUNT(*), SUM(O.SALEPRICE), TRUNC(AVG(O.SALEPRICE)) FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
HAVING COUNT(*) < 3;

-- (번외) 고객 중 한 권도 구입하지 않은 사람 찾기
-- 03_외부조인 참조
------------------------------------------------








