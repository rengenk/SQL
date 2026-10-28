SELECT DISTINCT p.name
FROM person_order AS po
JOIN person AS p
	On p.id = po.person_id
ORDER BY name;
