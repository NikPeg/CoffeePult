create or replace procedure add_client(address_ varchar(255), name_ varchar(255), birthday_ date,
                                       phone_ varchar(255))
language plpgsql
as $$
    begin
        if not check_phone_number(phone_) then
            raise 'Incorrect phone number %!', phone_;
        end if;
        insert into client(address, name, birthday, phonenumber)
        values (address_, name_, birthday_, phone_);
    end;
$$