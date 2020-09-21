-- 단순한 답
select
	animal_type,
	IFNULL(NAME, 'No name'),
	sex_upon_intake
from ANIMAL_INS;

-- Oracle 답 (NVL이용)
-- 코드를 입력하세요
SELECT ANIMAL_TYPE, NVL(NAME, 'No name') AS NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
order by ANIMAL_ID;