-- ���� ����(Sub Query) 
-- SELECT �� �ȿ� �ٽ� SELECT ���� ����� ���� 
-- ���� SELECT �� �ȿ� ���� SELECT ���� ���Ե� ���¶� ��ø��(nested) ������� �θ� 
-- ���� SELECT �� ��븸���δ� ������ ���ǽ��� ���� �� ��� 
-- �ٸ� ���̺��� ������ ���� ��ȸ�� �� �������� ����� �� ��� 

-- ���� ���� ���� 
-- ���� �� �������� : �ϳ��� ���� �˻��ϴ� ���� ���� => ���� ������ ������� ����� ���� ���� ��츦 ���Ѵ�. 
-- ���� �� �������� : �ϳ� �̻��� ���� �˻��ϴ� ���� ���� => ���� ������ ������� ����� �Ѱ� �̻��� ���� ��츦 ���Ѵ�. 
-- ���� �� ���� ���� : �ϳ� �̻��� ���� �˻��ϴ� ���� ���� => �˻��ϴ� ���������� ����� �ϳ� �̻��� ���� ������ �ִ� ��츦 ���Ѵ�. 

-- �������� ��Ģ 
-- ���� ������ ��ȣ�� ��� ����Ѵ�. 
-- ���� �� ������ �Ǵ� ���� �� �����ڷ� ���� ������ �����Ѵ�. 
-- ���� ���� ���� �� ���� ������ �����Ѵ�. 
-- ���� ���� ������ ��ø�ؼ� ��� �����ϴ�. 

-- ���� �� ������ : =, >, >=, <, <=, !=, <> : ���� �� ���������� ����Ҷ� ���, ���� �� ���������� ����� �� ��� 
-- ���� �� ������ : IN, NOT IN, EXISTS, ANY, ALL : ���� �� ���������� ����Ҷ� ���, ���� �� ���������� ����� �� ��� 

-- ���� �� ���� ���� 
-- �������� SELECT ������ ���� �� ����� ���� ������ ���� 
-- WHERE�� ���Ǵ� ���� ������ ������ Ÿ�� ��ġ �ʿ��ϴ�.
--              => ���������� ���� ���� �࿡ ���� ���� ������ WHERE�� �ȿ� �ִ� �� ����� ���� ������ ��ġ�ؾ� �ϰ� 
--                 ������ Ÿ�Ե� ��ġ �ؾ� �Ѵ�. 
SELECT * 
FROM employees
WHERE phone_number = (
                       SELECT phone_number
                       FROM employees 
                       WHERE employee_id = 100
                     ); 
                     
SELECT * 
FROM employees 
WHERE hire_date = (
                    SELECT hire_date 
                    FROM employees
                    WHERE email = 'SKING'
                  ); 
                  
SELECT * 
FROM employees 
WHERE hire_date < ( 
                    SELECT hire_date 
                    FROM employees 
                    WHERE email = 'SKING'
                  ); 
            
SELECT * 
FROM employees 
WHERE salary = ( 
                SELECT salary
                FROM employees 
                WHERE hire_date = '06/01/03'
              ); 

SELECT * 
FROM employees 
WHERE salary >= (
                 SELECT salary 
                 FROM employees 
                 WHERE hire_date = '06/01/03'
                ); 
              
-- ���� �� ���� ���� 
-- �������� SELECT ������ ���� �� ����� ���� ������ ���� 
--    => ���������� �����ϴ� ��� ��ü�� ���� ���� �ƴ϶� �������� ���� �������̴�. 
-- ���� �� �����ڴ� ��� �� �� ����, ���� �� �����ڸ� ��� ���� 

-- IN       : ���� ���� ��� �� ���� ���� ���ԵǾ� ������ TRUE => ���� ���� ��� �ִ� �� TRUE                :  IN(100, 101) 
-- NOT IN   : ���� ���� ��� �� ���� ���� ���Ե��� �ʾ����� TRUE => ���� ���� ��, �ٸ� ���� ��� �ִ� �� TRUE  :  NOT IN(100, 101)
-- EXISTS   : ���� ������ ����� �����ϸ� TRUE => ��ü ���� TRUE                                         :  EXISTS(100)
-- ANY(SOME): ���ǽ��� �ϳ��� �����ϸ� TRUE                                                          : ANY(100, 101) 
-- ALL      : ���ǽ��� ��� �����ϸ� TRUE                                                              : ALL(100, 101)

