WITH date_series AS
	(SELECT gs :: date AS missing_date
	FROM generate_series('2022-01-01', '2022-01-10', '1 day'::interval) AS gs ),
	person_filtered AS
	(SELECT *
	FROM person_visits
	WHERE person_id = 1 OR person_id = 2
)
SELECT ds.missing_date
FROM date_series AS ds
LEFT JOIN person_filtered AS pv
	ON pv.visit_date = ds.missing_date
WHERE pv.visit_date IS NULL
ORDER BY ds.missing_date;
