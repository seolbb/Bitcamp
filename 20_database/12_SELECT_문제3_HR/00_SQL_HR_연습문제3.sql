/****** HR 데이타 조회 문제2 ****************
/*1■ HR 부서의 어떤 사원은 급여정보를 조회하는 업무를 맡고 있다. 
  Tucker 사원 보다 급여를 많이 받고 있는 사원의 
  이름과 성(Name으로 별칭), 업무, 급여를 출력하시오
*****************************************************/
SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'Tucker';
SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME || ' ' || LAST_NAME LIKE '%Tucker%';

SELECT FIRST_NAME ||' '|| LAST_NAME NAME, JOB_ID, SALARY FROM EMPLOYEES 
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'Tucker')
ORDER BY SALARY;

/*2■ 사원의 급여 정보 중 업무별 최소 급여를 받고 있는 사원의 
  이름과 성(Name으로별칭), 업무, 급여, 입사일을 출력하시오
********************************************************/
SELECT JOB_ID, MIN(SALARY) FROM EMPLOYEES GROUP BY JOB_ID;

SELECT E.FIRST_NAME ||' '|| E.LAST_NAME NAME, E.JOB_ID, E.SALARY, E.HIRE_DATE 
FROM EMPLOYEES E, (SELECT JOB_ID, MIN(SALARY) MIN_SALARY FROM EMPLOYEES GROUP BY JOB_ID) M
WHERE E.JOB_ID = M.JOB_ID
AND E.SALARY = M.MIN_SALARY;
--상관서브쿼리
SELECT * FROM EMPLOYEES E
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES WHERE JOB_ID = E.JOB_ID);

/*3■ 소속 부서의 평균 급여보다 많은 급여를 받는 사원의 
  이름과 성(Name으로 별칭), 급여, 부서번호, 업무를 출력하시오
***********************************************************/
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) AVG_SALARY FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

SELECT E.FIRST_NAME ||' '|| E.LAST_NAME NAME, E.SALARY , E.DEPARTMENT_ID, E.JOB_ID 
FROM EMPLOYEES E , (SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) AVG_SALARY FROM EMPLOYEES GROUP BY DEPARTMENT_ID) A
WHERE E.DEPARTMENT_ID = A.DEPARTMENT_ID
AND E.SALARY > A.AVG_SALARY;
-- 상관서브쿼리 방식으로 조회
SELECT E.FIRST_NAME ||' '|| E.LAST_NAME NAME, E.SALARY , E.DEPARTMENT_ID, E.JOB_ID  
FROM EMPLOYEES E
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = E.DEPARTMENT_ID);

/*4■ 모든 사원의 소속부서 평균연봉을 계산하여 사원별로 이름과 성(Name으로 별칭),
  업무, 급여, 부서번호, 부서평균연봉(Department Avg Salary로 별칭)을 출력하시오
***************************************************************/
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))*12 AVG_SALARY12 FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

SELECT E.FIRST_NAME ||' '|| E.LAST_NAME NAME, E.JOB_ID, E.SALARY, E.DEPARTMENT_ID, A.AVG_SALARY12 "Department Avg Salary"
FROM EMPLOYEES E, (SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))*12 AVG_SALARY12 FROM EMPLOYEES GROUP BY DEPARTMENT_ID) A
WHERE E.DEPARTMENT_ID = A.DEPARTMENT_ID;
-- 상관서브쿼리
SELECT E.FIRST_NAME ||' '|| E.LAST_NAME NAME, E.JOB_ID, E.SALARY, E.DEPARTMENT_ID,
     (SELECT ROUND(AVG(SALARY))*12 AVG_SALARY12 FROM EMPLOYEES WHERE DEPARTMENT_ID = E.DEPARTMENT_ID) AVG_SALARY12
FROM EMPLOYEES E;

/*5■ HR 스키마에 있는 Job_history 테이블은 사원들의 업무 변경 이력을 나타내는 테이블이다. 
  이 정보를 이용하여 모든 사원의 현재 및 이전의 업무 이력 정보를 출력하고자 한다. 
  중복된 사원정보가 있으면 한 번만 표시하여 출력하시오
  (사원번호, 업무)
*********************************************************************/
SELECT EMPLOYEE_ID, JOB_ID FROM JOB_HISTORY
UNION
SELECT EMPLOYEE_ID, JOB_ID FROM EMPLOYEES
ORDER BY EMPLOYEE_ID, JOB_ID;

/*6■ 위 문제에서 각 사원의 업무 이력 정보를 확인하였다. 하지만 '모든 사원의
  업무 이력 전체'를 보지는 못했다. 여기에서는 모든 사원의 
  업무 이력 변경 정보(JOB_HISTORY) 및 업무변경에 따른 부서정보를 
  사원번호가 빠른 순서대로 출력하시오(집합연산자 UNION)
  (사원번호, 부서정보, 업무)
**********************************************************************/
-- UNION 사용 : 컬럼명, 타입, 갯수 순서 일치, ORDER BY 절은 마지막에 작성
SELECT EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID FROM JOB_HISTORY
UNION ALL
SELECT EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;
  
