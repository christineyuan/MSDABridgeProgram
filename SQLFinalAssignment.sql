#Christine Yuan, 8/10/16
#SQL Bridge Program, Final Project: Building Energy

drop database if exists BuildingEnergy;
drop table if exists EnergyCategories;
drop table if exists EnergyTypes;
drop table if exists Buildings;

#1. Create database
create database BuildingEnergy;

#2. Create two tables
create table EnergyCategories (
	cat_id int unique,
    cat varchar(100)
    );
    
create table EnergyTypes (
	type_id int unique,
    energytype varchar(100),
    cat_id int
    );

insert into EnergyCategories values (1, 'Fossil');
insert into EnergyCategories values (2, 'Renewable');

insert into EnergyTypes values (1, 'Electricity',1);
insert into EnergyTypes values (2, 'Gas',1);
insert into EnergyTypes values (3, 'Steam',1);
insert into EnergyTypes values (4, 'Fuel Oil',1);
insert into EnergyTypes values (5, 'Solar',2);
insert into EnergyTypes values (6, 'Wind',2);

#3. Write a JOIN statement
select cat as Category, energytype as EnergyType from EnergyCategories as c right outer join EnergyTypes as t on c.cat_id=t.cat_id;

#4. Add Buildings table
create table Buildings (
	bid int,
    buildingname varchar(100),
    energytype int
    );
    
insert into Buildings values (1, "Empire State Building", 1);
insert into Buildings values (1, "Empire State Building", 2);
insert into Buildings values (1, "Empire State Building", 3);
insert into Buildings values (2, "Chrysler Building", 1);
insert into Buildings values (2, "Chrysler Building", 3);
insert into Buildings values (3, "BMCC", 1);
insert into Buildings values (3, "BMCC", 3);
insert into Buildings values (3, "BMCC", 5);

#5. Write a JOIN statement for the buildings and energy types

select b.buildingname, e.energytype from Buildings as b left outer join Energytypes as e on type_id=b.energytype
	order by b.buildingname asc;
    
#6. Insert more data
insert into Buildings values (4, "Bronx Lion House", 7);
insert into Buildings values (5, "Brooklyn Childrens Museum", 1);
insert into Buildings values (5, "Brooklyn Childrens Museum", 7);

insert into EnergyTypes values (7, 'Geothermal',2);

#7. SQL query for renewable energy buildings
select b.buildingname, t.energytype, c.cat as category from 
	buildings as b left outer join 
		energytypes as t left outer join energycategories as c on t.cat_id=c.cat_id
		on b.energytype=t.type_id
where t.cat_id=2;

#8. SQL query for Energy Type Frequency
select t.energytype, count(*) from 
	buildings as b right outer join energytypes as t
	on b.energytype=t.type_id 
group by t.energytype 
order by count(*) desc;       
