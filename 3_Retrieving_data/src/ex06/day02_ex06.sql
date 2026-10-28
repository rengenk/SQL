SELECT
	m.pizza_name,
	pz.name AS pizzeria_name
FROM
	person_order AS po
JOIN
	person as p ON po.person_id = p.id
JOIN
	menu as m ON po.menu_id = m.id
JOIN
	pizzeria AS pz ON m.pizzeria_id = pz.id
WHERE
	p.name = 'Denis' OR p.name = 'Anna'
ORDER BY pizza_name, pizzeria_name;
