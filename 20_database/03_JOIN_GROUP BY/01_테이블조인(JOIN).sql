-- ������ ��ID
SELECT CUSTID FROM CUSTOMER WHERE NAME = '������'; --CUSTID : 1
-- �������� ������ å�� �հ�ݾ�
SELECT * FROM ORDERS WHERE CUSTID = 1;
SELECT SUM(SALEPRICE) FROM ORDERS WHERE CUSTID = 1;

--��������(SUB QUERY) ���
SELECT SUM(SALEPRICE) FROM ORDERS WHERE CUSTID = (SELECT CUSTID FROM CUSTOMER WHERE NAME = '������');
--=============================================================
-- ���̺� ����(JOIN) ���
SELECT * FROM CUSTOMER WHERE CUSTID = 1; -- ������
SELECT * FROM ORDERS WHERE CUSTID = 1; -- ������

-- CUSTOMER, ORDERS ���̺� ���� ��ȸ
SELECT * FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
AND NAME = '������';
-------------------------------------
--���̺� ���� ��Ī ������� �����ϰ� ǥ���ϰ� ���
SELECT * FROM CUSTOMER C, ORDERS O --���̺� ���� ��Ī ���
WHERE C.CUSTID = O.CUSTID --��������
AND C.NAME = '������'; --�˻�����

--ANSI ǥ�� ���� ����
SELECT * 
FROM CUSTOMER C INNER JOIN ORDERS O
    ON C.CUSTID = O.CUSTID --��������
    WHERE C.NAME = '������' --�˻�����
;
------------------------------------
--�������� ������ �հ�ݾ�
SELECT SUM(O.SALEPRICE)
--SELECT * 
FROM CUSTOMER C, ORDERS O --������ ���̺�
WHERE C.CUSTID = O.CUSTID --��������
AND C.NAME = '������'; --�˻�����
------------------------------------
SELECT * FROM ORDERS;
-- ������ å�� �Ǹŵ� å ���(�̵��� ������ ���ǻ�)
SELECT *
FROM BOOK B, ORDERS O
WHERE B.BOOKID = O.BOOKID --��������
--AND B.PUBLISHER = '�½�����'
AND B.PUBLISHER LIKE '%�̵��'
ORDER BY B.PUBLISHER, B.BOOKNAME
;
--============================================================
--(�ǽ�) ���̺� �����ؼ� ��û������ ã��
--1.'�߱��� ��Ź��'��� å�� �ȸ����� Ȯ��(å����, �Ǹűݾ�, �Ǹ�����)
SELECT B.BOOKNAME, O.SALEPRICE, O.ORDERDATE FROM BOOK B, ORDERS O
WHERE B.BOOKID = O.BOOKID
AND B.BOOKNAME = '�߱��� ��Ź��';

---
SELECT B.BOOKNAME, O.SALEPRICE, O.ORDERDATE
FROM BOOK B INNER JOIN ORDERS O
ON B.BOOKID = O.BOOKID
AND B.BOOKNAME = '�߱��� ��Ź��';

--2. '�߱��� ��Ź��'��� å�� ����� �ȷȴ��� Ȯ��
SELECT COUNT(*)
FROM BOOK B, ORDERS O
WHERE B.BOOKID = O.BOOKID
AND B.BOOKNAME = '�߱��� ��Ź��';

--3. '�߽ż�'�� ������ å���� ��������(å��, ��������)
SELECT O.SALEPRICE, O.ORDERDATE FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
AND C.NAME = '�߽ż�';

--4. '�߽ż�'�� ������ �հ�ݾ� Ȯ��
SELECT SUM(O.SALEPRICE)
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
AND C.NAME = '�߽ż�';

