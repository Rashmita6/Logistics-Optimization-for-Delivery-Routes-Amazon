use amazon;

-- task 1 
-- 1.1 Average delivery time (in days)
SELECT r.Route_ID, r.Start_Location, r.End_Location,
ROUND(AVG(DATEDIFF(o.Actual_Delivery_Date, o.Order_Date)),2) AS Avg_Delivery_Time_Days
FROM routes r
INNER JOIN orders o ON r.Route_ID = o.Route_ID
GROUP BY 1 , 2 , 3;

-- 1.2 Average traffic delay
SELECT Route_ID, Start_Location, End_Location,
ROUND(AVG(Traffic_Delay_Min),2) AS Avg_Traffic_Delay_Min
FROM routes
GROUP BY 1,2,3;

-- 1.3 Distance-to-time efficiency ratio: Distance_KM / Average_Travel_Time_Min
ALTER TABLE routes ADD COLUMN Efficiency_Ratio DECIMAL(10,4);
Select route_id, round(Distance_KM / Average_Travel_Time_Min,2) as effeciency_ratio
from routes order by effeciency_ratio;
select* from routes;

-- task 2 Identify 3 routes with the worst efficiency ratio
Select route_id, (Distance_KM / Average_Travel_Time_Min) as effeciency_ratio
from routes
order by effeciency_ratio
limit 3;

-- task 3 routes with >20% delayed shipments  
Select route_id, 
sum(case when Delivery_Status = 'Delayed' Then 1 Else 0 End) As delayed_shipments 
from orders GROUP BY Route_ID;
SELECT  Route_ID, COUNT(*) AS Total_Orders, SUM(CASE 
WHEN DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date) > 0 THEN 1 ELSE 0 END) AS Delayed_Orders,
(SUM(CASE WHEN DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date) > 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS Delay_Percentage 
FROM Orders GROUP BY Route_ID HAVING Delay_Percentage > 20 order by Delay_Percentage ASC;

-- Route Optimization

SELECT r.Route_ID,ROUND(r.Distance_KM / r.Average_Travel_Time_Min, 2) AS Efficiency_Ratio, COUNT(o.Order_ID) AS Total_Orders,
SUM(CASE WHEN DATEDIFF(o.Actual_Delivery_Date, o.Expected_Delivery_Date) > 0 
THEN 1 ELSE 0 END) AS Delayed_Orders,ROUND(SUM(CASE WHEN DATEDIFF(o.Actual_Delivery_Date, o.Expected_Delivery_Date) > 0 
THEN 1 ELSE 0 END) * 100.0 / COUNT(o.Order_ID), 2) AS Delay_Percentage FROM routes r JOIN orders o ON r.Route_ID = o.Route_ID
GROUP BY r.Route_ID, r.Distance_KM, r.Average_Travel_Time_Min HAVING Delay_Percentage > 20   -- High delay
AND Efficiency_Ratio < (SELECT AVG(Distance_KM / Average_Travel_Time_Min) FROM routes) ORDER BY Delay_Percentage DESC;