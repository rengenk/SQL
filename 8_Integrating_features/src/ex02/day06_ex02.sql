SELECT
	p.name,
	m.pizza_name,
	m.price,
	ROUND(m.price * 0.01 *(100 - pd.discount), 2)AS discount_price,
	pz.name AS pizzeria_name
FROM person_order AS po
JOIN person AS p ON po.person_id = p.id
JOIN menu AS m ON po.menu_id = m.id
JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
JOIN person_discounts AS pd
	ON po.person_id = pd.person_id
	AND m.pizzeria_id = pd.pizzeria_id
ORDER BY p.name, pizza_name;