/*7■ HR 부서에서는 신규 프로젝트를 성공으로 이끈 해당 업무자들의 
  급여를 인상 하기로 결정하였다. 
  사원은 현재 107명이며 19개의 업무에 소속되어 근무 중이다. 
  급여 인상 대상자는 회사의 업무(Distinct job_id) 중 다음 5개 업무에서 
  일하는 사원에 해당된다. 나머지 업무에 대해서는 급여가 동결된다. 
  5개 업무의 급여 인상안은 다음과 같다.
  HR_REP(10%), MK_REP(12%), PR_REP(15%), SA_REP(18%), IT_PROG(20%)
**********************************************************************/
-- CASE 동등 비교
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
END "순수인상금액"
FROM EMPLOYEES
ORDER BY JOB_ID;
-- DECODE 비교
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
                'IT_PROG', SALARY * 0.2, 0) "순수인상금액"            
FROM EMPLOYEES
ORDER BY JOB_ID;

/*8■ HR 부서에서는 최상위 입사일에 해당하는 2001년부터 2003년까지 입사자들의 급여를 
  각각 5%, 3%, 1% 인상하여 지분에 따른 배당금으로 지급하고자 한다. 
  전체 사원들 중 해당 년도에 해당하는 사원들의 급여를 검색하여 적용하고, 
  입사일자에 따른 오름차순 정렬을 수행하시오
**********************************************************************/
-- 2001년 이전 입사자가 없다는 전제하에 CASE WHEN 부등비교로 조회
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME, HIRE_DATE, SALARY,
CASE WHEN HIRE_DATE < TO_DATE('2002-01-01', 'YYYY-MM-DD') THEN ROUND(SALARY * 1.05)
     WHEN HIRE_DATE < TO_DATE('2003-01-01', 'YYYY-MM-DD') THEN ROUND(SALARY * 1.03)
     WHEN HIRE_DATE < TO_DATE('2004-01-01', 'YYYY-MM-DD') THEN ROUND(SALARY * 1.01)     
ELSE 0
END "배당금"
FROM EMPLOYEES
ORDER BY HIRE_DATE;
-- 입사일의 년도 4자리(YYYY) 기준으로 조회
-- WHEN 문
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME, HIRE_DATE, SALARY,
    CASE TO_CHAR(HIRE_DATE, 'YYYY') WHEN '2001' THEN ROUND(SALARY * 1.05)
                                    WHEN '2002' THEN ROUND(SALARY * 1.03)
                                    WHEN '2003' THEN ROUND(SALARY * 1.01)
                                    ELSE 0 END INCREASE_SALARY
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN '2001' AND '2003'    -- IN ('2001', '2002', '2003')
ORDER BY HIRE_DATE;
-- DECODE문
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME NAME, HIRE_DATE, SALARY,
    DECODE(TO_CHAR(HIRE_DATE, 'YYYY'), '2001', ROUND(SALARY * 1.05),
                                       '2002', ROUND(SALARY * 1.03),
                                       '2003', ROUND(SALARY * 1.01))INCREASE_SALARY
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN '2001' AND '2003'
ORDER BY HIRE_DATE;

/*9■ 부서별 급여 합계를 구하고, 그 결과를 다음과 같이 표현하시오.
  Sum Salary > 100000 이면, "Excellent"
  Sum Salary > 50000 이면, "Good"
  Sum Salary > 10000 이면, "Medium"
  Sum Salary <= 10000 이면, "Well"
**********************************************************************/
SELECT DEPARTMENT_ID, SUM(SALARY),
CASE WHEN SUM(SALARY) > 100000 THEN 'Excellent'
     WHEN SUM(SALARY) > 50000 THEN 'Good'
     WHEN SUM(SALARY) > 10000 THEN 'Medium'     
     WHEN SUM(SALARY) <= 10000 THEN 'Well' END "평가결과"
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

/*10■ 2005년 이전에 입사한 사원 중 업무에 "MGR"이 포함된 사원은 15%, 
  "MAN"이 포함된 사원은 20% 급여를 인상한다. 
  또한 2005년부터 근무를 시작한 사원 중 "MGR"이 포함된 사원은 25% 급여를 인상한다. 
  이를 수행하는 쿼리를 작성하시오
**********************************************************************/
-- CASE WHEN 이용해서 조회
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS NAME,
       JOB_ID, HIRE_DATE, SALARY,
       --2005년 이전입사이고, MGR : 15%인상 OR MAN : 20%인상
       CASE WHEN TO_CHAR(HIRE_DATE, 'YYYY') < '2005'
            THEN CASE WHEN JOB_ID LIKE '%MGR%' THEN ROUND(SALARY * 1.15)
                      WHEN JOB_ID LIKE '%MAN%' THEN ROUND(SALARY * 1.20)
                      ELSE SALARY
                 END
            --2005년부터 근무하고 직무에 MGR 있으면 25% 급여를 인상
            ELSE CASE WHEN JOB_ID LIKE '%MGR%' THEN ROUND(SALARY * 1.25)
                      ELSE SALARY
                 END
       END AS "변경된 급여" 
  FROM EMPLOYEES
 ORDER BY HIRE_DATE  
