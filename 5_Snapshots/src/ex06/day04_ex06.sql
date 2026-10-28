CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
	SELECT pz.name AS pizzeria_name
	FROM person_visits AS pv
		JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id
		JOIN person AS p ON p.id = pv.person_id
		JOIN menu AS m ON m.pizzeria_id = pv.pizzeria_id
	WHERE p.name = 'Dmitriy'
		AND pv.visit_date = '2022-01-08'
		AND m.price < 800;
