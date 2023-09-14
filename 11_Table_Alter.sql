-- 11_Table_Alter.sql
-- 테이블 구조(설계) 변경하기 : DBA(Database Administrator : DB 관리자)
-- 실습 테이블 : DEPT20 (구조만 복사)
CREATE TABLE DEPT20
AS
SELECT * FROM DEPARTMENT
WHERE 1=2;

-- 결과 보기
SELECT * FROM DEPT20;
-- 예제 1) 부서 테이블에 날짜 자료형을(DATE) 가지는 BIRTH 컬럼 추가하기(ADD)
-- 날짜 자료형 : DATE 사용(크기 없음)
-- 테이블에 새로운 컬럼 추가하기
-- 사용법) ALTER TABLE 테이블명 ADD(컬럼명 자료형);
ALTER TABLE DEPT20
ADD(BIRTH DATE);
-- 결과 보기
SELECT * FROM DEPT20;

-- 예제 2) 부서테이블에(DEPT20) 부서명(DNAME) 의 크기를 변경하기(기존 -> 수정(MODIFY))
-- 테이블에 컬럼 변경(크기 변경, 자료형 변경 등)
-- 사용법) ALTER TABLE 테이블명 MODIFY 컬럼명 자료형(크기);
ALTER TABLE DEPT20 MODIFY DNAME VARCHAR2(30);
-- 테이블 구조 보기 명령어 : DESC 테이블명
DESC DEPT20;

-- 예제 3) 부서테이블(DEPT20) BIRTH 컬럼 삭제하기
-- 사용법) ALTER TABLE 테이블명 DROP COLUMN 삭제할컬럼명;
ALTER TABLE DEPT20 DROP COLUMN BIRTH;

-- 예제 4) 테이블 이름 변경하기 : DEPT20 -> DEPT30
RENAME DEPT20 TO DEPT30;
--테이블 구조 보기 명령어 : DESC 테이블명
DESC DEPT30; -- DEPT20 -> DEPT30 으로 변경 확인

-- 12_Table_Alter_Exam.sql
-- 테이블 구조(설계:디자인) 연습문제
-- 1) DEPT 테이블을 생성하세요.
-- 단 , DEPT 이 있으면 삭제하고 재생성하세요.
-- 컬럼명 : DNO   NUMBER(2)
--         DNAME VARCHAR2(14)
--         LOC   VARCHAR2(13)

DROP TABLE DEPT;
CREATE TABLE DEPT(
DNO NUMBER(2),
DNAME VARCHAR2(14),
LOC VARCHAR2(13)
);

-- 2) EMP 테이블을 생성하세요.
-- 단, EMP 테이블이 있으면 삭제하고 재생성하세요.
-- 컬럼명 : ENO   NUMBER(4)
--         ENAME VARCHAR2(10)
--         DNO   NUMBER(2)

DROP TABLE EMP;
CREATE TABLE EMP(
ENO NUMBER(4),
ENAME VARCHAR2(10),
DNO NUMBER(2)
);

-- 3) EMP 테이블을 수정하세요.(ENAME 컬럼 크기)
-- 컬럼명 : ENO   NUMBER(4)
--         ENAME VARCHAR2(25)
--         DNO   NUMBER(2)

ALTER TABLE EMP MODIFY ENAME VARCHAR2(25);
DESC EMP;

-- 4) EMPLOYEE 테이블을 복사해서 EMPLOYEE2 테이블을 생성하되
--    사원번호, 이름, 급여, 부서번호 컬럼만 복사하고,
--    새로 생성된 테이블의 컬럼명은 각각 
--    EMP_ID, NAME, SAL, DEPT_ID로 지정하세요.
--   (데이터도 복사)

-- 방법1

CREATE TABLE EMPLOYEE2(EMP_ID, NAME, SAL, DEPT_ID)
AS
SELECT ENO, ENAME, SALARY, DNO FROM EMPLOYEE;

-- 방법2
CREATE TABLE EMPLOYEE2
AS
SELECT ENO , ENAME , SALARY , DNO FROM EMPLOYEE;

ALTER TABLE EMPLOYEE2 RENAME COLUMN ENO TO EMP_ID;
ALTER TABLE EMPLOYEE2 RENAME COLUMN ENAME TO NAME;
ALTER TABLE EMPLOYEE2 RENAME COLUMN SALARY TO SAL;
ALTER TABLE EMPLOYEE2 RENAME COLUMN DNO TO DEPT_ID;

-- 방법3

CREATE TABLE EMPLOYEE2(EMP_ID, NAME, SAL, DEPT_ID)
AS
SELECT ENO AS EMP_ID , ENAME AS NAME , SALARY AS SAL , DNO AS DEPT_ID FROM EMPLOYEE;

-- 5) EMP 테이블을 삭제하세요.

DROP TABLE EMP;

-- 6) EMPLOYEE2란 이름을 EMP로 변경하세요.

RENAME EMPLOYEE2 TO EMP;
DESC EMP;

-- 7) DEPT 테이블에서 DNAME 컬럼을 제거하세요.

ALTER TABLE DEPT DROP COLUMN DNAME;
DESC DEPT;