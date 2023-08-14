--SQL과 데이터 조회 
--SQL
--SELECT 문 
--
--SQL 
--SQL(Structured Query Language) 
--관계형 데이터베이스의 조작과 관리에 사용되는 데이터베이스 질의용 언어 
--IBM DB2, 마이크로소프트, Access(DB이름)와 SQL Server, Oracle, Sybase, Informix 등에서 구조화 질의어로 널리 사용 
--원하는 데이터가 무엇인지만 기술하고, 비절차적 언어(잘 정의만 하면 된다.) 
--
--SQL 특징 
--쉬운 문법 
--표준 언어 사용 
--데이터 검색, 조작 정의에 용이 
--실행 순서와 상관없이 처리 가능 
--
--SQL 활용 분야 
--데이터 조회, 가공(수정), 분석(우리가 원하는 값으로 집계하거나(특수 목적을 뜬다) 분석 도구로 사용할 수 있다. ) 
--응용 프로그램 개발 
--SAS, SAP, OLAP 프로그램 
--Python, R 언어와 연계 
--
--SQL 분류 
--DML(Data Manipulation Language) 
--데이터 조작 언어 
--데이터를 조작(선택, 삽입, 수정, 삭제)하는데 사용되는 언어 
--DML 구문이 사용되는 대상은 테이블의 행 
--DML 사용하기 위해서는 꼭 그 이전에 테이블이 정의되어 있어야 함 
--SELECT, INSERT, UPDATE, DELETE 구문 
--
--DDL(Data Definition Language) 
--데이터 정의 언어 
--데이터베이스, 테이블, 뷰, 인덱스 등의 데이터베이스 개체를 생성/삭제/변경 하는 역할 
--DDL은 트랜잭션 발생시키지 않음 
--CREATE, DROP, ALTER 구문 
--ROLLBACK이나 COMMIT 사용 불가
--=> 트랜잭션이라는 기능에 사용되는 ROLLBACK, COMMIT 명령어는 DDL구문에서 사용 불가 
--
--DCL(Data Control Language) 
--데이터 제어 언어 
--사용자에게 어떤 권한을 부여하거나 빼앗을 때 주로 사용하는 구문 
--GRANT, REVOKE 구문 
--
--TCL(Transaction Control Language) 
-- => 여러가지 일을 한 단위로 묶어서 만약에 그것을 실행 했는데 잘못 했을경우 ROLLBACK으로 돌아갈 수 있어야 한다. 
-- => Transaction Control 을 해줄 때 사용한다. 
--트랜잭션이 발생하는 SQL 
--테이블의 데이터를 변경(입력/수정/삭제)할 때 실제 테이블에 완전히 적용하지 않고, 임시로 적용시키며 취소 가능 
--DML에서 실행한 사항을 관리 
--COMMIT, ROLLBACK, SAVEPOINT 구문 
--
--데이터 조회 : SELECT 
--데이터베이스 내 테이블에서 원하는 데이터를 조회 및 분석하는데 사용되며, 일반적으로 가장 많이 사용되는 구문 
--
--테이블 전체 조회(SELECT * ) 
SELECT * 
FROM departments; 

--특정 컬럼만 조회 (SELECT 열 이름) 
--테이블에서 필요한 열만 조회 
--여러개의 열을 가져오고 싶을 떄는 콤마로 구분 
--열 이름의 순서는 출력하고 싶은 순서대로 배열 
SELECT department_id, department_name
FROM departments; 

--별칭 사용하기 (SELECT 열 이름 AS 별칭) 
--열 이름을 다른 별칭으로 표시 
SELECT department_id AS 부서ID , department_name AS 부서이름 
FROM departments;

--중복 제외(SELECT DISTINCT)
--중복된 것은 제외해서 출력 
--테이블의 크기가 클 수록 효율적임
SELECT DISTINCT location_id 
FROM departments;

--데이터 조회 : SELECT 
--연결 연산자(||) 
--컬럼이나 문자열을 연결할 때 사용 
SELECT department_id || department_name 
FROM departments; 

SELECT 'Department of ' || department_name 
FROM departments; 

SELECT 'Department of ' || department_name AS 부서이름 
FROM departments; 

--산술 연산자 
--연산자 : +       => 덧셈 
--연산자 : -       => 뺄셈 
--연산자 : *       => 곱셈 
--연산자 : /       => 나눗셈 
--
--숫자로 된 어떤 구성으로 된 컬럼을 선택해서 거기에 산술연산자를 사용해서 더하거나 빼거나 할 수 있다. 

SELECT first_name, last_name, salary+500 
FROM employees;

SELECT first_name, last_name, salary-500 
FROM employees; 

SELECT first_name, last_name, salary*1.1 
FROM employees; 

SELECT first_name, last_name, salary/1.2 
FROM employees; 

-- [실습] 테이터 조회 : SELECT 
SELECT * FROM countries;

SELECT country_id, country_name FROM countries;

SELECT country_id AS 국가ID, country_name AS 국가명 FROM countries;

SELECT DISTINCT region_id FROM countries; 

SELECT country_name || country_id FROM countries;

-- [실습] 데이터 조회 : SELECT 
SELECT street_address, city FROM locations; 

SELECT job_id, job_title FROM jobs; 

SELECT job_title, min_salary*1.1, max_salary*1.1 FROM jobs; 

SELECT first_name || last_name AS 이름 FROM employees; 

SELECT DISTINCT job_id FROM employees;

