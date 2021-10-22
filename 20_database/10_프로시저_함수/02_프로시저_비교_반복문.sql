/* �񱳱���(�б�ó��) IF��
IF (���ǽ�) THEN ~ END IF;
IF (���ǽ�) THEN ~ ELSE ~ END IF;
IF (���ǽ�) THEN ~ ELSIF ... ELSIF... ELSE ~ END IF;

**************************/
-- Ȧ��, ¦�� �Ǻ�
CREATE OR REPLACE PROCEDURE PRC_IF (
  IN_NUM IN NUMBER 
) AS 
BEGIN
    DBMS_OUTPUT.PUT_LINE('>> �Է°� : ' || IN_NUM);
    
    -- Ȧ,¦ �Ǻ�
    IF (MOD(IN_NUM, 2) = 0) THEN  --> MOD: IN_NUM�� 2�� ���� �������� 0
        DBMS_OUTPUT.PUT_LINE(IN_NUM || ' : ¦��');
    ELSE
        DBMS_OUTPUT.PUT_LINE(IN_NUM || ' : Ȧ��');
    END IF;
END PRC_IF;
---------------------------------------------------
-- 4�� ���� ������ �� Ȯ��
CREATE OR REPLACE PROCEDURE PRC_IF2 (
  IN_NUM IN NUMBER 
) AS 
BEGIN
  DBMS_OUTPUT.PUT_LINE('>> �Է°� : ' || IN_NUM);
  
    -- 4�� ���� ������ �� Ȯ��
    IF (MOD(IN_NUM, 4) = 0) THEN
    DBMS_OUTPUT.PUT_LINE('>> 4�� ���� ������ 0');
    ELSIF (MOD(IN_NUM, 4) = 1) THEN
        DBMS_OUTPUT.PUT_LINE('>> 4�� ���� ������ 1');
    ELSIF (MOD(IN_NUM, 4) = 2) THEN
        DBMS_OUTPUT.PUT_LINE('>> 4�� ���� ������ 2');
    ELSE
        DBMS_OUTPUT.PUT_LINE('>> 4�� ���� ������ 3');
    END IF;
END PRC_IF2;

