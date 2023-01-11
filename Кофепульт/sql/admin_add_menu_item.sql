create or replace procedure add_menu_item(adm_id_ int, drink_type_ varchar(255), dish_type_ varchar(255),
 adds_ varchar(255), price_in_ int, price_out_ int)
language plpgsql
as $$
    begin
        call check_admin(adm_id_);
        insert into dishes(drinktype, dishtype, adds, pricein, priceout)
        values(drink_type_, dish_type_, adds_, price_in_, price_out_);
    end;
$$;

call add_menu_item(42, '', '', '', 256, 290);
