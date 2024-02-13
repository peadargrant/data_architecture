CREATE OR REPLACE FUNCTION sale_total
( items numeric, discounts numeric, shipping numeric )
RETURNS numeric AS $$
	DECLARE -- optional not null, initial values and constant
		total numeric not null := 0;
		tax_rate constant numeric not null := 0.23;
	BEGIN
		total := items - discounts ; -- assigned by := 
		total := total + round( total * tax_rate, 2 ) ;
		total := total + shipping ;
		return total;
	END;
$$ LANGUAGE plpgsql ;
