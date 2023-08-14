-- LOWER(), UPPER(), INITCAP() 
-- ���ڿ��� �ҹ��ڷ� ��ȯ�ϴ� LOWER() �Լ�, ���ڿ��� �빮�ڷ� ��ȯ�ϴ� UPPER() �Լ� 
-- ù ���ڸ� �빮�ڷ� ��ȯ�ϴ� INITCAP() �Լ�. 
SELECT first_name, LOWER(first_name), UPPER(first_name), INITCAP(first_name)
FROM employees; 
-- SUBSTR()
-- ���ڿ����� ������ ���� ��ŭ�� �Ϻθ� ������ �� ��� 
SELECT job_id, SUBSTR(job_id, 1, 2), SUBSTR(job_id, 4)
FROM employees; 
-- REPLACE() 
-- Ư�� ���ڿ��� ã�Ƽ� �ٲٴ� �Լ� 
SELECT job_id, REPLACE(job_id, 'MGR', 'MANAGER')
FROM employees; 

SELECT job_id, REPLACE(job_id, 'PRO', 'PROGRAMMER')
FROM employees; 
-- CONCAT() 
-- �� ���� ���ڿ��� �ϳ��� ��ġ�� �Լ� 
SELECT CONCAT(first_name, CONCAT(' ' , last_name))
FROM employees; 
-- LENGTH()
-- ���ڿ��� ���̸� ��ȯ�ϴ� �Լ� 
SELECT first_name, LENGTH(first_name)
FROM employees; 
-- INSTR() 
-- ���ڿ� ��ġ���� ��ȯ�ϴ� �Լ� 
SELECT first_name, INSTR(first_name, 'a')
FROM employees; 
-- LPAD(), RPAD() 
-- Ư�� ���ڸ� ���ʺ��� ä��� LPAD() �Լ� 
-- Ư�� ���ڸ� ������ ���� ä��� RPAD() �Լ� 
SELECT LPAD(first_name, 10, '*'), RPAD(first_name, 10, '*')
FROM employees; 
-- LTRIM(), RTRIM() 
-- ���ʿ� Ư�� ���ڸ� �����ϴ� LTRIM() �Լ� 
-- �����ʿ� Ư�� ���ڸ� �����ϴ�  RTRIM() �Լ� 
SELECT job_id, LTRIM(job_id, 'A'), RTRIM(job_id, 'A')
FROM employees; 
-- TRIM() 
-- ���ڿ��� ����(space)�� �����ϴµ� ����ϴ� �Լ� 
SELECT TRIM('   Suan   '), TRIM('  su an   ')
FROM employees; 
-- dual ���̺� 
-- �ϳ��� �� DUMMY�� �ϳ��� �� 'X'�� ������ �ִ� ���̺�� ,, ���̺��� 
-- �������� �ʰ� ��¸��� �ϱ����ؼ� ����ϴ� ���̺��̴�. 
SELECT * 
FROM dual; 


--6�� �ǽ�  : [�ǽ�]���� �Լ� 
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




































