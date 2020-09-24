select
	ai.animal_id,
	ai.name
from ANIMAL_INS ai
left join ANIMAL_OUTS ao
on ai.animal_id = ao.animal_id
where ai.`datetime` > ao.`datetime`
order by ai.`datetime`;