--05 정렬과 집합연산 
--ORDER BY, UNION, UNION ALL, INTERSECT, MINUS
--=> 우리가 원하는 데이터를 조회 했을때 데이터들이 정렬되게 하기 위한 조치 
--=> 데이터베이스에서도 데이터를 정렬하는데 기준을 정하고 
--   그 기준으로 오름차순, 내림차순 이런 정렬을 시킬 수 있다. 
--=> 데이터들 간에 집합연산(합집합, 교집합, 차집합)을 할 수 있다. 
--
--ORDER BY (1. 맨 마지막에 써준다.   2. 정렬기능을 수행하기 위해서 사용하는 키워드) 
--
--ORDER BY 키워드를 이용해 결과 테이블 내용을 사용자가 원하는 순서로 출력 
--ORDER BY 키워드와 함께 정렬 기준이 되는 속성과 정렬 방식을 지정 
--        오름차순(기본) : ASC / 내림차순 : DESC
--        널 값은 오름차순에서는 맨 마지막에 출력되고, 내림차순에서는 맨 먼저 출력됨 
--        여러 기준에 따라 정렬하려면 정렬 기준이 되는 속성을 차례대로 제시 
        
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

--SQL연산자 
--=> 다양한 SQL연산자가 오르클에서 제공이 된다. 
--조건 비교 확장을 위해서 사용되는 SQL 연산자 
--=> 특수한 목적으로 사용되는 연산자 

--BETWEEN 연산자 
--두 값의 범위에 해당하는 데이터만 출력할 때 사용되는 확장 연산자 
SELECT * FROM employees WHERE employee_id BETWEEN 120 AND 130; 
SELECT * FROM employees WHERE salary BETWEEN 10000 AND 12000; 

--IN 연산자 
--여러개의 데이터 값을 지정하여 (IN 안에 포함된)일치하는 데이터만 출력할 때 사용 
SELECT * FROM employees WHERE first_name IN('Steven', 'John', 'Peter'); 
SELECT * FROM countries WHERE country_id IN('US', 'IL', 'SG'); 
SELECT * FROM locations WHERE city NOT IN('Sao Paulo', 'London', 'Southlake'); 

-- IS NULL 연산자 
-- 특정 속성의 값이 NULL 값인지를 비교하여 데이터 조회
SELECT * 
FROM locations 
WHERE state_province IS NULL;

SELECT * 
FROM employees 
WHERE commission_pct IS NOT NULL; 

-- LIKE 연산자 
-- 문자열 행들을 담고 있는 속성에서 부분적으로 일치하는 것만 출력할 때 사용 
-- 기호 : %    : 0개 이상의 문자(문자의 내용과 개수는 상관 없음) 
-- 기호 : _    : 1개 이상의 문자(문자의 내용은 상관 없음) => 개수가 지정이 됐다. 

-- 기호 : LIKE 'data%'   : data로 시작하는 문자열(길이 상관 없이 data로 시작) 
-- 기호 : LIKE '%data'   : date로 끝나는 문자열(길이 상관 없이 data로 끝남) 
-- 기호 : LIKE '%data%'  : data가 포함된 문자열(길이 상관 없이 data가 포함) 
-- 기호 : LIKE 'data____': data로 시작하는 8자리 문자열 
-- 기호 : LIKE '____data': data로 끝나는 8자리 문자열 
SELECT * 
FROM locations 
WHERE city LIKE 'South%'; 

SELECT * 
FROM locations 
WHERE street_address LIKE '%St'; 

SELECT * 
FROM locations 
WHERE city LIKE 'South____';

-- 집합연산자 
-- 연산자 앞뒤의 값을 비교하여 데이터 조회 
-- 연산자 : UNION      : 합집합(중복 제외) 
-- 연산자 : UNION ALL  : 합집합(중복 포함) 
-- 연산자 : MINUS      : 차집합 
-- 연산자 : INTERSECT  : 교집합 
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

-- [실습] 정렬, 집합연산자 
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





























































































