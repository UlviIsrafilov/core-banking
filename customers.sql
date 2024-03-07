create table cb_customers
(id number generated always as identity primary key,
first_name varchar2(30),
last_name varchar2(30),
birth_date date,
gender char(1));

 
create or replace procedure cb_customers_insert 
(p_first_name varchar2,p_last_name varchar2,p_birth_date date,p_gender char)
is
begin
insert into cb_customers (first_name,last_name,birth_date,gender)
values(p_first_name,p_last_name,p_birth_date,p_gender );
commit;
end;

create or replace procedure cb_customers_insert 
(p_id number,p_first_name varchar2 default null,
p_last_name varchar2 default null, p_birth_date date default null,
p_gender char default null)
is 
begin 
  update cb_customers set
  first_name = nvl (p_first_name, first_name),
  last_name = nvl (p_last_name, last_name),
  birth_date = nvl (p_birth_date, birth_date),
  gender = nvl(p_gender,gender)
  where id = p_id;
  commit;
  end;
