create or replace procedure add_barista(adm_id_ int, name_ varchar(255), login_ varchar(255), pwd_ varchar(255))
language plpgsql
as $$
    begin
        call check_admin(adm_id_);
        insert into barista(name, login, password) values (name_, login_, pwd_);
    end;
$$;
