-- [카티션 조인]
-- cross join
-- 각 테이블의 row 수의 곱만큼 출력된다.

-- MySQL
select
	m.major_id,
	m.major_title,
	p.prfs_id,
	p.name
from major m, professor p;

select
	m.major_id,
	m.major_title,
	p.prfs_id,
	p.name
from major m cross join professor p;

-- [inner join]
-- A, B 두 테이블이 있을 때 서로 연결되는 key가 있다고 가정하고, 해당 키의 값이 값은 데이터를 가지고 와서 출력하는 것

-- SQL
select
	p.name as 교수이름,
	m.major_title as 학과명
from professor p, major m
where p.bl_major_id = m.major_id;

-- ansi SQL
select
	p.namea as 교수이름,
	m.major_title as 학과명
from professor p
join major m 		-- inner join, cross join도 가능
on p.bl_major_id = m.major_id;

-- [비등가 Join] = inner join의 일종
-- A, B 두 테이블을 join 할 때 값이 서로 같지는 않지만 join 조건에서 지정한 어느 범위에 일치할 때 서로 데이터를 join 해 주는 것

-- SQL
select
	c.name as 고객명,
	c.`point` as 고객_point,
	g.name as 상품명
from customer c, gift g
where c.`point` BETWEEN g.point_s and g.point_e;

-- Ansi SQL
select c.name as 고객명, c.point as 고객_point, g.name as 상품명 from class.customer c join class.gift g on c.point between g.point_s and g.point_e;

select
	c.name as 고객명,
	c.`point` as 고객_point,
	g.name as 상품명
from customer c, gift gift
join gift g
on c.`point` BETWEEN g.point_e and g.point_s;

-- [outer join]
-- A, B 두 테이블이 있을 때, A 를 모두 출력하고 해당되는 B 데이터가 있을 때 출력하는 것. 없으면 null로 표시
-- full outer join = union

