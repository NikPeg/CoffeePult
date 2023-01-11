create or replace procedure change_order(order_id_ int, dish_id_ int, amount_ int)
language plpgsql
as $$
    declare cs_id_ int;
    begin
        if not exists(select csid into cs_id_ from order1 where ordid = order_id_) then
            raise 'No order with id = %!', order_id_;
        end if;
        if not exists(select dishid from dishes
                      where dishid = dish_id_ or not exists(
                            select dishid from dishord
                                where ordid = order_id_ and dishid = dish_id_
                          )) then
            raise 'No dishes with id = % in order with id = %!', dish_id_, order_id_;
        end if;
        if amount_ <= 0 and (
                select amount from dishord
                    where ordid = order_id_ and dishid = dish_id_ and amount < -amount_) then
                raise 'You have not enough dishes with id = % to remove % of them', dish_id_, amount_;
        end if;
        update dishord set amount = amount + amount_
            where ordid = order_id_ and dishid = dish_id_;
    end;
$$;
