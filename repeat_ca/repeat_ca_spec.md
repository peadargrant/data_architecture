% Data Architecture Repeat CA

**Final submission due:** 31st August

**Weight:** 100%

The Repeat CA replaces in its entirety the Data Architecture.

This CA is designed to showcase and integrate your work in Data
Architecture during Semesters 1 and 2.
You can use PostgreSQL, Neo4J or MongoDB or any combination of them for the exercise.

# Deliverables

Supply a single ZIP file `repeat_ca.zip` (not .rar) with the necessary files
included. File names are case-sensitive. Where multiple formats are
accepted, the first matching will be taken and others ignored.

Your submission must have a `README.txt` file with your student number
and name in it. If any specific notes regarding setup are required,
place them in `README.txt`. It will otherwise be assumed that any `sql`
files are for PostgreSQL, `py` files are for Python3.8 as on the shared
server and `.sh` files are for bash on Amazon Linux on the shared
server.

## Dataset identification (10%)

In the file `dataset.txt` you should provide:

1.  The name of the dataset(s)

2.  A summary of what is included in the dataset(s)

3.  Summary of what types of data they contain and what queries/analyses
    you plan on performing on that data.

## Database architecture (20%)

In the file `architecture.pdf` (max 1 page) you should show:

1.  The database(s) you plan to use for storage.

2.  Where the data is loaded from.

3.  Any transformations or scripts to load the data to the
    database (e.g. cleansing in pandas)

4.  The database schema (e.g. E-R diagram) itself.

5.  Connections to/from the database for Time Series Analysis module

## Cloud setup (20%)

Set up an EC2 server on AWS.
Provide evidence in the form of screenshots.
At least one must be of the SSH session connecting to the server named `screenshot.png`. 
Use this EC2 server to host your database server and related software.

## Server setup (20%)

You should set up your required database server, Python modules and other software. 
Provide evidence in the form of an (edited) `bash_history.sh` file.
You may also include screenshots and any other text files you feel are relevant.

## Database setup (20%)

Setup commands required to setup your database and load data must be given in
`setup.py`. 

## Analysis (10%)

You are required to replicate at least two analyses from your Time
Series Analysis using SQL programming. 
Analysis should be demonstrated from Python in the file `analysis.py`. 


# Demonstration

You may be asked to demonstrate your developed system after submission for verification. 


