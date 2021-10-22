/* UNION, UNOIN ALL : ������ ó��
-- UNION : �ߺ������͸� �����ϰ� ������(�ߺ������ʹ� 1���� ǥ��)
-- UNION ALL : �ߺ������͸� �����ؼ� ������(�ߺ������� ��� ���)
��, ��ȸ�ϴ� �÷��� �̸�, ����, ����, Ÿ���� ��ġ�ǵ��� �ۼ�
*******************************/
-- UNION ���
SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID IN (1, 2, 3);
SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID IN (3, 4, 5);
---- UNION ���� ���ϱ� : �ߺ������ʹ� 1���� ���
SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID IN (1, 2, 3)
UNION
SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID IN (3, 4, 5);
---- UNION ALL ����ؼ� ���ϱ� : �ߺ������͵� ��� ���
SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID IN (1, 2, 3)
UNION ALL
SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID IN (3, 4, 5)
ORDER BY NAME; -- ORDER BY ���� �������� �ۼ�(1����) 
--------------------------------
-- MINUS : ������(���� ����)
SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID IN (1, 2, 3)
MINUS
SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID IN (3, 4, 5);
--------------------------------
-- INTERSECT : ������(�ߺ������� ��ȸ) - ���ι��� ����� ����� ����
SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID IN (1, 2, 3)
INTERSECT
SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID IN (3, 4, 5); 
---- ���ι�
SELECT A.* FROM (SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID IN (1, 2, 3)) A,
                (SELECT CUSTID, NAME FROM CUSTOMER WHERE CUSTID IN (3, 4, 5)) B
        WHERE A.CUSTID = B.CUSTID
        AND A.NAME = B.NAME;



