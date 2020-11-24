create table PLACES (
	id integer not null,
	name varchar(50),
	host_id integer,
	unique(id)
)

create table SCHEDULES (
	place_id integer not null,
	SCHEDULED_AT Date,
	PRICE integer
)

create table PLACE_REVIEWS (
	id integer not null,
	PLACE_ID integer not null,
	CREATED_AT Date,
	REVIEWER_ID int,
	COMMENTS varchar(100)
)


insert into PLACES
VALUES
(4431977, "BOUTIQUE STAYS - Somerset Terrace, Pet Friendly", 760849),
(5194998, "BOUTIQUE STAYS - Elwood Beaches 3, Pet Friendly", 760849),
(22868779, "★ Fresh Fitzroy Pad with City Views! ★", 21058208),
(24195416, "5 Star Luxury St Kilda Road", 31634799);


insert into SCHEDULES
VALUES
(4431977, '2019-01-06 00:00:00', 369),
(22868779	, '2019-01-06 00:00:00', 99),
(24195416, '2019-01-06 00:00:00', 130),
(5194998, '2019-01-06 00:00:00', 415);

insert into PLACE_REVIEWS
VALUES
(38211981, 4431977, '2015-07-13 00:00:00', 37439781, 'We had a lovely stay at thi...'),
(34804004, 5194998, '2015-06-12 00:00:00', 28437929, 'We had a lovely stay at thi...'),
(350298581, 22868779, '2018-11-19 00:00:00', 23799748, 'We had a lovely stay at thi...'),
(353407321, 22868779, '2018-11-27 00:00:00', 6026824, 'We had a lovely stay at thi...'),
(348933938, 22868779, '2018-11-15 00:00:00', 70464455, 'We had a lovely stay at thi...');



select
	p.id as ID,
	p.name as NAME
from PLACES p
join SCHEDULES s
on p.id = s.place_id
join PLACE_REVIEWS pr
on p.id = pr.PLACE_ID
where DATE_FORMAT(s.SCHEDULED_AT, '%Y-%m-%d') = '2019-01-06'
and pr.COMMENTS is not null
GROUP by id
order by ID asc;