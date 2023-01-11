create or replace procedure pay_order(client_id_ int, order_id_ int)
language plpgsql
as $$
    begin
        update order1 set paid = true where ordid = order_id_;
    end;
$$;
