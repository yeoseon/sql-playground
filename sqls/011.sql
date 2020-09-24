select
	ai.animal_id,
	ai.animal_type,
	ai.name
from ANIMAL_INS ai
inner join ANIMAL_OUTS ao
on ai.animal_id = ao.animal_id
where ai.sex_upon_intake like '%Intact%'
	and (ao.sex_upon_outcome like '%Spayed%' or ao.sex_upon_outcome like '%Neutered%')
;


-- where 절에서 ai와 ao의 중성화 여부 값이 다를 경우로 간단하게 푼 경우도 있었다.