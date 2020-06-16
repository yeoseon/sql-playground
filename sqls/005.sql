-- 나의 풀이
select
	date_format(datetime, '%H') as hour,
	count(datetime)
from aac_intakes
where date_format(datetime, '%H') < '20'
	and date_format(datetime, '%H') > '08'
GROUP by date_format(datetime, '%H')
order by date_format(datetime, '%H');

-- 다른 답 (Oracle)
SELECT hour(datetime) as hour, count(hour(datetime)) as count from animal_outs
group by hour
having hour between 9 and 19
order by hour;

-- 다른 답 2
select hour, count(datetime) as cnt
from (select date_format(datetime,'%H') as hour, datetime
        from aac_intakes
        ) as temp
where hour between 9 and 19
group by hour
order by hour;

select * from aac_intakes;