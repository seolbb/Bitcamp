-- ��������(�μ�����, SUB QUERY)
-- SQL(SELECT, INSERT, UPDATE, DELETE) ���� �ִ� ������
--------------------------------------
-- �������� ������ ������ �˻�
SELECT CUSTID FROM CUSTOMER WHERE NAME = '������'; -- CUSTID: 1
SELECT * FROM ORDERS WHERE CUSTID = 1;
-- �������� ���
SELECT * FROM ORDERS
WHERE CUSTID = (SELECT CUSTID FROM CUSTOMER WHERE NAME = '������');
-- ���ι����� ó��
SELECT C.NAME, O.* FROM ORDERS O, CUSTOMER C
WHERE O.CUSTID = C.CUSTID
AND C.NAME = '������';
--------------------------------------
-- WHERE ������ �������� ���� ��ȸ ����� 2�� �̻��� ��� IN ���
-- ������, �迬�� ���Գ���(��������)
SELECT * FROM ORDERS
WHERE CUSTID IN (SELECT CUSTID FROM CUSTOMER WHERE NAME IN ('������','�迬��')); -- �ϳ��� �����͸� ���ϵǾ� '=' �� ��������, �������� IN
--------------------------------------
-- å �� ������ ���� ��� ������ �̸��� ���Ͻÿ�
SELECT MAX(PRICE) FROM BOOK; -- ���� ��� å�� ���� : 35000
SELECT * FROM BOOK WHERE PRICE = 35000;
--
SELECT * FROM BOOK WHERE PRICE = (SELECT MAX(PRICE) FROM BOOK); -- �ϳ��� �����͸� ���ϵǾ '=' ��� ����
--------------------------------------
-- ���������� FROM ���� ����ϴ� ���
SELECT * FROM BOOK B,(SELECT MAX(PRICE) MAX_PRICE FROM BOOK) M
WHERE B.PRICE = M.MAX_PRICE;
--(�ǽ�) ���ǵ� å�� ��ձݾ� �̻��� ���� ���
SELECT * FROM BOOK B, (SELECT AVG(PRICE) AVG_PRICE FROM BOOK) A
WHERE B.PRICE >= A.AVG_PRICE;
--(�ǽ�) ������, �迬�� ���� ����(�������� - FROM��)
SELECT C.NAME, O.* FROM ORDERS O, (SELECT * FROM CUSTOMER WHERE NAME IN ('������','�迬��')) C
WHERE O.CUSTID = C.CUSTID;
--------------------------------------
-- SELECT ���� �������� ��� �� --> ȿ�������� ����. �ظ��ϸ� JOIN�� ����
SELECT O.ORDERID, O.CUSTID, O.BOOKID,
(SELECT NAME FROM CUSTOMER WHERE CUSTID = O.CUSTID) CUSTNAME,
(SELECT BOOKNAME FROM BOOK WHERE BOOKID = O.BOOKID) BOOKNAME,
O.SALEPRICE, O.ORDERDATE 
FROM ORDERS O;
--------------------------------------
-- �������� ������ å ���(å����)
SELECT * FROM BOOK WHERE BOOKID 
IN (SELECT BOOKID FROM ORDERS WHERE CUSTID 
IN (SELECT CUSTID FROM CUSTOMER WHERE NAME = '������'));
--------------------------------------
-- ��������, ���ι�
-- (��������)
-- 1. �ѹ��̶� ������ ������ �ִ� ��� / �ѹ��� �������� ���� ��� (NOT IN)
SELECT * FROM CUSTOMER WHERE CUSTID
IN (SELECT CUSTID FROM ORDERS);
--
SELECT * FROM CUSTOMER WHERE CUSTID
NOT IN (SELECT CUSTID FROM ORDERS);
-- 2. 20000�� �̻�Ǵ� å�� ������ �� ��� ��ȸ
SELECT * FROM CUSTOMER WHERE CUSTID IN (SELECT CUSTID FROM ORDERS WHERE SALEPRICE >= 20000);
-- 3. '���ѹ̵��' ���ǻ��� å�� ������ �� �̸� ��ȸ
SELECT * FROM CUSTOMER WHERE CUSTID IN (SELECT CUSTID FROM ORDERS WHERE BOOKID IN (SELECT BOOKID FROM BOOK WHERE PUBLISHER = '���ѹ̵��'));
-- 4. ��ü å ���� ��պ��� ��� å�� ��� ��ȸ
SELECT * FROM BOOK WHERE PRICE > (SELECT AVG(PRICE) FROM BOOK);
-- ����� �ڵ�
SELECT * FROM BOOK B,(SELECT AVG(PRICE) AVG_PRICE FROM BOOK) M
 WHERE B.PRICE >= M.AVG_PRICE    
;
-- (���ι�)
-- 1.
SELECT DISTINCT C.* FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID;
-- ǥ�� SQL
SELECT DISTINCT C.* FROM CUSTOMER C INNER JOIN ORDERS O
ON C.CUSTID = O.CUSTID;
-- �ѹ��� ������������ ���
SELECT C.* FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID(+)
AND O.ORDERID IS NULL;   
-- ǥ�� SQL
SELECT c.* FROM CUSTOMER C LEFT OUTER JOIN ORDERS O
ON O.CUSTID = C.CUSTID
WHERE O.ORDERID IS NULL;
-- 2.
SELECT C.* FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
AND O.SALEPRICE >= 20000;
-- ǥ�� SQL
-- ���κ��� �غ�����
SELECT C.* FROM CUSTOMER C INNER JOIN ORDERS O
ON C.CUSTID = O.CUSTID
WHERE O.SALEPRICE >= 20000;
-- 3.
SELECT C.*, O.SALEPRICE, O.ORDERDATE, B.BOOKNAME, B.PUBLISHER FROM CUSTOMER C, ORDERS O, BOOK B
WHERE C.CUSTID = O.CUSTID
AND O.BOOKID = B.BOOKID
AND B.PUBLISHER = '���ѹ̵��';
-- ǥ�� SQL
SELECT C.*, O.SALEPRICE, O.ORDERDATE, B.BOOKNAME, B.PUBLISHER 
FROM CUSTOMER C INNER JOIN ORDERS O --���� ���̺� ���ι��
ON C.CUSTID = O.CUSTID --��������
INNER JOIN BOOK B --���� ���̺� ���ι��
ON O.BOOKID = B.BOOKID--��������
WHERE B.PUBLISHER = '���ѹ̵��'; --�˻�����
-- 4.
--------------------------------------















