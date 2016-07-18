#Week 1 Graded Assignment
#Christine Yuan, 7/17/16

#1. Which destination in the flights database is the furthest distance away? Honolulu (HNL)
select dest from flights 
	order by distance desc
    limit 1;
    
#2. What are the different numbers of engines in the planes table? 1, 2, 3, 4
select distinct engines from planes
#For each number of engines, which aircraft have the most number of seats?
select engines, tailnum, max(seats) from planes where engines='1' #N201AA has 16 seats
select engines, tailnum, max(seats) from planes where engines='2' #N10156 has 400 seats
select engines, tailnum, max(seats) from planes where engines='3' #N854NW has 379 seats
select engines, tailnum, max(seats) from planes where engines='4' #N281AT has 450 seats

#3. Show the total number of flights 336776
select count(*) from flights

#4. Show the total number of flights by airline
select carrier, count(*) from flights
	group by carrier
    
#5. Show all the airlines, ordered by number of flights in descending order
select carrier, count(*) from flights
	group by carrier
    order by count(*) desc
    
#6. Show only the top 5 airlines, by number of flights, in desc order
select carrier, count(*) from flights
	group by carrier
    order by count(*) desc
    limit 5;

#7. Show only the top airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights desc
select carrier,count(*) from flights
	where distance > 1000
    group by carrier
    order by count(*) desc
    limit 5;

#8. Create your own question
# How many flights were not delayed (both departure and arrival) and had a duration less than 1 hour? 43
select count(*) from flights
	where air_time < 60
    and dep_delay=0 and arr_delay=0
    order by distance desc