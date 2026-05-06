-- create database `gsss`;
use gsss;
-- create table creditcard(number bigint not null,
--  holder varchar(255) not null,
--  cvv int not null,
--  limits int not null);
 
-- alter table creditcard add primary key(number);

-- insert into creditcard values(1214,'Razak',123,200000);
-- insert into creditcard values(5678,'Sabari',111,20000);
-- insert into creditcard values(1232,'Richard',134,100000);
-- insert into creditcard values(1111,'Vikas',142,50000);
 
 
-- create user 'manager' identified by  'icici1';
-- create user 'customer' identified by  'icici2';

-- show grants;

-- grant insert, delete, select on creditcard to 'manager';
-- grant update, select on creditcard to 'customer';
-- show grants for manager;
-- show grants for customer;

-- flush privileges;

-- revoke select on creditcard from customer;
-- flush privileges;
 
 
 -- create table account(
--  acc_num bigint not null, 
--  acc_bal double not null,
--  acc_status varchar(20) not null,
--  acc_holder varchar(255) not null,
--  merchant_bal double not null,
--  merchant_name varchar(255) not null,
--  trans_amount double not null,
--  trans_date datetime not null
--  );
 
-- 1NF
-- alter table account add primary key(acc_num);
-- create table merchant(merchant_id int not null primary key, 
-- merchant_name varchar(255) not null, 
-- merchant_bal double not null);
-- alter table account drop merchant_name;
-- alter table account drop merchant_bal;

-- alter table account drop trans_date;
-- alter table account drop trans_amount;
-- create table transactions(
-- trans_id int not null primary key,
-- trans_from bigint not null,
-- trans_to int not null,
-- trans_amount double,
-- trans_date datetime
-- );

-- alter table transactions add 
-- foreign key(trans_from) references account(acc_num);
-- alter table transactions add 
-- foreign key(trans_to) references merchant(merchant_id);

-- perform new transactions
-- delimiter //
-- create procedure process_payment(
-- 	in p_acc bigint, in p_mer int, in p_amount double
-- )
-- begin
--     declare exist double default 0;
-- 	start transaction;
-- 	update account set acc_bal = acc_bal-p_amount where acc_num=p_acc;
-- 	commit;
-- 	start transaction;
-- 	update merchant set merchant_bal = merchant_bal+p_amount where merchant_id=p_mer;
-- 	commit;
--     select acc_bal into exist from account where acc_num=p_acc;
--     if exist < p_amount then 
-- 		rollback;
-- 		update account set acc_bal = acc_bal+p_amount where acc_num=p_acc;
-- 		update merchant set merchant_bal = merchant_bal-p_amount 
-- 		where merchant_id=p_mer;
-- 		select 'Transaction failed' as message;
-- 	else
-- 		insert into transactions
-- 		(trans_from,trans_to,trans_amount,trans_date) 
-- 		values(p_acc,p_mer,p_amount,now());
-- 		commit;
-- 	end if;
-- end//
-- delimiter ;

-- call process_payment(321,1111,10);


-- https://github.com/razzaksr/GSSS-Database


-- joins
select a.acc_holder, m.merchant_name, t.trans_amount, t.trans_date from transactions t inner join account a on t.trans_from=a.acc_num inner join merchant m on t.trans_to - m.merchant_id where a.acc_num=9888;




