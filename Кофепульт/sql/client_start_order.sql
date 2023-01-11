create or replace function start_order(cl_id_ int, bar_id_ int, cs_id_ int)
returns int
language plpgsql
as $$
    declare order_id_ int;
    begin
        insert into order1 (csid, barid, clid) VALUES (cl_id_, bar_id_, cs_id_)
                                               returning ordid into order_id_;
        return order_id_;
    end;
$$;
