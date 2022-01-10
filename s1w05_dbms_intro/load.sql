create table population ( LocID int,Location text,VarID int,Variant text,Time numeric,MidPeriod numeric,PopMale numeric,PopFemale numeric,PopTotal numeric,PopDensity numeric);

\COPY population FROM 'WPP2019_TotalPopulationBySex.csv' with (format csv);
