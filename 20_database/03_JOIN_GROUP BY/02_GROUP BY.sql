/* *************************
SELECT [* | DISTINCT] {�÷���, �÷���, ...}
  FROM ���̺��
[WHERE ������]
[GROUP BY {�÷���, ....}
    [HAVING ����] ] --GROUP BY ���� ���� ����
[ORDER BY {�÷��� [ASC | DESC], ....}] --ASC : ��������(�⺻/��������)
                                      --DESC : ��������
---------------------------
�� GROUP BY : �����͸� �׷����ؼ� ó���� ��� ���
�� GROUP BY ���� ����� �� SELECT �׸� ����� �� �ִ� ����
   GROUP BY ���� ���� �÷� �Ǵ� �׷��Լ�(COUNT, SUM, AVG, MAX, MIN) �� ����� �� �ִ�
***************************/
-- ���� ������ ���űݾ��� �հ踦 ���Ͻÿ�
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
--ORDER BY 2  --> SELECT ���� 2��° �׸����� ����
---------------------------------
--�ֹ� ���̺��� ���� ������ ��ȸ(�Ǽ�, �հ�, ���, �ּ�, �ִ�)
SELECT C.NAME, COUNT(*), TRUNC(AVG(O.SALEPRICE)), MIN(O.SALEPRICE), MAX(O.SALEPRICE) FROM ORDERS O, CUSTOMER C
WHERE O.CUSTID = C.CUSTID
GROUP BY C.NAME
ORDER BY C.NAME;

-- ���� �������� ���� ������ ��ȸ(�Ǽ�, �հ�, ���, �ּ�, �ִ�)
-- �߽ż�, ��̶�, �� 2�� ��ȸ
SELECT C.NAME, SUM(SALEPRICE), TRUNC(AVG(SALEPRICE)), MIN(SALEPRICE), MAX(SALEPRICE) FROM CUSTOMER C ,ORDERS O
WHERE C.CUSTID = O.CUSTID
AND C.NAME IN ('�߽ż�', '��̶�')
GROUP BY C.NAME
ORDER BY 1;
--ANSI ǥ��
SELECT C.NAME, SUM(SALEPRICE), TRUNC(AVG(SALEPRICE)), MIN(SALEPRICE), MAX(SALEPRICE) 
FROM CUSTOMER C INNER JOIN ORDERS O
ON C.CUSTID = O.CUSTID
WHERE C.NAME IN ('�߽ż�', '��̶�')
GROUP BY C.NAME
ORDER BY C.NAME;
--==============================================
-- HAVING �� : GROUP BY ���� ���ؼ� ������� �����Ϳ��� �˻����� �ο�
-- HAVING ���� �ܵ����� ���� �� ����, �ݵ�� GROUP BY ���� �Բ� ���
-------------
-- 3�� �̻� ������ �� ��ȸ
SELECT C.NAME, COUNT(*) AS CNT
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
HAVING COUNT(*) >= 3; -- �׷��ε� �����Ϳ��� ���ϴ� ������ �˻�
-------------
-- ������ å�߿��� 20000�� �̻��� å�� ������ ����� ��赥���� (�Ǽ�, �հ�, ���, �ּ�, �ִ�)
SELECT C.NAME, SUM(SALEPRICE), TRUNC(AVG(SALEPRICE)), MIN(SALEPRICE), MAX(SALEPRICE) FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
HAVING MAX(O.SALEPRICE) >= 20000; -- �׷��� ����� ���ϰ� 2���� �̻� ������ ���ã��
--=
--���� : WHERE ���� ���Ǵ� ã�� ����(���̺� ������ ����)
-- HAVING ������ ���Ǵ� ������ �׷��ε� ������ �������� �˻�
-- (������� �ٸ��� ó���ǹǷ� ã�� �����Ͱ� �������� ��Ȯ�� �Ǵ��ϰ� ����� ��)
SELECT C.NAME, SUM(SALEPRICE), TRUNC(AVG(SALEPRICE)), MIN(SALEPRICE), MAX(SALEPRICE) FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
AND O.SALEPRICE >= 20000 -- 2���� �̻��� å ���� ������ �������
GROUP BY C.NAME;
--==============================================
-- �ʿ�� GROUP BY ~ HAVING ������ ����ؼ� ó��
-- 1. ���� �ֹ��� ������ ���ǸŰǼ�, �Ǹž�, ��հ�, ������, �ְ� ���ϱ�
SELECT COUNT(*) AS "TOTAL COUNT"
    , SUM(SALEPRICE) AS "�Ǹž� �հ�" -- AS "�ѱ�" : ��� ���������� �Ⱦ��°� ����
    , TRUNC(AVG(SALEPRICE)) ��հ�AVG
    , MIN(SALEPRICE) ������_MIN  -- �����(_) ��밡��
    , MAX(SALEPRICE)  "�ְ�(MAX)"
FROM ORDERS;

-- 2. ������ �ֹ��� ������ �Ѽ���, ���Ǹž� ���ϱ�
SELECT C.NAME, COUNT(*) AS CNT, SUM(O.SALEPRICE) AS SUM_PRICE FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
--ORDER BY SUM(O.SALEPRICE) DESC -- ����� �׷��Լ��� ����
--ORDER BY 3 DESC -- �÷� ��ġ������ ����
ORDER BY SUM_PRICE DESC; -- ��Ī(ALIAS)���� ����

-- 3. ���� �̸��� ���� �ֹ��� ������ �ǸŰ���, å�̸��� �˻�
SELECT C.NAME, O.SALEPRICE, B.BOOKNAME FROM CUSTOMER C, ORDERS O, BOOK B
WHERE C.CUSTID = O.CUSTID
AND O.BOOKID = B.BOOKID;

-- 4. ������ �ֹ��� ��� ������ ���Ǹž��� ���ϰ�, �������� ����
SELECT C.NAME, SUM(O.SALEPRICE) FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
ORDER BY C.NAME;

-- 5. ������ �ֹ��� �Ǽ�, �հ�ݾ�, ��ձݾ��� ���ϰ�(3�� �̸����� ������ ��� �˻�)
SELECT C.NAME, COUNT(*), SUM(O.SALEPRICE), TRUNC(AVG(O.SALEPRICE)) FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
GROUP BY C.NAME
HAVING COUNT(*) < 3;

-- (����) �� �� �� �ǵ� �������� ���� ��� ã��
-- 03_�ܺ����� ����
------------------------------------------------








