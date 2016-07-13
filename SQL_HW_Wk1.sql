#SQL Assignment #1: Selects and Aggregations
#Christine Yuan, 7/13/16

#1. Write a SELECT statement that returns all of the rows and columns in the planes table
select * from planes

#2. Using the weather table, concatenate the date columns to display the date in the format M/DD/YYYY
select * from weather
select concat(month,"/",day,"/",year) from weather

#3. Order the planes table by number of seats, in descending order
select * from planes 
	order by seats desc

#4. List planes with engine "Turbo-Jet"
select * from planes where engine='Turbo-jet';

#5. List only the first 5 rows in the flights table
select * from flights 
	limit 5;
    
#6. What is the longest air time?
select max(air_time) from flights;

#7. What is the shortest airtime for Delta?
select min(air_time) from flights
	where carrier='DL';
    
#8. Show all the Alaska Airlines flights between 6/1/13-6/3/13
select * from flights
	where carrier='AA' and
    year='2013' and month='6' and day in ('1','2','3')

#9. Show all airlines whose names contain 'America'
select * from airlines where name like '%America%';

#10. How many flights went to Miami
select count(*) from flights where dest='MIA'

#11. Where there more flights to Miami in Jan 2013 or Jul 2013? Jan 2013
select count(*) from flights where dest='MIA' and year='2013' and month='1' #981
select count(*) from flights where dest='MIA' and year='2013' and month='7' #978

#12. What is the average altitude of airports? #1005.917...ft?
select avg(alt) from airports

#1. What is the average altitude of the 3 major NY airports? 17.67
select avg(alt) from airports where FAA in ('EWR','JFK','LGA')

#2. What is the average altitude for airports grouped by timezone? tz -7 because of the Rocky Mountains
#confer: http://www.greenskychaser.com/blog/wp-content/uploads/2011/02/timezone.png
select tz,avg(alt) from airports group by tz
	order by avg(alt) desc;
    
#3. Which of these airplanes made the most flights out of NYC in 2013? N328AA made 953 flights
select tailnum, count(*) from flights where tailnum in ('N125UW','N848MQ','N328AA','N247JB') and year='2013' and origin in ('LGA','JFK','EWR')
	order by count(*) desc;

#4. Show the metadata for each of these four planes. No data for N848MQ?
select * from planes where tailnum in ('N125UW','N848MQ','N328AA','N247JB')

#5. Write a SELECT statement that shows the flights between 2/14-2/17 for these 4 planes
select tailnum, year, month, day, dep_delay, arr_delay, dest from flights 
	where tailnum in ('N125UW','N848MQ','N328AA','N247JB')
    and month='2' and day in ('14','15','16','17')