create database retail_trend_insight;


-- The ratio of male to female customers is about 68:32, using the data the store has on female customers,
-- What stategy do you recommend the store puts in place to attract more female customers?

select *
 from 
 shopping_trends;
 
 -- let's identify the percentage of clients based on their gender.
 -- 1) lets find first the total customers by gender 
 
 select 
 gender , 
 count(`Customer ID`) as client_count
 from shopping_trends
 group by 1 
 order by 2 desc ;
 
 -- 2) now lets use the case statement for the percentage .
 
 with total as (
  select 
 gender , 
 count(`Customer ID`) as client_count
 from shopping_trends
 group by 1 
 order by 2 desc 
 )
 select
 sum(case when gender = 'Male' then client_count else 0 end) count_male,
 sum(case when gender = 'Female' then client_count else 0 end) count_female,
round(sum(case when gender = 'Male' then client_count else 0 end)/
 (sum(case when gender = 'Male' then client_count else 0 end) + sum(case when gender = 'Female' then client_count else 0 end)) *100,2)as pct_male,
 
 round(sum(case when gender = 'Female' then client_count else 0 end)/
 (sum(case when gender = 'Female' then client_count else 0 end) + sum(case when gender = 'Male' then client_count else 0 end)) *100,2)as pct_female
 
 
 from total
 
 
 -- -- what age group do we mostly serve?
-- first lets get the min and max  age before the age range
select
max(age) as max_age,
min(Age) as min_age

from shopping_trends;

-- now lets use the case statement to answer the question :
 
 select 
 case 
when Age between 18 and 31 then '18-31'
when Age between 32 and 45 then '32-45' 
when Age between 46 and 59 then '46-59'
when Age between 60 and 70 then '60-70'
end as Age_group,
count(`Customer ID`) as client 

from shopping_trends
group by 1
order by 2 desc ;

-- 
 
 

