create or replace procedure client_view_menu(cs_id_ int, asc_ bool default true)
language plpgsql
as $$
    begin
        if asc_ then
            select d.name as name, d.drinktype as drink_type, d.dishtype as dish_type,
                   d.adds as additions, d.priceout as price from menu
                   join dishes d on menu.dishid = d.dishid
                   where csid = cs_id_
                   order by price;
        end if;

        select d.name as name, d.drinktype as drink_type, d.dishtype as dish_type,
               d.adds as additions, d.priceout as price from menu
               join dishes d on menu.dishid = d.dishid
               where csid = cs_id_
               order by price desc;
    end;
$$;