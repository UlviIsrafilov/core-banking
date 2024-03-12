depozit meblegi
illik faiz derecesi
Emanetin saxlanma muddeti 

deposit_profit_amount = deposit_amount * interest_rate*term/100

select*from cb_deposit_products;
/
create or replace procedure calc_deposit_profit_amount
(p_deposit_amount number, p_interest_rate number, p_term number, p_profit_amount out number) is
begin
p_profit_amount := p_deposit_amount*p_interest_rate*p_term/100;
end;
/
set serveroutput on;
/
declare 
v_profit_amount number;
begin 
  calc_deposit_profit_amount (50,5,6,v_profit_amount);
  dbms_output.put_line(v_profit_amount);
end;
/
declare 
v_profit_amount number;
v_term number;
v_interest_rate number;
v_deposit_amount number default 50;
begin 
  select term,interest_rate into v_term,v_interest_rate 
  from cb_deposit_products where product_name = 'Novruz emaneti';
  
--calc_deposit_profit_amount (50,5,6,v_profit_amount);
calc_deposit_profit_amount (v_deposit_amount,v_interest_rate,v_term,v_profit_amount);
cb_customer_deposits_insert (1,1,'00009',v_deposit_amount, v_profit_amount, sysdate);
end;
/
select*from cb_customer_deposits;
select*from cb_deposit_products;
/



