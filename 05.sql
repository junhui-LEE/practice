--05 ���İ� ���տ��� 
--ORDER BY, UNION, UNION ALL, INTERSECT, MINUS
--=> �츮�� ���ϴ� �����͸� ��ȸ ������ �����͵��� ���ĵǰ� �ϱ� ���� ��ġ 
--=> �����ͺ��̽������� �����͸� �����ϴµ� ������ ���ϰ� 
--   �� �������� ��������, �������� �̷� ������ ��ų �� �ִ�. 
--=> �����͵� ���� ���տ���(������, ������, ������)�� �� �� �ִ�. 
--
--ORDER BY (1. �� �������� ���ش�.   2. ���ı���� �����ϱ� ���ؼ� ����ϴ� Ű����) 
--
--ORDER BY Ű���带 �̿��� ��� ���̺� ������ ����ڰ� ���ϴ� ������ ��� 
--ORDER BY Ű����� �Բ� ���� ������ �Ǵ� �Ӽ��� ���� ����� ���� 
--        ��������(�⺻) : ASC / �������� : DESC
--        �� ���� �������������� �� �������� ��µǰ�, �������������� �� ���� ��µ� 
--        ���� ���ؿ� ���� �����Ϸ��� ���� ������ �Ǵ� �Ӽ��� ���ʴ�� ���� 
        
SELECT first_name, last_name 
FROM employees 
ORDER BY first_name; 

SELECT first_name, last_name
FROM employees 
ORDER BY first_name DESC; 

SELECT department_name 
FROM departments
ORDER BY department_name;

SELECT department_name 
FROM departments 
ORDER BY department_name DESC;

SELECT country_id, city 
FROM locations 
ORDER BY country_id, city; 

SELECT location_id, department_name 
FROM departments
ORDER BY location_id DESC, department_name; 

--SQL������ 
--=> �پ��� SQL�����ڰ� ����Ŭ���� ������ �ȴ�. 
--���� �� Ȯ���� ���ؼ� ���Ǵ� SQL ������ 
--=> Ư���� �������� ���Ǵ� ������ 

--BETWEEN ������ 
--�� ���� ������ �ش��ϴ� �����͸� ����� �� ���Ǵ� Ȯ�� ������ 
SELECT * FROM employees WHERE employee_id BETWEEN 120 AND 130; 
SELECT * FROM employees WHERE salary BETWEEN 10000 AND 12000; 

--IN ������ 
--�������� ������ ���� �����Ͽ� (IN �ȿ� ���Ե�)��ġ�ϴ� �����͸� ����� �� ��� 
SELECT * FROM employees WHERE first_name IN('Steven', 'John', 'Peter'); 
SELECT * FROM countries WHERE country_id IN('US', 'IL', 'SG'); 
SELECT * FROM locations WHERE city NOT IN('Sao Paulo', 'London', 'Southlake'); 

-- IS NULL ������ 
-- Ư�� �Ӽ��� ���� NULL �������� ���Ͽ� ������ ��ȸ
SELECT * 
FROM locations 
WHERE state_province IS NULL;

SELECT * 
FROM employees 
WHERE commission_pct IS NOT NULL; 

-- LIKE ������ 
-- ���ڿ� ����� ��� �ִ� �Ӽ����� �κ������� ��ġ�ϴ� �͸� ����� �� ��� 
-- ��ȣ : %    : 0�� �̻��� ����(������ ����� ������ ��� ����) 
-- ��ȣ : _    : 1�� �̻��� ����(������ ������ ��� ����) => ������ ������ �ƴ�. 

-- ��ȣ : LIKE 'data%'   : data�� �����ϴ� ���ڿ�(���� ��� ���� data�� ����) 
-- ��ȣ : LIKE '%data'   : date�� ������ ���ڿ�(���� ��� ���� data�� ����) 
-- ��ȣ : LIKE '%data%'  : data�� ���Ե� ���ڿ�(���� ��� ���� data�� ����) 
-- ��ȣ : LIKE 'data____': data�� �����ϴ� 8�ڸ� ���ڿ� 
-- ��ȣ : LIKE '____data': data�� ������ 8�ڸ� ���ڿ� 
SELECT * 
FROM locations 
WHERE city LIKE 'South%'; 

SELECT * 
FROM locations 
WHERE street_address LIKE '%St'; 

SELECT * 
FROM locations 
WHERE city LIKE 'South____';

-- ���տ����� 
-- ������ �յ��� ���� ���Ͽ� ������ ��ȸ 
-- ������ : UNION      : ������(�ߺ� ����) 
-- ������ : UNION ALL  : ������(�ߺ� ����) 
-- ������ : MINUS      : ������ 
-- ������ : INTERSECT  : ������ 
SELECT employee_id, first_name, department_id 
FROM employees 
WHERE department_id = 60
UNION 
SELECT employee_id, first_name, department_id 
FROM employees 
WHERE department_id = 100; 

SELECT employee_id, first_name
FROM employees 
WHERE employee_id <= 160 
UNION 
SELECT employee_id, first_name 
FROM employees
WHERE employee_id >= 140; 

SELECT employee_id, first_name 
FROM EMPLOYEES 
WHERE employee_id <= 160
UNION ALL 
SELECT employee_id, first_name
FROM employees
WHERE employee_id >= 140; 

SELECT employee_id, first_name
FROM employees 
WHERE employee_id <= 160
MINUS
SELECT employee_id, first_name
FROM employees 
WHERE employee_id >= 140; 

SELECT employee_id, first_name
FROM employees 
WHERE employee_id <= 160
INTERSECT
SELECT employee_id, first_name 
FROM employees
WHERE employee_id >= 140; 

-- [�ǽ�] ����, ���տ����� 
SELECT job_title FROM jobs ORDER BY job_title;

SELECT country_name FROM countries ORDER BY country_name DESC;

SELECT * FROM employees WHERE salary BETWEEN 10000 AND 12000; 

SELECT * FROM employees WHERE job_id IN('IT_PROG', 'ST_MAN'); 

SELECT * FROM employees WHERE manager_id IS NULL; 

SELECT department_name FROM departments WHERE manager_id IS NOT NULL;

SELECT * FROM employees WHERE job_id LIKE 'AD%'; 

SELECT * FROM employees WHERE first_name LIKE '%ni%'; 

SELECT location_id, street_address, city
FROM locations
WHERE location_id <= 3000 
UNION ALL 
SELECT location_id, street_address, city
FROM locations
WHERE location_id >= 2000; 

SELECT location_id, street_address, city
FROM locations
WHERE location_id <=  3000 
MINUS 
SELECT location_id, street_address, city 
FROM locations
WHERE location_id >= 2000; 

SELECT location_id, street_address, city 
FROM locations
WHERE location_id <= 3000 
INTERSECT 
SELECT location_id, street_address, city 
FROM locations 
WHERE location_id >= 2000; 





























































































