use amazon;

-- Task :- Calculate KPIs using SQL queries:
-- task 1.1 Average Delivery Delay per Region (Start_Location)
SELECT r.Start_Location, AVG(DATEDIFF(o.Actual_Delivery_Date, o.Expected_Delivery_Date)) AS Avg_Delivery_Delay_Days
FROM Orders o JOIN Routes r ON o.Route_ID = r.Route_ID GROUP BY r.Start_Location;


-- task 1.2 On-Time Delivery % = (Total On-Time Deliveries / Total Deliveries) * 100
SELECT COUNT(*) AS Total_Deliveries, SUM( CASE WHEN DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date) <= 0 THEN 1 ELSE 0
END) AS On_Time_Deliveries,(SUM(CASE WHEN DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date) <= 0 THEN 1 ELSE 0
END) * 100.0 / COUNT(*)) AS On_Time_Delivery_Percentage FROM Orders;


 -- task 1.3 Average Traffic Delay per Route
SELECT Route_ID, AVG(Traffic_Delay_Min) AS Avg_Traffic_Delay_Min FROM Routes GROUP BY Route_ID;