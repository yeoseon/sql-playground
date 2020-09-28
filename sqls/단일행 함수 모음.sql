-- 1. 문자 관련 단일행 함수 모음
-- https://stricky.tistory.com/210 참고
select
	country_name as 원본,
	LOWER(country_name) as 소문자,
	UPPER(country_name) as 대문자,
	LENGTH(country_name) as 글자수,
	CONCAT(country_name, " 여기 짱") as concat,
	SUBSTRING(country_name, 2, 2) as substring,
	INSTR(country_name, 'u') as instr,	-- 대/소문자 구분하지 않음
	LPAD(country_name, 10, 'AAA') as lpad,
	RPAD(country_name, 10, 'BBB') as rpad,
	capital_city as 원본,
	TRIM(capital_city) as trim,
	LTRIM(capital_city) as ltrim,
	RTRIM(capital_city) as RTRIM,
	REPLACE(country_name, 'U', '@')		-- 대/소문자 구문 함
from PLAYGROUND.country;

-- 2. 숫자 관련 단일행 함수 모음
-- https://stricky.tistory.com/217 참고
select  round(112.3456,1),round(112.3456,2),round(112.3456,-1), -- 입력된 숫자를 반올림
		truncate(112.3456,1),truncate(112.3456,2),truncate(112.3456,-1), -- 버림
		mod(26,3),mod(10,9),mod(4,2), -- 나눈 나머지
		ceil(12.6),ceil(11.5),ceil(16.3), -- 크면서도 가까운 정수
		floor(12.6),floor(11.5),floor(16.3), -- 작으면서 가까운 정수
		power(1,2),power(2,3),power(3,5) -- 제곱
from dual;


-- 3. 날짜 관련 단일행 함수 모음
-- https://stricky.tistory.com/220 참고

-- 1) 현재 날짜 / 시각
select
	now(),
	sysdate(),
	CURRENT_TIMESTAMP(),
	CURDATE(),
	CURRENT_DATE(),
	CURRENT_TIME(),
	now()+0,	-- 형식에 맞지 않고 숫자로 나열 하도록 출력
	CURRENT_TIME+0;


-- 2) 날짜, 시간에 따른 특정 정보
select
	dayofweek('2020-10-04 14:20:23') as DAYOFWEEK,	-- 1:일요일, 2:월요일...
	WEEKDAY('2020-10-04 14:20:23') as WEEKDAY, -- 0:월요일, ... 6:일요일
	DAYOFMONTH('2020-10-04 14:20:23') as DAYOFMONTH, -- 일자
	DAYOFYEAR('2020-10-04 14:20:23') as DAYOFYEAR, --  해의 몇번째 날
	MONTH('2020-10-04 14:20:23') as MONTH, -- 월
	DAYNAME('2020-10-04 14:20:23') as DAYNAME, -- 요일 영문
	MONTHNAME('2020-10-04 14:20:23') as MONTHNAME, -- 월 영문
	QUARTER('2020-10-04 14:20:23') as QUARTER, -- 분기
	WEEK('2020-10-04 14:20:23') as week, -- 해의 몇번째 주
	YEAR('2020-10-04 14:20:23') as YEAR, -- 연도
	HOUR('2020-10-04 14:20:23') as HOUR, -- 시간
	MINUTE('2020-10-04 14:20:23') as MINUTE -- 분

-- 3) 날짜, 시간의 연산
-- date_add(date, interval expr type)
-- date_sub(date, interval expr type)
-- adddate(date, interval expr type)
-- subdate(date, interval expr type)

select
	date_add('2020-12-31 23:59:59', INTERVAL 1 SECOND), 	-- 1초를 더한다
	date_add('2020-12-31 23:59:59', interval 31 day),		-- 31일 더하기
	date_add('2020-12-31 23:59:59', interval '1:1' MINUTE_SECOND), 	-- 1분 1초 더하기
	date_add('2020-12-31 23:59:59', interval '-1 17' day_hour);	-- 하루 17시간 빼기

-- 4) 시간/초 데이터 변환

select
	SEC_TO_TIME(3000),	-- 3000초를 시간으로
	TIME_TO_SEC('20:21:30');	-- 초로 변환

-- 5) period_add, period_diff
-- 원하는 개월을 더한 값을 YYYYMM 형태로 출력

select
	period_add(2001, 15),	 -- 입력값을 YYMM 으로 준 경우
	period_add(202001,15); -- 입력값을 YYYYMM 으로 준 경우


-- 6) date_format 함수
-- https://stricky.tistory.com/220 참고

-- 4. 형 변환 함수 모음
-- https://stricky.tistory.com/232 참고

-- 1) cast 와 convert

    -- int to char, char to int
     select
     	cast(100 as char) as num_to_char,
     	cast('100' as unsigned) as char_to_num   -- as int 로 했다가 오류 발생함
     from dual;

     -- Character -> Datetime
     select
     	'2016-08-25 03:30:00',
     	cast('2016-08-25 03:30:00' as datetime) as char_to_datetime
     from dual;

-- 5. 일반 함수 모음
-- https://stricky.tistory.com/233

