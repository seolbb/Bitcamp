/* ***** HR DB ������ ��ȸ �ǽ� *****************
��1 HR �μ����� ���� �� ������ �޿� ���� ������ �ۼ��Ϸ��� �Ѵ�. 
  �������(Employees) ���̺��� �޿��� $7,000~$10,000 ���� �̿��� ����� 
  �̸��� ��(Name���� ��Ī) �� �޿��� �޿��� ���� ������ ����Ͻÿ�
*/
SELECT FIRST_NAME||' '||LAST_NAME NAME, SALARY FROM EMPLOYEES 
WHERE SALARY < 7000 OR SALARY > 10000
ORDER BY SALARY;

SELECT FIRST_NAME||' '||LAST_NAME NAME, SALARY FROM EMPLOYEES 
WHERE SALARY NOT BETWEEN 7000 AND 10000
ORDER BY SALARY;

/*
��2 HR �μ������� �޿�(salary)�� ������(commission_pct)�� ���� ���� ������ �ۼ��Ϸ��� �Ѵ�. 
  ������ �޴� ��� ����� �̸��� ��(Name���� ��Ī), �޿�, ����, �������� ����Ͻÿ�. 
  �̶� �޿��� ū ������� �����ϵ�, �޿��� ������ �������� ū ������� �����Ͻÿ�
*/
SELECT FIRST_NAME||' '||LAST_NAME NAME, SALARY, JOB_ID, COMMISSION_PCT FROM EMPLOYEES 
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC, COMMISSION_PCT DESC;

/*  
��3 �̹� �б⿡ 60�� IT �μ������� �ű� ���α׷��� �����ϰ� �����Ͽ� ȸ�翡 �����Ͽ���. 
  �̿� �ش� �μ��� ��� �޿��� 12.3% �λ��ϱ�� �Ͽ���. 
  60�� IT �μ� ����� �޿��� 12.3% �λ��Ͽ� ������(�ݿø�) ǥ���ϴ� ������ �ۼ��Ͻÿ�. 
  ������ �����ȣ, ���� �̸�(Name���� ��Ī), �޿�, �λ�� �޿�(Increase Salary�� ��Ī)������ ����Ͻÿ�
*/  
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME NAME, SALARY, ROUND(SALARY * 1.123) "Increase Salary" FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;                 --(SALARY * 1.123) = (SALARY + SALARY * 0.123)

/*
��4 �� ����� ��(last_name)�� 's'�� ������ ����� �̸��� ������ �Ʒ��� ���� ���� ����ϰ��� �Ѵ�. 
  ��� �� �̸�(first_name)�� ��(last_name)�� ù ���ڰ� �빮��, ������ ��� �빮�ڷ� ����ϰ� 
  �Ӹ���(��ȸ�÷���)�� Employee JOBs.�� ǥ���Ͻÿ�
  ��) FIRST_NAME  LAST_NAME  Employee JOBs.
      Shelley     Higgins    AC_MGR
*/
SELECT INITCAP(FIRST_NAME), INITCAP(LAST_NAME), UPPER(JOB_ID) "Employee JOBs." FROM EMPLOYEES
WHERE LOWER(LAST_NAME) LIKE '%s';

/*
��5 ��� ����� ������ ǥ���ϴ� ������ �ۼ��Ϸ��� �Ѵ�. 
  ������ ����� �̸��� ��(Name���� ��Ī), �޿�, ���翩�ο� ���� ������ �����Ͽ� ����Ͻÿ�. 
  ���翩�δ� ������ ������ "Salary + Commission", ������ ������ "Salary only"��� ǥ���ϰ�, 
  ��Ī�� ������ ���̽ÿ�. ���� ��� �� ������ ���� ������ �����Ͻÿ�
*/
SELECT * FROM EMPLOYEES;
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME NAME, SALARY, COMMISSION_PCT,
    DECODE(COMMISSION_PCT, NULL, 'Salary only', 'Salary + Commission') COMMISION_YN,
    SALARY * (1 + NVL(COMMISSION_PCT, 0)) * 12 SALARY12  -- NVL ==> NULL �̸� 0
FROM EMPLOYEES
ORDER BY SALARY12 DESC;

/*
��6 �� ����� �Ҽӵ� �μ����� �޿� �հ�, �޿� ���, �޿� �ִ�, �޿� �ּڰ��� �����ϰ��� �Ѵ�. 
  ���� ��°��� ���� �ڸ��� �� �ڸ� ���б�ȣ, $ǥ�ÿ� �Բ� ���($123,456) 
  ��, �μ��� �Ҽӵ��� ���� ����� ���� ������ �����ϰ�, ��� �� �Ӹ����� ��Ī(alias) ó���Ͻÿ�
*/    
SELECT JOB_ID, TO_CHAR(SUM(SALARY), '$000,000') SUM_SALARY, TO_CHAR(AVG(SALARY) , '$000,000') AVG_SALRY,
    TO_CHAR(MAX(SALARY), '$000,000') MAX_SALARY, TO_CHAR(MIN(SALARY), '$000,000') MIN_SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY JOB_ID;

