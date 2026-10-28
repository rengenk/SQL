SELECT po.order_date,
	(SELECT p.name || ' (age:' || p.age || ')' FROM person AS p WHERE p.id = po.person_id) AS person_information
	FROM person_order AS po
JOIN person AS p
	ON po.person_id = p.id
ORDER BY order_date, person_information;
