create database amazon;
use amazon;

select* from routes;
select* from orders;
select * from Warehouses ;
select* from Shipment_Tracking_Table ;
select* from DeliveryAgents;

-- task 1 Data Cleaning & Preparation

-- task 1.1 Identify and delete duplicate Order_ID records
select Order_ID, count(*) AS count
from Orders group by Order_ID having count(*) > 1;
select* from orders;

-- task 1.2 Replace null Traffic_Delay_Min with the average delay for that route
select avg(Traffic_Delay_Min) from routes;
select * from routes where Traffic_Delay_Min IS NULL;
select* from routes;

-- task 1.3 Convert all date columns into YYYY-MM-DD format using SQL functions.
update orders
set order_date = date(order_date),
expected_delivery_date = date(expected_delivery_date), actual_delivery_date = date(actual_delivery_date);
update shipment_tracking_table
set Checkpoint_Time = date(Checkpoint_Time);
select* from shipment_tracking_table;

-- task 1.4 Ensure that no Actual_Delivery_Date is before Order_Date      
select Order_ID, Order_Date, Actual_Delivery_Date
from orders
where Actual_Delivery_Date < Order_Date;     
                                                                                                     
