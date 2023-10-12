USE mydata;

-- 테이블 생성
CREATE TABLE IF NOT EXISTS tasks (
	task_id INT AUTO_INCREMENT -- 자동으로 번호가 하나씩 올라가라
    , title VARCHAR(255) NOT NULL -- DATA TYPE 
    , start_date DATE
    , due_date DATE
    , priority TINYINT NOT NULL DEFAULT 3 -- 데이터를 추가할 때 PRIORITY를 넣지 않으면 기본적으로 3으로 넣게 된다.
    , DESCRIPTION TEXT
    , PRIMARY KEY (task_id)
);

CREATE TABLE IF NOT EXISTS TASK2(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL, -- 이름은 보통 VARCHAR과 CHAR타입을 사용한다고 한다.
    AGE INT,
    SEX TEXT,
    COUNTRY TEXT,
    ALIVE_COUNT INT
);


-- 교재 P.71 문법 확인
INSERT INTO tasks(title, priority)
VALUES('learn MySQL', 1);

INSERT INTO TASK2(NAME, AGE, SEX)
VALUES('LEE', '25', '남');

-- [SELECT]
SELECT * FROM tasks;
SELECT * FROM TASK2;

INSERT INTO tasks(title, priority)
VALUES('learn Oracle', DEFAULT);

SELECT * FROM tasks;

-- 다중행 추가 INSERT
INSERT INTO tasks(title, priority)
VALUES
	('learn AWS', 1)
    ,('learn Python',2)
    ,('learn R',4);

INSERT INTO TASK2(NAME, AGE, SEX, ALIVE_COUNT)
VALUES
	('CHO', 26, '여', 16),
    ('AL', NULL, '남', 25),
    ('GO', NULL, NULL, NULL);


SELECT * FROM tasks;
SELECT * FROM task2;


-- 날짜 추가
INSERT INTO tasks(title, start_date, due_date)
VALUES ('learn INSERT','2023-10-05','2023-10-05');

INSERT INTO tasks(title, start_date, due_date)
VALUES ('learn DELETE', CURRENT_DATE(),CURRENT_DATE());

SELECT * FROM tasks;


-- [DELETE]

SET SQL_SAFE_UPDATES = 0;

DELETE FROM TASKS WHERE TASK_ID = 1;
SELECT * FROM tasks;

DELETE FROM tasks WHERE title = "learn AWS";
SELECT * FROM tasks;

-- start_date = DATE('2023-10-05')
DELETE FROM tasks WHERE start_date = "2023-10-05";
SELECT * FROM tasks;

-- 날짜 추가, (COMMIT, ROLLBACK 개념)
INSERT INTO tasks(title, start_date, due_date)
VALUES ('learn INSERT','2023-10-03','2023-10-04');

INSERT INTO tasks(title, start_date, due_date)
VALUES ('learn DELETE', CURRENT_DATE(),CURRENT_DATE());

SELECT * FROM tasks;

-- UPDATE
SELECT * FROM TASKS WHERE TASK_ID = 5;
UPDATE TASKS
SET PRIORITY = 10
WHERE TASK_ID = 5;

SELECT * FROM tasks;

-- TASK_ID 8, due_date =10.5, priority = 5
UPDATE TASKS
SET
	due_date = DATE('2023-10-10')
    ,priority = 5
WHERE TASK_ID = 8;

SELECT * FROM tasks;

-- PROCEDURE, 트리거등 일종의 사용자 정의함수!
-- PL/SQL이라는 개념을 알고 있어야 한다!
DELIMITER $$
CREATE PROCEDURE mydata.GETTASKS()
BEGIN
	SELECT *
    FROM TASKS
    ORDER BY TASK_ID;
END $$
DELIMITER ;

CALL mydata.GETTASKS();

-- [VIEW]
DROP VIEW tasksView;

CREATE VIEW tasksView
AS
SELECT *
FROM tasks
WHERE task_id = 4;

SELECT * FROM tasksview;