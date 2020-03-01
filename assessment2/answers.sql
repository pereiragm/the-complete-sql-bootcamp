-- 1. How can you retrieve all the information from the cd.facilities table?
select * from facilities f;


-- 2. You want to print out a list of all of the facilities and their cost
-- to members. How would you retrieve a list of only facility names and costs?
select name, membercost
from facilities f;


-- 3. How can you produce a list of facilities that charge a fee to members?
select * from facilities b
where b.membercost > 0;


-- 4. How can you produce a list of facilities that charge a fee to members, 
-- and that fee is less than 1/50th of the monthly maintenance cost? 
-- Return the facid, facility name, member cost, and monthly maintenance 
-- of the facilities in question.
select
	f.facid,
	f."name",
	f.membercost,
	f.monthlymaintenance
from facilities f
where
membercost > 0
and membercost < monthlymaintenance/50;


-- 5. How can you produce a list of all facilities with the word 'Tennis'
-- in their name?
select *
from facilities
where name like '%Tennis%'


-- 6. How can you retrieve the details of facilities with ID 1 and 5?
-- Try to do it without using the OR operator.
select *
from facilities f
where f.facid in (1, 5);


-- 7. How can you produce a list of members who joined after the
-- start of September 2012? Return the memid, surname, firstname,
-- and joindate of the members in question.
select
	memid,
	surname,
	firstname,
	joindate
from members
where joindate > '2012-09-01';


-- 8. How can you produce an ordered list of the first 10 surnames in
-- the members table? The list must not contain duplicates.
select distinct(surname)
from members
order by surname
limit(10);


-- 9. You'd like to get the signup date of your last member.
-- How can you retrieve this information?
select
	joindate as latest
from members
order by joindate desc
limit(1);

-- better answer
select max(joindate) as latest
from members;


-- 10. Produce a count of the number of facilities that have a cost
-- to guests of 10 or more.
select count(*)
from facilities
where facilities.guestcost >= 10;


-- 11. Skip this one, no question for #11.


-- 12. Produce a list of the total number of slots booked per
-- facility in the month of September 2012. Produce an output table
-- consisting of facility id and slots, sorted by the number of slots.
select
	b.facid,
	sum(b.slots) as sum_of_slots
from bookings b
where b.starttime >= '2012-09-01'
and b.starttime < '2012-10-01'
group by b.facid
order by sum(b.slots);


-- 13. Produce a list of facilities with more than 1000 slots booked.
-- Produce an output table consisting of facility id and total slots,
-- sorted by facility id.
select
	facid,
	total_slots
from (
	select
		f.facid,
		sum(b.slots) as total_slots
	from facilities f
	inner join bookings b on b.facid = f.facid
	group by f.facid
	order by f.facid
) as bla
where bla.total_slots > 1000;

-- better solution
select
	facid,
	sum(slots) as "Total Slots"
from cd.bookings
group by facid
having sum(slots) > 1000
order by facid;


-- 14. How can you produce a list of the start times for bookings
-- for tennis courts, for the date '2012-09-21'?
-- Return a list of start time and facility name pairings, ordered by the time.

-- did not answered

-- solution:
select
	bks.starttime as start,
	facs.name as name
from cd.facilities facs
inner join cd.bookings bks on facs.facid = bks.facid
where facs.facid in (0,1)
and bks.starttime >= '2012-09-21'
and bks.starttime < '2012-09-22'
order by bks.starttime;


-- 15. How can you produce a list of the start times for bookings
-- by members named 'David Farrell'?
select 
	b.starttime
from bookings b
where b.memid in (
	select 
		m.memid
	from members m
	where m.firstname = 'David'
	and m.surname = 'Farrell'
);

-- better solution:
select
	bks.starttime
from cd.bookings bks
inner join cd.members mems on mems.memid = bks.memid
where mems.firstname='David'
and mems.surname='Farrell';

