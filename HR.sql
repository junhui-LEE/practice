SELECT * 
FROM countries;

INSERT INTO countries
VALUES('KR', 'South Korea', 3);

INSERT INTO countries(country_id, country_name, region_id)
VALUES('KP', 'North Korea', 3);

SELECT * 
FROM departments;

INSERT INTO departments
VALUES(280, 'Testing', 200, 1700);

INSERT INTO departments(department_id, department_name, location_id)
VALUES(290, 'Data Analytics', 1700);

SELECT * 
FROM jobs;

INSERT INTO jobs
VALUES('IT DS', 'Data Scientist', 10000, 20000); 

INSERT INTO jobs(job_id, job_title, min_salary, max_salary)
VALUES('IT DA', 'Data Analyst', 10000, 20000); 

SELECT * 
FROM countries;

UPDATE countries
SET country_name = 'Democratic People''s Republic of Korea'
WHERE country_id = 'KP'; 

UPDATE countries
SET country_name = 'Republic of Korea'
WHERE country_id = 'KR';

SELECT * 
FROM departments;

UPDATE departments
SET department_name = 'IT Testing'
WHERE department_id = 280;

UPDATE departments
SET department_name = 'IT Quality Assurance'
WHERE department_id = 280; 

SELECT * 
FROM jobs; 

UPDATE jobs
SET job_id = 'IT QA', job_title = 'Quality Assurance' 
WHERE job_id = 'IT DS';

SELECT * 
FROM countries;

DELETE FROM countries
WHERE country_id = 'KP'; 

DELETE FROM countries 
WHERE country_id = 'KR'; 

SELECT * 
FROM departments; 

DELETE FROM departments
WHERE department_id = 280; 

DELETE FROM departments
WHERE department_id = 290; 

SELECT * 
FROM jobs;

DELETE FROM jobs
WHERE job_id = 'IT QA';

DELETE FROM jobs
WHERE job_id = 'IT DA'; 

-- 오라클 제대로 끝내기 11강 실습 
-- [실습] INSERT
SELECT * 
FROM countries; 

INSERT INTO countries(country_id, country_name, region_id) 
VALUES('AT', 'Austria', 1); 

INSERT INTO countries(country_id, country_name, region_id)
VALUES('NO', 'Norway', 1);

INSERT INTO countries(country_id, country_name, region_id)
VALUES('ID', 'Indonesia', 3); 

INSERT INTO countries(country_id, country_name, region_id)
VALUES('TR', 'Turkey', 4); 

SELECT * 
FROM departments;

INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(280, 'Advertising', 200, 1700); 

INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(290, 'Sales Support', 145, 1700); 

INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES(300, 'Education', null, 1700); 

INSERT INTO departments(department_id, department_name, location_id)
VALUES(310, 'E-Commerce', 1700); 

SELECT * 
FROM jobs; 

INSERT INTO JOBS(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY)
VALUES('ADV', 'Advisor', 10000, 20000);

INSERT INTO jobs(job_id, job_title, min_salary, max_salary)
VALUES('IT ENG', 'Engineer', 8000, 15000); 

INSERT INTO jobs
VALUES('IT RES', 'Researcher', 12000, 22000); 

SELECT * 
FROM departments;

UPDATE departments
SET location_id = 2000
WHERE department_id IN(280, 290, 300, 310); 

UPDATE departments
SET manager_id = 102
WHERE department_id IN(300, 310);

SELECT * 
FROM jobs;

UPDATE jobs
SET min_salary = 12000, max_salary = 22000
WHERE job_id = 'ADV'; 

UPDATE jobs
SET max_salary = 16000
WHERE job_id = 'IT ENG';

UPDATE jobs 
SET job_title = 'Research Engineer', max_salary = 24000
WHERE job_id = 'IT RES';

SELECT * 
FROM countries;

DELETE FROM countries
WHERE country_id IN('AT','NO','ID','TR');

SELECT * 
FROM departments;

DELETE FROM departments
WHERE department_id IN(280, 290, 300, 310);

SELECT * 
FROM jobs; 

DELETE FROM jobs
WHERE job_id IN('ADV', 'IT ENG', 'IT RES'); 


alter user hr identified by 1234;






