-- IN / NOT IN ������ 
SELECT * 
FROM employees 
WHERE salary IN (
                    SELECT MAX(salary) 
                    FROM employees 
                    GROUP BY department_id
                    ); 
                    
SELECT * 
FROM employees 
WHERE salary NOT IN( 
                    SELECT MAX(salary) 
                    FROM employees 
                    GROUP BY department_id 
                ); 
                
SELECT *
FROM employees 
WHERE EXISTS(
                SELECT * 
                FROM employees 
                WHERE employee_id = 100 
             ); 

-- ANY / ALL ������ 
SELECT * 
FROM employees 
WHERE salary = ANY(6000, 10000, 12000); 

SELECT * 
FROM employees 
WHERE salary <> ANY(6000, 10000, 12000); 

SELECT * 
FROM employees 
WHERE salary < ANY(6000, 10000, 12000); 

SELECT * 
FROM employees
WHERE salary <= ALL(6000, 10000, 12000); 

SELECT * 
FROM employees 
WHERE salary >= ALL(6000, 10000, 12000); 

SELECT * 
FROM employees 
WHERE salary <> ALL(6000, 10000, 12000); 

-- ANY / ALL ������ 
SELECT * 
FROM employees
WHERE salary < ANY(SELECT salary 
                   FROM employees
                   WHERE hire_date > '08/01/01'); 
                   
SELECT * 
FROM employees 
WHERE salary < ALL(SELECT salary 
                   FROM employees 
                   WHERE hire_date > '08/01/01'); 
                   
SELECT * 
FROM employees 
WHERE salary > ANY( SELECT MAX(salary) 
                    FROM employees
                    GROUP BY department_id);
    
SELECT * 
FROM employees 
WHERE salary < ALL( SELECT MAX(salary) 
                    FROM employees 
                    GROUP BY department_id); 
                   
-- �ζ��� ��(Inline View) 
-- => ���߿� �並 ��� ���ε� �� ���� ���������� ����ؼ� �ζ��� ���·�, ��ġ ��ó�� ����� �� �ִ�. 
--    FROM ���� �ִ� ���������� �ζ��� �並 �����Ѵ�. 
--    FROM ���� ���� ����Ͽ� ȿ������ �˻��� �����ϴ�. 
--    FROM ���� �ִ� ������������ ���� ��Ī�� ����Ѵ�. 

SELECT * 
FROM employees E, (SELECT department_id 
                    FROM departments 
                    WHERE department_name = 'IT') D
WHERE E.department_id = D.department_id; 

SELECT E.last_name, E.salary, D.avg_sal
FROM employees E, (SELECT department_id, AVG(salary) avg_sal 
                    FROM employees 
                    GROUP BY department_id) D
WHERE E.department_id = D.department_id
AND E.salary > D.avg_sal; 

SELECT department_name, (SELECT AVG(salary) 
                         FROM employees 
                         GROUP BY department_name)
FROM departments;

SELECT ROWNUM, salary 
FROM (SELECT salary
      FROM employees 
      ORDER BY salary DESC)
WHERE ROWNUM <= 10; 

-- [�ǽ�] ���� ����
SELECT first_name, last_name, job_id, salary
FROM employees
WHERE department_id = (
                       SELECT department_id
                       FROM departments
                       WHERE department_name = 'IT'
                      ); 
                      
SELECT department_id, department_name                      
FROM departments
WHERE location_id = (
                     SELECT location_id                     
                     FROM locations
                     WHERE state_province = 'California'
                     ); 
                     
SELECT city, state_province, street_address                   
FROM locations                     
WHERE country_id IN(
                    SELECT country_id                  
                    FROM countries
                    WHERE region_id = 3
                    ); 
                    
SELECT first_name, last_name, job_id, salary   
FROM employees
WHERE department_id IN(
                       SELECT department_id        
                       FROM departments
                       WHERE manager_id IS NOT NULL
                       ); 

SELECT department_id, department_name
FROM departments                    
WHERE location_id NOT IN(
                     SELECT location_id        
                     FROM locations
                     WHERE city = 'Seattle'
                     ); 
                     
SELECT city, state_province, street_address                    
FROM locations                     
WHERE country_id IN (
                    SELECT country_id
                    FROM countries                     
                    WHERE region_id = (
                                         SELECT region_id                    
                                         FROM regions
                                         WHERE region_name = 'Europe'
                                        )
                  ); 
                    





























