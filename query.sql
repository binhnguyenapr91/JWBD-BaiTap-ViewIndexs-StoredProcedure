create database product_manager;

use product_manager;
create table products (
	id int primary key auto_increment,
    productCode varchar(10) not null,
    productName varchar(50) not null,
    productPrice float,
    productAmount int,
    productDescription varchar(200),
    productStatus bit
);

insert into products (productCode, productName, productPrice, productAmount,productDescription, productStatus) values ('SP1','IPHONE',20000000,250,'Apple',1);
insert into products (productCode, productName, productPrice, productAmount,productDescription, productStatus) values ('SP2','NOZZA',40000000,25,'YAMAHA',0);
insert into products (productCode, productName, productPrice, productAmount,productDescription, productStatus) values ('SP3','DELL',10000000,23,'DELLINC',1);
insert into products (productCode, productName, productPrice, productAmount,productDescription, productStatus) values ('SP4','AZUZ',20000000,50,'AUS',1);
insert into products (productCode, productName, productPrice, productAmount,productDescription, productStatus) values ('SP5','HP',20000000,2,'Helwlet Package',0);
insert into products (productCode, productName, productPrice, productAmount,productDescription, productStatus) values ('SP6','ANDROID',10000000,250,'SAMSUNG',1);
insert into products (productCode, productName, productPrice, productAmount,productDescription, productStatus) values ('SP7','CSS',30000000,7,'MDN',1);
insert into products (productCode, productName, productPrice, productAmount,productDescription, productStatus) values ('SP8','SQL',90000000,1000,'MICROSOFT',1);
insert into products (productCode, productName, productPrice, productAmount,productDescription, productStatus) values ('SP9','HTML',70000000,2500,'MDN',1);
insert into products (productCode, productName, productPrice, productAmount,productDescription, productStatus) values ('SP10','JAVA',30000000,34250,'ORACLE',1);



explain select * from products where productName = 'IPHONE' and productPrice > 10000000;

create index idx_ProductName_ProductPrice on products(productName,productPrice);

explain select * from products where productName = 'IPHONE' and productPrice > 10000000;

explain select * from products where productCode = 'SP5';

create unique index idx_ProductCode on products(productCode);

explain select * from products where productCode = 'SP5';

use product_manager;

create view productView as
select productCode, productName,productPrice,productStatus from products;


select * from productView;

create or replace view productView as
select productCode, productName from products;

select * from productView;

insert into productView values ('SP11','BinhNGUYEN');

select * from products;

drop view productView;
-- 5
-- 5.1
delimiter //
create procedure get_all_record ()
begin
	select * from products;
end //
delimiter ;

call get_all_record();
-- 5.2
delimiter //
create procedure add_record (in in_productCode varchar(10), in_productName varchar(50))
begin
	insert into products (productCode,productName)values (in_productCode, in_productName);
end //
delimiter ;

call add_record('SP12','VIOS');
-- 5.3
delimiter //
create procedure delete_record (in in_productID int)
begin
	delete from products where id = in_productID;
end //
delimiter ;


call delete_record(12);
select * from products;
-- 5.4

delimiter //
create procedure update_record (in in_productID int, in_productCode varchar(10), in_productName varchar(50))
begin
	update products set productCode =in_productCode, productName = in_productName where id = in_productID;
end //
delimiter ;


call update_record(11,'ABC','DEF');
select * from products;


