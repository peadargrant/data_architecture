% Data Architecture CA2

**Final submission due:** as displayed on Moodle

**Weight:** 35%

This project is to be done individually.

Introduction
============

This CA is designed to showcase and integrate your work in Data
Architecture during Semester 2.

You can use PostgreSQL, Neo4J or MongoDB or any combination of them for the exercise.

Deliverables
============

Your submission must be in a git repository named `data_arch_ca2` on the gitlab server https://gitlab.comp.dkit.ie/ .
You must add `grantp` as a Developer on the repository in advance of the deadline.
Submissions will be collected from gitlab after the deadline has passed.

File names are case-sensitive. Where multiple formats are
accepted, the first matching will be taken and others ignored.

Your submission must have a `README.txt` file with your student number
and name in it. If any specific notes regarding setup are required,
place them in `README.txt`. It will otherwise be assumed that any `sql`
files are for PostgreSQL, `py` files are for Python3.8 as on the shared
server and `.sh` files are for bash on the shared server.

Dataset identification (10%)
----------------------------

In the file `dataset.txt` you should provide:

1.  The name of the dataset(s)

2.  A summary of what is included in the dataset(s)

3.  Summary of what types of data they contain.

4.  What queries/analyses/operations you plan on performing on that data.


Database architecture (20%)
---------------------------

In the file `architecture.pdf` (max 1 page) you should show:

1.  The database(s) you plan to use for storage.

2.  Where the data is loaded from.

3.  Any transformations or scripts to load the data to the
    database (e.g. cleansing in pandas)

4.  The database schema (e.g. E-R diagram) itself.

5.  Connections to/from the database for Time Series Analysis module


System and database setup (10%)
-------------------------------

Set up of server(s) on your laptop, shared server, cloud hosts etc.
Provide evidence in the form of screenshots, text files etc. 
You should set up your required database server, Python modules and other software. 


Data loading (30%)
------------------

Python file to load data into database
Recommendations:

- Better to load data from API / web scraping than file.
- Consider work done in BeautifulSoup library or similar.
- Should be able to be re-run multiple times. 


Analysis (30%)
--------------

You are required to implement at least 3 data analyses using Python in conjunction with your databases.
To maximise grades:
- Use the Python libraries correctly for your chosen Database(s)
- Employ good programming practices (command-line handling etc)
- Don't hard-code analyses - instead use user input. 


Use of version control (10%)
----------------------------

To get full marks you must have evidence of iterative / ongoing work. 



Demonstration
=============

You must demonstrate your developed system during the final week of term.. 

