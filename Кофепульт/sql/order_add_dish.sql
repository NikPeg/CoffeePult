create or replace function order_add_dish(order_id_ int, dish_id_ int, amount_ int default 1)
returns int
language plpgsql
as $$
    declare cs_id_ int;
    declare dishord_id int;
    begin
        if not exists(select csid into cs_id_ from order1 where ordid = order_id_) then
            raise 'No order with id = %!', order_id_;
        end if;
        if not exists(select dishid from dishes where dishid = dish_id_) then
            raise 'No dishes with id = %!', dish_id_;
        end if;
        if amount_ <= 0 then
            raise 'Amount cannot be less than 1!';
        end if;
        insert into dishord (timestamp, dishid, ordid, csid, amount)
        values (
                (select current_timestamp from now()),
                dish_id_,
                order_id_,
                cs_id_,
                amount_
        ) returning dishordid into dishord_id;
        return dishord_id;
    end;
$$;
