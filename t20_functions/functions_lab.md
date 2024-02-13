# Stored functions lab

1. Load the `worldcities.csv` from the `datasets` folder into your own psql database.

2. Create a user-defined function called `distance_between` to report the distance in km from one city to another.
   Excel equivalent formula:

```
Excel equivalent formula:
=ACOS((SIN(RADIANS(Lat1)) * SIN(RADIANS(Lat2))) + (COS(RADIANS(Lat1)) * COS(RADIANS(Lat2))) * (COS(RADIANS(Lon2) - RADIANS(Lon1)))) * 6371
```

3. Modify your function to RAISE an error if city is not found.

