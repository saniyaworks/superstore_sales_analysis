# Superstore Sales Analysis

I did this project to practice SQL. I wanted to find out where the store makes profit and where it loses money.

## Tools
Oracle SQL (SQL Developer) and Excel.

## Data
Superstore sales data from Kaggle. 9,994 rows, 5,009 orders, from 2014 to 2017. I loaded it into an Oracle table. I checked for duplicates, nulls and wrong dates first. There were none.

## What I found
- Total sales is 2,297,201 and total profit is 286,397.
- When discount is 0-20%, the store makes profit. When discount is above 20%, it loses money (about 135,000 loss in total).
- Central region has the lowest profit margin (7.92%). Its average discount is 24%, which is the highest.
- Tables and Bookcases are losing money. Both have high average discount.
- Supplies also loses money but its discount is low (7.7%), so I don't know the reason for this one.
- Sales go up every November and December.

## My suggestion
Keep discount under 20%.

## Dashboard
![Dashboard](dashboard/dashboard.png)

## Files
- sql/create_table.sql
- sql/analysis.sql
- dashboard/superstore_dashboard.xlsx