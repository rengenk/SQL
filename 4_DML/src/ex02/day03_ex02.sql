SELECT pizza_name, price, pz.name AS pizzeria_name
FROM menu AS m
JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
LEFT JOIN person_order AS po ON m.id = po.menu_id
WHERE po.menu_id IS NULL
ORDER BY pizza_name,price;
