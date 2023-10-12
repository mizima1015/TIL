USE classicmodels;

-- [SELECT]

SELECT * FROM orders;

SELECT * FROM classicmodels.orders;

SELECT customerNumber, phone FROM customers;

-- [COUNT] : 행의 갯수, 각 칼럼의 값의 갯수를 파악할 때
SELECT count(checknumber) from payments;
select count(*) from payments;

-- 테이블 정의서를 보고 테이블의 형태를 파악!
select * from payments; -- 실무에서는 이 쿼리 사용하면 사수한테 혼남!!
select sum(amount) from payments;

select productname, productline
From products;

-- [특정 컬럼명 변경]
select 
	count(productcode) AS n_products
    , count(productcode) n_products
    , count(productcode)
    , count(productcode) AS 갯수 # AS는 있어도 되고 없어도 된다. 한글 영어 두가지 모두 가능
From
	products
;

-- 교재 31p
-- DISTINCT : 중복 제외하고 데이터 조회!
SELECT 
	DISTINCT ordernumber
FROM
	orderdetails
;

SELECT 
	count(ordernumber) AS 중복포함
    , count(DISTINCT ordernumber) AS 중복제거
from 
	orderdetails
;

-- 32p from  읽어보기 이미 계속 사용 중

-- [WHERE] SQL문법에서 WHERE절을 익히는 것이 60%
-- Online 튜토리얼, where 절 집중적으로 익히는 것 추천


-- [WHERE, BETWEEN]
SELECT *
FROM orderdetails
WHERE priceEach BETWEEN 30 AND 50
;

-- [WHERE, 대소관계 연산자]
SELECT *
FROM orderdetails
WHERE priceEach >=30
;

SELECT COUNT(*)
FROM orderdetails
WHERE priceEach < 30
;

-- orderdetails.loc[orderdetails['priceeach'] < 30, :]

select * 
from payments
where amount < 6066
;

select * 
from payments
;

-- [WHERE, IN],
-- 주의할 점은 칼럼 값이 "값1" 또는 "값2"인 데이터가 출력된다!
-- 서브쿼리 사용할 때 자주 사용되는 연산자!
-- France, Poland, Germany 추가

SELECT country FROM customers;

SELECT
	customerNumber
    , country
FROM customers
WHERE country = 'USA' OR country = 'Canada' OR country = 'France'
;

-- IN 연산자는 OR과 같이 "또는"의 개념이다.
SELECT
	customerNumber
    , country
FROM customers
WHERE country IN( 'USA', 'Canada', 'France')
;

SELECT
	customerNumber
    , country
FROM customers
WHERE country NOT IN( 'USA', 'Canada', 'France')
;

-- [WHERE, IS NULL]

SELECT * FROM employees;

SELECT employeenumber
FROM employees
WHERE reportsto IS NULL;

SELECT employeenumber
FROM employees
WHERE reportsto IS not NULL;

SELECT 
	COUNT(employeenumber) 
	,count(reportsto) -- null이 존재하면 count 하지 않는다!
    ,count(*)
FROM employees;

SELECT COUNT(reportsto) from employees;

-- [WHERE, LIKE '%TEXT%']
-- %는 문자를 의미한다. 부산 앞, 뒤로 어떤 문자가 와도 상관없다!
-- %가 있는 부분만 아무 문자가 와도 되는것 %가 없다면 거기서 끝나야하는 것
SELECT
	addressline1
FROM customers 
WHERE addressline1 LIKE '%ST.%';

-- GROUP BY
SELECT
	country -- 문자 칼럼
    , city -- 문자 칼럼
    , COUNT(customerNumber) AS n_customers
FROM customers
GROUP BY country , city
; -- select 안에 있는 city는 생략해도 에러가 나지 않는다. 다만 결과 모습에 city 칼럼이 나오지 않을 뿐이다. 다만 group by 안에 있는 city는 select에 city가 있다면 꼭 넣어줘야한다.

