select
    customer_no
where actor_no in (
    select
        mgmt_actor_no
    from ex_a_table a, ex_b_table b, ex_c_table c
    where 1=1
    and a.조건1 = "조건값"
    and a.code = b.code
    and a.code = c.doe
    and b.조건1 = "조건값"
    and c.조건1 != "조건값"
);