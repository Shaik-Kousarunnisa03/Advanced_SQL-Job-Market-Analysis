create database job_market;
use job_market;
select * from job_market_dataset;

select company,year,count(*) as total_jobs
from job_market_dataset
group by company,year;

select location,avg(salary_min_lpa) as avg_min_salary
from job_market_dataset
group by location;

select location,avg(salary_max_lpa) as avg_max_salary
from job_market_dataset
group by location;

select location,avg(experience_required_years) as avg_experience
from job_market_dataset
group by location;

select company,count(*) as total_jobs
from job_market_dataset
group by company
order by total_jobs desc
limit 3;

select job_category
from job_market_dataset
group by job_category
having count(distinct location)>5;

select job_title,location,experience_required_years,
rank() over(partition by location order by experience_required_years desc) as job_rank
from job_market_dataset;

select job_category,avg(experience_required_years) as avg_experience
from job_market_dataset
group by job_category;

select job_category,count(*) as total_jobs
from job_market_dataset
group by job_category
order by total_jobs desc
limit 1 offset 1;

select year,company,count(*) as total_jobs
from job_market_dataset
group by year,company
order by total_jobs desc
limit 1;

select location,count(*) as total_jobs
from job_market_dataset
group by location
having count(*) > 10;

select company,max(year) as latest_year
from job_market_dataset
group by company;