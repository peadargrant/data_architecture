---
title: Multi-table Queries lab
---

# France 

1.  Use `psql` to connect to the `france` database.

2.  Use the client command `\d` to describe all the database objects.

3.  Use the `\d towns` command to describe the `towns` table. Do the
    same for the other two tables. From the foreign key / referencing
    information, draw the relationship between the tables on paper.

4.  Write a query to count the number of towns. Similarly the number of
    regions and departments.

5.  Construct a query to summarise the number of towns, regions and
    departments in a single result set. Use the `UNION` clause to
    combine similar result sets. Use the `AS` clause to name columns as
    needed. The output should be:

            entity    | count
         -------------+-------
          towns       | 36684
          regions     |    26
          departments |   100
          (3 rows)

6.  Construct a query to list the regions by id ascending showing only
    the `id`, `code` and `name` for regions with `id` less than 7,
    ordered by `region_name`. You will need to use an `ORDER BY` clause.
    Output must be exactly:

         region_id | region_code |    region_name
        -----------+-------------+-------------------
                 6 | 21          | Champagne-Ardenne
                 1 | 01          | Guadeloupe
                 3 | 03          | Guyane
                 5 | 11          | Île-de-France
                 4 | 04          | La Réunion
                 2 | 02          | Martinique
        (6 rows)

    []{#step:region-list label="step:region-list"}

7.  Write down the column names that link the `departments` and
    `regions` tables.

8.  Modify the query from
    Step [\[step:region-list\]](#step:region-list){reference-type="ref"
    reference="step:region-list"} to show the number of departments in
    each region. You will need to use a `JOIN` clause.

         region_id | region_code |    region_name    |  department_name
        -----------+-------------+-------------------+-------------------
                 6 | 21          | Champagne-Ardenne | Ardennes
                 6 | 21          | Champagne-Ardenne | Aube
                 6 | 21          | Champagne-Ardenne | Haute-Marne
                 6 | 21          | Champagne-Ardenne | Marne
                 1 | 01          | Guadeloupe        | Guadeloupe
                 3 | 03          | Guyane            | Guyane
                 5 | 11          | Île-de-France     | Essonne
                 5 | 11          | Île-de-France     | Hauts-de-Seine
                 5 | 11          | Île-de-France     | Paris
                 5 | 11          | Île-de-France     | Seine-et-Marne
                 5 | 11          | Île-de-France     | Seine-Saint-Denis
                 5 | 11          | Île-de-France     | Val-de-Marne
                 5 | 11          | Île-de-France     | Val-d'Oise
                 5 | 11          | Île-de-France     | Yvelines
                 4 | 04          | La Réunion        | La Réunion
                 2 | 02          | Martinique        | Martinique
        (16 rows)

    []{#step:regions-and-departments
    label="step:regions-and-departments"}

9.  Starting with your query from
    Step [\[step:regions-and-departments\]](#step:regions-and-departments){reference-type="ref"
    reference="step:regions-and-departments"}, modify so that it counts
    the number of departments per region. You will need use the
    `GROUP BY` clause. Output should be exactly:

         region_id | region_code |    region_name    | number_of_departments
        -----------+-------------+-------------------+-----------------------
                 6 | 21          | Champagne-Ardenne |                     4
                 1 | 01          | Guadeloupe        |                     1
                 3 | 03          | Guyane            |                     1
                 5 | 11          | Île-de-France     |                     8
                 4 | 04          | La Réunion        |                     1
                 2 | 02          | Martinique        |                     1
        (6 rows)

    []{#step:number-of-departments-per-region
    label="step:number-of-departments-per-region"}

10. Modify the query from
    Step [\[step:number-of-departments-per-region\]](#step:number-of-departments-per-region){reference-type="ref"
    reference="step:number-of-departments-per-region"} to exclude
    regions with less than 2 departments. You will need to use a
    `HAVING` clause. Output should be exactly:

         region_id | region_code |    region_name    | number_of_departments
        -----------+-------------+-------------------+-----------------------
                 6 | 21          | Champagne-Ardenne |                     4
                 5 | 11          | Île-de-France     |                     8
        (2 rows)

    []{#step:number-of-departments-per-region-not-1
    label="step:number-of-departments-per-region-not-1"}

11. Modify the query from
    Step [\[step:number-of-departments-per-region-not-1\]](#step:number-of-departments-per-region-not-1){reference-type="ref"
    reference="step:number-of-departments-per-region-not-1"} so that it
    shows instead the number of towns in each region from the entire set
    of regions, ordered to show regions with the highest number of towns
    first. You will need an additional `JOIN` clause. Output should be
    exactly:

         region_id | region_code |     region_name      | number_of_towns
        -----------+-------------+----------------------+-----------------
                20 | 73          | Midi-Pyrénées        |            3020
                22 | 82          | Rhône-Alpes          |            2879
                13 | 41          | Lorraine             |            2339
                19 | 72          | Aquitaine            |            2296
                 7 | 22          | Picardie             |            2292
                11 | 26          | Bourgogne            |            2046
                 6 | 21          | Champagne-Ardenne    |            1948
                 9 | 24          | Centre               |            1842
                10 | 25          | Basse-Normandie      |            1812
                15 | 43          | Franche-Comté        |            1786
                12 | 31          | Nord-Pas-de-Calais   |            1546
                24 | 91          | Languedoc-Roussillon |            1545
                16 | 52          | Pays de la Loire     |            1502
                18 | 54          | Poitou-Charentes     |            1464
                 8 | 23          | Haute-Normandie      |            1420
        (15 rows)
