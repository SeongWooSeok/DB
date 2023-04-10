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

CREATE TABLE MYFILE(
IDX NUMBER NOT NULL,
NAME VARCHAR2(50) NOT NULL,
TITLE VARCHAR2(200) NOT NULL,
CATE VARCHAR2(100),
OFILE VARCHAR2(200) NOT NULL,
NFILE VARCHAR2(100) NOT NULL,
REGDATE DATE DEFAULT SYSDATE NOT NULL
);



