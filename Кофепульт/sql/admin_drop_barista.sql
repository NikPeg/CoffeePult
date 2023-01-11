create or replace procedure drop_barista(adm_id_ int, b_id_ int)
language plpgsql
as $$
    begin
        call check_admin(adm_id_);
        delete from barista where barid = b_id_;
    end;
$$;
