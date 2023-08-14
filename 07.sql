--���ڸ� ������ �ø��ϴ� CEIL()�Լ�, ���ڸ� ������ �����ϴ� FLOOR() �Լ� 
SELECT salary, salary/21, CEIL(salary/21), FLOOR(salary/21)
FROM employees; 

--���ڸ� �ݿø� �ϴ� ROUND() �Լ�, ���ڸ� �����ϴ� TRUNC()�Լ� 
SELECT salary, salary/21, 
       ROUND(salary/21, 2) , ROUND(salary/21, -1), 
       TRUNC(salary/21, 2), TRUNC(salary/21, -1)
FROM employees; 

--MOD() : ���ڸ� ���� �� �������� ���� 
SELECT salary, salary/21, MOD(salary, 21)
FROM employees; 

--SIGN() : ���ڰ� ����� ��� 1, ������ ��� -1, �������� 0�� ��ȯ
SELECT SIGN(-123), SIGN(0), SIGN(123)
FROM dual; 

--POWER() / SQRT() : �ŵ������� ����ϴ� POWER()�Լ�, �������� ����ϴ� SQRT()�Լ� 
SELECT POWER(3, 3), SQRT(4)
FROM dual; 
-- *************************************************************************
-- ** ��¥�Լ��� ������ �Լ��μ� ����Ǵ� ����࿡ �����Ǵ� �����(���� �����)��      ** 
-- ** ��ȯ�Ѵ�. ������ �Լ� �̱� ������ SELECT, WHERE, ORDER BY ������ ���ȴ�.  ** 
-- ** ����� �����Ҷ� ������¥, �����ð�, ���� database�� ������ �Ǵ� ��찡 ����  ** 
-- ** ��ȭ ���� �ý��ۿ����� ��Ȯ�ϰ� ��ȭ�� ����� ��¥, �ð��� ��� �Ǵ���        ** 
-- ** database�� ����Ǵ� ��찡 ����. ���� database������ ��¥�ڷ����� ����     ** 
-- ** �����ϸ� ��¥�� ó���� �� �ִ� ��¥�Լ��� �����Ѵ�.                         ** 
-- *************************************************************************

--SYSDATE : ����Ŭ�� ��ġ�� �ý����� ���� ��¥�� ��ȯ�Ѵ�. 
SELECT SYSDATE, SYSDATE+1, SYSDATE-1
FROM dual; 

--MONTH_BETWEEN() : ��¥�� ��¥ ������ ���� ���� ���   
SELECT hire_date, MONTHS_BETWEEN(SYSDATE, hire_date)
FROM employees; 

--ADD_MONTHS() : ��¥�� ������ �������� ���Ѵ�. 
SELECT hire_date, ADD_MONTHS(hire_date, 3), ADD_MONTHS(hire_date, -3)
FROM employees; 

-- NEXT_DAY() / LAST_DAY() : 
--  ������ ��¥���� ���ƿ��� ���� ��¥�� ����ϴ� NEXT_DAY() �Լ� 
--  ���� ������ ��¥�� ����ϴ� LAST_DAY() �Լ� 
SELECT hire_date, 
       NEXT_DAY(hire_date, 3),        -- 03/06/17 ���� 3�� ���ϸ� �׳� 3�� ���ϴ� ���� �ƴ϶� 
       NEXT_DAY(hire_date, '������'),  -- ������ ��¥(hire_date)���� ���ƿ��� ������ ��¥�� 
       LAST_DAY(hire_date)            -- ����� �ش�. �׷��� �� ������ ���ƿ��� ������ ��¥�� ���
FROM employees;                       -- �Ǵ��Ĵ� ���� ����� �ش�.=> 3�� ȭ�����̰�, 1�� �Ͽ����̴�. 

-- ROUND() / TRUNC() : 
-- ��¥�� �⵵�� ������ ���ܵΰ� �� �ڸ� �ݿø� �ϴ� ROUND() �Լ� 
-- ��¥�� �⵵�� ������ ���ܵΰ� �� �ڸ�  �߶󳻴�(�ʱ�ȭ �ϴ�)  TRUNC() �Լ� 
SELECT hire_date, 
       ROUND(hire_date, 'YEAR'), 
       ROUND(hire_date, 'MONTH'), 
       TRUNC(hire_date, 'YEAR'), 
       TRUNC(hire_date, 'MONTH')
FROM employees; 

--��ȯ ������ 
-- ����Ŭ���� �����ϴ� ������Ÿ���� �ʿ信 ���� ��ȯ 
-- *�ڵ�(�Ϲ���)��ȯ, *����(�����)��ȯ �� �ִ�. 

-- �ڵ�(�Ϲ���)��ȯ 
SELECT 1 + '2' 
FROM dual;

-- ����(�����)��ȯ 
-- TO_CHAR() : ���ڿ� ��¥ �����͸� ���� �����ͷ� ��ȯ 
-- TO_NUMBER() : ���� �����͸� ���� �����ͷ� ��ȯ 
-- TO_DATE() :  ���� �����͸� ��¥ �����ͷ� ��ȯ 

-- TO_CHAR() : ���ڿ� ��¥ �����͸� ���� �����ͷ� ��ȯ�ϴ� �Լ� 
SELECT TO_CHAR(SYSDATE, 'CC AD Q')
FROM dual; 

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD')
FROM dual; 

SELECT TO_CHAR(SYSDATE, 'W DAY')
FROM dual; 

--TO_CHAR() : ���ڿ� ��¥ �����͸� ���� �����ͷ� ��ȯ�ϴ� �Լ� 
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS')
FROM dual; 

SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS PM')
FROM dual; 

