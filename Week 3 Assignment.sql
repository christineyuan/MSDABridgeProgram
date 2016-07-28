#Week 3 Assignment - SQL
#Christine Yuan 7/28/16

create table usertable (
	userid int,
    username varchar(100),
    groupid int
    )

insert into usertable (userid, username, groupid) values (1,"Modesto",1)
insert into usertable (userid, username, groupid) values (2,"Ayine",1)
insert into usertable (userid, username, groupid) values (3,"Christopher",2)
insert into usertable (userid, username, groupid) values (4,"Cheong woo",2)
insert into usertable (userid, username, groupid) values (5,"Saulat",3)
insert into usertable (userid, username, groupid) values (6,"Heidy", null)

#select * from usertable

create table grouptable (
	groupid int,
    groupname varchar(100)
    )

insert into grouptable (groupid, groupname) values (1,"I.T.")
insert into grouptable (groupid, groupname) values (2,"Sales")
insert into grouptable (groupid, groupname) values (3,"Administration")
insert into grouptable (groupid, groupname) values (4,"Operations")

select * from grouptable

create table rooms (
	roomid int,
    roomname varchar(100))
    
insert into rooms (roomid, roomname) values (1,"101")
insert into rooms (roomid, roomname) values (2,"102")
insert into rooms (roomid, roomname) values (3,"Auditorium A")
insert into rooms (roomid, roomname) values (4,"Auditorium B")

    
create table group_user (
	groupid int,
    groupname varchar(100),
    userid int,
    username varchar(100)
    )
    
insert into group_user (groupid, groupname,userid, username) 
	select usertable.groupid, groupname, userid, username from usertable right outer join grouptable on usertable.groupid=grouptable.groupid
    
select * from group_user

create table group_room (
	groupid int,
    groupname varchar(100),
    roomid int,
    roomname varchar(100)
    )

#I.T. rooms    
insert into group_room (groupid, groupname, roomid, roomname) 
	select groupid, groupname, roomid, roomname from grouptable, rooms where roomid in (1,2) and groupid=1 
#Sales rooms
insert into group_room (groupid, groupname, roomid, roomname) 
	select groupid, groupname, roomid, roomname from grouptable, rooms where roomid in (2,3) and groupid=2

select * from group_room

#1. All groups and users assigned to them
select groupid,groupname,username from group_user

#2. All rooms and groups assigned to them
select rooms.roomid,rooms.roomname, group_room.groupname from rooms left outer join group_room on rooms.roomid=group_room.roomid

#3. All users, groups, rooms
select * from usertable left outer join group_room on usertable.groupid=group_room.groupid 
	order by username, groupname, roomname asc