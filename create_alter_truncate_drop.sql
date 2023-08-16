-- 유튜브 "오라클제대로끝내기" 13강 테이블생성, 수정, 삭제

--1) CREATE TABLE
CREATE TABLE customers(
    customer_id     number      NOT NULL     PRIMARY KEY,
    first_name      varchar2(10)NOT NULL,
    last_name       varchar2(10)NOT NULL,
    email           varchar2(10),
    phone_number    varchar2(20),
    register_date   date
);

SELECT * FROM customers;

INSERT INTO customers
VALUES(1, 'Suan', 'Lee', 'suan', '010-1234-1234', '21/01/01');

INSERT INTO customers
(
    customer_id,
    first_name,
    last_name,
    email,
    phone_number,
    register_date
)VALUES(
    2,
    'Elon',
    'Musk',
    'elon',
    '010-1111-2222',
    '21/05/01'
);

INSERT INTO customers
VALUES(3, 'Steve', 'Jobs', 'steve', '010-3333-4444', '21/10/01');

INSERT INTO customers
VALUES(4, 'Bill', 'Gates', 'bill', '010-5555-6666', '21/11/01');

INSERT INTO customers
VALUES(5, 'Mark', 'Zuckerberg', 'mark', '010-7777-8888', '21/12/01');

--2-1) ALTER TABLE ADD
ALTER TABLE customers
ADD(gender varchar2(10));

ALTER TABLE customers
ADD(age number);

ALTER TABLE customers
ADD(dob date);

UPDATE customers
SET
    gender = 'male',
    age = 20,
    dob = '09/01/01'
WHERE customer_id = 1;

UPDATE customers
SET
    gender = 'male',
    age = 40,
    dob = '89/01/01'
WHERE customer_id = 2;

UPDATE customers
SET 
    gender = 'male',
    age = 30,
    dob = '99/01/01'
WHERE customer_id = 3;

--2-2) ALTER TABLE ADD CONSTRAINT
select * from customers;

ALTER TABLE customers
ADD CONSTRAINT AK_email
UNIQUE(email);

ALTER TABLE customers
ADD CONSTRAINT AK_phone
UNIQUE(phone_number);

ALTER TABLE customers
ADD CONSTRAINT CK_age
CHECK(age >= 0);

--INSERT INTO customers
--VALUES(6, 'Mark', 'Zuckerberg', 'mark2', '010-5345-5453', '21/12/01', 'male', -1, '98/01/01');

--2-3) ALTER TABLE MODIFY
UPDATE customers
SET 
    first_name = 'Steven Paul',
    gender = 'male',
    age = 50,
    dob = '50/01/01'
WHERE customer_id = 3; 

ALTER TABLE customers
MODIFY(first_name varchar2(20));

UPDATE customers
SET
    first_name = 'William Henry',
    gender = 'male',
    age = 40,
    dob = '89/01/01'
WHERE customer_id = 4;

ALTER TABLE customers
MODIFY(last_name varchar2(30));

ALTER TABLE customers
MODIFY(email varchar2(30));

ALTER TABLE customers
MODIFY(age default 0);

INSERT INTO customers
(
    customer_id,
    first_name,
    last_name,
    email
)
VALUES(
    6,
    'Lawrence Edward',
    'Page',
    'larry'
);

--2-4) ALTER TABLE RENAME / DROP COLUMN
ALTER TABLE customers
RENAME COLUMN phone_number TO phone;

ALTER TABLE customers
RENAME COLUMN gender TO sex;

ALTER TABLE customers
RENAME COLUMN dob TO date_of_birth;

ALTER TABLE customers
DROP COLUMN date_of_birth;

ALTER TABLE customers
DROP CONSTRAINT CK_AGE;

ALTER TABLE customers
DROP COLUMN sex;

--2-5) TRUNCATE/DROP TABLE
select * from customers;

TRUNCATE TABLE customers;

SELECT *
FROM customers;

DROP TABLE customers;

SELECT *
FROM customers;

--[실습] 테이블 생성
CREATE TABLE products(
    product_id      number      NOT NULL        PRIMARY KEY,
    product_name    varchar2(10)NOT NULL,    
    reg_date        DATE
);
INSERT INTO products
VALUES(1, 'Computer', '21/01/01');
INSERT INTO products
(
    product_id,
    product_name,
    reg_date
)VALUES(
    2,
    'Smartphone',
    '21/02/01'
);
INSERT INTO products VALUES(3, 'Television', '21/03/01');
select * from products;

--[실습] 테이블 열/제약조건 추가
ALTER TABLE products
ADD(WEIGHT NUMBER );

ALTER TABLE products
ADD CONSTRAINT CK_WEIGHT
CHECK(WEIGHT >= 0);

ALTER TABLE products
ADD (PRICE NUMBER);

ALTER TABLE products
ADD CONSTRAINT CK_PRICE
CHECK(PRICE >= 0);

--[실습] 테이블 데이터 수정
select * from products;

UPDATE products
SET
    WEIGHT = 10,
    PRICE = 1600000
WHERE PRODUCT_ID = 1;

UPDATE products
SET
    WEIGHT = 0.2,
    PRICE = 1000000
WHERE PRODUCT_ID = 2;

UPDATE products
SET
    WEIGHT = 20,
    PRICE = 2000000
WHERE PRODUCT_ID = 3;

--[실습] 테이블 열 수정/ 테이블 삭제
ALTER TABLE products
MODIFY(PRODUCT_NAME varchar2(30));

ALTER TABLE products
RENAME COLUMN REG_DATE TO REGIST_DATE;

ALTER TABLE products
DROP COLUMN WEIGHT;

TRUNCATE TABLE products;

DROP TABLE products;
























