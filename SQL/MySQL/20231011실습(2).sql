USE MYDATA;
SELECT * FROM DATASET3;

SELECT * 
	, ROW_NUMBER() OVER(ORDER BY QTY DESC) RNK
FROM(
SELECT
	STOCKCODE
    , SUM(QUANTITY) QTY
FROM DATASET3
GROUP BY 1
)A
LIMIT 2
;

SELECT STOCKCODE
FROM(
SELECT * 
	, ROW_NUMBER() OVER(ORDER BY QTY DESC) RNK
FROM(
SELECT
	STOCKCODE
    , SUM(QUANTITY) QTY
FROM DATASET3
GROUP BY 1
)A
LIMIT 2
)A
;

SELECT * FROM DATASET3
ORDER BY STOCKCODE, CUSTOMERID;

-- MAX 사용 MAX는?

CREATE TABLE BU_LIST AS
SELECT CUSTOMERID
FROM DATASET3
GROUP BY 1
HAVING MAX(CASE WHEN STOCKCODE = '84077' THEN 1 ELSE 0 END) = 1 -- TRUE?
	AND MAX(CASE WHEN STOCKCODE = '85123A' THEN 1 ELSE 0 END) = 1 -- TRUE?
;

SELECT *
FROM DATASET3
WHERE CUSTOMERID IN (SELECT CUSTOMERID FROM BU_LIST)
	AND STOCKCODE NOT IN ('84077','85123A');
    
SELECT CUSTOMERID, STOCKCODE, QUANTITY
FROM DATASET3
WHERE CUSTOMERID IN (SELECT CUSTOMERID FROM BU_LIST)
	AND STOCKCODE NOT IN ('84077','85123A');
    
-- 국가별, 상품별 구매 지표 추출
-- 200P
-- A 고객 2018년 구매, 2019년 구매,
-- B 고객 2018년 구매,
-- C 고객 2017년 구매, 2019년 구매

SELECT 
	A.COUNTRY
    , SUBSTR(A.INVOICEDATE, 1,4) AS YY
    , COUNT(DISTINCT B.CUSTOMERID)/COUNT(DISTINCT A.CUSTOMERID) RETENTION_RATE
FROM(
SELECT DISTINCT COUNTRY
	, INVOICEDATE
    , CUSTOMERID
FROM DATASET3
) A
LEFT
JOIN(SELECT DISTINCT COUNTRY, INVOICEDATE, CUSTOMERID FROM DATASET3) B
ON SUBSTR(A.INVOICEDATE,1,4) = SUBSTR(B.INVOICEDATE,1,4) -1 -- 같은연도끼리 엮어줘야하는데 -1... 왜들어갔니
	AND A.COUNTRY = B.COUNTRY
    AND A.CUSTOMERID = B.CUSTOMERID
GROUP BY 1,2
ORDER BY 1,2
;

-- 코호트 분석 (RETENTION)
-- 디지털 마케팅 희망자 블로그 정리하기, SQL 쿼리
-- GOOGLE ANALYTICS 자동으로 만들어줌
-- GA, SQL, PYTHON, 엑셀(스프레드시트) 코호트 분석 각각에 필요한 것 알아보기

-- 고객별로 구매일 확인
SELECT 
	CUSTOMERID
    , MIN(INVOICEDATE) MNDT
FROM DATASET3
GROUP BY 1
;

-- 각 고객의 주문 일자, 구매액을 조회
SELECT
	CUSTOMERID
    , INVOICEDATE
    , UNITPRICE * QUANTITY AS SALES
FROM DATASET3
;

-- 첫 번째로 구매했던 고객별 첫 구매일 테이블에 고객의 구매 내역을 JOIN 한다.
SELECT 
	SUBSTR(MNDT,1,7) MM
    , TIMESTAMPDIFF(MONTH, MNDT, INVOICEDATE) DATEDIFF
    , COUNT(DISTINCT A.CUSTOMERID) BU
    , SUM(SALES) SALES
FROM(
SELECT
	CUSTOMERID
    , MIN(INVOICEDATE) MNDT -- 최초 구매일
    -- , MAX(INVOICEDATE) MXDT -- 마지막 구매일
FROM DATASET3
GROUP BY 1
) A
LEFT
JOIN (
SELECT 
	CUSTOMERID
	, INVOICEDATE
    , UNITPRICE*QUANTITY SALES
FROM DATASET3
) B
ON A.CUSTOMERID = B.CUSTOMERID
GROUP BY 1,2
;

-- P.205
-- MNDT는 각 고객의 최초 구매월 의미
-- 몇 개월 후에 재 구매가 이뤄졌는지를 파악
-- 