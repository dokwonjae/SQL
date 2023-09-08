-- 04_Function_3.sql
-- 자료형 변환 함수(**)
-- DB 자료형 : 문자열(VARCHAR2(가변문자열), CHAR(고정문자열))
--            숫자(NUMBER, 실수, 정수)
--            날짜(DATE)
-- 1) TO_CHAR : 날짜 -> 문자열로 바꾸는 함수
-- 사원 : EMPLOYEE
-- 날짜컬럼(DATE) : HIREDATE(입사일)
-- 사용법) TO_CHAR(컬럼명, '날짜포맷')
-- 날짜포맷 : YYYY(년도(4자리)), YY(2자리) [YEAR]
--           MM(월(2자리))               [MONTH]
--           DD(일(2자리))               [DAY]
--           DAY(요일)                   [요일]
--           HH(1~12까지의시간)           [HOUR]
--           HH24(1~24까지의시간)         [HOUR]
--           MI(분(2자리)                [MINUTES]
--           SS(초(2자리))               [SECOND]
SELECT ENAME, HIREDATE
       ,TO_CHAR(HIREDATE, 'YY-MM') AS 단축날짜
       ,TO_CHAR(HIREDATE, 'YYYY-MM-DD HH24:MI:SS') AS 날짜
FROM EMPLOYEE;

-- 연습 1) 현재 날짜와 시간을 표현하세요(날짜 -> 문자열로 변환하세요)
-- 단 출력포맷 예) 2011/05/01, 15:07:43  으로 출력하세요
-- 힌트) 현재날짜 : SYSDATE(날짜형)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD, HH24:MI:SS') FROM DUAL;

-- 2) TO_CHAR : 숫자 -> 문자로 변환
-- 사용법) TO_CHAR(숫자컬럼, '숫자포맷')
-- 예제 2) 급여를 출력하면서 통화기호를 (W, $ 등) 포함해서 출력하세요
-- 숫자포맷 : L - 각 나라별 통화 기호를 자동으로 붙여줌(W, $ 등)
--           9 - 3자리를 잡고 자리수가 모자라도 따로 0을 채워주지 않음
--           0 - 3자리를 잡고 자리수가 모자라면 0을 채움
--           , - 각 통화의 중간에 쉼표(,)를 자동으로 추가해줌
SELECT ENAME, SALARY
      ,TO_CHAR(SALARY, 'L999,999')
      ,TO_CHAR(SALARY, 'L000,000')
FROM EMPLOYEE;