create or replace procedure check_admin(adm_id_ int)
language plpgsql
as $$
    begin
        if not exists(select AdminId from admin where AdminId = adm_id_) then
            raise exception 'No admin with id = %!', adm_id_;
        end if;
    end;
$$