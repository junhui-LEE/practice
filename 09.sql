-- JOIN
-- �� �� �̻��� ���̺��� ���� �����ϴµ� ���Ǵ� ��� 
-- ���̺���� Ư�� ��Ģ�� ���� ���� ��ȣ ���踦 ������. 
-- 
-- ���� ���� 
-- īƼ�� ��(Cartesian Product) : ��� �࿡ ���ؼ� ���� 
-- ���� ����(Equi Join) : ���� ������ ��Ȯ�� ��ġ�� �� ��ȸ
-- �񵿵� ����(Non Equi Join) : ���� ������ ��Ȯ�� ��ġ���� �ʴ� ��� ��ȸ 
-- �ܺ� ����(Outer Join) : ���� ������ ��Ȯ�� ��ġ���� �ʾƵ� ��� ��ȸ 
-- ��ü ����(Self Join) : ��ü ���̺��� �����Ͽ� ��ȸ 

-- īƼ�� ��(Cartesian Product) : ����Ǵ� �÷� ���� ���� ������ ��� ��� �����Ͱ� ��ȸ �ȴ�. 
SELECT * FROM employees; 
SELECT * FROM departments;
SELECT * FROM employees, departments;

-- ���� ����(Equi Join) 
-- �����ϴ� ���̺��� ���� ������ ��ġ�ϴ� �͸� ��ȸ 
-- ���� �����̶�� �θ� 
SELECT * 
FROM jobs, job_history
WHERE jobs.job_id = job_history.job_id; 

SELECT * 
FROM countries C, locations L 
WHERE C.country_id = L.country_id;

SELECT * 
FROM employees E, departments D 
WHERE E.department_id = D.department_id;


-- �񵿵� ����(Non Equi Join) 
-- ���̺��� ������ �÷� ���� �ٸ� �������� �����ϴ� ��� 
SELECT * 
FROM employees E, jobs J 
WHERE E.salary BETWEEN J.min_salary AND J.max_salary;   

SELECT E.first_name, E.hire_date, H.start_date, H.end_date
FROM employees E, job_history H 
WHERE E.hire_date BETWEEN H.start_date AND H.end_date; 

-- �ܺ� ����(Outer Join) 
-- �����ϴ� ���̺��� ���� ������ �������� �ʴ� �൵ ��� 
-- "���� ���� ������ �������� ���ϰ�" ������ ���� ����� �� ��� 

SELECT * 
FROM jobs J, job_history H 
WHERE J.job_id = H.job_id(+); 

SELECT * 
FROM countries C, locations L 
WHERE C.country_id = L.country_id(+); 

SELECT * 
FROM employees E, departments D 
WHERE E.department_id(+) = D.department_id; 

-- ��ü ����(Self Join) 
-- �ڱ� �ڽ��� ���̺�� �����ϴ� ��� 
SELECT E.first_name, E.last_name, 
       M.first_name, M.last_name
FROM employees E, employees M 
WHERE E.manager_id = M.employee_id;

-- [�ǽ�] JOIN
SELECT C.country_name, L.state_province, L.street_address
FROM countries C, locations L
WHERE C.country_id = L.country_id;

SELECT J.job_id, J.job_title, H.start_date, H.end_date
FROM jobs J, job_history H
WHERE J.job_id = H.job_id;
--> ���⼭�� join �Ǿ ����� ���� ���̺� job_id�� 2���� 
--  �ֱ� ������ � job_id�� ������ ���� ���ؼ� ��Ī�� ���� �ؼ� 
--  �� ��� �Ѵ�. �翬�� ���̺� ��Ī�� ������ �ο� �ؾ� �ڴ�. 

SELECT E.first_name, E.last_name, 
       D.department_name, J.job_title
FROM employees E, departments D, jobs J
WHERE E.department_id = D.department_id 
      AND E.job_id = J.job_id;
      
SELECT C.country_id, C.country_name, L.city 
FROM countries C, locations L
WHERE C.country_id = L.country_id(+); 

SELECT E.employee_id, E.first_name, 
       E.last_name, D.department_name
FROM employees E, departments D
WHERE E.department_id = D.department_id(+)
ORDER BY E.employee_id; 

SELECT E.first_name ||' ' || E.last_name AS employee,
       M.first_name || ' ' || M.last_name AS manager
FROM employees E, employees M
WHERE E.manager_id = M.employee_id
ORDER BY E.employee_id; 
