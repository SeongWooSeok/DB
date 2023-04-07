SELECT * FROM BOARD
WHERE ROWNUM<=10
ORDER BY NUM DESC;


select *
from(
    select rownum, s.*
    from(
        select b.*
        from board b
        where title like '%ÆäÀÌÂ¡%'
        order by num desc
        )s
    )
where rownum between 1 and 50;

select*
from(
    select row_number() over(order by num desc) pnum,  b.*
            from board b
            where title like '%ÆäÀÌÂ¡%'
            order by num desc
            )
where pnum between 11 and 20;





