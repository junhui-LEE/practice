-- JOIN
-- 두 개 이상의 테이블을 서로 연결하는데 사용되는 기법 
-- 테이블들은 특정 규칙에 따라 서로 상호 관계를 가진다. 
-- 
-- 조인 종류 
-- 카티션 곱(Cartesian Product) : 모든 행에 대해서 조인 
-- 동등 조인(Equi Join) : 조인 조건이 정확히 일치할 때 조회
-- 비동등 조인(Non Equi Join) : 조인 조건이 정확히 일치하지 않는 경우 조회 
-- 외부 조인(Outer Join) : 조인 조건이 정확히 일치하지 않아도 모두 조회 
-- 자체 조인(Self Join) : 자체 테이블에서 조인하여 조회 

-- 카티션 곱(Cartesian Product) : 공통되는 컬럼 없이 조인 조건이 없어서 모든 데이터가 조회 된다. 
SELECT * FROM employees; 
SELECT * FROM departments;
SELECT * FROM employees, departments;

-- 동등 조인(Equi Join) 
-- 조인하는 테이블에서 조인 조건이 일치하는 것만 조회 
-- 내부 조인이라고도 부름 
SELECT * 
FROM jobs, job_history
WHERE jobs.job_id = job_history.job_id; 

SELECT * 
FROM countries C, locations L 
WHERE C.country_id = L.country_id;

SELECT * 
FROM employees E, departments D 
WHERE E.department_id = D.department_id;


-- 비동등 조인(Non Equi Join) 
-- 테이블의 동일한 컬럼 없이 다른 조건으로 조인하는 방법 
SELECT * 
FROM employees E, jobs J 
WHERE E.salary BETWEEN J.min_salary AND J.max_salary;   

SELECT E.first_name, E.hire_date, H.start_date, H.end_date
FROM employees E, job_history H 
WHERE E.hire_date BETWEEN H.start_date AND H.end_date; 

-- 외부 조인(Outer Join) 
-- 조인하는 테이블에서 조인 조건을 만족하지 않는 행도 출력 
-- "동등 조인 조건을 만족하지 못하고" 누락된 행을 출력할 때 사용 

SELECT * 
FROM jobs J, job_history H 
WHERE J.job_id = H.job_id(+); 

SELECT * 
FROM countries C, locations L 
WHERE C.country_id = L.country_id(+); 

SELECT * 
FROM employees E, departments D 
WHERE E.department_id(+) = D.department_id; 

-- 자체 조인(Self Join) 
-- 자기 자신의 테이블과 조인하는 방법 
SELECT E.first_name, E.last_name, 
       M.first_name, M.last_name
FROM employees E, employees M 
WHERE E.manager_id = M.employee_id;

-- [실습] JOIN
SELECT C.country_name, L.state_province, L.street_address
FROM countries C, locations L
WHERE C.country_id = L.country_id;

SELECT J.job_id, J.job_title, H.start_date, H.end_date
FROM jobs J, job_history H
WHERE J.job_id = H.job_id;
--> 여기서는 join 되어서 만들어 지는 테이블에 job_id가 2개가 
--  있기 때문에 어떤 job_id를 선택할 지에 대해서 별칭을 포함 해서 
--  써 줘야 한다. 당연히 테이블에 별칭을 사전에 부여 해야 겠다. 

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
