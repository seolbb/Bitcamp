/************************************************
����ȯ �����Լ�
TO_CHAR : ����Ÿ������ ��ȯ(��¥ -> ����, ���� -> ����)
TO_NUMBER : ����Ÿ������ ��ȯ(���� -> ����)
TO_DATE : ��¥Ÿ������ ��ȯ(���� -> ��¥)

      <- TO_NUMBER(����)  -> TO_DATE(����)
������   ----    ������   ----     ��¥��
      -> TO_CHAR(����)   <- TO_CHAR(��¥)
************************************************
--��¥ -> ����
TO_CHAR(��¥������, '�������')
<�������>
�⵵(YYYY, YY), ��(MM), ��(DD)
�ð� : HH, HH12(12 �ð���), HH24(24 �ð���)
��(MI), ��(SS)
����, ����: AM, PM
����Ͻú��� �ۼ���) YYYY-MM-DD HH24:MI:SS
************************************************/
--TO_CHAR : ����Ÿ������ ��ȯ(��¥->����, ����->����)
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD (DY)') FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL; -- 24�ð� ���
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS') FROM DUAL;  -- 12�ð� ���
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH12:MI:SS') FROM DUAL;  -- 12�ð� ���
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD PM HH:MI:SS') FROM DUAL;

--==============================================
/* TO_CHAR(����, '�������') : ���� -> ����Ÿ��
<��������>
0(��) : �ڸ����� ��Ÿ����, �ڸ����� ���� �ʴ� ��� 0�� ǥ��
9(��) : �ڸ����� ��Ÿ����, �ڸ����� ���� �ʴ� ��� ǥ������ ����
L : ���� ��ȭ ���� ǥ��
.(��) : �Ҽ���
,(�޸�) : 1000���� ���� ǥ�� ����
************************************************/
SELECT 123000, TO_CHAR(123000) FROM DUAL;
SELECT '123000', TO_NUMBER('123000') FROM DUAL; -- ���������̸� ����Ÿ��, ���������̸� ����Ÿ��

-- ������ ����ȯ ó�� : ����Ÿ���� ���ڿ��꿡 ������ �� ����Ÿ������ ����ȯ ó���ȴ�
SELECT 123000 + 10, TO_CHAR(123000) + 10,
    '123000' + 10, TO_NUMBER('123000') + 10
FROM DUAL;
------------------------------------------------
SELECT TO_CHAR(123456, 'L999,999,999'), TO_CHAR(123456, 'L000,000,000')
FROM DUAL;
SELECT TO_CHAR(0, 'L999,999,999'), TO_CHAR(0, 'L000,000,000')
FROM DUAL;
SELECT TO_CHAR(1230.5, 'L999,999,999'), TO_CHAR(1230.5, 'L000,000,000')  -- �Ҽ����� �ݿø�ó��
FROM DUAL;
SELECT TO_CHAR(1230.5555, 'L999,999.999'), TO_CHAR(1230.5555, 'L000,000.000') -- ������ �Ҽ����� �ݿø�ó��
FROM DUAL;
------------------------------------------------
--TO_DATE(���ڿ�, ���Ĺ���) -> ��¥Ÿ�� ����
SELECT '2021-08-10', SYSDATE FROM DUAL;
SELECT SYSDATE + 1 FROM DUAL;
SELECT '2021-08-10' + 1 FROM DUAL; --ORA-01722: invalid number // ���ڿ����� ���� �ȵ�
SELECT '2021-08-10' || 1 FROM DUAL; --2021-08-101
SELECT TO_DATE('2021-08-10','YYYY-MM-DD') + 1 FROM DUAL;

SELECT '2021-08-10 16:04:10', TO_DATE('2021-08-10 16:04:10', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
------------------------------------------------
SELECT '���糯¥�ð�', SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
--�Ϸ� ��
SELECT TO_CHAR(SYSDATE + 1, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
--1�ð� ��
SELECT TO_CHAR(SYSDATE + 1/24, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
--3�ð� ��
SELECT TO_CHAR(SYSDATE + (1/24)*3, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
--1�� ��
SELECT TO_CHAR(SYSDATE + (1/24/60), 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE + (1/(24*60)), 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE + 1/1440, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
--1�� ��
SELECT TO_CHAR(SYSDATE + (1/24/60/60), 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE + (1/(24*60*60)), 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE + (1/86400), 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
------------------------------------------------
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TRUNC(SYSDATE), TO_CHAR(TRUNC(SYSDATE), 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(ROUND(SYSDATE), 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

------------------------------------------------
SELECT ABS(-15) FROM DUAL; -- 15
SELECT CEIL(15.7) FROM DUAL; -- 16 (�ø�)
SELECT COS(3.14159) FROM DUAL; -- 0.99999999999647923060461239250850048324
SELECT FLOOR(15.7) FROM DUAL; --15 (�Ҽ����Ʒ� ����)
SELECT LOG(10,100) FROM DUAL; -- 2
SELECT MOD(11,4) FROM DUAL; -- 3 (11�� 4�� ���� ������)
SELECT POWER(3,2) FROM DUAL; -- 9
SELECT ROUND(15.7) FROM DUAL; -- 16
SELECT SIGN(-15) FROM DUAL; -- -1
SELECT TRUNC(15.7) FROM DUAL; -- 15
SELECT CHR(67) FROM DUAL; -- C
SELECT CONCAT('HAPPY', 'Birthday') FROM DUAL; -- HAPPYBirthday
SELECT LOWER('Birthday') FROM DUAL; -- birthday
SELECT LPAD('Page 1', 15, '*') FROM DUAL; -- *********Page 1
SELECT LTRIM('Page 1', 'ae') FROM DUAL; -- Page 1
SELECT REPLACE('JACK', 'J', 'BL') FROM DUAL; -- BLACK
SELECT RPAD('Page1', 15, '*.') FROM DUAL; -- Page1*.*.*.*.*.
SELECT RTRIM('Page1','ae') FROM DUAL; -- Page1
SELECT SUBSTR('ABCDEFG', 3,4) FROM DUAL; -- CDEF
SELECT TRIM(LEADING 0 FROM '00AA00') FROM DUAL; -- AA00
SELECT UPPER('Birthday') FROM DUAL; -- BIRTHDAY
SELECT ASCII('A') FROM DUAL; -- 65
SELECT INSTR('CORPORATE FLOOR','OR', 3, 2) FROM DUAL; -- 14
SELECT LENGTH('Birtday') FROM DUAL; -- 7
SELECT ADD_MONTHS('14/05/21', 1) FROM DUAL; -- 0014/06/21
SELECT LAST_DAY(SYSDATE) FROM DUAL; -- 2021/08/31
SELECT NEXT_DAY(SYSDATE, 'ȭ') FROM DUAL; -- 2021/08/17
SELECT ROUND(SYSDATE) FROM DUAL; -- 2021/08/11
SELECT SYSDATE FROM DUAL; --2021/08/10
SELECT TO_CHAR(SYSDATE) FROM DUAL; -- 2021/08/ 10
SELECT TO_CHAR(123) FROM DUAL; -- 123
SELECT TO_DATE('12 05 2014', 'DD MM YYYY') FROM DUAL; -- 2014/05/12
SELECT TO_NUMBER('12.3') FROM DUAL; -- 12.3
SELECT DECODE(1,1,'aa','bb') FROM DUAL; -- aa
SELECT NULLIF(123, 345) FROM DUAL; -- 123
SELECT NVL(NULL, 123) FROM DUAL; --123













