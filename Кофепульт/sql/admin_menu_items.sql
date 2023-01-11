create or replace procedure get_menu(adm_id_ int, cs_id_ int)
language plpgsql
as $$
    begin
        call check_admin(adm_id_);
        select d.drinktype, d.dishtype, d.adds, d.pricein, d.priceout from menu
        join dishes d on menu.dishid = d.dishid
        where csid = cs_id_;
    end
$$;

call get_menu(42, 12);