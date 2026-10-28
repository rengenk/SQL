SELECT m.id AS menu_id
FROM menu AS m
LEFT JOIN person_order AS po ON m.id = po.menu_id
WHERE po.menu_id IS NULL
ORDER BY menu_id;
