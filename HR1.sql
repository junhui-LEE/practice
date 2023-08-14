-- 2023 08 08
SELECT *
FROM regions;

INSERT INTO regions
VALUES (3, 'Asia');

SELECT *
FROM countries;

INSERT INTO countries
VALUES('AR', 'Argentina', 2);

SELECT *
FROM locations;

INSERT INTO locations
VALUES(1000, 'Street', 12345, 'Korea', null, 'KR');

SELECT *
FROM departments;

INSERT INTO departments
VALUES(10, 'Admin', 200, 1700);

SELECT *
FROM employees;

INSERT INTO employees
VALUES(100, 'Suan', 'Lee', 'SUAN', '512.123.4567', '21/01/01', 'IT_Programmer', 10000, null, null, null);

SELECT *
FROM countries;

INSERT INTO countries
VALUES('KR', 'South Korea', 5);

SELECT *
FROM locations;

INSERT INTO locations
VALUES(3300, 'Street', 12345, 'Seoul', null, 'KR');

SELECT *
FROM departments;

INSERT INTO departments
VALUES(280, 'Testing', null, 3300);

SELECT *
FROM employees;

INSERT INTO employees
VALUES(207, 'Suan', 'Lee', 'SUAN', '010.123.1234', '21/01/01', 'IT_QA', 10000, null, null, null);

SELECT *
FROM job_history;

INSERT INTO job_history
VALUES(300, '21/01/01', '21/10/01', 'IT_PROG', 300);

--유일키 제약 조건 위반
SELECT *
FROM employees;

INSERT INTO employees
VALUES(207, 'Suan', 'Lee', 'SKING', '515.123.4567', '21/01/01', 'IT_PROG', 10000, null, null, null);

--NOT NULL 제약 조건 위반
SELECT *
FROM locations;

INSERT INTO locations
VALUES(3300, 'Street', 12345, null, null, 'US');

SELECT *
FROM departments;

INSERT INTO departments
VALUES(280, null, null, 1700);

SELECT *
FROM employees;

INSERT INTO employees
VALUES(207, 'Suan', 'Lee', null, '123.123.1234', '21/01/01', 'IT_PROG', 10000, null, null, null);

SELECT *
FROM job_history;

INSERT INTO job_history
VALUES(200, null, '21/01/01', 'IT_PROG', 200);

SELECT *
FROM job_history;

INSERT INTO job_history
VALUES(200, '21/01/01', null, 'IT_PROG', 200);

--CHECK 제약 조건 위반
SELECT *
FROM employees;

INSERT INTO employees
VALUES(207, 'Suan', 'Lee', 'SUAN', '123.123.1234', '21/01/01', 'IT_PROG', 0, null, null, null);

SELECT *
FROM job_history;

INSERT INTO job_history
VALUES(200, '21/10/01', '21/01/01', 'IT_PROG', 200);
























 





