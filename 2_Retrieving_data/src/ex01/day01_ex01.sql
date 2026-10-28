SELECT object_name
FROM (
    SELECT p.name as object_name, 1 AS sort_order
    FROM person AS p
    UNION ALL
    SELECT m.pizza_name as object_name, 2 AS sort_order
    FROM menu AS m
) AS combined
ORDER BY sort_order, object_name;
