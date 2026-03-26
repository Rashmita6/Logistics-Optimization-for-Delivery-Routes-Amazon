use amazon;
-- task 1 ●	Rank agents (per route) by on-time delivery percentage
SELECT Agent_ID, Route_ID, On_Time_Percentage,
RANK() OVER (PARTITION BY Route_ID ORDER BY On_Time_Percentage DESC ) AS Rank_In_Agent
FROM deliveryagents ORDER BY Route_ID, Rank_In_Agent;

-- task 2 Find agents with on-time % < 80%
SELECT * from deliveryagents WHERE On_Time_Percentage < 80 ORDER BY On_Time_Percentage;

-- task 3 Compare average speed of top 5 vs bottom 5 agents using subqueries
SELECT (SELECT ROUND(AVG(Avg_Speed_KM_HR), 2) FROM deliveryagents
ORDER BY On_Time_Percentage DESC LIMIT 5) AS Top5_AvgSpeed,
     
(SELECT ROUND(AVG(Avg_Speed_KM_HR), 2) FROM deliveryagents
ORDER BY On_Time_Percentage ASC LIMIT 5) AS Bottom5_AvgSpeed;