-- INSERT, UPDATE, DELETE
/*******************************
�� INSERT��
INSERT INTO ���̺��
        (�÷���1, �÷���2, ...., �÷���n)
VALUES (��1, ��2, ... ��n);

�� UPDATE ��
UPDATE ���̺��
    SET �÷���1 = ��1, �÷���2 = ��2, ..., �÷���n = ��n
WHERE ������ǹ�

�� DELETE ��
DELETE FROM ���̺��
WHERE ������ǹ�
*******************************/
SELECT * FROM BOOK;
INSERT INTO BOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES (30, '�ڹٶ� �����ΰ�', 'ITBOOK', 30000);
COMMIT;
INSERT INTO BOOK(BOOKID, PUBLISHER, BOOKNAME, PRICE)
VALUES (31, 'ITBOOK', '�ڹٶ� �����ΰ�2', 30000);
ROLLBACK;
COMMIT;
/* INSERT : �÷����� �������� �ʰ� �Է�
---- ���̺� ������ �ۼ��� �÷��� ���� ��� �ۼ�(������ ����)
---- ���̺� �ۼ��� �÷��� ������ ���� ������ �Է����� �ʴ� ���
    (�Է¼���) ���� ���� - �߸��� ��ġ�� ������ �Էµ�
    (�Է½���) ������ Ÿ�� ����ġ, ������ ũ�� ������ �� 
*******************************/
SELECT * FROM BOOK;
INSERT INTO BOOK
VALUES (32, '�ڹٶ� �����ΰ�3', 'ITBOOK', 38000);
COMMIT;
INSERT INTO BOOK
VALUES (33, '�ڹٶ� �����ΰ�4', '', 38000);
INSERT INTO BOOK
VALUES (34, 'ITBOOK', '�ڹٶ� �����ΰ�5', 38000);
COMMIT;
-------
INSERT INTO BOOK
    (BOOKID, PUBLISHER, BOOKNAME, PRICE)
VALUES(35, 'ITBOOK', '�ڹٶ������ΰ�6', 30000);
INSERT INTO BOOK
    (BOOKID, PUBLISHER, BOOKNAME)
VALUES(36, 'ITBOOK', '�ڹٶ������ΰ�7');
COMMIT;
SELECT * FROM BOOK ORDER BY BOOKID DESC;
-----------------------------
-- �ϰ��Է� : ���̺��� �����͸� �̿��ؼ� ���� �����͸� �ѹ��� �Է�ó��
---- IMPORTED_BOOK --> BOOK : �ϰ��Է�
INSERT INTO BOOK
SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE
FROM IMPORTED_BOOK;
SELECT * FROM BOOK ORDER BY BOOKID DESC;
-----------------------------
/*
�� UPDATE ��
UPDATE ���̺��
    SET �÷���1 = ��1, �÷���2 = ��2, ..., �÷���n = ��n
WHERE ������ǹ�
***********************/
SELECT * FROM CUSTOMER;
-- �ڼ��� �ּ� ���� : ���ѹα� ���� --> ���ѹα� �λ�
UPDATE CUSTOMER
SET ADDRESS = '���ѹα� �λ�'
WHERE NAME = '�ڼ���';
COMMIT;

-- �ڼ��� �ּ�, ��ȭ��ȣ ���� : ���ѹα� ����, 010-1111-1111 �� ����
UPDATE CUSTOMER
SET ADDRESS = '���ѹα� ����', PHONE = '010-1111-1111'
WHERE NAME = '�ڼ���';
SELECT * FROM CUSTOMER WHERE NAME = '�ڼ���';
COMMIT;
-----------------------------
-- �ڼ��� �ּ� ���� : �迬���� �ּҿ� �����ϰ� ����
---- UPDATE���� �������� �������� ������ ������ ã�� ����
---- �������� ��� �����Ͱ� 1�� ���Ͽ��� ��(2�� �̻��� ��� ����)
UPDATE CUSTOMER
SET ADDRESS = (SELECT ADDRESS FROM CUSTOMER WHERE NAME = '�迬��')
WHERE NAME = '�ڼ���';
COMMIT;
-----------------------------
-- �ڼ����� �ּ�, ��ȭ��ȣ ���� : �߽ż��� �����ϰ�
UPDATE CUSTOMER
SET ADDRESS = (SELECT ADDRESS FROM CUSTOMER WHERE NAME = '�߽ż�'),
    PHONE = (SELECT PHONE FROM CUSTOMER WHERE NAME = '�߽ż�')
WHERE NAME = '�ڼ���';
COMMIT;
/*

�� DELETE ��
DELETE FROM ���̺��
WHERE ������ǹ�
***********************/
SELECT * FROM TEST_LIKE;
--DELETE FROM TEST_LIKE WHERE NAME = 'ȫ�浿';
--DELETE FROM TEST_LIKE WHERE NAME LIKE 'ȫ�浿';

--DELETE FROM TEST_LIKE WHERE NAME LIKE 'ȫ�浿%';
SELECT * FROM TEST_LIKE;
COMMIT;
------------------
SELECT * FROM BOOK;
-- å ������ �ڹٷ� �����ϰ� ���ǻ簡 ITBOOK �� ������ ����
SELECT * FROM BOOK
--DELETE FROM BOOK
WHERE BOOKNAME LIKE '�ڹ�%' AND PUBLISHER = 'ITBOOK';
COMMIT;
------------------
SELECT * 
--DELETE 
FROM BOOK 
WHERE BOOKID >= 30;
COMMIT;










