DROP TABLE if exists menu;

CREATE TABLE menu (
id serial primary key,
name text not null unique,
price numeric(10,2) not null default 0
)
;

insert into menu (name, price) values
('Tea', '2.00'),
('Americano', '2.50'),
('Cappuccino', '3.00'),
('Latte', '3.50')
;
