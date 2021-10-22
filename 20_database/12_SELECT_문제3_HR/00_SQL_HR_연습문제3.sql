/****** HR ����Ÿ ��ȸ ����2 ****************
/*1�� HR �μ��� � ����� �޿������� ��ȸ�ϴ� ������ �ð� �ִ�. 
  Tucker ��� ���� �޿��� ���� �ް� �ִ� ����� 
  �̸��� ��(Name���� ��Ī), ����, �޿��� ����Ͻÿ�
*****************************************************/
SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'Tucker';
SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME || ' ' || LAST_NAME LIKE '%Tucker%';

SELECT FIRST_NAME ||' '|| LAST_NAME NAME, JOB_ID, SALARY FROM EMPLOYEES 
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'Tucker')
ORDER BY SALARY;

/*2�� ����� �޿� ���� �� ������ �ּ� �޿��� �ް� �ִ� ����� 
  �̸��� ��(Name���κ�Ī), ����, �޿�, �Ի����� ����Ͻÿ�
********************************************************/
SELECT JOB_ID, MIN(SALARY) FROM EMPLOYEES GROUP BY JOB_ID;

SELECT E.FIRST_NAME ||' '|| E.LAST_NAME NAME, E.JOB_ID, E.SALARY, E.HIRE_DATE 
FROM EMPLOYEES E, (SELECT JOB_ID, MIN(SALARY) MIN_SALARY FROM EMPLOYEES GROUP BY JOB_ID) M
WHERE E.JOB_ID = M.JOB_ID
AND E.SALARY = M.MIN_SALARY;
--�����������
SELECT * FROM EMPLOYEES E
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES WHERE JOB_ID = E.JOB_ID);

/*3�� �Ҽ� �μ��� ��� �޿����� ���� �޿��� �޴� ����� 
  �̸��� ��(Name���� ��Ī), �޿�, �μ���ȣ, ������ ����Ͻÿ�
***********************************************************/
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) AVG_SALARY FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

SELECT E.FIRST_NAME ||' '|| E.LAST_NAME NAME, E.SALARY , E.DEPARTMENT_ID, E.JOB_ID 
FROM EMPLOYEES E , (SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) AVG_SALARY FROM EMPLOYEES GROUP BY DEPARTMENT_ID) A
WHERE E.DEPARTMENT_ID = A.DEPARTMENT_ID
AND E.SALARY > A.AVG_SALARY;
-- ����������� ������� ��ȸ
SELECT E.FIRST_NAME ||' '|| E.LAST_NAME NAME, E.SALARY , E.DEPARTMENT_ID, E.JOB_ID  
FROM EMPLOYEES E
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = E.DEPARTMENT_ID);

/*4�� ��� ����� �ҼӺμ� ��տ����� ����Ͽ� ������� �̸��� ��(Name���� ��Ī),
  ����, �޿�, �μ���ȣ, �μ���տ���(Department Avg Salary�� ��Ī)�� ����Ͻÿ�
***************************************************************/
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))*12 AVG_SALARY12 FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

SELECT E.FIRST_NAME ||' '|| E.LAST_NAME NAME, E.JOB_ID, E.SALARY, E.DEPARTMENT_ID, A.AVG_SALARY12 "Department Avg Salary"
FROM EMPLOYEES E, (SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))*12 AVG_SALARY12 FROM EMPLOYEES GROUP BY DEPARTMENT_ID) A
WHERE E.DEPARTMENT_ID = A.DEPARTMENT_ID;
-- �����������
SELECT E.FIRST_NAME ||' '|| E.LAST_NAME NAME, E.JOB_ID, E.SALARY, E.DEPARTMENT_ID,
     (SELECT ROUND(AVG(SALARY))*12 AVG_SALARY12 FROM EMPLOYEES WHERE DEPARTMENT_ID = E.DEPARTMENT_ID) AVG_SALARY12
FROM EMPLOYEES E;

/*5�� HR ��Ű���� �ִ� Job_history ���̺��� ������� ���� ���� �̷��� ��Ÿ���� ���̺��̴�. 
  �� ������ �̿��Ͽ� ��� ����� ���� �� ������ ���� �̷� ������ ����ϰ��� �Ѵ�. 
  �ߺ��� ��������� ������ �� ���� ǥ���Ͽ� ����Ͻÿ�
  (�����ȣ, ����)
*********************************************************************/
SELECT EMPLOYEE_ID, JOB_ID FROM JOB_HISTORY
UNION
SELECT EMPLOYEE_ID, JOB_ID FROM EMPLOYEES
ORDER BY EMPLOYEE_ID, JOB_ID;

