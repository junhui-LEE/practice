-- �����Լ�
-- ���� �࿡ ���� �ϳ��� ����� ����ϴ� �׷��Լ��� �̿��Ͽ� 
-- �������� ���� ������ �����Ѵ�. 

-- �����Լ��� ���� 
-- COUNT() : ���� ���� 
-- SUM() : �հ� 
-- AVG() : ��� 
-- MIN() : �ּڰ� 
-- MAX() : �ִ� 
-- STDDEV() : ǥ������ 
-- VARIANCE() : �л� 

-- COUNT() : ���� ���� ������ ���ϴ� �Լ� 
SELECT COUNT(salary) 
FROM employees; 

SELECT COUNT(manager_id)
FROM employees; 

SELECT COUNT(commission_pct)
FROM employees;

SELECT COUNT(*)
FROM employees; 

-- SUM() / AVG() : ���� �հ踦 ���ϴ� SUM()�Լ�
--                 ���� ����� ���ϴ� AVG()�Լ� 
SELECT SUM(salary), AVG(salary)
FROM employees; 

SELECT SUM(salary)/COUNT(salary)
FROM employees; 

SELECT first_name, salary,
       SUM(salary) OVER(ORDER BY first_name)
FROM employees; 

-- MIN()/MAX() : ���� �ּڰ��� ���ϴ� MIN()�Լ� 
--             : ���� �ִ��� ���ϴ� MAX()�Լ� 
SELECT MIN(salary), MAX(salary)
FROM employees; 

SELECT MIN(first_name), MAX(first_name)
FROM employees;

-- STDDEV() / VARIANCE() : ǥ�������� ���ϴ� STDDEV() �Լ� 
--                       : �л��� ���ϴ� VARIANCE() �Լ� 
SELECT STDDEV(salary), VARIANCE(salary) 
FROM employees; 

SELECT first_name, salary, 
       STDDEV(salary) OVER(ORDER BY first_name)
FROM employees
WHERE department_id = 50; 

-- GROUP BY
-- : ������ ���� ������ ���� �������� �׷�ȭ�Ͽ� ���� �Լ� ���� 
-- GROUP BY ���� ���� 
-- 1. ���̺��� WHERE ���ǽſ� �´� ������ ���� ����
--       => ���� WHERE ������ ���͸��� �Ѵ�. 
-- 2. ������ �� �������� ���� ������ ������ �׷�ȭ �Ѵ�. 
-- 3. ������ ������ �׷�ȭ�� ���� ��� ����Ѵ�. 

-- GROUP BY �� Ư¡ 
-- 1. WHERE ���� �׷�ȭ �Ǳ� ���� ���ǽ� ���� 
-- 2. GROUP BY �� ���� SELECT ���� ������ ���� ���� ���� 
-- 3. SELECT ���� �׷� �Լ� ���̵� GROUP BY �� ��� ���� 


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

-- ���� GROUP BY �� 
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
-- WHERE �������� �׷� �Լ��� ����� �� ���� 
-- �׷�ȭ�� ���� ����� ���ǽ��� ������ �� HAVING �� ��� 
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

--[�ǽ�] ���� �Լ� 
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

--[�ǽ�] �׷� �Լ�
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










