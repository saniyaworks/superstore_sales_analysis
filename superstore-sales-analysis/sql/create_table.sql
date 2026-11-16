
create table superstore (
  row_id        number,
  order_id      varchar2(20),
  order_date    date,
  ship_date     date,
  ship_mode     varchar2(30),
  customer_id   varchar2(20),
  customer_name varchar2(100),
  segment       varchar2(30),
  country       varchar2(50),
  city          varchar2(100),
  state         varchar2(100),
  postal_code   varchar2(10),
  region        varchar2(20),
  product_id    varchar2(30),
  category      varchar2(30),
  sub_category  varchar2(30),
  product_name  varchar2(250),
  sales         number(12,4),
  quantity      number,
  discount      number(4,2),
  profit        number(12,4)
);