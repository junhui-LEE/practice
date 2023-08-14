--숫자를 정수로 올림하는 CEIL()함수, 숫자를 정수로 내림하는 FLOOR() 함수 
SELECT salary, salary/21, CEIL(salary/21), FLOOR(salary/21)
FROM employees; 

--숫자를 반올림 하는 ROUND() 함수, 숫자를 절삭하는 TRUNC()함수 
SELECT salary, salary/21, 
       ROUND(salary/21, 2) , ROUND(salary/21, -1), 
       TRUNC(salary/21, 2), TRUNC(salary/21, -1)
FROM employees; 

--MOD() : 숫자를 나눈 후 나머지를 구함 
SELECT salary, salary/21, MOD(salary, 21)
FROM employees; 

--SIGN() : 숫자가 양수일 경우 1, 음수일 경우 -1, 나머지는 0을 반환
SELECT SIGN(-123), SIGN(0), SIGN(123)
FROM dual; 

--POWER() / SQRT() : 거듭제곱을 출력하는 POWER()함수, 제곱근을 출력하는 SQRT()함수 
SELECT POWER(3, 3), SQRT(4)
FROM dual; 
-- *************************************************************************
-- ** 날짜함수는 단일행 함수로서 적용되는 모든행에 대응되는 결과값(여러 결과값)을      ** 
-- ** 반환한다. 단일행 함수 이기 때문에 SELECT, WHERE, ORDER BY 절에서 사용된다.  ** 
-- ** 어떤것을 결제할때 결제날짜, 결제시간, 등이 database에 저장이 되는 경우가 많고  ** 
-- ** 영화 예약 시스템에서도 정확하게 영화가 예약된 날짜, 시간이 어떻게 되는지        ** 
-- ** database에 저장되는 경우가 많다. 따라서 database에서는 날짜자료형이 따로     ** 
-- ** 존재하며 날짜를 처리할 수 있는 날짜함수가 존재한다.                         ** 
-- *************************************************************************

--SYSDATE : 오라클이 설치된 시스템의 현재 날짜를 반환한다. 
SELECT SYSDATE, SYSDATE+1, SYSDATE-1
FROM dual; 

--MONTH_BETWEEN() : 날짜와 날짜 사이의 개월 수를 계산   
SELECT hire_date, MONTHS_BETWEEN(SYSDATE, hire_date)
FROM employees; 

--ADD_MONTHS() : 날짜에 지정된 개월수를 더한다. 
SELECT hire_date, ADD_MONTHS(hire_date, 3), ADD_MONTHS(hire_date, -3)
FROM employees; 

-- NEXT_DAY() / LAST_DAY() : 
--  지정된 날짜부터 돌아오는 요일 날짜를 출력하는 NEXT_DAY() 함수 
--  월의 마지막 날짜를 계산하는 LAST_DAY() 함수 
SELECT hire_date, 
       NEXT_DAY(hire_date, 3),        -- 03/06/17 에서 3을 더하면 그냥 3을 더하는 것이 아니라 
       NEXT_DAY(hire_date, '수요일'),  -- 지정된 날짜(hire_date)에서 돌아오는 요일의 날짜를 
       LAST_DAY(hire_date)            -- 출력해 준다. 그래서 그 다음에 돌아오는 요일의 날짜가 어떻게
FROM employees;                       -- 되느냐는 것을 출력해 준다.=> 3은 화요일이고, 1은 일요일이다. 

-- ROUND() / TRUNC() : 
-- 날짜를 년도나 월까지 남겨두고 그 뒤를 반올림 하는 ROUND() 함수 
-- 날짜를 년도나 월까지 남겨두고 그 뒤를  잘라내는(초기화 하는)  TRUNC() 함수 
SELECT hire_date, 
       ROUND(hire_date, 'YEAR'), 
       ROUND(hire_date, 'MONTH'), 
       TRUNC(hire_date, 'YEAR'), 
       TRUNC(hire_date, 'MONTH')
FROM employees; 

--변환 ㅎ마수 
-- 오라클에서 제공하는 데이터타입을 필요에 따라 변환 
-- *자동(암묵적)변환, *수동(명시적)변환 이 있다. 

-- 자동(암묵적)변환 
SELECT 1 + '2' 
FROM dual;

-- 수동(명시적)변환 
-- TO_CHAR() : 숫자와 날짜 데이터를 문자 데이터로 변환 
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환 
-- TO_DATE() :  문자 데이터를 날짜 데이터로 변환 

-- TO_CHAR() : 숫자와 날짜 데이터를 문자 데이터로 변환하는 함수 
SELECT TO_CHAR(SYSDATE, 'CC AD Q')
FROM dual; 

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD')
FROM dual; 

SELECT TO_CHAR(SYSDATE, 'W DAY')
FROM dual; 

--TO_CHAR() : 숫자와 날짜 데이터를 문자 데이터로 변환하는 함수 
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS')
FROM dual; 

SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS PM')
FROM dual; 

SELECT TO_CHAR(SYSDATE, 'YY-MM-DD')
FROM dual; 

SELECT TO_CHAR(SYSDATE, 'MM"월" DD"일"') 
FROM dual; 

--TO_CHAR()함수는 또한 숫자데이터를 문자데이터로 바꿔줄 수도 있다. 
-- 여기서 숫자지정형식을 이용하여 숫자를 문자로 바꿀때 원하는 모양으로 
-- 지정할 수 있다. 
SELECT TO_CHAR(salary, '9999999')
FROM employees; 