-- Error Code: 1140. In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'classicmodels.customers.country'; this is incompatible with sql_mode=only_full_group_by	0.000 sec
-- count는 집계함수 인데 두가지 이상을 같이 나타내려면 group by를 써야한다~ 라는 의미

SELECT * FROM payments;
SELECT
	customernumber
    , checkNumber
    , SUM(amount)
FROM 
	payments
GROUP BY customernumber, checkNumber;

USE instacart;
USE classicmodels;

-- [CASE WHEN] : IF 조건문
-- P.46, USA 거주자의 수 계산, 그 비중을 구하자!

select
	SUM(CASE WHEN country = 'USA' THEN 1 ELSE 0 END) N_USA
FROM
	customers;
    
select
	country
	, CASE WHEN country = 'USA' THEN 1 ELSE 0 END N_USA
FROM
	customers;
    
-- 비율을 같이 구해보면
select
	SUM(CASE WHEN country = 'USA' THEN 1 ELSE 0 END) N_USA
    , count(*)
    , sum(case when country = 'USA' THEN 1 ELSE 0 END) / COUNT(*) AS USA_PORTION
FROM
	customers;
    
-- [JOIN]
-- 실무에서는 ERD를 그림을 보면서, 어떻게 JOIN 할 것인지 계획을 짬
-- 판다스의 MERGE와 비슷한 개념이라고 생각하자,  
-- LEFT JOIN , RIGHT JOIN, FULL JOIN 구분하기

SELECT
	A.ordernumber
    , B.country
FROM orders A
LEFT
JOIN customers B
ON A.customernumber = B.customernumber;


SELECT
	*
FROM orders A
LEFT
JOIN customers B
ON A.customernumber = B.customernumber;

SELECT
	*
FROM orders A
LEFT
JOIN customers B
ON A.customernumber = B.customernumber
where B.country = 'USA';

-- INNER JOIN (교집합)
SELECT
	*
FROM orders A
INNER
JOIN customers B
ON A.customerNumber = B.customerNumber
where B.country = 'USA';

-- PL/SQL (개발쪽 DB), TRIGGER 

-- FULL JOIN -> 현재 에러
-- A 테이블 갯수 1000개, B 테이블 갯수 100개
-- 1억개, 천만개
SELECT
	*
FROM orders A
FULL
JOIN customers B
ON A.customerNumber = B.customerNumber
where B.country = 'USA';

-- 58P
-- 윈도우 함수 : RANK, DENSE_RANK, ROW_NUMVER
-- 분석가에게 중요함!
-- 등수 매기는 것 RANK는 공동 등수가 있고 3등이 2명이면 4등이 없고 다음이 바로 5등이 된다.
-- ROW_NUMVER의 경우는 공동 등수가 없다. 그냥 쭉 등수를 매긴다.
-- DENSE_RANK의 경우 공동 등수가 있고 3등이 2명이더라도 다음이 4등이 된다.
SELECT
	buyprice
    , ROW_NUMBER() OVER(ORDER BY buyprice) ROWNUMVER
    , RANK() OVER(ORDER BY buyprice) RNK
    , DENSE_RANK() OVER(ORDER BY buyprice) DENSERANK
FROM products
;

-- 62P PARTITION BY
SELECT
	productline
	, buyprice
    -- , 매서드() OVER(PARTITION BY COL1 ORER BY COL2) => 윈도우 함수
    , ROW_NUMBER() OVER(PARTITION BY productline ORDER BY buyprice) ROWNUMVER
    , RANK() OVER(PARTITION BY productline ORDER BY buyprice) RNK
    , DENSE_RANK() OVER(PARTITION BY productline ORDER BY buyprice) DENSERANK
FROM products
;

-- 62P
-- SUBQUERY : 매우매우매우매우 중요함!
-- 서브쿼리 : 쿼리 안에 또 다른 쿼리를 사용하는 것 (갯수는 무제한)!


