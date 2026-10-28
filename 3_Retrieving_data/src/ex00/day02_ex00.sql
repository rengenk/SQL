SELECT pz.name, pz.rating
FROM pizzeria AS pz
LEFT JOIN person_visits as pv
	ON pz.id = pv.pizzeria_id
WHERE pv.pizzeria_id IS NULL;
