create database pizza_restaurant;

CREATE TABLE `pizza_restaurant`.`customers` (
  `customer_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`)
  );

CREATE TABLE `pizza_restaurant`.`pizza` (
  `pizza_id` INT NOT NULL,
  `pizza_type` VARCHAR(100) NULL,
  `pizza_price` DECIMAL(4,2) NULL,
  PRIMARY KEY (`pizza_id`)
  );
  
CREATE TABLE `pizza_restaurant`.`orders` (
  `order_id` INT NOT NULL,
  `day_time` DATETIME NULL,
  `pizza_id` INT NOT NULL,
  `total_price` DECIMAL(5,2) NULL,
  PRIMARY KEY (`order_id`)
  );
  
  CREATE TABLE `pizza_restaurant`.`transactions` (
  `transaction_id` INT NOT NULL,
  `pizza_id` INT NOT NULL,
  `pizza_count` INT NOT NULL,
  `total_price` DECIMAL(5,2) NULL,
  PRIMARY KEY (`transaction_id`)
  );
  
CREATE TABLE `pizza_order`(
		`pizza_id` INT NOT NULL,
        `order_id` INT NOT NULL,
        FOREIGN KEY (order_id) REFERENCES orders (order_id),
        FOREIGN KEY (pizza_id) REFERENCES pizza (pizza_id)
);

CREATE TABLE `customer_pizza`(
        `customer_id` INT NOT NULL,
        `pizza_id` INT NOT NULL,
        FOREIGN KEY (pizza_id) REFERENCES pizza (pizza_id),
        FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

insert into customers (customer_id, first_name, last_name, phone_number)
values (1, 'Trevor','Page','226-555-4982');

insert into customers (customer_id, first_name, last_name, phone_number)
values (2, 'John','Doe','555-555-9498');

insert into pizza (pizza_id, pizza_type, pizza_price)     
values (1, 'Pepperoni', 7.99);

insert into pizza (pizza_id, pizza_type, pizza_price)     
values (2, 'Vegetarian', 9.99);

insert into pizza (pizza_id, pizza_type, pizza_price)     
values (3, 'Meat Lovers', 14.99);

insert into pizza (pizza_id, pizza_type, pizza_price)     
values (4, 'Hawaiian', 12.99);

insert into transactions (transaction_id, pizza_id, pizza_count, total_price, order_id)
values (1, 1, 1, 7.99, 1);

insert into transactions (transaction_id, pizza_id, pizza_count, total_price, order_id)
values (2, 3, 1, 14.99, 1);

insert into transactions (transaction_id, pizza_id, pizza_count, total_price, order_id)
values (3, 2, 1, 9.99, 2);

insert into transactions (transaction_id, pizza_id, pizza_count, total_price, order_id)
values (4, 3, 2, 29.98, 2);

insert into transactions (transaction_id, pizza_id, pizza_count, total_price, order_id)
values (5, 3, 1, 14.99, 3);

insert into transactions (transaction_id, pizza_id, pizza_count, total_price, order_id)
values (6, 4, 1, 12.99, 3);

insert into orders (order_id, day_time, customer_phone, customer_name, pizza_order)
values (1, '2014-09-10 9:47:00', '226-555-4982', 'Trevor Page', '1x Pepperoni & Cheese Pizza, 1x Meat Lovers Pizza');

insert into orders (order_id, day_time, customer_phone, customer_name, pizza_order)
values (2, '2014-09-10 13:20:00', '555-555-9498', 'John Doe', '1x Vegetarian Pizza, 2x Meat Lovers Pizza');

insert into orders (order_id, day_time, customer_phone, customer_name, pizza_order)
values (3, '2014-09-10 9:47:00', '226-555-4982', 'Trevor Page', '1x Meat Lovers Pizza, 1x Hawaiian Pizza');

insert into pizza_order (pizza_id, order_id)
values (1, 1);

insert into pizza_order (pizza_id, order_id)
values (3, 1);

insert into pizza_order (pizza_id, order_id)
values (2, 2);

insert into pizza_order (pizza_id, order_id)
values (3, 2);

insert into pizza_order (pizza_id, order_id)
values (3, 3);

insert into pizza_order (pizza_id, order_id)
values (4, 3);

insert into customer_pizza (customer_id, pizza_id)
values (1, 1);

insert into customer_pizza (customer_id, pizza_id)
values (1, 3);

insert into customer_pizza (customer_id, pizza_id)
values (2, 2);

insert into customer_pizza (customer_id, pizza_id)
values (2, 3);

insert into customer_pizza (customer_id, pizza_id)
values (1, 3);

insert into customer_pizza (customer_id, pizza_id)
values (1, 4);

alter table transactions 
add column customer_id int;
  
alter table transactions
add foreign key (customer_id) references customers (customer_id);

update transactions 
set customer_id = 1 
where transaction_id = 1;

update transactions 
set customer_id = 1 
where transaction_id = 2;

update transactions 
set customer_id = 2 
where transaction_id = 3;

update transactions 
set customer_id = 2 
where transaction_id = 4;

update transactions 
set customer_id = 1 
where transaction_id = 5;

update transactions 
set customer_id = 1 
where transaction_id = 6;

select customer_id, sum(total_price) from transactions 
group by customer_id;

alter table transactions 
add column day_time datetime;

update transactions 
set day_time = '2014-09-10 9:47:00' 
where transaction_id = 1;

update transactions 
set day_time = '2014-09-10 9:47:00' 
where transaction_id = 2;

update transactions 
set day_time = '2014-09-10 13:20:00' 
where transaction_id = 3;

update transactions 
set day_time = '2014-09-10 13:20:00' 
where transaction_id = 4;

update transactions 
set day_time = '2014-09-10 9:47:00' 
where transaction_id = 5;

update transactions 
set day_time = '2014-09-10 9:47:00' 
where transaction_id = 6;

select customer_id, sum(total_price) from transactions 
group by customer_id;

select customer_id, count(transaction_id), date(day_time), sum(total_price) from transactions 
group by customer_id, date(day_time);

insert into orders (order_id, day_time, customer_phone, customer_name, pizza_order)
values (4, '2014-09-11 9:47:00', '226-555-4982', 'Trevor Page', '1x Pepperoni & Cheese Pizza, 1x Meat Lovers Pizza');

insert into transactions (transaction_id, pizza_id, pizza_count, total_price, order_id)
values (7, 1, 1, 7.99, 4);

insert into transactions (transaction_id, pizza_id, pizza_count, total_price, order_id)
values (8, 3, 1, 14.99, 4);

insert into customer_pizza (customer_id, pizza_id)
values (1, 1);

insert into customer_pizza (customer_id, pizza_id)
values (1, 3);

insert into pizza_order (pizza_id, order_id)
values (1, 4);

insert into pizza_order (pizza_id, order_id)
values (3, 4);

select * from transactions;

update transactions 
set customer_id = 1
where transaction_id = 8;

update transactions 
set day_time = '2014-09-10 8:47:00' 
where transaction_id = 1;