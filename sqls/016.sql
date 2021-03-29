-- 테이블에 VARCHAR 형태로 저장된 SEND, RESPONSE 시간이 있다.
-- 이 두 시간의 차가 30초 이상인 데이터를 찾고 싶다.

-- 1. 테이블에 VARCHAR 형태로 있는 시간 정보를 YY:MM:SS 형태로 변환해서 select 먼저 한다.
-- 2. 두 시간 정보의 차를 구해서, 30초 이상인 데이터를 select 한다.

select
*
from (
    select
        rtime - stime as tt,
        response_time,          -- 기존 VARCHAR 데이터
        send_time               -- 기존 VARCHAR 데이터
    from (
        select
            ,substr(a.response_time,0,2)*60*60 + substr(response_time,3,2)*60 + substr(response_time,5,2) as rtime
            ,substr(a.send_time,0,2)*60*60 + substr(send_time,3,2)*60 + substr(send_time,5,2) as stime,
            ,a.*
            from ex_table a
            where 1=1
          )
    )
) where tt > 30;
