-- 1. 중복 제거하기

-- 나의 풀이
select
	count(DISTINCT name)
from aac_intakes
where name is not null;
