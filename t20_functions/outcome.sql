CREATE OR REPLACE FUNCTION outcome ( grade int )
RETURNS TEXT
AS
$$ 
	BEGIN
		IF ( grade >= 40 )
		THEN
			RETURN 'PASS';
		ELSIF ( grade >= 35 )
		THEN
			RETURN 'PBC';
		ELSE
			RETURN 'FAIL';
		END IF;
		
	END;
$$
LANGUAGE plpgsql
;