SELECT TO_CHAR(SYSDATE, 'YY-MM-DD')
FROM dual; 

SELECT TO_CHAR(SYSDATE, 'MM"��" DD"��"') 
FROM dual; 

--TO_CHAR()�Լ��� ���� ���ڵ����͸� ���ڵ����ͷ� �ٲ��� ���� �ִ�. 
-- ���⼭ �������������� �̿��Ͽ� ���ڸ� ���ڷ� �ٲܶ� ���ϴ� ������� 
-- ������ �� �ִ�. 
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

--TO_NUMBER() : ���ڷ� �� ���ڿ��� ���� Ÿ������ ��ȯ�ϴ� �Լ� 
SELECT TO_NUMBER('123')
FROM dual; 

SELECT TO_NUMBER('123.123') 
FROM dual; 

--TO_DATE() : ���ڷ� �� ���ڿ��� ��¥ Ÿ������ ��ȯ�ϴ� �Լ� 
SELECT TO_DATE('20210909', 'YYMMDD')
FROM dual; 

SELECT TO_CHAR(TO_DATE('20210909', 'YYMMDD'), 'YYYY/MM/DD') 
FROM dual; 


-- �Ϲ��Լ�  <= ����Ŭ���� �����ϴ� ��� ������ �Լ����� �ִ�. // 
--   NVL(), NVL2(), DECODE(), CASE(), RANK(), DENSE_RANK(), ROW_NUMBER() 

-- NVL() : NULL ���� Ư���� ������ ġȯ�ϴ� �Լ� 

SELECT department_name, manager_id
FROM departments; 

SELECT department_name, NVL(manager_id, 100)
FROM departments; 

SELECT NVL(state_province, 'None')
FROM locations
ORDER BY state_province; 

--NVL2() : NULL ���� ���� NULL ���� �ƴ� ��츦 �����Ͽ� 
--         Ư���� ������ ġȯ�ϴ� �Լ� 
SELECT department_name, 
        NVL2(manager_id, '������ ����', '������ ����') 
FROM departments; 

SELECT  city, 
        NVL2(state_province, '�ּ� ����', '�ּ� ����') 
FROM locations 
ORDER BY state_province; 

--DECODE() : �����Ͱ� ���� ���� ��ġ�ϸ� ġȯ ���� ����ϰ�, 
--           ��ġ���� ������ �⺻���� ����ϴ� ���� �� ó�� �Լ� 
SELECT job_title, min_salary, 
       DECODE(min_salary, 2500, min_salary*1.1, min_salary) 
FROM jobs; 

SELECT job_title, max_salary, 
       DECODE(max_salary, 40000, max_salary*0.9, max_salary) 
FROM jobs; 

-- CASE() : ������ �� ���� ó�� �Լ� 
SELECT job_title, min_salary, 
        CASE
            WHEN min_salary < 4000 THEN min_salary*1.2
            WHEN min_salary BETWEEN 4000 AND 6000 THEN min_salary*1.1
            ELSE min_salary
        END AS �ּұ޿�����
FROM jobs;

--RANK(), DENSE_RANK(), ROW_NUMBER() �Լ� 
--    RANK() : ���� ������ �ǳʶپ� ���� ������ ����ϴ� ���� �Լ� 
--                  EX: ����2���� �־��� ������ 3���� ���� ����. 
--    DENSE_RANK() : ���� ������ �ǳʶ��� �ʰ�, ���� ������ ����ϴ� ���� �Լ� 
--    ROW_NUMBER() : ���� ���� ���� ������ ����ϴ� ���� �Լ� 
SELECT first_name, salary,  
        RANK() OVER(ORDER BY salary DESC) RANK, 
        DENSE_RANK() OVER(ORDER BY salary DESC) DENSE_RANK, 
        ROW_NUMBER() OVER(ORDER BY salary DESC) ROW_NUMBER
FROM employees; 

--[�ǽ�] ����, ��¥ �Լ� 
SELECT CEIL(min_salary/30), FLOOR(min_salary/30)
FROM jobs;

SELECT max_salary/30, ROUND(max_salary/30, 1), ROUND(max_salary/30, -1)
FROM jobs; 

SELECT TRUNC(max_salary/30, 3), TRUNC(max_salary/30, -1)
FROM jobs; 

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 1)
FROM dual;

SELECT  SYSDATE, 
        NEXT_DAY(SYSDATE, '������'), 
        NEXT_DAY(SYSDATE, 2), 
        NEXT_DAY(SYSDATE, '�ݿ���'), 
        NEXT_DAY(SYSDATE, 6)
FROM dual; 

--[�ǽ�] ��ȯ �Լ� 
SELECT TO_CHAR(SYSDATE, 'MON/DD"��" DAY')
FROM dual; 

SELECT TO_CHAR(SYSDATE, 'AM HH:MI')
FROM dual; 

SELECT TO_CHAR(TO_DATE('20210101', 'YYMMDD'), 'DAY')
FROM dual; 

--[�ǽ�] �Ϲ� �Լ�
SELECT 
      salary, 
      commission_pct, 
      salary+salary*NVL(commission_pct, 0)
FROM employees 
ORDER BY commission_pct;

SELECT 
       first_name, last_name, department_id, salary, 
       DECODE(department_id, 50, salary*1.1, salary) AS �޿��λ�, 
       DECODE(department_id, 100, salary*0.9, salary) AS �޿����� 
FROM employees;

SELECT job_title, max_salary, 
     CASE
         WHEN max_salary >= 20000 THEN '����'
         WHEN max_salary BETWEEN 10000 AND 20000 THEN '����'
         ELSE '����'
     END AS �޿���� 
FROM jobs
WHERE job_title LIKE '%Manager'; 