;
----------------------
SELECT JOB_ID, SUBSTR(JOB_ID, -3) FROM EMPLOYEES
WHERE SUBSTR(JOB_ID, -3) IN ('MGR', 'MAN');
------
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS NAME,
       JOB_ID, HIRE_DATE, SALARY,
       --2005년 이전입사이고, MGR : 15%인상 OR MAN : 20%인상
       CASE WHEN TO_CHAR(HIRE_DATE, 'YYYY') < '2005'
            THEN DECODE(SUBSTR(JOB_ID, -3),
                     'MGR', ROUND(SALARY * 1.15),
                     'MAN', ROUND(SALARY * 1.20),
                     SALARY)
            --2005년부터 근무하고 직무에 MGR 있으면 25% 급여를 인상
            ELSE DECODE(SUBSTR(JOB_ID, -3),
                     'MGR', ROUND(SALARY * 1.25), 
                     SALARY)
       END AS "변경된 급여" 
  FROM EMPLOYEES
 ORDER BY HIRE_DATE  
;
-- 내가 한것
SELECT HIRE_DATE, FIRST_NAME ||' '|| LAST_NAME NAME, JOB_ID, SALARY,
CASE WHEN TO_CHAR(HIRE_DATE, 'YYYY') < '2005' AND JOB_ID LIKE '%MGR%' THEN ROUND(SALARY * 1.15)
     WHEN TO_CHAR(HIRE_DATE, 'YYYY') < '2005' AND JOB_ID LIKE '%MAN%' THEN ROUND(SALARY * 1.20)
     WHEN TO_CHAR(HIRE_DATE, 'YYYY') >= '2005' AND JOB_ID LIKE '%MGR%' THEN ROUND(SALARY * 1.25)
     ELSE SALARY END INCREASE_SALARY
FROM EMPLOYEES;

/*11■ 월별로 입사한 사원 수 출력
  (방식1) 월별로 입사한 사원 수가 아래와 같이 각 행별로 출력되도록 하시오(12행).
  1월 xx
  2월 xx
  3월 xx
  ..
  12월 xx
  합계 XXX
**********************************************************************/  
SELECT TO_CHAR(HIRE_DATE, 'MM') "월", COUNT(*) "인원수" FROM EMPLOYEES GROUP BY TO_CHAR(HIRE_DATE, 'MM')
ORDER BY TO_CHAR(HIRE_DATE, 'MM'); --ORDER BY 1;
--- 합계
SELECT TO_CHAR(HIRE_DATE, 'MM') "월", COUNT(*) "인원수" FROM EMPLOYEES GROUP BY TO_CHAR(HIRE_DATE, 'MM')
UNION
SELECT '합계' "월", COUNT(*) "인원수" FROM EMPLOYEES;
--- '0' 빼기
SELECT TO_NUMBER(TO_CHAR(HIRE_DATE, 'MM')) "월", COUNT(*) "인원수" FROM EMPLOYEES GROUP BY TO_CHAR(HIRE_DATE, 'MM')
UNION
SELECT 99 "월", COUNT(*) "인원수" FROM EMPLOYEES
ORDER BY 1;
-- 99를 합계로 표시
SELECT DECODE(MM, 99, '합계', MM||'월') "입사월", CNT "인원수"
FROM (SELECT TO_NUMBER(TO_CHAR(HIRE_DATE, 'MM')) MM, COUNT(*) CNT FROM EMPLOYEES GROUP BY TO_CHAR(HIRE_DATE, 'MM')
UNION
SELECT 99 MM, COUNT(*) CNT FROM EMPLOYEES
ORDER BY 1);

--------------------------------------------------------
/* (방식2) 첫 행에 모든 월별 입사 사원 수가 출력되도록 하시오
  1월 2월 3월 4월 .... 11월 12월
  xx  xx  xx xx  .... xx   xx
**********************************************************************/
SELECT EMPLOYEE_ID, HIRE_DATE, TO_CHAR(HIRE_DATE,'MM'),
       DECODE (TO_CHAR(HIRE_DATE,'MM'), '01', 1,0)
FROM EMPLOYEES
ORDER BY HIRE_DATE;

SELECT SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '01', 1,0)) "1월" ,
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '02', 1,0)) "2월",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '03', 1,0)) "3월",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '04', 1,0)) "4월",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '05', 1,0)) "5월",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '06', 1,0)) "6월",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '07', 1,0)) "7월",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '08', 1,0)) "8월",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '09', 1,0)) "9월",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '10', 1,0)) "10월",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '11', 1,0)) "11월",
        SUM(DECODE (TO_CHAR(HIRE_DATE,'MM'), '12', 1,0)) "12월",
        COUNT(*) "합계"
FROM EMPLOYEES;















