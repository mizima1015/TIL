USE classicmodels;

-- [매출액]
-- 주문일자는 orders 테이블에 존재
-- 판매액은 orderdetails에 존재함

SELECT
	A.orderdate
    , priceeach * quantityordered
FROM orders A
LEFT
JOIN orderdetails B
ON A.ordernumber = B.ordernumber;

-- 일별 매출액
-- 합계, SUM()
SELECT
	A.orderdate
    ,SUM(priceeach * quantityordered) AS 매출액
FROM orders A
LEFT
JOIN orderdetails B
ON A.ordernumber = B.ordernumber
GROUP BY A.orderdate
ORDER BY A.orderdate;

-- [월별 매출액 조회]
-- SUBSTR(칼럼, 위치, 길이)
SELECT SUBSTR('ABCDE',2,2);
-- SQL은 INDEX가 1부터 시작한다.

SELECT SUBSTR('2003-01-06',1,7) MM;

SELECT 
	SUBSTR(A.orderdate,1,7) MM
    , SUM(priceeach * quantityordered) AS 매출액
FROM orders A
LEFT
JOIN orderdetails B
ON A.ordernumber = B.ordernumber
GROUP BY MM
ORDER BY MM; -- Oracle에서 이렇게 하면 에러남


-- [구매자 수, 구매 건수 (일자별, 월별, 연도별)]
-- SUBSTR()
-- GROUP BY
-- COUNT()
-- Orders 테이블에 판매일 (Orderdate), 구매 고객 번호 (Customernumber)
SELECT
	orderdate
    , customernumber
    , ordernumber
FROM orders;

-- 고객번호, 주문번호 중복 되면 큰일남
SELECT
	COUNT(DISTINCT customernumber) AS 구매자수
    ,COUNT(DISTINCT ordernumber) AS 구매건수
FROM orders;

SELECT
	orderdate
	, COUNT(DISTINCT customernumber) AS 구매자수
    ,COUNT(DISTINCT ordernumber) AS 구매건수
FROM orders
GROUP BY 1
ORDER BY 1
;

-- 구매자 수가 2명이상인 날짜를 확인하고 싶음
-- 서브 쿼리
SELECT A.*
FROM(
SELECT
	orderdate
	, COUNT(DISTINCT customernumber) AS 구매자수
    ,COUNT(DISTINCT ordernumber) AS 구매건수
FROM orders
GROUP BY 1
ORDER BY 1
) A
WHERE A.구매자수 >=4
;

-- p.93
-- 인당 매출액 (연도별)
-- 먼저 연도별 매출액과 구매자 수를 구한다!
-- 컬럼은 3개가 출력되어야 합니다. 

SELECT
	SUBSTR(A.orderdate, 1, 4) YY
    , COUNT(DISTINCT A.customernumber) AS 구매자수
    , SUM(priceeach * quantityordered) AS 매출액
FROM orders A
LEFT
JOIN orderdetails B
ON A.ordernumber = B.ordernumber
GROUP BY 1
ORDER BY 1;

-- 인당 매출액을 구한다 = 비율 구하기
-- Logic : 매출액 / 구매자수

SELECT
    SUBSTR(A.orderdate, 1, 4) AS YY,
    COUNT(DISTINCT A.customernumber) AS 구매자수,
    SUM(priceeach * quantityordered) AS 매출액,
    SUM(priceeach * quantityordered) / COUNT(DISTINCT A.customernumber) AS AMV
FROM orders A
LEFT 
JOIN orderdetails B 
ON A.ordernumber = B.ordernumber
GROUP BY 1
ORDER BY 1;

-- 서브쿼리는 실무에서 정말 자주 사용하니, 의도적으로 자주 TRY 할것,
-- 예) amv >= 30000 이상 추출하기 등

SELECT MO.* 
FROM(
SELECT
    SUBSTR(A.orderdate, 1, 4) AS YY,
    COUNT(DISTINCT A.customernumber) AS 구매자수,
    SUM(priceeach * quantityordered) AS 매출액,
    SUM(priceeach * quantityordered) / COUNT(DISTINCT A.customernumber) AS AMV
FROM orders A
LEFT 
JOIN orderdetails B 
ON A.ordernumber = B.ordernumber
GROUP BY 1
ORDER BY 1
) MO
WHERE MO.AMV>=50000;

-- 건당 구매금액(ATV : Average Transaction Value)
-- 1건의 거래가 평균적으로 얼마의 매출을 일으키는가?
SELECT
	SUBSTR(A.orderdate, 1, 4) YY
    , COUNT(DISTINCT A.ordernumber) AS 구매건수
    , SUM(priceeach * quantityordered) AS 매출액
    , SUM(priceeach * quantityordered) / COUNT(DISTINCT A.ordernumber) AS ATV
FROM orders A
LEFT
JOIN orderdetails B
ON A.ordernumber = B.ordernumber
GROUP BY 1
ORDER BY 1
;

-- 96P
-- 그룹별 구매 지표 구하기
SELECT *
FROM orders A -- 기준점 order 허수 고객이 있을 가능성이 있으므로, 순서 바꾸는건 불가능(결과가 많이 달라짐)
LEFT
JOIN orderdetails B
ON A.ordernumber = B.ordernumber
LEFT
JOIN customers C
on A.customernumber = C.customernumber
;

SELECT 
	C.COUNTRY
    , C.CITY
    , B.PRICEEACH * B.QUANTITYORDERED