/*6�� �� �������� �� ����� ���� �̷� ������ Ȯ���Ͽ���. ������ '��� �����
  ���� �̷� ��ü'�� ������ ���ߴ�. ���⿡���� ��� ����� 
  ���� �̷� ���� ����(JOB_HISTORY) �� �������濡 ���� �μ������� 
  �����ȣ�� ���� ������� ����Ͻÿ�(���տ����� UNION)
  (�����ȣ, �μ�����, ����)
**********************************************************************/
-- UNION ��� : �÷���, Ÿ��, ���� ���� ��ġ, ORDER BY ���� �������� �ۼ�
SELECT EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID FROM JOB_HISTORY
UNION ALL
SELECT EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;
  
/*7�� HR �μ������� �ű� ������Ʈ�� �������� �̲� �ش� �����ڵ��� 
  �޿��� �λ� �ϱ�� �����Ͽ���. 
  ����� ���� 107���̸� 19���� ������ �ҼӵǾ� �ٹ� ���̴�. 
  �޿� �λ� ����ڴ� ȸ���� ����(Distinct job_id) �� ���� 5�� �������� 
  ���ϴ� ����� �ش�ȴ�. ������ ������ ���ؼ��� �޿��� ����ȴ�. 
  5�� ������ �޿� �λ���� ������ ����.
  HR_REP(10%), MK_REP(12%), PR_REP(15%), SA_REP(18%), IT_PROG(20%)
**********************************************************************/
-- CASE ���� ��
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME, JOB_ID, SALARY,
CASE JOB_ID WHEN 'HR_REP' THEN SALARY * 1.1
            WHEN 'MK_REP' THEN SALARY * 1.12
            WHEN 'PR_REP' THEN SALARY * 1.15
            WHEN 'SA_REP' THEN SALARY * 1.18
            WHEN 'IT_PROG' THEN SALARY * 1.2
            ELSE SALARY
END INCREASE_SALARY,
CASE JOB_ID WHEN 'HR_REP' THEN SALARY * 0.1
            WHEN 'MK_REP' THEN SALARY * 0.12
            WHEN 'PR_REP' THEN SALARY * 0.15
            WHEN 'SA_REP' THEN SALARY * 0.18
            WHEN 'IT_PROG' THEN SALARY * 0.2
            ELSE 0
END "�����λ�ݾ�"
FROM EMPLOYEES
ORDER BY JOB_ID;
-- DECODE ��
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME, JOB_ID, SALARY,
DECODE (JOB_ID, 'HR_REP', SALARY * 1.1,
                'MK_REP', SALARY * 1.12,
                'PR_REP', SALARY * 1.15,
                'SA_REP', SALARY * 1.18,
                'IT_PROG', SALARY * 1.2, SALARY) INCREASE_SALARY,
DECODE (JOB_ID, 'HR_REP', SALARY * 0.1,
                'MK_REP', SALARY * 0.12,
                'PR_REP', SALARY * 0.15,
                'SA_REP', SALARY * 0.18,
                'IT_PROG', SALARY * 0.2, 0) "�����λ�ݾ�"            
FROM EMPLOYEES
ORDER BY JOB_ID;

/*8�� HR �μ������� �ֻ��� �Ի��Ͽ� �ش��ϴ� 2001����� 2003����� �Ի��ڵ��� �޿��� 
  ���� 5%, 3%, 1% �λ��Ͽ� ���п� ���� �������� �����ϰ��� �Ѵ�. 
  ��ü ����� �� �ش� �⵵�� �ش��ϴ� ������� �޿��� �˻��Ͽ� �����ϰ�, 
  �Ի����ڿ� ���� �������� ������ �����Ͻÿ�
**********************************************************************/
-- 2001�� ���� �Ի��ڰ� ���ٴ� �����Ͽ� CASE WHEN �ε�񱳷� ��ȸ
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME, HIRE_DATE, SALARY,
CASE WHEN HIRE_DATE < TO_DATE('2002-01-01', 'YYYY-MM-DD') THEN ROUND(SALARY * 1.05)
     WHEN HIRE_DATE < TO_DATE('2003-01-01', 'YYYY-MM-DD') THEN ROUND(SALARY * 1.03)
     WHEN HIRE_DATE < TO_DATE('2004-01-01', 'YYYY-MM-DD') THEN ROUND(SALARY * 1.01)     
