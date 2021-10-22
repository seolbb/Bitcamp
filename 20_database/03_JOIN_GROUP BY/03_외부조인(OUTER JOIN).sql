-- (����) �� �� �� �ǵ� �������� ���� ��� ã��
--    =  CUSTOMER ���̺��� �ְ�, ORDERS ���̺��� ���� ���
---------------------------------------------------------
-- (���1) ��������(SUB QUERY)
SELECT CUSTID FROM CUSTOMER WHERE CUSTID NOT IN (SELECT DISTINCT CUSTID FROM ORDERS); --DISTINCT : ���� ����

-- (���2) MINES : ������ ó��
SELECT CUSTID FROM CUSTOMER -- 1,2,3,4,5
MINUS
SELECT CUSTID FROM ORDERS; -- 1,1,2,3,4,1...
---------------------------------------------------------
-- (���3) �ܺ�����(OUTER JOIN)
-- ��������(INNER JOIN) - ��������(�����ϰ� �ִ�)
SELECT DISTINCT C.CUSTID, C.NAME FROM CUSTOMER C, ORDERS O  --> �����̷��� �ִ� ���
WHERE C.CUSTID = O.CUSTID; -- ��������(��������)   
---------------------------------------------
-- �ܺ�����(��������)
SELECT * FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID(+) -- ��������(��������)  --(+) ���°� ä���ִ´�
AND O.ORDERID IS NULL; -- CUSTID �ᵵ ��
-----
-- ANSI ǥ�� SQL(�������� - LEFT OUTER JOIN)
SELECT C.* FROM CUSTOMER C LEFT OUTER JOIN ORDERS O
ON C.CUSTID = O.CUSTID
WHERE O.ORDERID IS NULL -- CUSTID �ᵵ ��
;
---------------------------------------------------------
--�ܺ����� (��������)
SELECT * FROM ORDERS O, CUSTOMER C
WHERE O.CUSTID(+) = C.CUSTID -- �������� �ܺ�����
AND O.ORDERID IS NULL;
-- ANSI ǥ�� SQL(�������� - RIGHT OUTER JOIN)
SELECT C.* FROM ORDERS O RIGHT OUTER JOIN CUSTOMER C
ON C.CUSTID = O.CUSTID
WHERE O.ORDERID IS NULL; -- CUSTID �ᵵ ��
--=======================================================
-- ����(JOIN, INNER JOIN) : �������̺� ��ο� �����ϴ� ������ �˻�
-- �ܺ�����(OUTER JOIN) : ��� ���� ���̺� �����Ͱ� �������� �ʴ� ������ �˻�
---- ��� ������ ǥ���ϰ�, ��ġ���� �ʴ� ������ ã�� �� ���
--========================================================
CREATE TABLE DEPT(
    ID VARCHAR2(10) PRIMARY KEY,
    NAME VARCHAR2(30)
);
INSERT INTO DEPT VALUES ('10', '�ѹ���');
INSERT INTO DEPT VALUES ('20', '�޿���');
INSERT INTO DEPT VALUES ('30', 'IT��');
COMMIT;
------------
CREATE TABLE DEPT_1(
    ID VARCHAR2(10) PRIMARY KEY,
    NAME VARCHAR2(30)
);
INSERT INTO DEPT_1 VALUES ('10', '�ѹ���');
INSERT INTO DEPT_1 VALUES ('20', '�޿���');
COMMIT;
------------
CREATE TABLE DEPT_2(
    ID VARCHAR2(10) PRIMARY KEY,
    NAME VARCHAR2(30)
);
INSERT INTO DEPT_2 VALUES ('10', '�ѹ���');
INSERT INTO DEPT_2 VALUES ('30', 'IT��');
COMMIT;

SELECT * FROM DEPT;
SELECT * FROM DEPT_1;
SELECT * FROM DEPT_2;

-- DEPT = DEPT_1 ������ ã��
SELECT * FROM DEPT D, DEPT_1 D1
WHERE D.ID = D1.ID;
-- DEPT = DEPT_2 ������ ã��
SELECT * FROM DEPT D, DEPT_2 D2
WHERE D.ID = D2.ID;
-----------------
-- DEPT ���� �ְ�, DEPT_1 ���� ���� ������ ��ȸ
-- LEFT OUTER JOIN : ���� ���̺� ����
---- ��ü ������ ǥ���ϰ�, ������ ������ NULL ǥ��
SELECT * FROM DEPT D, DEPT_1 D1
WHERE D.ID = D1.ID(+); -- ��������(��������);
-- �������� �ִ� ������ ã��
SELECT * FROM DEPT D, DEPT_1 D1        --> FROM �� ������ ��� ����/ (+)�� ����ִ����� �߿�
WHERE D.ID = D1.ID(+)
AND D1.ID IS NULL;
--- ANSI ǥ�� SQL : LEFT OUTER JOIN - ���� ���̺� ����   --> OUTER ���� ����
SELECT D.* FROM DEPT D LEFT OUTER JOIN DEPT_1 D1 -- ���ι��(�������� �ܺ�����)
ON D.ID = D1.ID
WHERE D1.ID IS NULL;
-----------------
-- RIGHT OUTER JOIN : ���� ���̺� ����
SELECT * FROM DEPT_1 D1, DEPT D
WHERE D1.ID(+) = D.ID
AND D1.ID IS NULL;
--- ANSI ǥ�� SQL : RIGHT OUTER JOIN
SELECT D.* FROM DEPT_1 D1 RIGHT OUTER JOIN DEPT D
ON D1.ID = D.ID
WHERE D1.ID IS NULL;
-----------------
--(�ǽ�) DEPT_1, DEPT_2 ���̺��� ����ؼ�
--1. DEPT_1 ���� �ְ�, DEPT_2 ���̺��� ���� ������ ã�� (LEFT OUTER JOIN)
SELECT D1.* FROM DEPT_1 D1, DEPT_2 D2
WHERE D1.ID = D2.ID(+)
AND D2.ID IS NULL;
--ANSI ǥ��
SELECT D1.* FROM DEPT_1 D1 LEFT OUTER JOIN DEPT_2 D2
ON D1.ID = D2.ID
WHERE D2.ID IS NULL;
--2. DEPT_2 ���� �ְ�, DEPT_1 ���̺��� ���� ������ ã�� (RIGHT OUTER JOIN)
SELECT D2.* FROM DEPT_1 D1, DEPT_2 D2
WHERE D1.ID(+) = D2.ID
AND D1.ID IS NULL;
--ANSI ǥ��
SELECT D2.* FROM DEPT_1 D1 RIGHT OUTER JOIN DEPT_2 D2
ON D1.ID = D2.ID
WHERE D1.ID IS NULL;
--=====================
-- FULL OUTER JOIN : (+)��ȣ����� �ȵ� FULL [OUTER] JOIN ���
SELECT *
FROM DEPT_1 D1 FULL OUTER JOIN DEPT_2 D2
ON D1.ID = D2.ID
--WHERE D2.ID IS NULL -- ���� ���� ������
WHERE D1.ID IS NULL -- ���� ���� ������
;


