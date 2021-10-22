/* ** �ǽ����� : HR����(DB)���� �䱸���� �ذ� **********
-- ���(employee_id)�� 100�� ���� ���� ��ü ����
-- ����(salary)�� 15000 �̻��� ������ ��� ���� ����
-- ������ 15000 �̻��� ����� ���, �̸�(LAST_NAME), �Ի���(hire_date), ���޿� ���� ����
-- ������ 10000 ������ ����� ���, �̸�(LAST_NAME), �Ի���, ���޿� ���� ����
---- (�޿��� ���� �������)
-- �̸�(first_name)�� john�� ����� ��� ���� ��ȸ
-- �̸�(first_name)�� john�� ����� �� ���ΰ�?
-- 2008�⿡ �Ի��� ����� ���, ����('first_name last_name'), ���޿� ���� ��ȸ
---- ���� ��¿�) 'Steven King'
-- ���޿��� 20000~30000 ������ ���� ���, ����(last_name first_name), ���޿� ���� ��ȸ
-- ������ID(MANAGER_ID)�� ���� ��� ���� ��ȸ
-- ����(job_id)�ڵ� 'IT_PROG'���� ���� ���� ���޿��� ��
-- ������ �ִ� ���޿� �˻�
-- ������ �ִ� ���޿� �˻��ϰ�, �ִ� ���޿��� 10000�̻��� ���� ��ȸ
-- ������ ��ձ޿� �̻��� ���� ��ȸ
**********************************************************/

-- ���(employee_id)�� 100�� ���� ���� ��ü ����
SELECT * FROM EMPLOYEES 
WHERE EMPLOYEE_ID = 100;
-- ����(salary)�� 15000 �̻��� ������ ��� ���� ����
SELECT * FROM EMPLOYEES 
WHERE SALARY >= 15000;
-- ������ 15000 �̻��� ����� ���, �̸�(LAST_NAME), �Ի���(hire_date), ���޿� ���� ����
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE, SALARY 
FROM EMPLOYEES 
WHERE SALARY >= 15000;
-- ������ 10000 ������ ����� ���, �̸�(LAST_NAME), �Ի���, ���޿� ���� ����
---- (�޿��� ���� �������)
SELECT EMPLOYEE_ID, LAST_NAME, HIRE_DATE, SALARY 
FROM EMPLOYEES 
WHERE SALARY <= 10000
ORDER BY SALARY DESC;
-- �̸�(first_name)�� john�� ����� ��� ���� ��ȸ
SELECT * FROM EMPLOYEES 
WHERE FIRST_NAME LIKE INITCAP('JOHN');
-- �̸�(first_name)�� john�� ����� �� ���ΰ�?
SELECT COUNT(*) FROM EMPLOYEES 
WHERE FIRST_NAME LIKE INITCAP('JOHN');
-- 2008�⿡ �Ի��� ����� ���, ����('first_name last_name'), ���޿� ���� ��ȸ
---- ���� ��¿�) 'Steven King'
SELECT EMPLOYEE_ID, INITCAP(FIRST_NAME)||' '||INITCAP(LAST_NAME) NAME, SALARY 
FROM EMPLOYEES 
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2008';
-- ���޿��� 20000~30000 ������ ���� ���, ����(last_name first_name), ���޿� ���� ��ȸ
SELECT EMPLOYEE_ID, INITCAP(LAST_NAME)||INITCAP(FIRST_NAME) NAME, SALARY 
FROM EMPLOYEES 
WHERE SALARY BETWEEN 20000 AND 30000;
-- ������ID(MANAGER_ID)�� ���� ��� ���� ��ȸ
SELECT * FROM EMPLOYEES 
WHERE MANAGER_ID IS NULL;
-- ����(job_id)�ڵ� 'IT_PROG'���� ���� ���� ���޿��� ��
SELECT MAX(SALARY) 
FROM EMPLOYEES 
WHERE JOB_ID = 'IT_PROG' ;
-- ������ �ִ� ���޿� �˻�
SELECT JOB_ID, MAX(SALARY) 
FROM EMPLOYEES
GROUP BY JOB_ID;
-- ������ �ִ� ���޿� �˻��ϰ�, �ִ� ���޿��� 10000�̻��� ���� ��ȸ
SELECT JOB_ID, MAX(SALARY) 
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING MAX(SALARY) >= 10000;
-- 
SELECT JOB_ID, MAX(SALARY) 
FROM EMPLOYEES WHERE SALARY >= 10000 -- 10000 �̻� �޴� ����鸸 �������
GROUP BY JOB_ID;
-- ������ ��ձ޿� �̻��� ���� ��ȸ
SELECT JOB_ID, AVG(SALARY)
  FROM EMPLOYEES
 GROUP BY JOB_ID
;
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY
FROM EMPLOYEES E
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEES
                 WHERE JOB_ID = E.JOB_ID)
;
-----
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY,
       J.JOB_ID J_JOB_ID, J.AVG_SALARY
  FROM EMPLOYEES E,
       (SELECT JOB_ID, AVG(SALARY) AVG_SALARY
          FROM EMPLOYEES
         GROUP BY JOB_ID ) J --�������� : �������̺�(�ζ��κ�)
 WHERE E.JOB_ID = J.JOB_ID --��������
   AND E.SALARY >= J.AVG_SALARY -- �˻�����
;






 



 
 

 








