# Logistics-Optimization-for-Delivery-Routes-Amazon

# Introduction
Amazon, a global e-commerce leader, handles millions of daily shipments across various regions. The logistics network is vast, comprising warehouses, fulfillment centers, and last-mile delivery partners. With increasing order volumes, delays and inefficiencies in delivery routes can significantly affect customer satisfaction and operational costs.

# Project Objective:
Build a SQL-driven Logistics analytics system to analyze delays, optimize routes, and enhance
shipment efficiency by leveraging queries, aggregations. The project aims to answer key
business questions, uncover inefficiencies, and recommend actionable improvements based on
data analysis.

# Project Overview
The goal of the project is to build a SQL-driven logistics analytics system that identifies inefficiencies in delivery routes, warehouses, and agent performance, and recommends actionable improvements. The project leverages relational databases containing key tables: Orders, Routes, Warehouses, Delivery Agents, and Shipment Tracking.

# Amazon’s logistics team faces challenges in:-
● Identifying delays and their root causes (e.g., route congestion, warehouse delays).
● Optimizing delivery routes for faster fulfillment.
● Improving shipment efficiency through data-driven insights.

# SQL Techniques Used
● Joins to combine multiple tables for comprehensive analysis.
● CTEs (Common Table Expressions) for intermediate calculations and bottleneck identification.
● Window Functions for ranking and partitioning data.
● Aggregations to calculate averages, counts, and percentages.
● Subqueries for comparative analysis between top and bottom performers.

# Key Tasks and SQL Techniques

1. Data Cleaning and Preparation
Remove duplicate Order_ID records to ensure data integrity.
Replace null values in Traffic_Delay_Min with the average delay for the corresponding route.
Standardize date columns to YYYY-MM-DD format using SQL date functions.
Flag invalid records where Actual_Delivery_Date is before Order_Date. 

2. Delivery Delay Analysis
Calculate delivery delay in days for each order.
Identify the Top 10 delayed routes based on average delay.
Use window functions to rank orders by delay within each warehouse.
Analyze checkpoint-level delays to determine primary causes such as traffic congestion or warehouse processing. 

3. Route Optimization Insights
Compute for each route:
Average delivery time (days)
Average traffic delay
Distance-to-time efficiency ratio (Distance_KM / Average_Travel_Time_Min)
Identify routes with the worst efficiency ratios and those with >20% delayed shipments.
Recommend potential route redesigns or off-peak dispatch strategies to improve efficiency. 

4. Warehouse Performance
Determine top warehouses with the highest average processing time.
Compare total vs delayed shipments per warehouse.
Use CTEs to identify bottleneck warehouses exceeding the global average processing time.
Rank warehouses by on-time delivery percentage. 

5. Delivery Agent Performance
Identify agents with on-time delivery <80%.
Compare average speed of top 5 vs bottom 5 agents using subqueries.
Recommend training or workload balancing for low-performing agents.

## Conclusion
This project strengthened my expertise in data analytics, SQL-based performance measurement, and logistics optimization.
By identifying bottlenecks, quantifying performance metrics, and suggesting improvements, I demonstrated how data science empowers business efficiency in real-world supply chain systems.
