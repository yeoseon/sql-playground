-- 나의 풀이

select
	name,
	count(name)
from aac_intakes
where name <> ''
group by name
having count(name) > 1
order by name asc;