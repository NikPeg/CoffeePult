create or replace function check_phone_number(phone_ varchar(255))
returns bool
language plpgsql
as $$
    begin
        if not starts_with(phone_, '+') then
            return true;
        end if;
        return false;
    end;
$$;