--===================================================
-- �ݺ��� : FOR, WHILE
-- FOR��
---- FOR ���� IN �ʱⰪ .. �ʱⰪ LOOP ~ END LOOP;
------------------------
-- ����(N)�� �ϳ� �Է¹޾Ƽ� �հ踦 ���(1~N ������ ��)
CREATE OR REPLACE PROCEDURE PRC_FOR_SUM(
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0; -- �հ� ���� ����(�ʱⰪ 0)
BEGIN
  -- �Է¹��� ���ڱ����� �հ� ���ϱ�
  DBMS_OUTPUT.PUT_LINE('>> �Է°� : '|| IN_NUM);
  
  -- FOR ������ �ݺ�ó��
  FOR I IN 1 .. IN_NUM LOOP  --> �ݺ����� I�� 1���� IN_NUM���� �ݺ�
    V_SUM := V_SUM + I;
    DBMS_OUTPUT.PUT_LINE('>> I : ' || I || ', �հ� : ' || V_SUM);
  END LOOP;
  
    DBMS_OUTPUT.PUT('1 ���� ' || IN_NUM || '������ �հ� : ');
    DBMS_OUTPUT.PUT_LINE(V_SUM);

    DBMS_OUTPUT.PUT_LINE('�հ� : ' || V_SUM);
  
END PRC_FOR_SUM;
---------------------------------------------------
-- FOR�� REVERSE �ɼ� ���(���������� �ʱⰪ���� �ݺ�ó��)
CREATE OR REPLACE PROCEDURE PRC_FOR_REVERSE (
  IN_NUM IN NUMBER 
) AS 
BEGIN
  FOR I IN REVERSE 1 .. IN_NUM LOOP
        DBMS_OUTPUT.PUT_LINE(I);
  END LOOP;
END PRC_FOR_REVERSE;
--===================================================
-- WHILE ��
-- WHILE (���ǽ�) LOOP ~ END LOOP;
-- ����(N)�� �ϳ� �Է¹޾Ƽ� �հ踦 ���(1~N ������ ��)
CREATE OR REPLACE PROCEDURE PRC_WHILE_SUM (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    I NUMBER := 1; --> �ʱⰪ
BEGIN
  -- �Է°� Ȯ��(���)
  DBMS_OUTPUT.PUT_LINE('�Է°� : ' || IN_NUM);
  
  WHILE (I <= IN_NUM) LOOP
    V_SUM := V_SUM + I;
    I := I + 1; --> WHILE���� �ʱⰪ ����ó���� �� �������
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('1~' || IN_NUM || '������ �հ� : ' || V_SUM);
END PRC_WHILE_SUM;
-------------------------------
/* LOOP ~ END LOOP;
LOOP
    EXIT WHEN (�������ǽ�);
END LOOP;
*****************************/
CREATE OR REPLACE PROCEDURE LOOP1
AS 
    I NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('I : ' || I);
        EXIT WHEN (I >= 10);
        I := I + 1;
        END LOOP;
END LOOP1;
--============================
/* (�ǽ�)���ڸ� �ϳ� �Է� �޾Ƽ� 1~ ���ڱ����� �հ� ���ϱ�
���ν����� : PRC_SUM_EVENODD
-- �Է°��� Ȧ���� Ȧ������ ���ϰ�
-- �Է°��� ¦���� ¦������ ���ؼ�
���� �հ谪�� ȭ�� ���
<�������>
-- �Է¼��� : �Է°�, Ȧ��/¦��, �հ�: �հ���
    ��¿�) �Է¼���: 4, ¦��, �հ�: 6
********************************/
create or replace PROCEDURE PRC_SUM_EVENODD (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    V_EVEN_ODD VARCHAR2(10); -- Ȧ�� ¦��
BEGIN

    IF(MOD(IN_NUM,2) = 0) THEN 
        V_EVEN_ODD := '¦��';
    ELSE
        V_EVEN_ODD := 'Ȧ��';
    END IF;
    
    -- Ȧ���� �Ǵ� ¦���� ���ϱ�
    FOR I IN 1 .. IN_NUM LOOP
        IF(MOD(I,2) = 0 AND V_EVEN_ODD = '¦��') THEN
            V_SUM := V_SUM + I;
        END IF;
        IF(MOD(I,2) <> 0 AND V_EVEN_ODD = 'Ȧ��') THEN
            V_SUM := V_SUM + I;
        END IF;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('�Է¼���: ' || IN_NUM || V_EVEN_ODD || ', �հ�: ' || V_SUM);
    
END PRC_SUM_EVENODD;
-----------------------------------------------------------
create or replace PROCEDURE PRC_SUM_EVENODD2 (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    V_EVEN_ODD VARCHAR2(10); -- Ȧ��, ¦�� ���ڿ� ���� ����
    V_MOD NUMBER(1);
BEGIN
    -- �Է°� Ȧ/¦ �Ǻ� �� Ȧ���� ��� Ȧ�� ��, ¦���� ��� ¦�� �� ���ϱ� 
    V_MOD := MOD(IN_NUM, 2);
  IF (V_MOD = 0) THEN 
      V_EVEN_ODD := '¦��';
  ELSE
      V_EVEN_ODD := 'Ȧ��';
      
  END IF;
  
  -- Ȧ����, ¦���� ���ϱ� 
  FOR I IN 1 .. IN_NUM LOOP   -- I�� 1���� IN_NUM���� �ݺ�
     IF (MOD(I, 2) = V_MOD) THEN
      V_SUM := V_SUM + I;
     END IF;
  END LOOP;
    DBMS_OUTPUT.PUT_LINE('�Է¼���: ' || IN_NUM 
            || ', ' ||V_EVEN_ODD || ', ��' || V_SUM);
   
   
END PRC_SUM_EVENODD2;
----------------------------------------------------
create or replace PROCEDURE PRC_SUM_EVENODD_WHILE (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    V_EVEN_ODD VARCHAR2(10); -- Ȧ��, ¦�� ���ڿ� ���� ����
    V_MOD NUMBER(1);
    I NUMBER := 0;
BEGIN
    -- �Է°� Ȧ/¦ �Ǻ� �� Ȧ���� ��� Ȧ�� ��, ¦���� ��� ¦�� �� ���ϱ� 
    IF (MOD(IN_NUM, 2) = 0) THEN --> ¦���϶�
        I := 2;  --> �Ʒ��� WHILE�� ���۰��� 2�� ��
        V_EVEN_ODD := '¦��';
    ELSE  --> Ȧ���϶�
        I := 1; --> �Ʒ��� WHILE�� ���۰��� 1�� ��
        V_EVEN_ODD := 'Ȧ��';
    END IF;
    
    WHILE (I <= IN_NUM) LOOP
        V_SUM := V_SUM + I;
        I := I + 2;
    END LOOP;        
    
    DBMS_OUTPUT.PUT_LINE('�Է¼���: ' || IN_NUM || ', ' ||V_EVEN_ODD || ', ��' || V_SUM);
  
END PRC_SUM_EVENODD_WHILE;