FROM orders A
JOIN orderdetails B
ON A.ordernumber = B.ordernumber
LEFT
JOIN customers C
on A.customernumber = C.customernumber
;

-- 국가별, 도시별 매출액 계산
SELECT 
	C.COUNTRY
    , C.CITY
    , SUM(B.PRICEEACH * B.QUANTITYORDERED) AS 매출액 
FROM orders A
JOIN orderdetails B
ON A.ordernumber = B.ordernumber
LEFT
JOIN customers C
on A.customernumber = C.customernumber
GROUP BY 1, 2
ORDER BY 1, 2
;


-- 북미 VS 비북미 매출액 비교
SELECT 
	CASE WHEN COUNTRY IN ('USA', 'CANADA') THEN '북미'
	ELSE '비북미' 
    END COUNTRY_GRP
    , COUNTRY
FROM CUSTOMERS;

SELECT 
	CASE WHEN COUNTRY IN ('USA', 'CANADA') THEN '북미'
	ELSE '비북미' 
    END COUNTRY_GRP
    , SUM(B.PRICEEACH * B.QUANTITYORDERED) AS 매출액 
FROM orders A
LEFT
JOIN orderdetails B
ON A.ordernumber = B.ordernumber
LEFT
JOIN customers C
on A.customernumber = C.customernumber
GROUP BY 1
ORDER BY 1 ASC
;
-- 과제 : 위 코드를 간략화시키기

-- 매출 TOP5 국가 및 매출 
DROP TABLE STAT;

SELECT 
	QUANTITYORDERED
    , RANK() OVER(ORDER BY QUANTITYORDERED DESC) AS 'RANK'
    , DENSE_RANK() OVER(ORDER BY QUANTITYORDERED DESC) AS 'DENSE RANK'
    , ROW_NUMBER() OVER(ORDER BY QUANTITYORDERED DESC) AS 'ROW NUMBER'
FROM ORDERDETAILS;


CREATE TABLE STAT AS
SELECT
	C.COUNTRY
    , SUM(PRICEEACH * QUANTITYORDERED) 매출액
FROM orders A
LEFT
JOIN orderdetails B
ON A.ordernumber = B.ordernumber
LEFT
JOIN customers C
on A.customernumber = C.customernumber
GROUP BY 1
ORDER BY 2 DESC
;

SELECT * FROM STAT;

SELECT 
	COUNTRY
    , 매출액
    , DENSE_RANK() OVER(ORDER BY 매출액 DESC) RNK
FROM STAT;

-- 교재에서는 새로운 테이블을 또 생성(강사는 이 방법 싫음)
-- 서브쿼리 통해서 구현
SELECT A.*
FROM (
SELECT 
	COUNTRY
    , 매출액
    , DENSE_RANK() OVER(ORDER BY 매출액 DESC) RNK
FROM STAT
) A
WHERE RNK BETWEEN 1 AND 5
;

-- P.107 서브쿼리
-- P.111 재구매율 (RETENTION RATE(%))
-- 매우매우매우 중요한 마케팅 개념
-- P.112 (셀프조인) - 추가적인 공부 필요
SELECT
	A.customernumber
    , A.orderdate
    , B.customernumber
    , B.orderdate
FROM orders A
LEFT
JOIN orders B
ON A.customernumber = B.customernumber
	AND SUBSTR(A.orderdate, 1, 4) = SUBSTR(B.orderdate, 1, 4) -1;
    
SELECT SUBSTR('2004-11-05',1,4) -1 ; -- 실제 같은해에 주문한 이력이 존재하는가?

-- A 국가 거주 구매자 중 다음 연도에서 구매를 한 구매자의 비중으로 정의
SELECT
	C.country
    , SUBSTR(A.orderdate, 1,4) YY
    , COUNT(DISTINCT A.customernumber) BU_1
    , COUNT(DISTINCT B.customernumber) BU_2
    -- 2004년 구매자수 / 2003년 구매자수 ==> 재구매율(재방문율) -- 게임사 단골
    , COUNT(DISTINCT B.customernumber) / COUNT(DISTINCT A.customernumber) AS 재구매율 
FROM orders A
LEFT
JOIN orders B
ON A.customernumber = B.customernumber
	AND SUBSTR(A.orderdate, 1, 4) = SUBSTR(B.orderdate, 1, 4) -1
LEFT
JOIN customers C
ON A.customernumber = C.customernumber
GROUP BY 1,2
;

CREATE TABLE user_activity (
    user_id INT,
    activity_date DATE
);

INSERT INTO user_activity (user_id, activity_date)
VALUES (1, '2023-01-01'), (1, '2023-01-07'), (2, '2023-01-01'), (2, '2023-01-10'), (3, '2023-01-02');

WITH week1_users AS (
    SELECT user_id 
    FROM user_activity 
    WHERE activity_date BETWEEN '2023-01-01' AND '2023-01-07'
),
week2_users AS (
    SELECT user_id 
    FROM user_activity 
    WHERE activity_date BETWEEN '2023-01-08' AND '2023-01-14'
)

SELECT 
    COUNT(DISTINCT w2.user_id) * 100.0 / COUNT(DISTINCT w1.user_id) AS retention_rate
FROM week1_users w1
LEFT JOIN week2_users w2 ON w1.user_id = w2.user_id;


-- 국가별 TOP PRODUCT 및 매출
