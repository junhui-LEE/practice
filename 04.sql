--04 ���� �˻��� 
--��, �� ���� 
--=> �츮�� �����͸� ��ȸ �ϴ� ���� �ӿ��� Ư���� ������ �ְ� ���� ���� �ִ�. 
--=> �츮�� �����͸� �˻��ϴ� �����ӿ��� �񱳿���� �������� ���ؼ� 
--    Ư�� �����͸� ��ȸ �� �� �ֵ��� �׷��� ���� �� �ִ�. 
--
--WHERE, AND, OR, NOT
--
--WHERE 
--Ư��  ������ �����ϴ� �����͸� ��ȸ 
--������, �÷���, ǥ����, ����, ���� ���� �̿��� ���� ���� 
--
--������ 
--��������� : +, -, *, / 
--�񱳿����� : =, <>, !=, >, >=, <, <=
--�������� : AND, OR, NOT 
--���տ����� : UNION, UNION ALL, MINUS, INTERSECT 
--SQL������ : BETWEEN, IN, LIKE, IS NULL 
--
--���ڻӸ� �ƴ϶� ���ڳ� ��¥ ���� ���ϴ� �͵� ���� 
--��) 'A' < 'C'
--��) '2019-12-02' < '2019-12-02' 
--���ǿ��� ���ڳ� ��¥ ���� ���� ����ǥ�� ��� ǥ�� 
--
--������ �켱���� 
--*, /                                     ��������� 
--+, -                                     ��������� 
--=, !=, ^=, <>, >, >=, <, <=              ��� �� ������ 
--IS (NOT) NULL, (NOT) LIKE, (NOT) IN      (�� �� �� ������) 
--BETWEEN A AND B                          SQL������ 
--NOT                                      �������� 
--AND                                      �������� 
--OR                                       �������� 
--
--=> WHERE���� ���̴� ������ �켱���� : �������� < SQL������ < �񱳿����� < ��������� 
--
--�񱳿����� 
--������ �յ��� ���� ���Ͽ� ������ ��ȸ 
--
--������ : =     : ����. 
--������ : <>    : �ٸ���. 
--������ : <     : �۴�. 
--������ : >     : ũ��. 
--������ : <=    : �۰ų� ����. 
--������ : >=    : ũ�ų� ����. 

SELECT * 
FROM employees 
WHERE employee_id = 110; 

SELECT * 
FROM employees
WHERE employee_id <> 110; 

SELECT * 
FROM employees 
WHERE employee_id < 110; 

SELECT * 
FROM employees 
WHERE employee_id > 110; 

SELECT * 
FROM employees 
WHERE employee_id < = 110;

SELECT * 
FROM employees 
WHERE employee_id >= 110; 

--�������� 
--���� ������ �� �����ڷ� ������� ������ ��ȸ(���� ������ �ش�.)
--
--������ : AND     : ��� ������ �����ؾ� ��ȸ 
--������ : OR      : ���� ���� �� �ϳ��� �����ص� ��ȸ 
--������ : NOT     : ������ �������� �ʴ� �͸� ��ȸ 

SELECT * 
FROM employees 
WHERE employee_id >= 120 AND employee_id <= 130; 

SELECT * 
FROM employees 
WHERE salary >= 10000 AND salary <= 12000; 

SELECT * 
FROM employees 
WHERE manager_id = 100 OR manager_id = 120; 

SELECT * 
FROM employees 
WHERE last_name = 'King' OR last_name = 'Smith'; 

SELECT * 
FROM employees 
WHERE NOT department_id = 50; 

SELECT * 
FROM employees 
WHERE NOT department_id = 50 AND NOT department_id = 80; 

-- [�ǽ�] ��, �� ������ 
SELECT * FROM employees WHERE first_name = 'David'; 

SELECT JOB_TITLE FROM jobs  WHERE MIN_SALARY = 4000; 

SELECT JOB_TITLE FROM jobs WHERE MIN_SALARY > 4000; 

SELECT JOB_TITLE FROM jobs WHERE MIN_SALARY <= 10000; 

SELECT JOB_TITLE FROM jobs WHERE MIN_SALARY >= 4000 AND MAX_SALARY <= 10000; 

SELECT * FROM employees WHERE job_id = 'IT_PROG' AND SALARY > 5000; 
