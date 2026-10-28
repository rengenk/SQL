WITH pp AS (
	SELECT
		pizza_name,
		pz.name AS pizzeria_name,
		price
	FROM menu AS m
	JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
)

Select
	p1.pizza_name,
	p1.pizzeria_name AS pizzeria_name_1,
	p2.pizzeria_name AS pizzeria_name_2,
	p1.price
FROM pp AS p1
JOIN pp AS p2
	ON p1.pizza_name = p2.pizza_name
	AND p1.price = p2.price
	AND p1.pizzeria_name < p2.pizzeria_name
ORDER BY pizza_name;
