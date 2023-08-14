-- 집계함수
-- 여러 행에 대해 하나의 결과를 출력하는 그룹함수를 이용하여 
-- 여러가지 집계 연산을 수행한다. 

-- 집계함수의 종류 
-- COUNT() : 행의 개수 
-- SUM() : 합계 
-- AVG() : 평균 
-- MIN() : 최솟값 
-- MAX() : 최댓값 
-- STDDEV() : 표준편차 
-- VARIANCE() : 분산 

-- COUNT() : 열의 행의 개수를 구하는 함수 
SELECT COUNT(salary) 
FROM employees; 

SELECT COUNT(manager_id)
FROM employees; 

SELECT COUNT(commission_pct)
FROM employees;

SELECT COUNT(*)
FROM employees; 

-- SUM() / AVG() : 열의 합계를 구하는 SUM()함수
--                 열의 평균을 구하는 AVG()함수 
SELECT SUM(salary), AVG(salary)
FROM employees; 

SELECT SUM(salary)/COUNT(salary)
FROM employees; 

SELECT first_name, salary,
       SUM(salary) OVER(ORDER BY first_name)
FROM employees; 

-- MIN()/MAX() : 열의 최솟값을 구하는 MIN()함수 
--             : 열의 최댓값을 구하는 MAX()함수 
SELECT MIN(salary), MAX(salary)
FROM employees; 

SELECT MIN(first_name), MAX(first_name)
FROM employees;

-- STDDEV() / VARIANCE() : 표준편차를 구하는 STDDEV() 함수 
--                       : 분산을 구하는 VARIANCE() 함수 
SELECT STDDEV(salary), VARIANCE(salary) 
FROM employees; 

SELECT first_name, salary, 
       STDDEV(salary) OVER(ORDER BY first_name)
FROM employees
WHERE department_id = 50; 

-- GROUP BY
-- : 지정한 열의 데이터 값을 기준으로 그룹화하여 집계 함수 적용 
-- GROUP BY 동작 순서 
-- 1. 테이블에서 WHERE 조건신에 맞는 데이터 값만 구분
--       => 먼저 WHERE 절에서 필터링을 한다. 
-- 2. 지정한 열 기준으로 같은 데이터 값으로 그룹화 한다. 
-- 3. 지정한 열들의 그룹화된 집계 결과 출력한다. 

-- GROUP BY 절 특징 
-- 1. WHERE 절은 그룹화 되기 전에 조건식 적용 
-- 2. GROUP BY 절 사용시 SELECT 절에 지정된 기준 열을 지정 
-- 3. SELECT 절에 그룹 함수 없이도 GROUP BY 절 사용 가능 


SELECT job_id, SUM(salary), AVG(salary)
FROM employees
GROUP BY job_id;

SELECT job_id, SUM(salary), AVG(salary) 
FROM employees
WHERE department_id = 50
GROUP BY job_id; 

SELECT department_id, MIN(salary), MAX(salary)
FROM employees
GROUP BY department_id; 

SELECT department_id, MIN(salary), MAX(salary)
FROM employees
WHERE hire_date > '20070101'
GROUP BY department_id; 

SELECT country_id, COUNT(country_id)
FROM locations
GROUP BY country_id
ORDER BY country_id;

-- 다중 GROUP BY 절 
SELECT job_id, department_id, 
       SUM(salary), AVG(salary)
FROM employees
WHERE department_id BETWEEN 50 AND 100
GROUP BY job_id, department_id
ORDER BY job_id; 

SELECT department_id, manager_id, 
       SUM(salary), AVG(salary)
FROM employees
WHERE department_id = 50 
GROUP BY department_id, manager_id
ORDER BY manager_id; 

SELECT manager_id, department_id, job_id, 
       SUM(salary), MIN(salary), MAX(salary)
FROM employees
WHERE manager_id IN(100, 101)
GROUP BY manager_id, department_id, job_id
ORDER BY manager_id, department_id;

-- HAVINT 
-- WHERE 절에서는 그룹 함수를 사용할 수 없음 
-- 그룹화된 집계 결과에 조건식을 적용할 때 HAVING 절 사용 
SELECT job_id, SUM(salary), AVG(salary)
FROM employees
GROUP BY job_id
HAVING AVG(salary) > 10000; 

SELECT department_id, MIN(salary), MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 7000; 

SELECT country_id, COUNT(country_id)
FROM locations
GROUP BY country_id
HAVING  COUNT(country_id) > 2
ORDER BY country_id;

SELECT job_id, department_id, 
       SUM(salary), AVG(salary)
FROM employees
WHERE department_id BETWEEN 50 AND 100 
GROUP BY job_id, department_id
HAVING AVG(salary) > 9000
ORDER BY job_id;

SELECT manager_id, department_id, job_id, 
       SUM(salary), MIN(salary), MAX(salary) 
FROM employees
WHERE manager_id IN(100, 101)
GROUP BY manager_id, department_id, job_id
HAVING SUM(salary) BETWEEN 10000 AND 40000
ORDER BY manager_id, department_id;

--[실습] 집계 함수 
SELECT COUNT(*)
FROM employees 
WHERE salary >= 8000;

SELECT COUNT(*)
FROM employees
WHERE TO_NUMBER(TO_CHAR(hire_date, 'YYMMDD')) > 070101; 

SELECT SUM(max_salary), AVG(max_salary)
FROM jobs;

SELECT SUM(salary), AVG(salary)
FROM employees
WHERE job_id = 'IT_PROG'; 

SELECT first_name, salary, 
        AVG(NVL(commission_pct, 0)) OVER(ORDER BY first_name)
FROM employees
WHERE department_id BETWEEN 50 AND 80;

SELECT MIN(max_salary), MAX(max_salary)
FROM jobs; 

SELECT MIN(max_salary), MAX(max_salary)
FROM jobs
WHERE job_title = 'Programmer'; 

SELECT MIN(hire_date), MAX(hire_date)
FROM employees
WHERE department_id = 50;

SELECT first_name, salary, 
       VARIANCE(salary)
           OVER(ORDER BY hire_date)
FROM employees
WHERE department_id = 100; 

--[실습] 그룹 함수
SELECT job_id, MIN(salary), MAX(salary)
FROM employees
WHERE hire_date BETWEEN '20040101' AND '20061231'
GROUP BY job_id;

SELECT department_id, job_id, 
       SUM(salary),
       MIN(salary),
       MAX(salary)
FROM employees
WHERE department_id IN(50, 80)
GROUP BY department_id, job_id
ORDER BY job_id;


SELECT department_id, job_id, 
       MIN(salary), 
       MAX(salary), 
       AVG(salary)
FROM employees
GROUP BY department_id, job_id
HAVING AVG(salary) >= 12000
ORDER BY department_id;










