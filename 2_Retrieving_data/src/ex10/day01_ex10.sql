SELECT
p.name AS person_name,
m.pizza_name AS pizza_name,
pz.name AS pizzeria_name
FROM person_order AS po
	JOIN person AS p ON p.id = po.person_id
	JOIN menu AS m on m.id = po.menu_id
	JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
ORDER BY person_name, pizza_name, pizzeria_name;
