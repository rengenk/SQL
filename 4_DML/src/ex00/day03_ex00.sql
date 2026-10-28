SELECT
	m.pizza_name,
	m.price,
	pz.name AS pizzeria_name,
	pv.visit_date
FROM person_visits AS pv
JOIN menu AS m ON m.pizzeria_id = pv.pizzeria_id
JOIN pizzeria as pz ON pz.id = pv.pizzeria_id
JOIN person AS p ON p.id = pv.person_id
WHERE p.name = 'Kate'
	AND m.price BETWEEN 800 and 1000
ORDER BY pizza_name, price, pizzeria_name;
