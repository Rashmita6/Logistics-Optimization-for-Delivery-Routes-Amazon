use amazon;
-- task 1 Find the top 3 warehouses with the highest average processing time
SELECT Warehouse_ID, Location, ROUND(AVG(Processing_Time_Min), 2) AS Avg_Processing_Time_Min
FROM warehouses GROUP BY Warehouse_ID, Location ORDER BY Avg_Processing_Time_Min DESC LIMIT 3;

-- task 2 Calculate total vs. delayed shipments for each warehouse.
SELECT  Warehouse_ID, COUNT(*) AS Total_Orders,SUM(
CASE 
WHEN DATEDIFF(Actual_Delivery_Date, Expected_Delivery_Date) > 0 THEN 1 ELSE 0 
END) AS Delayed_Orders FROM Orders GROUP BY Warehouse_ID;

-- task 3: Use CTEs to find bottleneck warehouses where processing time > global average
WITH AvgProcessing AS (SELECT AVG(Processing_Time_Min) AS Global_Avg_Processing_Time FROM warehouses)
SELECT w.Warehouse_ID, w.Location, w.Processing_Time_Min, a.Global_Avg_Processing_Time,
CASE WHEN w.Processing_Time_Min > a.Global_Avg_Processing_Time THEN 'Bottleneck' ELSE 'Normal'
END AS Warehouse_Status FROM warehouses w JOIN AvgProcessing a ORDER BY w.Processing_Time_Min DESC;

-- task 4: Rank warehouses based on on-time delivery percentage
SELECT w.Warehouse_ID, w.Location,ROUND((SUM(CASE WHEN o.Delivery_Status = 'On Time' THEN 1 ELSE 0 END) * 100) / COUNT(*), 2) 
AS OnTime_Percentage, RANK() OVER (ORDER BY (SUM(CASE WHEN o.Delivery_Status = 'On Time' THEN 1 ELSE 0 END) * 100 / COUNT(*)) DESC)
AS Performance_Rank FROM warehouses w JOIN orders o ON w.Warehouse_ID = o.Warehouse_ID GROUP BY w.Warehouse_ID, w.Location
ORDER BY OnTime_Percentage DESC;

