CREATE TABLE develop_book(
	book_id 	INTEGER,
	pub_date 	INTEGER,
	Book_name 	VARCHAR(80),
	price 		MONEY
)
;
CREATE TABLE "MyData"(
	book_id 	INTEGER,
	pub_date 	INTEGER,
	Book_name 	VARCHAR(80),
	price 		MONEY
)
;
SELECT * FROM mydata;

INSERT INTO develop_book(book_id, pub_date, Book_name, price)
VALUES(1, 20231013,'책',3000)
;

SELECT * FROM develop_book

-- 날짜 및 시간
CREATE TABLE datetime_study(
	type_ts		TIMESTAMP,
	type_tstz	TIMESTAMPTZ,
	type_date	DATE,
	type_time	TIME
)
;

INSERT INTO datetime_study(type_ts,type_tstz,type_date,type_time)
VALUES(
	'2023-10-13 10:00:01+09', '2023-10-13 10:00:02+09', '2023-10-13','10:00:01'
)
;

SELECT* FROM datetime_study;

SELECT * FROM DATETIME_STUDY;

-- 배열형 테이블
DROP TABLE contact_info;
CREATE TABLE contact_info(
	cont_id		NUMERIC(3),
	name		VARCHAR(15),
	tel			INTEGER[],
	email		VARCHAR
)
;

-- 데이터 추가
INSERT INTO contact_info
VALUES(001,'evan',ARRAY[01012345678,01112345678],'abc@gmail.com');

SELECT * FROM contact_info;

INSERT INTO contact_info
VALUES(002,'kim','{01212345678,01312345678}','dcd@gmail.com');

SELECT * FROM contact_info;

--JSON형
CREATE TABLE develop_book_order(
	id			NUMERIC(3),
	order_info	JSON NOT NULL
)
;

INSERT INTO develop_book_order
VALUES(001, '{"customer" : "evan", "books" : {"product" : "postgreSQL", "qty":2}}');

SELECT * FROM develop_book_order;

-- 형변환 : CAST 메서드 활용
SELECT CAST('3000' AS INTEGER);

SELECT * FROM DEVELOP_BOOK;

SELECT BOOK_ID, CAST(PUB_DATE AS VARCHAR) FROM DEVELOP_BOOK;
SELECT BOOK_ID, PUB_DATE::VARCHAR FROM DEVELOP_BOOK;

-- 제품정보, 주문, 공장, 고객 테이블 생성
CREATE TABLE prod_info(
	prod_no    NUMERIC(5),
	prod_name  VARCHAR(40),
	prod_date  DATE, 
	prod_price MONEY,
	fact_no    NUMERIC(7)
);

CREATE TABLE prod_order(
	ord_no     NUMERIC(6), 
	cust_id    CHAR(8), 
	prod_name  VARCHAR(40), 
	qty        NUMERIC(1000), 
	prod_price MONEY, 
	ord_date   TIMESTAMPTZ
);

CREATE TABLE factory(
	fact_no    NUMERIC(7), 
	fact_name  VARCHAR(45), 
	city       VARCHAR(25), 
	fact_admin VARCHAR(40), 
	fact_tel   NUMERIC(11), 
	prod_name  VARCHAR[], 
	estab_date DATE
);

CREATE TABLE customer(
	cust_id    CHAR(8), 
	cust_name  VARCHAR(40), 
	cust_tel   NUMERIC(11), 
	email      VARCHAR(100), 
	birth      NUMERIC(6), 
	identify   BOOLEAN
);

-- CASE WHEN
SELECT
	ID
	, NAME
	, SCORE
	, CASE WHEN SCORE>80 THEN 'A' ELSE 'FAIL' END RANK
FROM STUDENT_SCORE;

SELECT
	ID
	, NAME
	, SCORE
	, CASE WHEN SCORE <=100 AND SCORE>=90 THEN 'A' 
	WHEN SCORE <=89 AND SCORE >=80 THEN 'B'
	WHEN SCORE <=79 THEN 'F'
	END AS GRADE
FROM STUDENT_SCORE;

SELECT * FROM REAL_AMOUNT;
SELECT * FROM ASSUMPTION_AMOUNT;

SELECT * FROM REAL_AMOUNT
WHERE EXISTS(
	SELECT * FROM ASSUMPTION_AMOUNT
);
SELECT * FROM REAL_AMOUNT
WHERE EXISTS(
	SELECT * FROM SUBJECT
);
--EXISTS연산자 테이블에 데이터가 있을 경우 위의 값이 나온다.

SELECT * FROM FACTORY;

SELECT * FROM REAL_AMOUNT
WHERE EXISTS(
	SELECT * FROM EXCEPTION
);

-- MySQL SUBSTR
SELECT SUBSTR('EVAN_123456789', 1, 4);

SELECT LEFT('EVAN_123456789',6);


