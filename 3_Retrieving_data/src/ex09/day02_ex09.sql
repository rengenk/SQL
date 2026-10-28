WITH female_orders AS
	(SELECT * FROM person AS p
	JOIN
	   person_order AS po ON po.person_id = p.id
	JOIN
	   menu AS m ON po.menu_id = m.id
	WHERE
	   p.gender = 'female'
	)
SELECT name
FROM female_orders AS fo
WHERE pizza_name = 'cheese pizza'
INTERSECT
SELECT name
FROM female_orders
WHERE pizza_name = 'pepperoni pizza'