SELECT TO_CHAR(salary, '0999999') 
FROM employees; 

SELECT TO_CHAR(salary, '$999999') 
FROM employees; 

SELECT TO_CHAR(salary, 'L999999') 
FROM employees; 

SELECT TO_CHAR(salary, '99999.99')
FROM employees; 

SELECT TO_CHAR(salary, '9,999,999')
FROM employees; 

--TO_NUMBER() : 숫자로 된 문자열을 숫자 타입으로 변환하는 함수 
SELECT TO_NUMBER('123')
FROM dual; 

SELECT TO_NUMBER('123.123') 
FROM dual; 

--TO_DATE() : 숫자로 된 문자열을 날짜 타입으로 변환하는 함수 
SELECT TO_DATE('20210909', 'YYMMDD')
FROM dual; 

SELECT TO_CHAR(TO_DATE('20210909', 'YYMMDD'), 'YYYY/MM/DD') 
FROM dual; 


-- 일반함수  <= 오라클에서 제공하는 몇가지 유용한 함수들이 있다. // 
--   NVL(), NVL2(), DECODE(), CASE(), RANK(), DENSE_RANK(), ROW_NUMBER() 

-- NVL() : NULL 값을 특정한 값으로 치환하는 함수 

SELECT department_name, manager_id
FROM departments; 

SELECT department_name, NVL(manager_id, 100)
FROM departments; 

SELECT NVL(state_province, 'None')
FROM locations
ORDER BY state_province; 

--NVL2() : NULL 값인 경우와 NULL 값이 아닌 경우를 구분하여 
--         특정한 값으로 치환하는 함수 
SELECT department_name, 
        NVL2(manager_id, '관리자 있음', '관리자 없음') 
FROM departments; 

SELECT  city, 
        NVL2(state_province, '주소 있음', '주소 없음') 
FROM locations 
ORDER BY state_province; 

--DECODE() : 데이터가 조건 값과 일치하면 치환 값을 출력하고, 
--           일치하지 않으면 기본값을 출력하는 조건 논리 처리 함수 
SELECT job_title, min_salary, 
       DECODE(min_salary, 2500, min_salary*1.1, min_salary) 
FROM jobs; 

SELECT job_title, max_salary, 
       DECODE(max_salary, 40000, max_salary*0.9, max_salary) 
FROM jobs; 

-- CASE() : 복잡한 논리 조건 처리 함수 
SELECT job_title, min_salary, 
        CASE
            WHEN min_salary < 4000 THEN min_salary*1.2
            WHEN min_salary BETWEEN 4000 AND 6000 THEN min_salary*1.1
            ELSE min_salary
        END AS 최소급여변경
FROM jobs;

--RANK(), DENSE_RANK(), ROW_NUMBER() 함수 
--    RANK() : 공통 순위는 건너뛰어 다음 순위를 출력하는 순위 함수 
--                  EX: 공동2등이 있었기 때문에 3등이 없어 졌다. 
--    DENSE_RANK() : 공통 순위를 건너뛰지 않고, 다음 순위를 출력하는 순위 함수 
--    ROW_NUMBER() : 공통 순위 없이 순위를 출력하는 순위 함수 
SELECT first_name, salary,  
        RANK() OVER(ORDER BY salary DESC) RANK, 
        DENSE_RANK() OVER(ORDER BY salary DESC) DENSE_RANK, 
        ROW_NUMBER() OVER(ORDER BY salary DESC) ROW_NUMBER
FROM employees; 

--[실습] 숫자, 날짜 함수 
SELECT CEIL(min_salary/30), FLOOR(min_salary/30)
FROM jobs;

SELECT max_salary/30, ROUND(max_salary/30, 1), ROUND(max_salary/30, -1)
FROM jobs; 

SELECT TRUNC(max_salary/30, 3), TRUNC(max_salary/30, -1)
FROM jobs; 

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 1)
FROM dual;

SELECT  SYSDATE, 
        NEXT_DAY(SYSDATE, '월요일'), 
        NEXT_DAY(SYSDATE, 2), 
        NEXT_DAY(SYSDATE, '금요일'), 
        NEXT_DAY(SYSDATE, 6)
FROM dual; 

--[실습] 변환 함수 
SELECT TO_CHAR(SYSDATE, 'MON/DD"일" DAY')
FROM dual; 

SELECT TO_CHAR(SYSDATE, 'AM HH:MI')
FROM dual; 

SELECT TO_CHAR(TO_DATE('20210101', 'YYMMDD'), 'DAY')
FROM dual; 

--[실습] 일반 함수
SELECT 
      salary, 
      commission_pct, 
      salary+salary*NVL(commission_pct, 0)
FROM employees 
ORDER BY commission_pct;

SELECT 
       first_name, last_name, department_id, salary, 
       DECODE(department_id, 50, salary*1.1, salary) AS 급여인상, 
       DECODE(department_id, 100, salary*0.9, salary) AS 급여감소 
FROM employees;

SELECT job_title, max_salary, 
     CASE
         WHEN max_salary >= 20000 THEN '상위'
         WHEN max_salary BETWEEN 10000 AND 20000 THEN '중위'
         ELSE '하위'
     END AS 급여등급 
FROM jobs
WHERE job_title LIKE '%Manager'; 

