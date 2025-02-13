% Data Architecture CA1

**Weight:** 35%

**Deadline:** as displayed on Moodle

# Deliverables

Your work must be presented in a GitLab Repository on the [school GitLab server](https://gitlab.comp.dkit.ie/) named *exactly* `data_arch_ca1`.
Repositories named otherwise will *not* be marked and you will receive zero.
You must add user `grantp` with Developer access to your repository so that I can download and mark it after the deadline.

I will not accept work by Moodle submission or by e-mail.

## Aim (10%)

You must supply a `README.txt` (plain text, not word or PDF) file that contains the following information:

-   A brief (1 paragaph) introduction summarising the data source you will be using.

-   Links to where the data sources may be obtained from.

-   3-5 specific outputs / functionality.


## Database design (20%)

Data should be analysed with a view to normalising to at least 3NF.
ER diagram to show normalised entities and relationships This can be hand-drawn, drawn on a computer or produced from a database tool.
ER diagram must be single page, A4, PDF named `er_diagram.pdf`.


## Database setup (30%)

Write appropriate SQL to generate table(s) suitable to load data into.
Table(s) should be defined in file `database_setup.sql`.
You can either write the SQL directly or use the DUMP tool to export your interactive work. 

For full marks, tables should have:

-   correct column names
-   suitable data types set on columns
-   primary key set explicitly in Database
-   constraints: NOT NULL, UNIQUE, CHECK as appropriate.
-   other suitable features such as generated columns if needed


## Data Load (20%)

Write a bash script to load data into your database from the source files `data_load.sh`.
You must include your raw data file (CSV, XML, JSON, etc) in your submission.
This can call any program(s) you like to populate the database (e.g. SQL files, Python scripts).


## Python data access program (20%)

You are to provide a Python program to query / access / update the database.
This should be able to run on either the shared database server OR on the lab PC environment. 

You may employ pandas (and any other Python modules) but you should try to select only the data needed from the database.
It should permit the user to generate outputs identified in your README file.
You may use either interactive prompting (basic) and/or command-line arguments (better).


# Submission

Ensure that you have *committed* and *pushed* your work to GitLab by the deadline above.
It will be automatically collected after that date.


# Demonstration

You are required to demonstrate your solution functioning following submission.
Demonstrations will be scheduled by the lecturer during lab time.
Failure to demonstrate your solution will result in zero grade.


# Feedback

Summary feedback will be supplied with your grade on Moodle and/or via GitLab.
