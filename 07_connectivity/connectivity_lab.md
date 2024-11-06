% Connectivity Lab exercise

# Reminders on usage

## Text file (e.g. Python)

To open a new or existing text file in the emacs editor type: 

	emacs name_of_file.py
	
## Save in emacs

	Ctrl-X Ctrl-S
	
## Quitting emacs

	Ctrl-X Ctrl-C

## How to run Python program

	python3 name_of_file.py
	


# France database queries

1.  Write a python program that connects to the `france` database. It
    should print out the number of towns, regions and departments. The
    output should be:

        towns: 36684
        regions: 26
        departments: 100

2.  In `psql`, construct an SQL query to show the following informatin
    for a particular region. Example here is region 26.

         department_code | department_name | n_towns 
        -----------------+-----------------+---------
         21              | Côte-d'Or       |     707
         58              | Nièvre          |     312
         71              | Saône-et-Loire  |     573
         89              | Yonne           |     454
        (4 rows)
		
3.  Construct a program in Python that will take a region number and will display the same information:

        21 Côte-d'Or (707)
        58 Nièvre (312)
        71 Saône-et-Loire (573)
        89 Yonne 454

4.  Write a python program that displays all regions. It requests the
    code of a region of a region. It should then list out the
    departments within that region (name and code) and the number of
    towns in each department.

        number of regions: 26
        Alsace [42]
        Aquitaine [72]
        Auvergne [83]
        Basse-Normandie [25]
        Bourgogne [26]
        Bretagne [53]
        Centre [24]
        Champagne-Ardenne [21]
        ... (omitted from handout)
        Enter region code: 26
        number of departments: 4
        21. Cote-d'Or [707]
        58. Nievre [312]
        71. Saone-et-Loire [573]
        89. Yonne [454]


# Task manager (homework)


1.  Construct a task manager (tasks, projects) \[ datatypes, null/not
    null, keys, foreign keys, domains + enumerated types \] for
    yourself. (Alternatives: expense tracker, sports score, track
    exercise - anything with \*2\* or more tables.) Set up the tables
    using psql.

2.  If you haven't already, set a password using psql's `\password`.

3.  Write Python program (in nano, emacs, vim) to:

    1.  Allow user to create either a new task or a new project

    2.  If a new project, get the name & then exit.

    3.  If a new task, display list of projects.

    4.  Ask user to choose which project new project task belongs to.

    5.  Ask user name of new task.

    6.  Then ask to save or not. If yes, commit, if not, rollback.

4.  Write another Python program to display a query using Pandas (for
    example a VIEW showing tasks and their projects JOINed).
