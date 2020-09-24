-- 아직 입양을 못감 : In에만 있음
-- ON은 Join 의 조건임
-- 뽑고싶은 조건은 where에서 가져오는게 맞다.

select
	ai.name,
	ai.`datetime`
from ANIMAL_INS ai

left join ANIMAL_OUTS ao
on ai.animal_id = ao.animal_id
where ao.animal_id is null
order by ai.`datetime` asc
LIMIT 3;