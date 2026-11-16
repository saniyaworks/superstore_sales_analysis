
select count(*) as total_rows,
       min(order_date) as first_date,
       max(order_date) as last_date,
       round(sum(sales), 2) as total_sales,
       round(sum(profit), 2) as total_profit
from superstore;

-- duplicates 
select row_id, count(*) as cnt
from superstore
group by row_id
having count(*) > 1;

-- nulls
select
  sum(case when sales  is null then 1 else 0 end) as null_sales,
  sum(case when profit is null then 1 else 0 end) as null_profit,
  sum(case when region is null then 1 else 0 end) as null_region
from superstore;

-- ship date before order date
select count(*) as bad_dates
from superstore
where ship_date < order_date;


-- profit by region
select region,
       round(sum(sales), 2)  as total_sales,
       round(sum(profit), 2) as total_profit,
       round(sum(profit) / sum(sales) * 100, 2) as profit_margin_pct
from superstore
group by region
order by total_profit desc;

-- top 10 products by profit
select product_name,
       round(sum(profit), 2) as total_profit
from superstore
group by product_name
order by total_profit desc
fetch first 10 rows only;

-- sub categories that lose money
select category,
       sub_category,
       round(sum(profit), 2) as total_profit
from superstore
group by category, sub_category
having sum(profit) < 0
order by total_profit;

-- profit by discount size
-- these are order lines, one order can have many lines
select case
         when discount = 0    then '0% - No discount'
         when discount <= 0.2 then '1-20%'
         when discount <= 0.4 then '21-40%'
         else 'Above 40%'
       end as discount_band,
       count(*) as order_lines,
       round(sum(profit), 2) as total_profit
from superstore
group by case
           when discount = 0    then '0% - No discount'
           when discount <= 0.2 then '1-20%'
           when discount <= 0.4 then '21-40%'
           else 'Above 40%'
         end
order by total_profit desc;

-- monthly sales
select to_char(order_date, 'yyyy-mm') as order_month,
       round(sum(sales), 2) as monthly_sales
from superstore
group by to_char(order_date, 'yyyy-mm')
order by order_month;

-- average discount for the losing sub categories vs two good ones
select sub_category,
       round(avg(discount) * 100, 1) as avg_discount_pct,
       round(sum(profit), 2) as total_profit
from superstore
where sub_category in ('Tables', 'Bookcases', 'Supplies', 'Chairs', 'Phones')
group by sub_category
order by total_profit;

-- average discount and margin by region
select region,
       round(avg(discount) * 100, 1) as avg_discount_pct,
       round(sum(profit) / sum(sales) * 100, 2) as profit_margin_pct
from superstore
group by region
order by avg_discount_pct desc;

-- total orders, sales and profit (numbers on the dashboard)
select count(distinct order_id) as orders,
       round(sum(sales)) as total_sales,
       round(sum(profit)) as total_profit
from superstore;