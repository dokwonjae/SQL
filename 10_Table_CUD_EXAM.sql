-- 10_Table_CUD_Exam.sql
-- 테이블 : CUD(INSERT/UPDATE/DELETE) 연습문제
-- 1) EMPLOYEE 테이블의 구조만 복사하여 
--    EMP_INSERT 란 이름의 빈 테이블을 만드시오.

CREATE TABLE EMP_INSERT
AS
SELECT * FROM EMPLOYEE
WHERE 1=2;

-- 2) 본인을 EMP_INSERT 테이블에 추가하되 SYSDATE를 이용해서 입사일을 
--    오늘로 입력하세요.
--   예) ENO(사번) : 1, ENAME(사원명) : 'KTG', JOB(직위): 'STUDENT',
--      MANAGER(관리자) : NULL, HIREDATE(입사일) : SYSDATE, 
--      SALARY(월급): 2700, COMMISSION(상여금): 230, DNO(부서번호):10

INSERT INTO EMP_INSERT(ENAME, JOB, MANAGER, HIREDATE, SALARY, COMMISSION, DNO)
VALUES('DKJ', 'STUDENT', NULL, SYSDATE, 3500, 300, 70);
-- 영구 반영
COMMIT;
-- 결과 보기
SELECT * FROM EMP_INSERT;

-- 3) EMP_INSERT 테이블에 옆(아시는분) 사람을 추가하되 
--    TO_DATE 함수를 이용해서 입사일을 어제로 입력하세요.
-- 참고) INSERT 시 EMP_INSERT(컬럼명 ...) : 컬럼명 생략가능( 모든 데이터를 INSERT 할때만 가능 )


INSERT INTO EMP_INSERT(ENAME, JOB, MANAGER, HIREDATE, SALARY, COMMISSION, DNO)
VALUES('LDH', 'STUDENT', NULL, TO_DATE(SYSDATE-1,'YYYY/MM/DD'), 3500, 300, 70);

-- 다른 풀이 : 컬럼명 생략
INSERT INTO EMP_INSERT
VALUES('LDH', 'STUDENT', NULL, TO_DATE(SYSDATE-1,'YYYY/MM/DD'), 3500, 300, 70);
-- 영구 반영
COMMIT;
-- 결과 보기
SELECT * FROM EMP_INSERT;

-- 4) EMPLOYEE 테이블의 구조와 내용을 복사하여 
--    EMP_COPY란 이름의 테이블을 만드세요.
-- 단, EMP_COPY 테이블이 있으면 테이블을 삭제하고 다시 만드세요
DROP TABLE EMP_COPY;

CREATE TABLE EMP_COPY
AS 
SELECT * FROM EMPLOYEE;

-- 5) 사원번호가 7788인 사원의 부서번호를 10번으로 수정하세요.
--   ( 대상테이블 : EMP_COPY )

UPDATE EMP_COPY
SET DNO = 10
WHERE ENO = 7788;
COMMIT; -- 영구 반영
SELECT * FROM EMP_COPY;

-- 6) 사원번호가 7788의 담당 업무(JOB) 및 급여를(SALARY) 
--    사원번호 7499의 담당 업무(JOB) 및 급여와(SALARY) 
--    일치하도록 갱신하세요.( 대상테이블 : EMP_COPY )
--  힌트 : UPDATE 서브쿼리

SELECT JOB, SALARY FROM EMP_COPY WHERE ENO = 7499;

UPDATE EMP_COPY
SET (JOB, SALARY) = (SELECT JOB, SALARY FROM EMP_COPY WHERE ENO = 7499)
WHERE ENO = 7788;

COMMIT; -- 영구 반영
SELECT * FROM EMP_COPY;

-- 7) (사원번호(ENO) 7369)와 업무가 동일한 모든 사원의 부서번호를(DNO) 
--    (사원 7369의 현재 부서번호)로 갱신하세요.
-- 힌트) 조건절 (서브쿼리), SET 컬럼명=(서브쿼리)
-- 1) 사원번호(ENO) 7369 의 업무(JOB) 를 찾기 : 
-- 2) 사원번호(ENO) 7369의 현재 부서번호로 찾기 : 
-- 3) 2번을 UPDATE(SET 절 : 서브쿼리)
--    1번을 조건으로 걸기(WHERE 절 : 서브쿼리)

SELECT JOB
FROM EMP_COPY
WHERE ENO = 7369;

SELECT DNO
FROM EMP_COPY
WHERE ENO = 7369;

UPDATE EMP_COPY
SET DNO = (SELECT DNO
FROM EMP_COPY
WHERE ENO = 7369)
WHERE JOB = (SELECT JOB
FROM EMP_COPY
WHERE ENO = 7369);

COMMIT; -- 영구 반영

SELECT * FROM EMP_COPY;

-- 8) DEPARTMENT 테이블의 구조와 내용을 복사하여 
--    DEPT_COPY란 이름의 테이블을 만드세요.

DROP TABLE DEPT_COPY;

CREATE TABLE DEPT_COPY
AS
SELECT * FROM DEPARTMENT;

COMMIT; -- 영구 반영
SELECT * FROM DEPT_COPY;

-- 9) DEPT_COPY 테이블에서 부서명이(DNAME) RESEARCH 인 부서를 제거하세요.

DELETE FROM DEPT_COPY
WHERE DNAME = 'RESEARCH';

SELECT * FROM DEPT_COPY;

-- 10) DEPT_COPY 테이블에서 부서 번호가(DNO) 10이거나 40인 부서를 제거하세요.

DELETE DEPT_COPY
WHERE DNO IN (10, 40);

COMMIT;
SELECT * FROM DEPT_COPY;