/* ************************
��(VIEW) : �ϳ� �Ǵ� �� �̻��� ���̺�� ����
   �������� �κ������� ���̺��� ��ó�� ����ϴ� ��ü(�������̺�)
-- ��(VIEW) ������
CREATE [OR REPLACE] VIEW ���̸� [(�÷���Ī1, �÷���Ī2, ..., �÷���Īn)]    ==> [OR REPLACE] : ������ ����� ������ ����
AS
SELECT ����
[�ɼ�];

-- �б����� �ɼ� : WITH READ ONLY

-- ��(VIEW) ����
DROP VIEW ���̸�;
***************************/
SELECT * FROM BOOK WHERE BOOKNAME LIKE '%�౸%';
-- ��(VIEW) �����--
CREATE OR REPLACE VIEW VW_BOOK
AS
SELECT * FROM BOOK WHERE BOOKNAME LIKE '%�౸%'
WITH READ ONLY; -- �б� ����
--
-- �� ����ؼ� ������ �˻�
SELECT * FROM (SELECT * FROM BOOK WHERE BOOKNAME LIKE '%�౸%');
SELECT * FROM VW_BOOK;
SELECT * FROM VW_BOOK WHERE PUBLISHER = '�½�����';
SELECT * FROM (SELECT * FROM BOOK WHERE BOOKNAME LIKE '%�౸%')
WHERE PUBLISHER = '�½�����';

-------------------------
-- �� (VIEW) ���� - �÷���Ī(alias) ���
CREATE VIEW VW_BOOK2
(BID, BNAME, PUB, PRICE)
AS SELECT * FROM BOOK WHERE BOOKNAME LIKE '%�౸%'
WITH READ ONLY;
SELECT * FROM VW_BOOK2 WHERE PUB = '�½�����';
-------------------------
CREATE VIEW VW_BOOK3
(BNAME,PUB,PREICE)
AS SELECT BOOKNAME, PUBLISHER, PRICE
FROM BOOK
WHERE BOOKNAME LIKE '%�౸%'
WITH READ ONLY;
-------------------------
CREATE OR REPLACE VIEW VW_ORDERS
AS
SELECT O.ORDERID, O.CUSTID, O.BOOKID, 
    C.NAME, C.PHONE, C.ADDRESS,
    B.BOOKNAME, B.PUBLISHER, B.PRICE,
    O.SALEPRICE, O.ORDERDATE
FROM ORDERS O, BOOK B, CUSTOMER C
WHERE O.BOOKID = B.BOOKID AND O.CUSTID = C.CUSTID
ORDER BY O.ORDERID
WITH READ ONLY;
------------------------
-- (����) ������, �迬�ư� ������ å ����, ���Աݾ�, ��������
SELECT NAME, BOOKNAME, SALEPRICE, ORDERDATE FROM VW_ORDERS 
WHERE NAME IN ('������', '�迬��');

-- �� ����
DROP VIEW VW_ORDERS;

--============================
--(�ǽ�) �並 ����, ��ȸ, ����
--1. ����� - ���Ī : VW_ORD_ALL
---- �ֹ�(�Ǹ�)����, å����, ������ ��� ��ȸ�� �� �ִ� ���� �� 
CREATE OR REPLACE VIEW VW_ORD_ALL
AS
SELECT O.ORDERID, O.CUSTID, O.BOOKID, 
    C.NAME, C.PHONE, C.ADDRESS,
    B.BOOKNAME, B.PUBLISHER, B.PRICE,
    O.SALEPRICE, O.ORDERDATE
FROM CUSTOMER C, ORDERS O, BOOK B
WHERE C.CUSTID = O.CUSTID AND O.BOOKID = B.BOOKID
WITH READ ONLY;
--2. �̻�̵��� ������ å�� �Ǹŵ� å����, �Ǹűݾ�, �Ǹ��� ��ȸ
SELECT BOOKNAME, SALEPRICE, ORDERDATE FROM VW_ORD_ALL
WHERE PUBLISHER = '�̻�̵��';
--3. �̻�̵��� ������ å �߿��� �߽ż�, ��̶��� ������ å ���� ��ȸ
---- ����׸� : ������ ����̸�, å����, ���ǻ�, ����(����), �ǸŰ�, �Ǹ�����
---- ���� : ������ ����̸�, �������� �ֱټ�
SELECT NAME, BOOKNAME, PRICE, SALEPRICE, ORDERDATE FROM VW_ORD_ALL
WHERE PUBLISHER = '�̻�̵��'
AND NAME IN ('�߽ż�', '��̶�')
ORDER BY NAME, ORDERDATE;
--4. �Ǹŵ� å�� ���Ͽ� �����ں� �Ǽ�, �հ�ݾ�, ��ձݾ�, �ְ�, ������ ��ȸ
--(����) ����� : VW_ORD_ALL ���� ó��
SELECT NAME, COUNT(*), SUM(SALEPRICE), TRUNC(AVG(SALEPRICE)), MAX(SALEPRICE), MIN(SALEPRICE) FROM VW_ORD_ALL
GROUP BY NAME;
DROP VIEW VW_ORD_ALL;
--================================
-- FORCE : SELECT ���� ���̺��� ���������ʾƵ� ��(VIEW)�� ������ ����
CREATE OR REPLACE FORCE VIEW VW_AAA
AS
SELECT ID, NAME, PHONE FROM AAA; --AAA ���̺� ���� ��



