create or replace procedure update_menu(adm_id_ int, dish_id_ int, field_ varchar(255), value_ varchar(255))
language plpgsql
as $$
    declare dish_real_ int;
    begin
        call check_admin(adm_id_);

        if not exists(select dishid into dish_real_ from menu
                      where menu.csid = (select csid from admin where adminid = adm_id_)
                      and dishid = dish_id_) then
            raise 'There is no dish with id = %!', dish_id_;
        end if;

        case lower(field_)
            when 'drinktype' then
                update dishes set drinktype = value_ where dishid = dish_real_;
            when 'dishtype' then
                update dishes set dishtype = value_ where dishid = dish_real_;
            when 'adds' then
                update dishes set adds = value_ where dishid = dish_real_;
            when 'name' then
                update dishes set name = value_ where dishid = dish_real_;
            when 'pricein' then
                update dishes set pricein = cast(value_ as float) where dishid = dish_real_;
            when 'priceout' then
                update dishes set priceout = cast(value_ as float) where dishid = dish_real_;
            else
                raise 'There is no field = % in Dishes table!', field_;
        end case;
    end;
$$;
