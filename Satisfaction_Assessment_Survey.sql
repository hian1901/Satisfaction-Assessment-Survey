SELECT * FROM practice.raw_data1;
create table raw_data1_copy as
select * ,
row_number() over (partition by customer_id order by survey_date) as rn
from raw_data1;

delete 
from raw_data1_copy
where rn > 1;
alter table raw_data1_copy drop column rn ;

update raw_data1_copy 
set email = null where email = '' ;
update raw_data1_copy 
set phone = null where phone = '' ;
-- combine contact ,
select email,phone,
coalesce(email,phone,'no available')
from raw_data1_copy;

alter table raw_data1_copy 
add column contact TEXt ;
alter table raw_data1_copy
modify column contact text after customer_id;
update raw_data1_copy
set contact = coalesce(email,phone,'no available');
alter table raw_data1_copy 
drop column email, drop column phone;

-- split column
select address,
substring_index(address,',',1) as street,
substring_index(substring_index(address,',',2),',',-1) as city ,
substring_index(address,',',-1) as state
from raw_data1_copy ;
alter table raw_data1_copy 
add column street text, add column city text , add column state text;
update raw_data1_copy 
set street = substring_index(address,',',1),
 city = substring_index(substring_index(address,',',2),',', -1),
 state = substring_index(address,',',-1) ;
 alter table raw_data1_copy drop column address;
update raw_data1_copy 
set rewards_member = trim(upper(rewards_member));

-- validate date 
select survey_date, str_to_date( survey_date,'%d-%m-%Y') from raw_data1_copy;
update raw_data1_copy set survey_date = str_to_date( survey_date,'%d-%m-%Y');
alter table raw_data1_copy modify column survey_date date;

select survey_time, str_to_date( survey_time, '%H:%i')
from raw_data1_copy ;
update raw_data1_copy set survey_time = str_to_date( survey_time, '%H:%i');
alter table raw_data1_copy modify column survey_time time ;

select service_feedback,
case 
when  service_feedback like '%Excellent%' then 'Excellent'
when service_feedback like '%Poor serviceA%' then 'Poor'
when service_feedback = 'average service' then 'Average'
when service_feedback='good service' then concat(trim(upper(substring(service_feedback,1,1))),trim(substring(service_feedback,2)))
else service_feedback
end as new_service_feedback
from  raw_data1_copy;

select * from  raw_data1_copy;

select distinct service_feedback
from raw_data1_copy;
update raw_data1_copy set service_feedback = case 
when  service_feedback like '%Excellent%' then 'Excellent'
when service_feedback like '%Poor serviceA%' then 'Poor'
when service_feedback = 'average service' then 'Average'
when service_feedback='good service' then 
concat(trim(upper(substring(service_feedback,1,1))),trim(substring(service_feedback,2)))
else service_feedback
end;

select distinct freetext_response , trim(freetext_response) from raw_data1_copy;
update raw_data1_copy set freetext_response =  trim(freetext_response);
-- -------------------------------
select * 
from raw_data1_copy;
select service_feedback, 
count(customer_id) as total,
round((count(customer_id)) * 100 / (sum(count(customer_id))over()),2)
from raw_data1_copy
group by service_feedback;
select service_feedback, visit_frequency,
count(customer_id) as total
from raw_data1_copy
group by service_feedback, visit_frequency;
select service_feedback, product_quality,
count(customer_id) as total
from raw_data1_copy
group by service_feedback,product_quality;
select service_feedback ,
freetext_response
from raw_data1_copy
where service_feedback = 'Poor' ;
select service_feedback, recommend_to_friend,
count(customer_id) as total
from raw_data1_copy
group by service_feedback, recommend_to_friend;
select service_feedback, rewards_member,
count(customer_id) as total
from raw_data1_copy
group by service_feedback, rewards_member;
