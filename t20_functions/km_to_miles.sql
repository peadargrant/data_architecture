CREATE OR REPLACE FUNCTION km_to_miles ( miles int )
RETURNS int
AS
$$ 
	BEGIN
		RETURN 0.625 * miles; 
	END;
$$ 
LANGUAGE plpgsql
;
