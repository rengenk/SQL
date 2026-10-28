INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
	(SELECT MAX(id) + 1 FROM person_visits),
	(SELECT id FROM person WHERE name = 'Dmitriy'),
	(SELECT MIN(m.pizzeria_id)
	FROM menu AS m
		JOIN pizzeria AS pz
		ON pz.id = m.pizzeria_id
	WHERE m.price < 800
	AND pz.name != 'Papa Johns'),
	'2022-01-08');
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
