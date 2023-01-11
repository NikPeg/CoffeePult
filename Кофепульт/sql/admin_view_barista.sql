create or replace function view_barista(adm_id_ int, b_id_ int)
returns table(
    b_name varchar(255),
    b_login varchar(255)
)
language plpgsql
as $$
    begin
        call check_admin(adm_id_);
        select name, login from barista where barid = b_id_;
    end;
$$;

create or replace function view_barista_enhanced(adm_id_ int, adm_pwd varchar(255), b_id_ int)
returns table(
    b_name varchar(255),
    b_login varchar(255),
    b_password varchar(255)
)
language plpgsql
as $$
    begin
        call check_admin(adm_id_);
        if not exists(select adminid from admin where adminid = adm_id_ and password = adm_pwd) then
            raise 'Incorrect password for admin with id = %!', adm_pwd;
        end if;
        select name, login, password from barista where barid = b_id_;
    end;
$$;