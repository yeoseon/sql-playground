-- 풀이 1

select
	name
from (
	select
		*
	from
	aac_intakes
	ORDER by datetime
	)
where rownum = 1;

-- 풀이 2 : 서브쿼리 이용

SELECT name
from aac_intakes
where datetime = (select MIN(datetime) from aac_intakes);

-- 풀이 3 : Limit 이용

SELECT NAME FROM aac_intakes
ORDER BY DATETIME
LIMIT 1;