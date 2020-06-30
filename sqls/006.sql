-- 아직 풀지 못함
select
	date_format(datetime, '%H') as hour,
	count(datetime)
from aac_intakes
GROUP by date_format(datetime, '%H')
order by date_format(datetime, '%H');


-- 다른 답
WITH RECURSIVE HOUR AS(
SELECT 0 AS h
UNION ALL
SELECT h+1 FROM HOUR WHERE h<23)
SELECT h AS HOUR, COALESCE(COUNT(ANIMAL_ID),0) AS COUNT
FROM HOUR LEFT JOIN ANIMAL_OUTS ON HOUR.h = DATE_FORMAT(DATETIME, '%k')
GROUP BY HOUR.h



-- 다른 답 2
WITH RECURSIVE OT AS
(
    SELECT 0 AS N
    UNION
    SELECT N + 1 FROM OT WHERE N < 23
)
SELECT OT.N, COUNT(HOUR(OUTS.DATETIME))
FROM OT
LEFT JOIN ANIMAL_OUTS AS OUTS ON OT.N = HOUR(OUTS.DATETIME)
GROUP BY OT.N


-- 다른 답 3

SELECT
    tmp.HOUR AS `HOUR`,
    IF (outs.datetime IS NULL, 0, COUNT(tmp.HOUR)) AS `COUNT`
FROM
    animal_outs AS outs RIGHT OUTER JOIN (
        WITH RECURSIVE hour_generator (n)
          AS (SELECT 1
              UNION ALL
              SELECT n+1
              FROM hour_generator
              WHERE n < 24
             )
        SELECT n-1 AS `HOUR`, 0 AS COUNT
        FROM hour_generator) AS tmp
    ON tmp.HOUR = HOUR(outs.datetime)
GROUP BY tmp.HOUR
ORDER BY tmp.HOUR;