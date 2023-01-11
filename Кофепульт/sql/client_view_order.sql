create or replace procedure view_order(order_id_ int)
language plpgsql
as $$
    begin
        select ordid as order_id, priceout as single_price, priceout * amount as item_price, timestamp,
               csid as coffee_shop_id, amount
        from dishord join dishes d on dishord.dishid = d.dishid
        where ordid = ordid;
    end;
$$;

create or replace procedure get_order_total_price(order_id_ int)
language plpgsql
as $$
    begin
        select sum(item_price) as total_price
        from (select ordid             as order_id,
                priceout          as single_price,
                priceout * amount as item_price,
                timestamp,
                csid              as coffee_shop_id,
                amount
                 from dishord
                          join dishes d on dishord.dishid = d.dishid
                 where ordid = ordid
        ) as ordr;
    end;
$$;
