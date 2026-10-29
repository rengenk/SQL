CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fib INTEGER) AS $$
DECLARE
	prev INTEGER := 0;
	curr INTEGER := 1;
	next INTEGER;
BEGIN
	WHILE prev < pstop LOOP
	fib := prev;
	RETURN NEXT;
	
	next := prev + curr;
	prev := curr;
	curr := next;
	END LOOP;
END;
$$ LANGUAGE plpgsql;


-- select * from fnc_fibonacci(100);

-- select * from fnc_fibonacci();