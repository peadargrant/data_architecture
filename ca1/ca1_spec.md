Introduction
============

This CA is designed to showcase and integrate your work in Data
Architecture during Semester 1.

**Weight:** 35%

**Deadline:** as displayed on Moodle

Deliverables
============

Deliverables are to be contained in a single ZIP file named `data_ca1.zip`.

Your work should be done on the shared database server. If work is done
elsewhere, note that testing/grading will be done on shared DB server.

Problem identification (5%) {#sec:problem-identification}
---------------------------

You must supply a `README.txt` (plain text, not word or PDF) file that
contains the following information:

-   A brief (1 paragaph) introduction summarising the data sources you
    will be using.

-   Links to where the data sources may be obtained from.

-   3-5 specific outputs you will be able to show from your data.

Data downloading (5%)
---------------------

Choose an appropriate data set from any online source. You will find it
easiest to work with CSV-based data sets, but there is no restriction on
what you can use.

If you choose not to undertake this section you should put an empty
`data_download.sh` file in that contains a link to the dataset chosen as
a comment, and supply the initial data in your zip file.

Table definition (10%)
----------------------

Write appropriate SQL to generate table(s) suitable to load unnormalised
initial data into. Table(s) should be defined in file
`initial_tables.sql`.

For full marks, tables should have:

-   correct column names

-   suitable data types set on columns

-   primary key set explicitly in Database

-   constraints: NOT NULL, UNIQUE, CHECK as appropriate.

-   generated columns if needed

Data Load (10%)
---------------

Write appropriate SQL to load data into your database `data_load.sql`. 

You should provide evidence that the loading has succeeded, in the form
of a table description, query output for number of rows etc. This should
be copied into a file named `load_verification.txt`.

Normalisation (20%) {#sec:normalisation}
-------------------

Data should be analysed with a view to normalising to at least 3NF.

ER diagram to show normalised entities and relationships This can be
hand-drawn, drawn on a computer or produced from a database tool. ER
diagram must be single page, A4, PDF named `er_diagram.pdf`.

Normalisation operations (20%)
------------------------------

SQL Operations to normalise the data to form shown in ER diagram in must
be given in file `normalise.sql`.

-   Normalisation operations must be done entirely through SQL.

-   Use table copy, subselects, temporary tables, views etc as needed.

-   It is OK to relax constraints to normalise and then reapply.

You should provide evidence that the loading has succeeded, in the form
of a table description, query output for number of rows etc. This should
be copied into a file named `normalisation_verification.txt`.

Queries (30%)
-------------

Implement queries to present outputs identified in your README file.
To achieve maximum marks you should:

-   Utilise appropriate constructs: aggregate functions, subselects,
    case, window functions, group by etc.

Submission
==========

Submission of single ZIP file `data_ca1.zip` to Moodle must be made by deadline date.
Use `ca1_checks.ps1` to confirm your ZIP file is acceptable.

Feedback
========

Written feedback will be supplied with your grade. Verbal feedback is
available upon request.

Queries
=======

Queries on this CA should be addressed to the module Q&A forum on
Moodle.
