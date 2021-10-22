/* *** �Լ�(FUNCTION) *****
CREATE OR REPLACE FUNCTION FUNCTION1 
(
  PARAM1 IN VARCHAR2  -- �Ķ���� �ۼ�����
) RETURN VARCHAR2  -- ���� ������ Ÿ�Լ���
AS 
BEGIN
  RETURN NULL;  -- ������ ��
END;
----------
-- ������ �����Ϳ� ���� ���� �ʿ�
RETURN ����������(Ÿ��)
-- ���α׷� �������� �� �����ϴ� ���� �ʿ�
RETURN ���ϰ�;
**************************/
-- BOOKID�� å���� Ȯ���ϴ� �Լ�(�Ķ���Ͱ�: BOOKID, RETURN��: BOOKNAME)
CREATE OR REPLACE FUNCTION GET_BOOKNAME (
  IN_ID IN NUMBER 
) RETURN VARCHAR2 -- ������ ������ Ÿ�� ����
AS 
    V_BOOKNAME BOOK.BOOKNAME%TYPE;
BEGIN
    SELECT BOOKNAME INTO V_BOOKNAME
    FROM BOOK
    WHERE BOOKID = IN_ID;
    
    RETURN V_BOOKNAME; -- ���ϰ� ����
END;
------------------------------------------
-- �Լ�(FUNCTION)�� ���
-- SELECT ���� ���
SELECT BOOKID, BOOKNAME, GET_BOOKNAME(BOOKID)
FROM BOOK;
---
SELECT O.*, GET_BOOKNAME(BOOKID) 
FROM ORDERS O;
---
-- WHERE ������ �Լ� ���
SELECT O.*, GET_BOOKNAME(BOOKID) 
FROM ORDERS O
WHERE GET_BOOKNAME(BOOKID) = '�౸�� ����';
------------------------------------------
-- ��ID ���� �޾Ƽ� ������ �����ִ� �Լ� �ۼ�(CUSTOMER ���̺� ���)
-- �Լ��� : GET_CUSTNAME
-- �Լ��� ����ؼ� ORDERS ���̺� ������ ��ȸ
---- GET_BOOKNAME, GET_CUSTNAME �Լ� ��� �ֹ�(�Ǹ�) ������ å����, ���� ��ȸ
---------------------
create or replace FUNCTION GET_CUSTNAME (
  IN_CUSTID IN NUMBER 
) RETURN VARCHAR2 
AS 
    V_NAME CUSTOMER.NAME%TYPE;
BEGIN
    SELECT NAME INTO V_NAME
    FROM CUSTOMER
    WHERE CUSTID = IN_CUSTID;
    RETURN V_NAME;
END;
---
SELECT O.*, GET_CUSTNAME(CUSTID) CUSTNAME
FROM ORDERS O;
---
SELECT O.*, GET_BOOKNAME(BOOKID) BOOK_NAME, GET_CUSTNAME(CUSTID) CUST_NAME
FROM ORDERS O;
---
-- ���ι��� �� ȿ������
SELECT O.*, B.BOOKNAME, C.NAME
FROM ORDERS O, BOOK B, CUSTOMER C
WHERE O.BOOKID = B.BOOKID AND O.CUSTID = C.CUSTID;





