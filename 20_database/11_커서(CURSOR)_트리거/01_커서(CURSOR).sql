/* ******** CURSOR(Ŀ��) **************
�����ͺ��̽� Ŀ��(Cursor)�� �Ϸ��� �����Ϳ� ���������� �׼����� �� 
�˻� �� "���� ��ġ"�� �����ϴ� ������ ���

������Ŀ�� : SELECT, INSERT, UPDATE, DELETE ������ ����� ��
     DBMS�� CURSOR(Ŀ��)�� Open, Fetch, Close �ڵ� ó��
�����Ŀ�� : ���α׷������� ��������� Ŀ��(CURSOR)�� ������ ���

<Ŀ��(CURSOR) ��� ����>
1. ����(CURSOR Ŀ���� IS SELECT��)
2. Ŀ������(OPEN Ŀ����)
3. ����Ÿ����(FETCH Ŀ���� INTO)
4. Ŀ���ݱ�(CLOSE Ŀ����)
------------------------------------------
- SQL%ROWCOUNT : ���� ��
- SQL%FOUND : 1�� �̻��� ��� (������� ������ true)
- SQL%NOTFOUND : ������� �ϳ��� ������ true
- SQL%ISOPEN : �׻� false, �Ͻ��� Ŀ���� ���� ������ true
**************************************/
CREATE OR REPLACE PROCEDURE DISP_ORDERS
AS
    -- 1. Ŀ������(CURSOR Ŀ���� IS SELECT��)
    CURSOR C_ORDERS IS
    SELECT O.ORDERID, GET_CUSTNAME(CUSTID) CUSTNAME , GET_BOOKNAME(BOOKID) BOOKNAME, O.SALEPRICE, O.ORDERDATE
    FROM ORDERS O
    ORDER BY ORDERID DESC;
    
    -- ����� ���� ����
    V_ORDERID ORDERS.ORDERID%TYPE;
    V_CUSTNAME CUSTOMER.NAME%TYPE;
    V_BOOKNAME BOOK.BOOKNAME%TYPE;
    V_SALEPRICE ORDERS.SALEPRICE%TYPE;
    V_ORDERDATE ORDERS.ORDERDATE%TYPE;
BEGIN
    -- Ŀ����� : ���õ� �����͸� ȭ�� ���
    -- 2. Ŀ������(OPEN Ŀ����)
    OPEN C_ORDERS; 
    
    LOOP
        -- 3. ����������(FETCH Ŀ���� INTO)
        FETCH C_ORDERS
        INTO V_ORDERID, V_CUSTNAME, V_BOOKNAME, V_SALEPRICE, V_ORDERDATE;
        
    EXIT WHEN C_ORDERS%NOTFOUND; -- Ŀ���� �����Ͱ� ������ �ݺ� ����
        -- Ŀ������ ������ ������ ȭ�� ���
        DBMS_OUTPUT.PUT_LINE(V_ORDERID ||', '|| V_CUSTNAME ||', '|| V_BOOKNAME ||', '|| V_SALEPRICE ||', '|| V_ORDERDATE);
    END LOOP;
    
    -- 4. Ŀ���ݱ�(CLOSE Ŀ����)
    CLOSE C_ORDERS;
END;