ELSE 0
END "����"
FROM EMPLOYEES
ORDER BY HIRE_DATE;
-- �Ի����� �⵵ 4�ڸ�(YYYY) �������� ��ȸ
-- WHEN ��
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME, HIRE_DATE, SALARY,
    CASE TO_CHAR(HIRE_DATE, 'YYYY') WHEN '2001' THEN ROUND(SALARY * 1.05)
                                    WHEN '2002' THEN ROUND(SALARY * 1.03)
                                    WHEN '2003' THEN ROUND(SALARY * 1.01)
                                    ELSE 0 END INCREASE_SALARY
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN '2001' AND '2003'    -- IN ('2001', '2002', '2003')
ORDER BY HIRE_DATE;
-- DECODE��
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME, HIRE_DATE, SALARY,
    DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2001', ROUND(SALARY * 1.05),
                                       '2002', ROUND(SALARY * 1.03),
                                       '2003', ROUND(SALARY * 1.01))INCREASE_SALARY
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN '2001' AND '2003'
ORDER BY HIRE_DATE;

/*9�� �μ��� �޿� �հ踦 ���ϰ�, �� ����� ������ ���� ǥ���Ͻÿ�.
  Sum Salary > 100000 �̸�, "Excellent"
  Sum Salary > 50000 �̸�, "Good"
  Sum Salary > 10000 �̸�, "Medium"
  Sum Salary <= 10000 �̸�, "Well"
**********************************************************************/
SELECT DEPARTMENT_ID, SUM(SALARY),
CASE WHEN SUM(SALARY) > 100000 THEN 'Excellent'
     WHEN SUM(SALARY) > 50000 THEN 'Good'
     WHEN SUM(SALARY) > 10000 THEN 'Medium'     
     WHEN SUM(SALARY) <= 10000 THEN 'Well' END "�򰡰��"
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

/*10�� 2005�� ������ �Ի��� ��� �� ������ "MGR"�� ���Ե� ����� 15%, 
  "MAN"�� ���Ե� ����� 20% �޿��� �λ��Ѵ�. 
  ���� 2005����� �ٹ��� ������ ��� �� "MGR"�� ���Ե� ����� 25% �޿��� �λ��Ѵ�. 
  �̸� �����ϴ� ������ �ۼ��Ͻÿ�
**********************************************************************/
-- CASE WHEN �̿��ؼ� ��ȸ
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS NAME,
       JOB_ID, HIRE_DATE, SALARY,
       --2005�� �����Ի��̰�, MGR : 15%�λ� OR MAN : 20%�λ�
       CASE WHEN TO_CHAR(HIRE_DATE, 'YYYY') < '2005'
            THEN CASE WHEN JOB_ID LIKE '%MGR%' THEN ROUND(SALARY * 1.15)
                      WHEN JOB_ID LIKE '%MAN%' THEN ROUND(SALARY * 1.20)
                      ELSE SALARY
                 END
            --2005����� �ٹ��ϰ� ������ MGR ������ 25% �޿��� �λ�
            ELSE CASE WHEN JOB_ID LIKE '%MGR%' THEN ROUND(SALARY * 1.25)
                      ELSE SALARY
                 END
       END AS "����� �޿�" 
  FROM EMPLOYEES
 ORDER BY HIRE_DATE  
;
----------------------
SELECT JOB_ID, SUBSTR(JOB_ID, -3) FROM EMPLOYEES
WHERE SUBSTR(JOB_ID, -3) IN ('MGR', 'MAN');
------
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS NAME,
       JOB_ID, HIRE_DATE, SALARY,
       --2005�� �����Ի��̰�, MGR : 15%�λ� OR MAN : 20%�λ�
       CASE WHEN TO_CHAR(HIRE_DATE, 'YYYY') < '2005'
            THEN DECODE(SUBSTR(JOB_ID, -3),
                     'MGR', ROUND(SALARY * 1.15),
                     'MAN', ROUND(SALARY * 1.20),
                     SALARY)
            --2005����� �ٹ��ϰ� ������ MGR ������ 25% �޿��� �λ�
            ELSE DECODE(SUBSTR(JOB_ID, -3),
                     'MGR', ROUND(SALARY * 1.25), 
                     SALARY)
       END AS "����� �޿�" 
  FROM EMPLOYEES
 ORDER BY HIRE_DATE  
