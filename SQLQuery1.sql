select count(*)
from dbo.Hotel_Reviews$

select *
from dbo.Hotel_Reviews$


/* what is the 10 best hotels with score more than 9.0 */

select distinct top 10 Hotel_Name, Average_Score,Total_Number_of_Reviews
from dbo.Hotel_Reviews$
where Average_Score >= 9
order by 3 desc, 2 desc

----------------------------------------------


/* what is the top 10 lowest_score hotel */

select distinct top 10 Hotel_Name, Average_Score,Total_Number_of_Reviews
from dbo.Hotel_Reviews$
where Average_Score <= 7
order by  2, 3 desc

----------------------------------------------


/* what is the most top 10 reviewed hotel */

select distinct top 10 Hotel_Name, Total_Number_of_Reviews
from dbo.Hotel_Reviews$
order by 2 desc

----------------------------------------------


/* what is the least top 10 reviewed hotels */

select distinct top 10 Hotel_Name, Total_Number_of_Reviews
from dbo.Hotel_Reviews$
order by 2


----------------------------------------------


/* what is the country with the most hotels */

select Country, count(Hotel_Name) as number_of_hotels_by_country
from dbo.Hotel_Reviews$
group by Country
order by 2 desc


----------------------------------------------


/* what is the top 10 countries with the highest avarage score hotels */

select distinct top 10 Country, Hotel_Name, Average_Score
from dbo.Hotel_Reviews$
order by 3 desc


----------------------------------------------


/* what is the top 10 countries with the highest reviews hotels */

select distinct top 10 Country, Hotel_Name, Total_Number_of_Reviews
from dbo.Hotel_Reviews$
order by 3 desc

----------------------------------------------


/* each country's most reviewed hotel */

with max_num_reviews_by_country as (select distinct Country, max(Total_Number_of_Reviews) as num_reviews_by_each_country
from dbo.Hotel_Reviews$
group by Country)
select distinct h.Country, h.Hotel_Name, h.Total_Number_of_Reviews
from dbo.Hotel_Reviews$ h
join max_num_reviews_by_country m
on h.Total_Number_of_Reviews = m.num_reviews_by_each_country
order by 3 desc












