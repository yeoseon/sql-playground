select * from assessments;

-- 풀이 1. 문제 이해 잘못
-- 각 experience 내의 max를 구하는 것이면 이렇게 left join 써서 했을 것..
select
	a.experience as exp,
	count(*) as count,
	count(if(if(sql_ is null, 100, sql_) + if(algo is null, 100, algo) + if(bug_fixing is null, 100, bug_fixing)= b.sum, if(sql_ is null, 100, sql_) + if(algo is null, 100, algo) + if(bug_fixing is null, 100, bug_fixing), null)) as max
from assessments a
left join (select
	experience,
	max(if(sql_ is null, 100, sql_) + if(algo is null, 100, algo) + if(bug_fixing is null, 100, bug_fixing)) as sum
from assessments
GROUP by experience) b
on a.experience = b.experience
GROUP by a.experience
order by exp desc;

-- 1-1. experience 별 max 점수
select
	experience,
	max(if(sql_ is null, 100, sql_) + if(algo is null, 100, algo) + if(bug_fixing is null, 100, bug_fixing)) as sum
from assessments
GROUP by experience;

-- 풀이 2. 그게 아니고 300이 최대임
select
	a.experience as exp,
	count(*) as count,
	count(if(if(sql_ is null, 100, sql_) + if(algo is null, 100, algo) + if(bug_fixing is null, 100, bug_fixing)= 300, if(sql_ is null, 100, sql_) + if(algo is null, 100, algo) + if(bug_fixing is null, 100, bug_fixing), null)) as max
from assessments a
GROUP by a.experience
order by exp desc;

-- 추가 고민
-- 1. if(sql_ is null, 100, sql_) + if(algo is null, 100, algo) + if(bug_fixing is null, 100, bug_fixing)가 여러번 사용되는 구문이라 불편하다. 이를 줄이거나, 변수로 묶어서 한번에 사용할 수 있는 방법이 있을까?
-- 2. 컬럼이 3개가 아닌 4개면 최대 점수는 400이 되는데.. 이런 것에 대해 유연한 SQL이면 좋겠다.
