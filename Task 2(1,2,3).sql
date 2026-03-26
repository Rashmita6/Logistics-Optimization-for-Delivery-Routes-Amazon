use amazon;

-- task 2.1 Calculate delivery delay (in days) for each order

alter table orders add column Delivery_Delay_Days int;
Select *, datediff(Actual_Delivery_Date, Expected_Delivery_Date) as delay from orders;

-- task 2.2 Top 10 delayed routes based on average delay days

Select Route_id, avg(datediff(Actual_Delivery_Date, Expected_Delivery_Date)) as avg_delay
from orders group by route_id order by avg_delay desc Limit 10;

-- task 2.3  rank all orders by delay within each warehouse

select *, rank() over (partition by Warehouse_Id order by datediff(Actual_Delivery_Date, Expected_Delivery_Date) desc) as ranks
from orders order by ranks desc;