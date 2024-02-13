CREATE OR REPLACE FUNCTION km_to_miles ( miles int )
-- input parameters have name and type
RETURNS int -- datatype function is to return
AS
$$ -- delimiter must match ending delimiter
	BEGIN --- NOT same as transaction BEGIN/END!
		RETURN 0.625 * miles; 
	END;
$$ 
LANGUAGE plpgsql -- specify plpgsql for Procedural SQL
;
