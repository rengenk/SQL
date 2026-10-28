COMMENT ON TABLE person_discounts IS
'In this table stores discount rules applicable to customers at specific pizzerias.';

COMMENT ON COLUMN person_discounts.id IS
'Unique identifier of the discount record. PRIMARY KEY.';
COMMENT ON COLUMN person_discounts.person_id IS
'Identifier of the customer who receives the discount. FOREIGN KEY referencing the person table.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS
'Identifier of the pizzeria for which the discount is provided. FOREIGN KEY referencing the pizzeria table.';
COMMENT ON COLUMN person_discounts.discount IS
'Value of the personal discount in percent for the specific person at the specific pizzeria.';

-- \dt+ person_discounts
