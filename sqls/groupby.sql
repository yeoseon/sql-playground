-- group by 절을 이용해 평균과 함계
select
	do,
	avg(budget_value) as 예산평균,
	sum(budget_value) as 예산합계
from budget
group by do
having avg(budget_value) > 20000;   -- 아래 주의할 점 참고. having 또한 select에서 사용하고 있는 함수를 이용해야 한다.

-- group by 사용시 주의 점
-- 수도권과 지방으로 나누어 평균과 합계
select
--     do, -- 이렇게 쓰면 에러 발생함
    if(do in ('서울특별시', '경기도'), '수도권', '지방') as 지역구분,        -- group by절에서 함수를 이용한다면, select 절에도 그대로 해당 함수를 이용해주어야 한다.
    avg(budget_value) as 예산평균,
    sum(budget_value) as 예산합계
from budget
group by if(do in ('서울특별시', '경기도'), '수도권', '지방');



