% MSc CA2 spec

**Deadline:** 16/05/2025 21:00

**Weight:** 35%

*NB: This CA is for MSc Data Architecture students only. PgDip students should consult PgDip Project.*


# Introduction

You are to develop a route planning application in Python on the Neo4J database for your choice of public transport system.
You can either provide data for a real system (e.g. Dublin's LUAS, Irish Rail network) or integrate it from elsewhere (e.g. GitHub, Kaggle, etc).


# Deliverables

Python files must be plain `.py` and not `.ipynb` or similar, and should work from the command-line.


## Description (10%)

In your `README.md` file:

- Indicate the specific system(s) / dataset chosen, and the expected outputs from it.
- Provide instructions for running the other script(s) in the repository.
- Indicate what OS and Python versions this work was completed on.


## Data load (20%)

Provide a `data_load.py` script that will load data into your Neo4J database.

You are free to decide how this script retrieves its data. 
Some options:

1. Provide local `.csv`, `.xml`, `.json` or other files with a file named `source.txt` that explains the source or origin data of these files.
2. Directly download them from an online URL (which may be static or provided by an API).
3. Use an LLM to synthesize them directly via an API. *You should discuss this with me first.*

Marks for data loading will be enhanced by:

- Appropriate labelling of nodes and relationships based on source data
- Addition of nodes to enhance representation of relationships
- Storage of appropriate properties for nodes and relationships
- Avoiding redundant storage of information


## Statistics (10%)

Provide a `statistics.py` script that will show:

1. The number of nodes of each label type.
2. The number of relationships of each label type.

Marks for statistics will be enhanced by:

- Identifying additional significant groupings in output
- Employing visualisations e.g. using scipy where appropriate


## Route planner (30%)

Your route planner should be in the `planner.py` script.

It should permit the entry of an origin and destination point by name or publically identifiable number/code (e.g. airport codes).

Marks for the route planner will be enhanced by:

- Using the `argparse`, `click` or similar libraries to provide a robust command-line interface.
- Professional Python program organisation using functions, classes, appropriate control structures, exceptions.
- Formatting the output to enhance usability
- Employing visualisations e.g. using scipy


## Use of version control (10%)

Marks for use of version control will be enhanced by:

- Sensible atomic commits demonstrating clear development steps.
- Evidence of commits happening in line with standard development cycle, not bulk loading towards the end.
- Meaningful clear commit messages
- Use of tags to demarcate milestones


## Additional enhancement (20%)

This section is for an additional enhancement.
Some ideas, but you're free to choose your own:

- Pulling real-time travel information from an online API
- Additional data storage (e.g. document DB, relational DB)
- Significant use of database features beyond class usage, as indicated in comments.
- Storage / recall of preferred routings using a database
- Providing a Python GUI or webapp
- Exporting output to MS Office, HTML or other formats.
- Use of GitLab CI/CD Pipeline features

*You should discuss your planned enhancement with me before starting work. A basic attempt is required here only.*



# Submission

Your work must be presented in a git repository named exactly `data_arch_ca2` on the [school GitLab server](https://gitlab.comp.dkit.ie/).
Submissions will not be accepted via Moodle or email.

You must add `grantp` with *Developer*-level access to your repository so that I can access your work to grade it. 

The most recent commit in advance of the deadline will be taken as your submitted version.


# Feedback

Numerical component grades and summary feedback will be returned on Moodle.

Verbal feedback available on request during consultation period.
