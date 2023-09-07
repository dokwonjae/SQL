-- 파일명 : 02_Select_Where.sql
-- 데이터를 조건을 붙여 조회하기
-- 1) 비교연산자로 조건절 사용하기
-- 예제 1) 월급(SALARY) 이 1500 이상인 사원(EMPLOYEE) 조회하기(ENAME, SALARY)
-- 사용법) SELECT 컬럼명,컬럼명2 ... FROM 테이블명
--        WHERE 조건절(컬럼명 > 값)
-- 비교연산자 : > , <, >=, <=, =(같다), <>(같지않다)
SELECT ENAME, SALARY FROM EMPLOYEE
WHERE SALARY > 1500;

-- 예제 2) 10번 부서의 소속 사원을 출력하세요(전체출력 : *)
-- 사원 테이블   : EMPLOYEE
-- 부서번호 컬럼 : DNO
-- 조건절 : WHERE DNO = 10
SELECT * FROM EMPLOYEE
WHERE DNO = 10;

-- 예제 3) 사원명(ENAME) 이 SCOTT 사원을 출력하세요( 전체출력 )
-- 사원 테이블   : EMPLOYEE
-- 힌트) SQL 문자열 : '문자열' (홑따옴표)
SELECT * FROM EMPLOYEE
WHERE ENAME = 'SCOTT';

-- 예제 4) 입사일(HIREDATE) 이 '1981/01/01' 이전인 사원만 출력하기(전체 출력)
-- 힌트 : 문자열 비교 (비교연산자 : > , < , >=, <=, = , <>)
-- 사원테이블 : EMPLOYEE
SELECT * FROM EMPLOYEE
WHERE HIREDATE <= '1981/01/01';

-- 2) 논리 연산자와 함께 조건절 사용하기
-- 논리연산자 ( AND(*****), OR, NOT )
-- 성능 : AND > OR (NOT)
-- 예제 5) 부서번호(DNO) 가 10이고(AND) 직급이(JOB) 'MANAGER' 사원을 출력하세요
-- 사원 : EMPLOYEE
SELECT * FROM EMPLOYEE
WHERE DNO = 10 
AND   JOB = 'MANAGER';

-- 연습 1) 급여가(SALARY) 1000 과 1500 사이의 사원 조회하기(전체 조회)
-- 사원 : EMPLOYEE
SELECT * FROM EMPLOYEE
WHERE SALARY >= 1000
AND   SALARY <= 1500;

-- 예제 6) 부서번호가(DNO) 10이거나(OR) 직급이(JOB) 'MANAGER' 인 사원만 출력하기
SELECT * FROM EMPLOYEE
WHERE DNO = 10
OR    JOB = 'MANAGER';

-- 예제 7) 10번 부서에 소속된 사원을 제외하고 나머지 사원 출력하기
-- 사용법) SELECT 컬럼명 FROM 테이블명 WHERE NOT 컬럼명 = 값; (그 값에 반대되는 데이터가 출력됨)
SELECT * FROM EMPLOYEE
WHERE NOT DNO = 10;

-- 결과는 같고 다른 방법 : <>(같지 않다)
SELECT * FROM EMPLOYEE
WHERE DNO <> 10;

-- 연습 2) 급여가(SALARY) 1000 미만이거나 1500 초과인 사원 출력하기
-- 사원 : EMPLOYEE
SELECT * FROM EMPLOYEE
WHERE SALARY < 1000
OR    SALARY > 1500;

-- 연습 3) 커미션(COMMISSION) 이 300 이거나(OR) 500 이거나(OR) 1400 인 사원 출력하기
-- 사원 : EMPLOYEE
SELECT * FROM EMPLOYEE
WHERE COMMISSION = 300
OR    COMMISSION = 500
OR    COMMISSION = 1400;

-- 3) BETWEEN 예약어 소개
-- 예제 8) 급여가(SALARY) 1000 과 1500 사이의 사원 조회하기
-- 사원 : EMPLOYEE
SELECT * FROM EMPLOYEE
WHERE SALARY >= 1000
AND   SALARY <= 1500;

-- 사용법) SELECT 컬러명 FROM 테이블명 BETWEEN 작은값 AND 큰값;
-- 사용처 : 작은값 ~ 큰값 사이의 결과 조회하기 할때 사용
SELECT * FROM EMPLOYEE
WHERE SALARY BETWEEN 1000 AND 1500;

-- NOT BETWEEN 
-- 예제 9) 급여가(SALARY) 1000 미만이거나 1500 초과인 사원 조회하기
-- 사원 : EMPLOYEE
SELECT * FROM EMPLOYEE
WHERE SALARY < 1000
OR    SALARY > 1500;

-- NOT BETWEEN 
SELECT * FROM EMPLOYEE
WHERE SALARY NOT BETWEEN 1000 AND 1500;

-- 연습 3) 1982 년에 입사한(HIREDATE) 사원 조회하기
-- 단 BETWEEN ~ AND 사용해서 작성하세요
-- 사원 : EMPLOYEE
-- 힌트 : BETWEEN '1982/01/01' AND '끝날짜'
SELECT * FROM EMPLOYEE
WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';

-- 4) IN 예약어 
-- 예제 10) 상여금(COMMISSION) 300 이거나 500 이거나 1400 인 사원 조회하기
-- 사원 : EMPLOYEE
SELECT * FROM EMPLOYEE
WHERE COMMISSION = 300
OR    COMMISSION = 500
OR    COMMISSION = 1400;

-- 사용법) SELECT 컬럼명 FROM 테이블명 WHERE 컬럼명 IN (값, 값2, ...);
-- 사용처 ; OR 로 연결된 데이터를 간단하게 사용 가능
SELECT * FROM EMPLOYEE
WHERE COMMISSION IN (300, 500, 1400);

-- NOT IN 사용
-- 예제 11) 상여금(COMMISSION) 300 이 아니고, 500이 아니고, 1400 아닌 사원 조회하기
-- 사원 : EMPLOYEE
SELECT * FROM EMPLOYEE
WHERE COMMISSION NOT IN (300, 500, 1400);

-- 5) LIKE 검색(*****)
-- 정의 : 일부 키워드(영문자, 한글)만 사용해서 비슷한 것들만 추려서 조회하기
-- 예제 12) 이름이 'F' 로 시작하는 사원 조회하기
-- 사원     : EMPLOYEE
-- 대상 컬럼 : ENAME
-- 사용법) SELECT 컬럼 FROM 테이블명 WHERE 컬럼명 LIKE '%키워드%';
--  % : 키워드를 제외한 문자들
SELECT * FROM EMPLOYEE
WHERE ENAME LIKE 'F%';