/*
��7 ������� ������ ��ü �޿� ����� $10,000���� ū ��츦 ��ȸ�Ͽ� 
    ������ �޿� ����� ����Ͻÿ�. 
  �� ������ CLERK�� ���Ե� ���� �����ϰ� ��ü �޿� ����� ���� ������� ����Ͻÿ�
*/
SELECT DISTINCT JOB_ID FROM EMPLOYEES  -- DISTINCT �ߺ��� �����ϰ� �ϳ��� ǥ��
WHERE JOB_ID LIKE '%CLERK%';

SELECT JOB_ID FROM EMPLOYEES
WHERE UPPER(JOB_ID) NOT LIKE '%CLERK%';

SELECT JOB_ID, AVG(SALARY) AVG_SALARY FROM EMPLOYEES
WHERE UPPER(JOB_ID) NOT LIKE '%CLERK%'
GROUP BY JOB_ID
HAVING AVG(SALARY) > 10000
ORDER BY AVG(SALARY) DESC;

/*
��8 HR ��Ű���� �����ϴ� Employees, Departments, Locations ���̺��� ������ �ľ��� �� 
  Oxford�� �ٹ��ϴ� ����� �̸��� ��(Name���� ��Ī), ����, �μ��̸�, �����̸��� ����Ͻÿ�. 
  �̶� ù ��° ���� ȸ���̸��� 'HR-Company'�̶�� ������� ��µǵ��� �Ͻÿ�
*/
SELECT 'HR-Company' COMPANY_NAME, E.FIRST_NAME||' '||E.LAST_NAME NAME, E.JOB_ID, D.DEPARTMENT_NAME, L.CITY 
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID
AND L.CITY = 'Oxford'
ORDER BY E.EMPLOYEE_ID;
--ǥ�� SQL
SELECT 'HR-Company' COMPANY_NAME, E.FIRST_NAME||' '||E.LAST_NAME NAME, E.JOB_ID, D.DEPARTMENT_NAME, L.CITY 
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
INNER JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY = 'Oxford'
ORDER BY E.EMPLOYEE_ID;

-- HR���� �����ϴ� EMP_DETAILS_VIEW ���
SELECT 'HR-Company' COMPANY_NAME, FIRST_NAME||' '||LAST_NAME NAME, JOB_ID, DEPARTMENT_NAME, CITY
FROM EMP_DETAILS_VIEW
WHERE CITY = 'Oxford';

/*
��9 HR ��Ű���� �ִ� Employees, Departments ���̺��� ������ �ľ��� �� 
  ������� �ټ� �� �̻��� �μ��� �μ��̸��� ��� ���� ����Ͻÿ�. 
  �̶� ��� ���� ���� ������ �����Ͻÿ�
*/
SELECT E.DEPARTMENT_ID, D.DEPARTMENT_NAME, COUNT(*) EMP_CNT 
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY E.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING COUNT(*) >= 5
ORDER BY EMP_CNT DESC;
-- �μ��� �ο��� ���� �� �μ����̺� �����ؼ� �μ��� Ȯ��
SELECT DEPARTMENT_ID, COUNT(*) EMP_CNT
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT D.DEPARTMENT_NAME, E.EMP_CNT 
FROM (SELECT DEPARTMENT_ID, COUNT(*) EMP_CNT
            FROM EMPLOYEES
            GROUP BY DEPARTMENT_ID) E,
                DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.EMP_CNT >= 5;


/*
��10 �� ����� �޿��� ���� �޿� ����� �����Ϸ��� �Ѵ�. 
  �޿� ����� Job_Grades ���̺� ǥ�õȴ�. �ش� ���̺��� ������ ���캻 �� 
  ����� �̸��� ��(Name���� ��Ī), ����, �μ��̸�, �Ի���, �޿�, �޿������ ����Ͻÿ�.
********************************/
CREATE TABLE JOB_GRADES (
    GRADE_LEVEL VARCHAR2(3),
    LOWEST_SAL NUMBER,
    HIGHEST_SAL NUMBER
);
INSERT INTO JOB_GRADES VALUES ('A', 1000, 2999);
INSERT INTO JOB_GRADES VALUES ('B', 3000, 5999);
INSERT INTO JOB_GRADES VALUES ('C', 6000, 9999);
INSERT INTO JOB_GRADES VALUES ('D', 10000, 14999);
INSERT INTO JOB_GRADES VALUES ('E', 15000, 24999);
INSERT INTO JOB_GRADES VALUES ('F', 25000, 40000);
COMMIT;

SELECT * FROM JOB_GRADES
WHERE 6500 BETWEEN LOWEST_SAL AND HIGHEST_SAL;

SELECT E.EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME NAME,
        E.JOB_ID, D.DEPARTMENT_NAME, E.HIRE_DATE, E.SALARY, J.GRADE_LEVEL
FROM EMPLOYEES E, JOB_GRADES J, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.SALARY BETWEEN J.LOWEST_SAL AND J.HIGHEST_SAL
ORDER BY E.EMPLOYEE_ID;




