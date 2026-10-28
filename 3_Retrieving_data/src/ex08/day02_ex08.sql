SELECT
	p.name
FROM
	person AS p
JOIN
	person_order AS po ON po.person_id = p.id
JOIN
	menu AS m ON po.menu_id = m.id
WHERE
	p.gender = 'male'
	AND ( m.pizza_name = 'pepperoni pizza' OR m.pizza_name = 'mushroom pizza')
	AND (p.address = 'Samara' OR p.address = 'Moscow')
ORDER BY p.name DESC;

