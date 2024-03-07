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

create or replace procedure cb_customers_update 
(p_id number,p_first_name varchar2 default null,
p_last_name varchar2 default null,
p_birth_date date default null,
p_gender char default null, 
p_result out varchar2)
is 
begin 
  update cb_customers set
  first_name = nvl (p_first_name, first_name),
  last_name = nvl (p_last_name, last_name),
  birth_date = nvl (p_birth_date, birth_date),
  gender = nvl(p_gender,gender)
  where id = p_id;
  if SQL%rowcount=0 then
  p_result := 'No row updated';
  else
  p_result := '1 row updated';
  end if;
  commit;
  end;
  
set serveroutput on;

declare
a varchar2(90);
begin 
cb_customers_update(1,p_first_name=>'Ali',p_result=>a);
dbms_output.put_line(a);
end;
  
  
  
  
  
  
  
  
  
  
  
  
  