--5. '������', '�߽ż�'�� ������ ������ Ȯ��(�̸�, �Ǹűݾ�, �Ǹ�����)
SELECT C.NAME, O.SALEPRICE, O.ORDERDATE FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
AND C.NAME IN ('������', '�߽ż�');
--AND (C.NAME = '�߽ż�' OR C.NAME = '������');
--============================================================
--3�� ���̺� �����ؼ� ������ ��ȸ
--����, å����, ���ǻ��, �ǸŰ���, �Ǹ�����,
-- A=B, A=C
SELECT C.NAME, B.BOOKNAME, B.PUBLISHER, O.SALEPRICE, O.ORDERDATE FROM ORDERS O, BOOK B, CUSTOMER C
WHERE O.BOOKID = B.BOOKID --��������
AND O.CUSTID = C.CUSTID;   --��������
-- A=B, B=C
SELECT C.NAME, B.BOOKNAME, B.PUBLISHER, O.SALEPRICE, O.ORDERDATE FROM ORDERS O, BOOK B, CUSTOMER C
WHERE B.BOOKID = O.BOOKID --��������
AND O.CUSTID = C.CUSTID;   --��������
--�Ƚ�ǥ��
SELECT C.NAME, B.BOOKNAME, B.PUBLISHER, O.SALEPRICE, O.ORDERDATE 
FROM BOOK B INNER JOIN ORDERS O
ON B.BOOKID = O.BOOKID
INNER JOIN CUSTOMER C
ON O.CUSTID = C.CUSTID;

--------------------------------------------------------
--(�ǽ�) BOOK, CUSTOMER, ORDERS ���̺� ������ ��ȸ
--1. ��̶��� ������ å����, ���԰���, ��������, ���ǻ�
SELECT B.BOOKNAME, O.SALEPRICE, O.ORDERDATE, B.PUBLISHER FROM BOOK B, ORDERS O, CUSTOMER C
WHERE C.CUSTID = O.CUSTID
AND O.BOOKID = B.BOOKID
AND C.NAME = '��̶�';

--2. ��̶��� ������ å �߿� 2014-01-01 ~ 2014-07-08���� ������ ����
SELECT ORDERDATE, TO_CHAR(ORDERDATE, 'YYY-MM-DD HH24:MI:SS') FROM ORDERS;  -- ORDERDATE �ú��� Ȯ��
SELECT * FROM BOOK B, ORDERS O, CUSTOMER C
WHERE C.CUSTID = O.CUSTID
AND O.BOOKID = B.BOOKID
AND C.NAME = '��̶�'
AND ORDERDATE >= TO_DATE('2014-01-01','YYYY-MM-DD') AND ORDERDATE <= TO_DATE('2014-07-08','YYYY-MM-DD');
--=
SELECT * FROM BOOK B, ORDERS O, CUSTOMER C
WHERE C.CUSTID = O.CUSTID
AND O.BOOKID = B.BOOKID
AND C.NAME = '��̶�'
AND ORDERDATE BETWEEN TO_DATE('2014-01-01','YYYY-MM-DD') AND TO_DATE('2014-07-08','YYYY-MM-DD');

--3. '�߱��� ��Ź��'��� å�� ������ ����� �������ڸ� Ȯ��
SELECT C.NAME, O.ORDERDATE FROM BOOK B, ORDERS O, CUSTOMER C
WHERE C.CUSTID = O.CUSTID
AND O.BOOKID = B.BOOKID
AND B.BOOKNAME = '�߱��� ��Ź��';

--4. �߽ż�, ��̶��� ������ å����, ���Աݾ�, �������� Ȯ��
----(����: ����, �������� ������)
SELECT C.NAME, B.BOOKNAME, O.SALEPRICE, O.ORDERDATE FROM BOOK B, ORDERS O, CUSTOMER C
WHERE C.CUSTID = O.CUSTID
AND O.BOOKID = B.BOOKID
AND C.NAME IN ('�߽ż�', '��̶�')
ORDER BY C.NAME, O.ORDERDATE;
--ORDER BY 1, 4 -- �̷��Ե� ����

--5. �߽ż��� ������ å����, �հ�ݾ�, ��հ�, ���� ��� å �ݾ�, ���� �� å �ݾ�
SELECT COUNT(*), SUM(O.SALEPRICE), AVG(O.SALEPRICE), MAX(O.SALEPRICE), MIN(O.SALEPRICE) FROM ORDERS O, CUSTOMER C  -- 2�� ���̺� ����
WHERE C.CUSTID = O.CUSTID
AND C.NAME = '�߽ż�';

-- 5-1.������� ���������
-- �׷��Լ� + Ư�� �÷� �� ������ ������ ������ �� -- > GROUP BY �������
SELECT C.NAME, COUNT(*), SUM(O.SALEPRICE), ROUND(AVG(O.SALEPRICE)), MAX(O.SALEPRICE), MIN(O.SALEPRICE) FROM ORDERS O, CUSTOMER C 
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME;
--------------------------------------------------------
















