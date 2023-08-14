--04 조건 검색과 
--비교, 논리 연산 
--=> 우리가 데이터를 조회 하는 과정 속에서 특정한 조건을 주고 싶을 때가 있다. 
--=> 우리가 데이터를 검색하는 과정속에서 비교연산과 논리연산을 통해서 
--    특정 데이터만 조회 할 수 있도록 그럿게 만들 수 있다. 
--
--WHERE, AND, OR, NOT
--
--WHERE 
--특정  조건을 만족하는 데이터만 조회 
--연산자, 컬럼명, 표현식, 숫자, 문자 등을 이용한 조건 제시 
--
--연산자 
--산술연산자 : +, -, *, / 
--비교연산자 : =, <>, !=, >, >=, <, <=
--논리연산자 : AND, OR, NOT 
--집합연산자 : UNION, UNION ALL, MINUS, INTERSECT 
--SQL연산자 : BETWEEN, IN, LIKE, IS NULL 
--
--숫자뿐만 아니라 문자나 날짜 값을 비교하는 것도 가능 
--예) 'A' < 'C'
--예) '2019-12-02' < '2019-12-02' 
--조건에서 문자나 날짜 값은 작은 따옴표로 묶어서 표현 
--
--연산자 우선순위 
--*, /                                     산술연산자 
--+, -                                     산술연산자 
--=, !=, ^=, <>, >, >=, <, <=              대소 비교 연산자 
--IS (NOT) NULL, (NOT) LIKE, (NOT) IN      (그 외 비교 연산자) 
--BETWEEN A AND B                          SQL연산자 
--NOT                                      논리연산자 
--AND                                      논리연산자 
--OR                                       논리연산자 
--
--=> WHERE절에 쓰이는 연산자 우선순위 : 논리연산자 < SQL연산자 < 비교연산자 < 산술연산자 
--
--비교연산자 
--연산자 앞뒤의 값을 비교하여 데이터 조회 
--
--연산자 : =     : 같다. 
--연산자 : <>    : 다르다. 
--연산자 : <     : 작다. 
--연산자 : >     : 크다. 
--연산자 : <=    : 작거나 같다. 
--연산자 : >=    : 크거나 같다. 

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

--논리연산자 
--여러 조건을 논리 연산자로 연결시켜 데이터 조회(여러 조건을 준다.)
--
--연산자 : AND     : 모든 조건을 만족해야 조회 
--연산자 : OR      : 여러 조건 중 하나만 만족해도 조회 
--연산자 : NOT     : 조건을 만족하지 않는 것만 조회 

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

-- [실습] 비교, 논리 연산자 
SELECT * FROM employees WHERE first_name = 'David'; 

SELECT JOB_TITLE FROM jobs  WHERE MIN_SALARY = 4000; 

SELECT JOB_TITLE FROM jobs WHERE MIN_SALARY > 4000; 

SELECT JOB_TITLE FROM jobs WHERE MIN_SALARY <= 10000; 

SELECT JOB_TITLE FROM jobs WHERE MIN_SALARY >= 4000 AND MAX_SALARY <= 10000; 

SELECT * FROM employees WHERE job_id = 'IT_PROG' AND SALARY > 5000; 
