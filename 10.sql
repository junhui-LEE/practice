-- 서브 쿼리(Sub Query) 
-- SELECT 문 안에 다시 SELECT 문이 기술된 쿼리 
-- 상위 SELECT 문 안에 하위 SELECT 문이 포함된 형태라 중첩된(nested) 쿼리라고도 부름 
-- 단일 SELECT 문 사용만으로는 복잡한 조건식을 만들 때 사용 
-- 다른 테이블에서 데이터 값을 조회한 후 조건으로 사용할 때 사용 

-- 서브 쿼리 종류 
-- 단일 행 서브쿼리 : 하나의 행을 검색하는 서브 질의 => 서브 쿼리가 내어놓는 결과가 단일 행일 경우를 말한다. 
-- 다중 행 서브쿼리 : 하나 이상의 행을 검색하는 서브 질의 => 서브 쿼리가 내어놓는 결과가 한개 이상의 행일 경우를 말한다. 
-- 다중 열 서브 쿼리 : 하나 이상의 열을 검색하는 서브 질의 => 검색하는 서브쿼리의 결과가 하나 이상의 열을 가지고 있는 경우를 말한다. 

-- 서브쿼리 규칙 
-- 서브 쿼리는 괄호를 묶어서 사용한다. 
-- 단일 행 연산자 또는 다중 행 연산자로 서브 쿼리를 연결한다. 
-- 서브 쿼리 실행 후 메인 쿼리를 실행한다. 
-- 여러 서브 쿼리를 중첩해서 사용 가능하다. 

-- 단일 행 연산자 : =, >, >=, <, <=, !=, <> : 단일 행 서브쿼리를 사용할때 사용, 다중 열 서브쿼리를 사용할 때 사용 
-- 다중 행 연산자 : IN, NOT IN, EXISTS, ANY, ALL : 다중 행 서브쿼리를 사용할때 사용, 다중 열 서브쿼리를 사용할 때 사용 

-- 단일 행 서브 쿼리 
-- 서브쿼리 SELECT 문에서 단일 행 결과를 메인 쿼리에 전달 
-- WHERE에 사용되는 열의 개수와 데이터 타입 일치 필요하다.
--              => 서브쿼리가 내어 놓는 행에 따른 열의 개수와 WHERE절 안에 있는 비교 대상인 열의 개수가 일치해야 하고 
--                 데이터 타입도 일치 해야 한다. 
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
              
-- 다중 행 서브 쿼리 
-- 서브쿼리 SELECT 문에서 다중 행 결과를 메인 쿼리에 전달 
--    => 서브쿼리가 전달하는 결과 자체가 단일 행이 아니라 여러개의 행인 다중행이다. 
-- 단일 행 연산자는 사용 할 수 없고, 다중 행 연산자만 사용 가능 

-- IN       : 서브 쿼리 결과 중 같은 값이 포함되어 있으면 TRUE => 같은 것을 담고 있는 행 TRUE                :  IN(100, 101) 
-- NOT IN   : 서브 쿼리 결과 중 같은 값이 포함되지 않았으면 TRUE => 같지 않은 것, 다른 것을 담고 있는 행 TRUE  :  NOT IN(100, 101)
-- EXISTS   : 서브 쿼리의 결과가 존재하면 TRUE => 전체 행이 TRUE                                         :  EXISTS(100)
-- ANY(SOME): 조건식을 하나라도 만족하면 TRUE                                                          : ANY(100, 101) 
-- ALL      : 조건식을 모두 만족하면 TRUE                                                              : ALL(100, 101)

-- IN / NOT IN 연산자 
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

-- ANY / ALL 연산자 
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

-- ANY / ALL 연산자 
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
                   
-- 인라인 뷰(Inline View) 
-- => 나중에 뷰를 배울 것인데 그 전에 서브쿼리를 사용해서 인라인 형태로, 마치 뷰처럼 사용할 수 있다. 
--    FROM 절에 있는 서브쿼리가 인라인 뷰를 생성한다. 
--    FROM 절에 직접 기술하여 효율적인 검색이 가능하다. 
--    FROM 절에 있는 서브쿼리에는 자주 별칭을 사용한다. 

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

-- [실습] 서브 쿼리
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
                    





























