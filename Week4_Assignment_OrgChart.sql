#Christine Yuan, 8/10/16
#Week Four SQL Assignment: Self Joins

drop table if exists org_chart;

create table org_chart (
	emp_id int NOT NULL primary key,
    emp_name varchar(100),
    emp_title varchar(100),
    sup_id int
    );

insert into org_chart values (1,'Steve Jobs','CEO', null);
insert into org_chart values (2,'Timothy Cook','COO', 1);
insert into org_chart values (3,'Andy Miller','Mobile VP',1);
insert into org_chart values (4,'Hiroki Asai','Creative Director', 1);
insert into org_chart values (5,'Douglas Beck','Apple Japan VP',2);
insert into org_chart values (6,'John Brandon','VP Channel Sales',2);
insert into org_chart values (7,'John Couch','VP Education Sales',2);

#This select statement shows who reports to whom, where emp_name (Employee Name) reports to sup_name (Supervisor Name)
select supervisor.emp_name as sup_name, employee.emp_name as emp_name
	from org_chart supervisor
		join org_chart employee
        on employee.sup_id=supervisor.emp_id
order by employee.sup_id asc;