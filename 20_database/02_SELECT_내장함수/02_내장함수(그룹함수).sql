?/* �����Լ� : ����Ŭ DBMS���� �����ϴ� �Լ�(FUNCTION)
�׷��Լ� : �ϳ� �̻��� ���� �׷����� ��� ����
COUNT(*) : ������ ���� ��ȸ(��ü �÷��� ���Ͽ�)
COUNT(�÷���) : ������ ���� ��ȸ(������ �÷��� �������)
SUM(�÷���) : �հ谪 ���ϱ�
AVG(�÷���) : ��հ� ���ϱ�
MAX(�÷���) : �ִ밪 ���ϱ�
MIN(�÷���) : �ּҰ� ���ϱ�
******************************/
SELECT COUNT (*) FROM BOOK; -- ���̺� ������ �Ǽ� Ȯ��
SELECT * FROM CUSTOMER; -- ������ �Ǽ� 5��
SELECT COUNT (*) FROM CUSTOMER; -- 5�� Ȯ��
SELECT COUNT (NAME) FROM CUSTOMER; -- 5��Ȯ��
SELECT COUNT (PHONE) FROM CUSTOMER; -- 4�� ��ȸ : NULL ���� ���ܵ� // �ȵǰ� �Ϸ��� �������� : PK,NOT NULL...
-------------------------------
--SUM(�÷���) : �հ谪 ���ϱ�
SELECT * FROM BOOK;
SELECT SUM(PRICE) FROM BOOK;
--(�ǽ�)���ѹ̵��, �̻�̵�� ���ǻ翡�� ������ ��� å �ݾ� �հ�
SELECT SUM(PRICE) FROM BOOK WHERE PUBLISHER IN ('���ѹ̵��', '�̻�̵��');

--AVG(�÷���) : ��հ� ���ϱ�
SELECT AVG(PRICE) FROM BOOK;
--(�ǽ�)���ѹ̵��, �̻�̵�� ���ǻ翡�� ������ ��� å ��� �ݾ�
SELECT AVG(PRICE) FROM BOOK WHERE PUBLISHER IN ('���ѹ̵��', '�̻�̵��');

--MAX(�÷���) : �ִ밪 ���ϱ�
--MIN(�÷���) : �ּҰ� ���ϱ�
SELECT * FROM BOOK;
SELECT MAX(PRICE), MIN(PRICE) FROM BOOK;
--(�ǽ�) �½����� ������ å�� �ְ�, ������
SELECT * FROM BOOK WHERE PUBLISHER = '�½�����';
SELECT MAX(PRICE), MIN(PRICE) FROM BOOK WHERE PUBLISHER ='�½�����';
-------------------------------
SELECT COUNT(*), SUM(PRICE), AVG(PRICE), MAX(PRICE), MIN(PRICE) FROM BOOK;
--=============================
--(�ǽ�����)
--1. ���ǵ� å ��ü ��ȸ(����: ���ǻ�, �ݾ� ��)
SELECT * FROM BOOK ORDER BY PUBLISHER, PRICE;
SELECT PUBLISHER, PRICE FROM BOOK ORDER BY PUBLISHER, PRICE;
--2. �½��������� ������ å�� å ��������� ��ȸ
SELECT * FROM BOOK WHERE PUBLISHER ='�½�����' ORDER BY BOOKNAME;
--3. ���ǵ� å �߿��� 10000 �̻��� å(���ݼ� - ū�ݾ׺���)
SELECT * FROM BOOK WHERE PRICE >= 10000 ORDER BY PRICE DESC;
--4. �������� �� ���ž�(CUSTID = 1)
SELECT * FROM CUSTOMER WHERE NAME = '������';
SELECT CUSTID FROM CUSTOMER WHERE NAME = '������';
SELECT SUM(SALEPRICE) FROM ORDERS WHERE CUSTID = 1;
SELECT SUM(SALEPRICE) AS SUM_SALEPRICE FROM ORDERS WHERE CUSTID = 1;  -- �÷��̸� SUM(SALEPRICE) --> SUM_SALEBPRICE �� ����
SELECT SUM(SALEPRICE) SUM_SALEPRICE FROM ORDERS WHERE CUSTID = 1; -- AS ���� ����
SELECT '������' NAME, SUM(SALEPRICE) SUM_SALEPRICE FROM ORDERS WHERE CUSTID = 1;

--��������
SELECT CUSTID FROM CUSTOMER WHERE NAME = '������';
SELECT SUM(SALEPRICE) FROM ORDERS 
WHERE CUSTID = (SELECT CUSTID FROM CUSTOMER WHERE NAME = '������');

--5. �������� ������ ������ �� (COUNT)
SELECT COUNT(*) FROM ORDERS WHERE CUSTID = 1;
SELECT COUNT(ORDERID) FROM ORDERS WHERE CUSTID = 1;
--6. ���� '��"�� ���� �̸��� �ּ� (LIKE)
SELECT NAME, ADDRESS FROM CUSTOMER WHERE NAME LIKE  '��%';
--7. ���� '��'�̰� �̸��� '��'���� ������ ���� �̸��� �ּ� (LIKE)
SELECT NAME, ADDRESS FROM CUSTOMER WHERE NAME LIKE '��%��';
SELECT NAME, ADDRESS FROM CUSTOMER WHERE NAME LIKE '��_��'; -- �̸��� ������ 3����
--8. å ������ '�߱�' ���� '�౸'������ �˻�(å �������� ���� ��, '����' ���� ������ ����)
SELECT * FROM BOOK WHERE BOOKNAME BETWEEN '�߱�' AND '�౸' 
    AND BOOKNAME NOT LIKE '%����%'
    ORDER BY BOOKNAME;
    
SELECT * FROM BOOK 
WHERE (BOOKNAME >= '�߱�' AND BOOKNAME <='�౸')
    AND BOOKNAME NOT LIKE '%����%'
    ORDER BY BOOKNAME;    






