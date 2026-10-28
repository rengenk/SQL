WITH RECURSIVE all_cities as (
	select point1 as city from roads
	union
	select point2 as city from roads
), -- Берём все города из roads
routes as (
	select
		point1,
		point2,     -- Стартовая часть маршрута
		cost,
		array [point1, point2] as route
	from roads
	where point1 = 'a'

	union all

	select 
		r.point1,
		n.point2,
		r.cost + n.cost,
		r.route || n.point2 -- Строим маршруты
	from routes r
	join roads n
		on r.point2 = n.point1
	where n.point2 <> all(r.route)
),
full_routes as (
	select
		r.cost + n.cost as totalcost,
		r.route || ARRAY['a'] as tour -- Добавляем город 'a' в конец
	from routes r
	join roads n
		on r.point2=n.point1
		and n.point2 = 'a'
	where array_length(r.route, 1) = (
		select count(*) from all_cities
	)
)
select      -- Оставляем минимальные маршруты
	totalcost,
	'{' || array_to_string(tour, ',') || '}' as tour
from full_routes
where totalcost = (   
	select min(totalcost)
	from full_routes
)
or totalcost = (
    select max(totalcost)
    from full_routes
)
order by totalcost, tour;