;
-- ���� �Ѱ�
SELECT HIRE_DATE, FIRST_NAME ||' '|| LAST_NAME NAME, JOB_ID, SALARY,
CASE WHEN TO_CHAR(HIRE_DATE, 'YYYY') < '2005' AND JOB_ID LIKE '%MGR%' THEN ROUND(SALARY * 1.15)
     WHEN TO_CHAR(HIRE_DATE, 'YYYY') < '2005' AND JOB_ID LIKE '%MAN%' THEN ROUND(SALARY * 1.20)
     WHEN TO_CHAR(HIRE_DATE, 'YYYY') >= '2005' AND JOB_ID LIKE '%MGR%' THEN ROUND(SALARY * 1.25)
     ELSE SALARY END INCREASE_SALARY
FROM EMPLOYEES;

/*11�� ������ �Ի��� ��� �� ���
  (���1) ������ �Ի��� ��� ���� �Ʒ��� ���� �� �ະ�� ��µǵ��� �Ͻÿ�(12��).
  1�� xx
  2�� xx
  3�� xx
  ..
  12�� xx
  �հ� XXX
**********************************************************************/  
SELECT TO_CHAR(HIRE_DATE, 'MM') "��", COUNT(*) "�ο���" FROM EMPLOYEES GROUP BY TO_CHAR(HIRE_DATE, 'MM')
ORDER BY TO_CHAR(HIRE_DATE, 'MM'); --ORDER BY 1;
--- �հ�
SELECT TO_CHAR(HIRE_DATE, 'MM') "��", COUNT(*) "�ο���" FROM EMPLOYEES GROUP BY TO_CHAR(HIRE_DATE, 'MM')
UNION
SELECT '�հ�' "��", COUNT(*) "�ο���" FROM EMPLOYEES;
--- '0' ����
SELECT TO_NUMBER(TO_CHAR(HIRE_DATE, 'MM')) "��", COUNT(*) "�ο���" FROM EMPLOYEES GROUP BY TO_CHAR(HIRE_DATE, 'MM')
UNION
SELECT 99 "��", COUNT(*) "�ο���" FROM EMPLOYEES
ORDER BY 1;
-- 99�� �հ�� ǥ��
SELECT DECODE(MM, 99, '�հ�', MM||'��') "�Ի��", CNT "�ο���"
FROM (SELECT TO_NUMBER(TO_CHAR(HIRE_DATE, 'MM')) MM, COUNT(*) CNT FROM EMPLOYEES GROUP BY TO_CHAR(HIRE_DATE, 'MM')
UNION
SELECT 99 MM, COUNT(*) CNT FROM EMPLOYEES
ORDER BY 1);

--------------------------------------------------------
/* (���2) ù �࿡ ��� ���� �Ի� ��� ���� ��µǵ��� �Ͻÿ�
  1�� 2�� 3�� 4�� .... 11�� 12��
  xx  xx  xx xx  .... xx   xx
**********************************************************************/
SELECT EMPLOYEE_ID, HIRE_DATE, TO_CHAR(HIRE_DATE,'MM'),
       DECODE (TO_CHAR(HIRE_DATE,'MM'), '01', 1,0)
FROM EMPLOYEES
ORDER BY HIRE_DATE;

SELECT SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '01', 1,0)) "1��" ,
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '02', 1,0)) "2��",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '03', 1,0)) "3��",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '04', 1,0)) "4��",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '05', 1,0)) "5��",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '06', 1,0)) "6��",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '07', 1,0)) "7��",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '08', 1,0)) "8��",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '09', 1,0)) "9��",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '10', 1,0)) "10��",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '11', 1,0)) "11��",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '12', 1,0)) "12��",
        COUNT(*) "�հ�"
FROM EMPLOYEES;















