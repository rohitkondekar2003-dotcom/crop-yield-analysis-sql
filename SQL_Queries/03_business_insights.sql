--- Business Insights ------
use crop_yield_project;
-- 1) Most Productive States
select state, sum(production) as total_production, avg(yield_value) as avg_yield
from crop_yield
group by state
order by total_production desc;
# I grouped the data by state. I added up total production and found the average yield. 
#Tamil Nadu and Karnataka produce the most. But West Bengal has the best average yield, even with less total production.
# So West Bengal uses its land better.

-- 2)Fertilizer Usage vs. Yield Efficiency
select crop, round(avg(fertilizer)) as avg_fertilizer, avg(yield_value) as avg_yield
from crop_yield
group by crop
order by avg_fertilizer desc
limit 5;
#I compared fertilizer use and yield for each crop. Wheat uses the most fertilizer.
# But its yield is not much higher than other crops.
# This means wheat may be using too much fertilizer for the result it gives.


 -- 3) States Outperforming the National Average Yield
select state, avg(yield_value) as avg_state_yield
from crop_yield
group by state
having avg(yield_value) > (select avg(yield_value) from crop_yield)
order by avg_state_yield desc;
#First I found the average yield for the whole country using a subquery. 
#Then I checked which states are above that number. 
#Only 3 states — West Bengal, Tamil Nadu, and Karnataka — are above average. The other 6 states are below.


-- 4) Rainfall Impact on Crop Yield
select 
case 
when w.total_rainfall_mm < 1000 then 'low'
when w.total_rainfall_mm between 1000 and 2000 then 'moderate'
else 'high'
end as rainfall_category,
avg(c.yield_value) as avg_yield
from crop_yield c
join weather_data w
on c.state = w.state and c.year = w.year
group by rainfall_category;

#I joined the crop data with the weather data. I grouped rainfall into three levels — low, moderate, and high. 
#The surprising result is that moderate rainfall gives the best yield.
# High rainfall actually gives less yield. This may be because too much rain damages the crops.


-- 5) Soil Quality (N, P, K, pH) vs. Yield Performance
select c.state, avg(c.yield_value) as avg_yield, 
avg(s.Nitrogen) as avg_Nitrogen, avg(s.Phosphorus) as avg_Phosphorus, avg(s.Potassium) as avg_Potassium, avg(s.Soil_pH) as avg_Soil_pH
from crop_yield c
join soil_data s
on c.state = s.state
group by c.state
order by avg_yield desc;

# I joined the crop data with the soil data. Punjab has the best soil numbers — nitrogen, phosphorus, potassium, and pH.
# But Punjab's yield is one of the lowest. So good soil alone does not guarantee good yield. 
#Other things like watering methods and farming style probably matter more

-- 6) Production Trend Over the Years (1997–2019)
select year, sum(production) as total_production
from crop_yield
group by year
order by year ;

#I grouped the data by year to see the yearly total. Production has grown a lot since 1997 — almost 16 times more by 2019.
# There are some ups and downs, but the overall direction is upward

-- 7) Yield Reliability vs. Volatility Across Crops
select crop, avg(yield_value) as avg_yield, stddev(yield_value) as yield_volatility
from crop_yield
group by crop
order by yield_volatility desc;
#I used AVG for the average yield and STDDEV to check how much the yield changes year to year. 
#Coconut has a very high average and very high change — much more than any other crop.
# This is likely because coconut is measured differently, maybe in count instead of weight."






