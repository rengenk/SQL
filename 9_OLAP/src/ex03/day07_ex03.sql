WITH 
	orders AS (
		SELECT
		    pz.name,
		    COUNT (*) AS count,
		    'order' AS action_type
		FROM person_order AS po
		JOIN menu AS m
		    ON po.menu_id = m.id
		JOIN pizzeria AS pz
		    ON m.pizzeria_id = pz.id
		GROUP BY pz.name
		ORDER BY count DESC),
	visits AS (
		SELECT
		    pz.name,
		    COUNT (*) AS count,
		    'visit' AS action_type
		FROM person_visits AS pv
		JOIN pizzeria AS pz
		    ON pv.pizzeria_id = pz.id
		GROUP BY pz.name
		ORDER BY count DESC),
	stat AS (
	SELECT
		COALESCE(o.name, v.name) AS name,
		COALESCE(o.count, 0) + COALESCE(v.count, 0) AS total_count
		FROM orders AS o
		FULL JOIN visits AS v
	    	    ON o.name = v.name)
	SELECT
		pz.name,
		COALESCE(st.total_count, 0) AS total_count
		FROM pizzeria AS pz
		JOIN stat AS st
		    ON pz.name = st.name
		ORDER BY total_count DESC, name ASC;
