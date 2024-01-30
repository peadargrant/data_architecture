Data Architecture CA1
=====================

**Weight:** 35%

**Deadline:** as displayed on Moodle


Deliverables
============

Your work is to be delivered in a GitLab repository on the School GitLab server.
Your repository must be named data_arch_ca1 exactly.

Your work should be done on the shared database server.
If work is done elsewhere, note that testing/grading will be done on shared DB server.

Aim (10%)
--------

You must supply a `README.txt` (plain text, not word or PDF) file that contains the following information:

-   A brief (1 paragaph) introduction summarising the data source you will be using.

-   Links to where the data sources may be obtained from.

-   3-5 specific outputs / functionality.


Database design (20%)
---------------------

Data should be analysed with a view to normalising to at least 3NF.

ER diagram to show normalised entities and relationships This can be hand-drawn, drawn on a computer or produced from a database tool.
ER diagram must be single page, A4, PDF named `er_diagram.pdf`.


Database setup (10%)
--------------------

Write appropriate SQL to generate table(s) suitable to load data into. Table(s) should be defined in file `database_setup.sql`.

For full marks, tables should have:

-   correct column names

-   suitable data types set on columns

-   primary key set explicitly in Database

-   constraints: NOT NULL, UNIQUE, CHECK as appropriate.

-   other suitable features such as generated columns if needed


Data Load (20%)
---------------

Write a Python script to load data into your database `data_load.py`. 

You must include your raw data file (CSV, XML, JSON, etc) in your submission.

Alternatively your data loading program can load data directly from the internet. 


Python query program (30%)
--------------------------

You are to provide a Python program `data_query.py` to query the database. 
You may employ pandas but you should try to select only the data needed from the database.
It should permit the user to generate outputs identified in your README file.
You may use either interactive prompting and/or command-line arguments.

Version control (10%)
---------------------

Your git repository should have a number of meaningful atomic commits with appropriate messages.



Submission
==========

You must add the lecturer Peadar.Grant@dkit.ie as a Developer on your repository.
Submissions will automatically be collected after the deadlinee passes.


Demonstration
=============

You may be required to demonstrate your solution functioning following submission.
Failure to demonstrate your solution will result in zero grade.


Feedback
========

Summary feedback will be supplied with your grade on Moodle.
Verbal feedback is available upon request.


Academic integrity
==================

You are reminded of DkITs academic integrity policies, which will be applied in full.
