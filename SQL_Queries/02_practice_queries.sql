use crop_yield_project;

select * from crop_yield;
-- queries--
-- 1) Write a query to display all distinct crops grown in the dataset.--
select distinct crop from crop_yield;

-- 2) Write a query to display all records where yield is greater than 10, sorted from highest to lowest. --
select * from crop_yield 
where yield_value>10
order by yield_value desc;

-- 3) Write a query to display all crops grown in the "Kharif" season in Punjab, limited to the first 10 results. --
select * from crop_yield 
where season="Kharif" and state="Punjab"
limit 10;

-- 4)Write a query to display the total production and average yield for each state.
select state,sum(production) as Total_production,avg(yield_value) as Average_yield
from crop_yield
group by state; 

-- 5)Write a query to display the crop with the highest average fertilizer usage.--
select crop,avg(fertilizer) as average_fertilizer
from crop_yield
group by crop
order by average_fertilizer desc
limit 1;


-- 5)Write a query to display the minimum and maximum rainfall recorded for each state.--
select state,max(total_rainfall_mm)as Maximum_Rainfall,min(total_rainfall_mm) as Minimum_Rainfall
from weather_data
group by state;


-- 6) Write a query to display states where the average yield is greater than 5.
select state 
from crop_yield
group by state
having avg(yield_value)>5;

-- 7) Write a query to display crops that are grown in more than 3 different states.
select crop from crop_yield
group by crop 
having count(distinct state)>3;


-- 8)Write a query to display crop yield data alongside rainfall and temperature for each state and year.


SELECT crop_yield.crop, 
crop_yield.state, 
crop_yield.year, 
crop_yield.yield_value,
weather_data.avg_temp_c,
weather_data.total_rainfall_mm
FROM crop_yield
JOIN weather_data
ON crop_yield.state = weather_data.state
AND crop_yield.year = weather_data.year;






-- 9)Write a query to display each crops yield next to the soils N, P, K, and pH values for that state.
SELECT crop_yield.crop,
crop_yield.state,
crop_yield.yield_value,
soil_data.Nitrogen,
soil_data.Phosphorus,
soil_data.Potassium,
soil_data.Soil_pH
FROM crop_yield
JOIN soil_data
ON crop_yield.state = soil_data.state;

-- 10) Write a query to display all states whose average yield is above the overall national average yield.

select  state, avg(yield_value) as avg_state_yield
from  crop_yield
group by state
having avg(yield_value) > (select avg(yield_value) from crop_yield);

-- 11)Write a query to display the crop with the single highest yield value.
select crop,state,year,yield_value
from crop_yield
where yield_value = (select max(yield_value) from crop_yield);


-- 12)Write a query to display states ranked by total production for each year.
select year, state, total_production,
rank() over (partition by year order by total_production desc) as state_rank
from (select year, state, sum(production) as total_production
from crop_yield
group by year, state) as yearly_totals;

-- 13)Write a query to display a 3-year moving average of yield for each crop.
select crop, year, yield_value,
avg(yield_value) over (partition by crop order by year rows between 2 preceding and current row) as moving_avg_3yr
from crop_yield
order by crop, year;

-- 15) Write a query to display each record categorized as "High Yield", "Medium Yield", or "Low Yield" based on yield value.


select crop, state, year, yield_value,
case 
when yield_value > 10 then 'high yield'
when yield_value between 5 and 10 then 'medium yield'
else 'low yield'
end as yield_category
from crop_yield;

-- 16)Write a query to display each state's rainfall labeled as "Low", "Moderate", or "High" based on defined thresholds.
select state, year, total_rainfall_mm,
case 
when total_rainfall_mm < 1000 then 'low'
when total_rainfall_mm between 1000 and 2000 then 'moderate'
else 'high'
end as rainfall_category
from weather_data;

-- 17)Write a query to display distinct season values after trimming any extra spaces.
select distinct trim(season) as clean_season
from crop_yield;

-- 18)Write a query to display each crop's yield along with its rank within its own state
select crop, state, yield_value,
rank() over (partition by state order by yield_value desc) as yield_rank
from crop_yield;

----- 19)Write a query to display the cumulative (running) total of production for each state, ordered by year.
select state, year, production,
sum(production) over (partition by state order by year) as running_total_production
from crop_yield
order by state, year;

------ 20) Write a query to display all crops whose average fertilizer usage is above the overall average fertilizer usage across all crops.
select crop, avg(fertilizer) as avg_fertilizer
from crop_yield
group by crop
having avg(fertilizer) > (select avg(fertilizer) from crop_yield);

-------- 21) Write a query to display the state with the lowest total production (using a subquery to find the minimum).
select state, sum(production) as total_production
from crop_yield
group by state
having sum(production) = (
select min(state_total)
from (select sum(production) as state_total
from crop_yield
group by state) as state_totals
);

