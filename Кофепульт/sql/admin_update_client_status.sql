create or replace procedure update_client_vip(adm_id_ int, cl_id_ int, new_status_ bool)
language plpgsql
as $$
    begin
        call check_admin(adm_id_);
        if not exists(select clid from client where clid = cl_id_) then
            raise 'No client with id = %!', cl_id_;
        end if;

        update client set vip = new_status_ where clid = cl_id_;
    end;
$$