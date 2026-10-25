# Crop Yield Analysis using SQL

## About the Project
This project uses MySQL to study crop yield in 9 Indian states from 1997 to 2019. I used three datasets: crop yield, soil data and weather data. I wrote 20 SQL queries and found 7 business insights from them.

## Datasets

### 1. crop_yield (7633 rows)
- crop: name of the crop
- year: year of the record
- season: growing season (Kharif, Rabi etc.)
- state: Indian state
- area: land used for the crop
- production: total crop produced
- fertilizer: total fertilizer used
- pesticide: total pesticide used
- yield_value: production divided by area

### 2. soil_data (30 rows)
- state: Indian state
- N: nitrogen
- P: phosphorus
- K: potassium
- pH: soil acidity level

### 3. weather_data (720 rows)
- state: Indian state
- year: year of the record
- avg_temp_c: average temperature in celsius
- total_rainfall_mm: total rainfall in mm
- avg_humidity_percent: average humidity in percent

crop_yield and soil_data are joined using state.
crop_yield and weather_data are joined using state and year.

## Tools Used
- MySQL
- MySQL Workbench

## SQL Concepts Used
- SELECT, WHERE, ORDER BY, LIMIT, DISTINCT
- SUM, AVG, MIN, MAX, COUNT, STDDEV
- GROUP BY and HAVING
- JOINS
- Subqueries
- Window functions (RANK, LAG)
- CASE statements
- CTEs

## Project Folders
- sql: all SQL files (create tables, insert data, 20 queries, 7 business insights)
- screenshots: screenshots of query results

## How to Run
1. Open MySQL Workbench.
2. Create the database: create database crop_yield_project;
3. Run the create table file.
4. Run the insert files to load the data.
5. Check the row counts: crop_yield 7633, soil_data 30, weather_data 720.
6. Run the practice queries and business insight queries.

## 7 Business Insights

1. Most Productive States
Tamil Nadu and Karnataka produce the most. But West Bengal has the highest average yield even with less production.

2. Fertilizer vs Yield
Wheat uses the most fertilizer but its yield is not much higher than other crops.

3. States Above National Average
Only 3 states are above the national average yield: West Bengal, Tamil Nadu and Karnataka.

4. Rainfall vs Yield
Moderate rainfall gives the best yield. High rainfall gives the lowest yield.

5. Soil Quality vs Yield
Punjab has the best soil values but one of the lowest yields. So soil alone does not decide yield.

6. Production Trend
Total production grew about 16 times from 1997 to 2019.

7. Crop Yield Volatility
Coconut has very high yield and very high change in yield compared to other crops.

## Conclusion
This project shows that crop yield depends on many factors together, not on one factor alone.

- The state with the highest production is not the state with the highest yield.
- Using more fertilizer does not always give more yield.
- Only 3 out of 9 states are above the national average yield, so the other 6 states can improve.
- Moderate rainfall works better than high rainfall.
- Good soil alone does not guarantee good yield.
- Production has grown a lot since 1997.
- Coconut is very different from other crops and needs to be treated separately.

Through this project I practiced joins, subqueries, window functions and CTEs on real data, and learned how to turn query results into business insights.

## Author
Rohit Kondekar
MSc Statistics | Aspiring Data Analyst
Pune, Maharashtra
