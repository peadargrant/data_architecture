-- Table setup for COVID case data
-- Peadar Grant

drop table if exists cases;

create table cases (
       X numeric, 
       Y numeric, 
       Date timestamp not null, 
       ConfirmedCovidCases numeric, 
       TotalConfirmedCovidCases numeric, 
       ConfirmedCovidDeaths numeric, 
       TotalCovidDeaths numeric, 
       StatisticsProfileDate timestamp not null, 
       CovidCasesConfirmed numeric, 
       HospitalisedCovidCases numeric, 
       RequiringICUCovidCases numeric, 
       HealthcareWorkersCovidCases numeric, 
       ClustersNotified numeric, 
       HospitalisedAged5 numeric, 
       HospitalisedAged5to14 numeric, 
       HospitalisedAged15to24 numeric, 
       HospitalisedAged25to34 numeric, 
       HospitalisedAged35to44 numeric, 
       HospitalisedAged45to54 numeric, 
       HospitalisedAged55to64 numeric, 
       Male numeric, 
       Female numeric, 
       Unknown numeric, 
       Aged1to4 numeric, 
       Aged5to14 numeric, 
       Aged15to24 numeric, 
       Aged25to34 numeric, 
       Aged35to44 numeric, 
       Aged45to54 numeric, 
       Aged55to64 numeric, 
       Median_Age numeric, 
       CommunityTransmission numeric, 
       CloseContact numeric, 
       TravelAbroad numeric, 
       FID numeric, 
       HospitalisedAged65to74 numeric, 
       HospitalisedAged75to84 numeric, 
       HospitalisedAged85up numeric, 
       Aged65to74 numeric, 
       Aged75to84 numeric, 
       Aged85up numeric, 
       DeathsCumulative_DOD numeric, 
       DeathsToday_DOD numeric, 
       SevenDayAvg_Cases numeric
       );
       
\copy cases from 'covid.csv' delimiter ',' csv header;

