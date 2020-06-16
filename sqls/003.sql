-- 나의 풀이
select
	animal_type as animal_type,
	count(*) as count
from aac_intakes
group by animal_type
order by animal_type;



-- 풀이 2
SELECT ANIMAL_TYPE, COUNT(ANIMAL_TYPE) AS COUNT
FROM aac_intakes
GROUP BY ANIMAL_TYPE
ORDER BY ANIMAL_TYPE ASC;