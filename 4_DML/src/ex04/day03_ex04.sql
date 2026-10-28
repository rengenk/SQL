WITH o AS (
	SELECT
		pz.name AS pizzeria_name,
		p.gender
	FROM person_order AS po
	JOIN menu AS m ON m.id = po.menu_id
	JOIN pizzeria AS pz ON pz.id = m.pizzeria_id
	JOIN person AS p ON p.id = po.person_id
)
(
	SELECT pizzeria_name FROM o WHERE gender = 'female'
	EXCEPT
	SELECT pizzeria_name FROM o WHERE gender = 'male'
)
UNION
(
	SELECT pizzeria_name FROM o WHERE gender = 'male'
	EXCEPT
	SELECT pizzeria_name FROM o WHERE gender = 'female'
)
ORDER BY pizzeria_name;
