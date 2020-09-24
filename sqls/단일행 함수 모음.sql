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
