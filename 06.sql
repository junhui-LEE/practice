-- LOWER(), UPPER(), INITCAP() 
-- 문자열을 소문자로 변환하는 LOWER() 함수, 문자열을 대문자로 변환하는 UPPER() 함수 
-- 첫 문자만 대문자로 변환하는 INITCAP() 함수. 
SELECT first_name, LOWER(first_name), UPPER(first_name), INITCAP(first_name)
FROM employees; 
-- SUBSTR()
-- 문자열에서 지정된 길이 만큼의 일부만 추출할 때 사용 
SELECT job_id, SUBSTR(job_id, 1, 2), SUBSTR(job_id, 4)
FROM employees; 
-- REPLACE() 
-- 특정 문자열을 찾아서 바꾸는 함수 
SELECT job_id, REPLACE(job_id, 'MGR', 'MANAGER')
FROM employees; 

SELECT job_id, REPLACE(job_id, 'PRO', 'PROGRAMMER')
FROM employees; 
-- CONCAT() 
-- 두 개의 문자열을 하나로 합치는 함수 
SELECT CONCAT(first_name, CONCAT(' ' , last_name))
FROM employees; 
-- LENGTH()
-- 문자열의 길이를 반환하는 함수 
SELECT first_name, LENGTH(first_name)
FROM employees; 
-- INSTR() 
-- 문자열 위치값을 반환하는 함수 
SELECT first_name, INSTR(first_name, 'a')
FROM employees; 
-- LPAD(), RPAD() 
-- 특정 문자를 왼쪽부터 채우는 LPAD() 함수 
-- 특정 문자를 오른쪽 부터 채우는 RPAD() 함수 
SELECT LPAD(first_name, 10, '*'), RPAD(first_name, 10, '*')
FROM employees; 
-- LTRIM(), RTRIM() 
-- 왼쪽에 특정 문자를 제거하는 LTRIM() 함수 
-- 오른쪽에 특정 문자를 제거하는  RTRIM() 함수 
SELECT job_id, LTRIM(job_id, 'A'), RTRIM(job_id, 'A')
FROM employees; 
-- TRIM() 
-- 문자열의 공백(space)을 제거하는데 사용하는 함수 
SELECT TRIM('   Suan   '), TRIM('  su an   ')
FROM employees; 
-- dual 테이블 
-- 하나의 열 DUMMY와 하나의 값 'X'를 가지고 있는 테이블로 ,, 테이블을 
-- 참조하지 않고 출력만을 하기위해서 사용하는 테이블이다. 
SELECT * 
FROM dual; 


--6강 실습  : [실습]문자 함수 
SELECT job_title, LOWER(job_title), UPPER(job_title)
FROM jobs;

SELECT SUBSTR(first_name, 1, 1), last_name
FROM employees; 

SELECT REPLACE(job_id, 'REP', 'REPRESENTATIVE')
FROM employees; 

SELECT CONCAT(SUBSTR(first_name, 1, 1) , CONCAT(' ', last_name))
FROM employees; 

SELECT LENGTH(first_name) + LENGTH(last_name)
FROM employees; 

SELECT job_id, INSTR(job_id, 'A')
FROM employees; 

SELECT LPAD(city, 15, '.'), RPAD(city, 15, '.')
FROM locations;

SELECT city, LTRIM(city, 'S'), RTRIM(city, 'e')
FROM locations; 




































