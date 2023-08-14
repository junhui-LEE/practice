--SQL�� ������ ��ȸ 
--SQL
--SELECT �� 
--
--SQL 
--SQL(Structured Query Language) 
--������ �����ͺ��̽��� ���۰� ������ ���Ǵ� �����ͺ��̽� ���ǿ� ��� 
--IBM DB2, ����ũ�μ���Ʈ, Access(DB�̸�)�� SQL Server, Oracle, Sybase, Informix ��� ����ȭ ���Ǿ�� �θ� ��� 
--���ϴ� �����Ͱ� ���������� ����ϰ�, �������� ���(�� ���Ǹ� �ϸ� �ȴ�.) 
--
--SQL Ư¡ 
--���� ���� 
--ǥ�� ��� ��� 
--������ �˻�, ���� ���ǿ� ���� 
--���� ������ ������� ó�� ���� 
--
--SQL Ȱ�� �о� 
--������ ��ȸ, ����(����), �м�(�츮�� ���ϴ� ������ �����ϰų�(Ư�� ������ ���) �м� ������ ����� �� �ִ�. ) 
--���� ���α׷� ���� 
--SAS, SAP, OLAP ���α׷� 
--Python, R ���� ���� 
--
--SQL �з� 
--DML(Data Manipulation Language) 
--������ ���� ��� 
--�����͸� ����(����, ����, ����, ����)�ϴµ� ���Ǵ� ��� 
--DML ������ ���Ǵ� ����� ���̺��� �� 
--DML ����ϱ� ���ؼ��� �� �� ������ ���̺��� ���ǵǾ� �־�� �� 
--SELECT, INSERT, UPDATE, DELETE ���� 
--
--DDL(Data Definition Language) 
--������ ���� ��� 
--�����ͺ��̽�, ���̺�, ��, �ε��� ���� �����ͺ��̽� ��ü�� ����/����/���� �ϴ� ���� 
--DDL�� Ʈ����� �߻���Ű�� ���� 
--CREATE, DROP, ALTER ���� 
--ROLLBACK�̳� COMMIT ��� �Ұ�
--=> Ʈ������̶�� ��ɿ� ���Ǵ� ROLLBACK, COMMIT ��ɾ�� DDL�������� ��� �Ұ� 
--
--DCL(Data Control Language) 
--������ ���� ��� 
--����ڿ��� � ������ �ο��ϰų� ������ �� �ַ� ����ϴ� ���� 
--GRANT, REVOKE ���� 
--
--TCL(Transaction Control Language) 
-- => �������� ���� �� ������ ��� ���࿡ �װ��� ���� �ߴµ� �߸� ������� ROLLBACK���� ���ư� �� �־�� �Ѵ�. 
-- => Transaction Control �� ���� �� ����Ѵ�. 
--Ʈ������� �߻��ϴ� SQL 
--���̺��� �����͸� ����(�Է�/����/����)�� �� ���� ���̺� ������ �������� �ʰ�, �ӽ÷� �����Ű�� ��� ���� 
--DML���� ������ ������ ���� 
--COMMIT, ROLLBACK, SAVEPOINT ���� 
--
--������ ��ȸ : SELECT 
--�����ͺ��̽� �� ���̺��� ���ϴ� �����͸� ��ȸ �� �м��ϴµ� ���Ǹ�, �Ϲ������� ���� ���� ���Ǵ� ���� 
--
--���̺� ��ü ��ȸ(SELECT * ) 
SELECT * 
FROM departments; 

--Ư�� �÷��� ��ȸ (SELECT �� �̸�) 
--���̺��� �ʿ��� ���� ��ȸ 
--�������� ���� �������� ���� ���� �޸��� ���� 
--�� �̸��� ������ ����ϰ� ���� ������� �迭 
SELECT department_id, department_name
FROM departments; 

--��Ī ����ϱ� (SELECT �� �̸� AS ��Ī) 
--�� �̸��� �ٸ� ��Ī���� ǥ�� 
SELECT department_id AS �μ�ID , department_name AS �μ��̸� 
FROM departments;

--�ߺ� ����(SELECT DISTINCT)
--�ߺ��� ���� �����ؼ� ��� 
--���̺��� ũ�Ⱑ Ŭ ���� ȿ������
SELECT DISTINCT location_id 
FROM departments;

--������ ��ȸ : SELECT 
--���� ������(||) 
--�÷��̳� ���ڿ��� ������ �� ��� 
SELECT department_id || department_name 
FROM departments; 

SELECT 'Department of ' || department_name 
FROM departments; 

SELECT 'Department of ' || department_name AS �μ��̸� 
FROM departments; 

--��� ������ 
--������ : +       => ���� 
--������ : -       => ���� 
--������ : *       => ���� 
--������ : /       => ������ 
--
--���ڷ� �� � �������� �� �÷��� �����ؼ� �ű⿡ ��������ڸ� ����ؼ� ���ϰų� ���ų� �� �� �ִ�. 

SELECT first_name, last_name, salary+500 
FROM employees;

SELECT first_name, last_name, salary-500 
FROM employees; 

SELECT first_name, last_name, salary*1.1 
FROM employees; 

SELECT first_name, last_name, salary/1.2 
FROM employees; 

-- [�ǽ�] ������ ��ȸ : SELECT 
SELECT * FROM countries;

SELECT country_id, country_name FROM countries;

SELECT country_id AS ����ID, country_name AS ������ FROM countries;

SELECT DISTINCT region_id FROM countries; 

SELECT country_name || country_id FROM countries;

-- [�ǽ�] ������ ��ȸ : SELECT 
SELECT street_address, city FROM locations; 

SELECT job_id, job_title FROM jobs; 

SELECT job_title, min_salary*1.1, max_salary*1.1 FROM jobs; 

SELECT first_name || last_name AS �̸� FROM employees; 

SELECT DISTINCT job_id FROM employees;

