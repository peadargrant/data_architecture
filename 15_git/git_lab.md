# Git lab 

# Task 0: Project folder

On the server, create a folder called `analysis_project` directly in your home directory.
Change into this folder.
Prompt should look like: `grantp@datalab:~/analysis_project$`


# Task 1: Download data file

Use `curl` to download the CSV file at: 

	curl -o cities.csv https://raw.githubusercontent.com/joelacus/world-cities/refs/heads/main/world_cities.csv
	
	
# Task 2: Create python program
	
Create a python programe named `analyse_cities.py` similar to: 

	#!/usr/bin/env python3

	# import the pandas module
	import pandas as pd

	# data frame from CSV
	df = pd.read_csv('cities.csv')

	# show the 20 most northern cities
	print(df.nlargest(20,['lat']))
	
Exit the editor and check that the program runs when called: 

	python3 analyse_cities.py 
	

# Task 3: Repository setup 

Start tracking the folder in git

	git init
	
	
Show the respository status

	git status
	
	
Add a file to git using the command: 

	git add cities.csv
	
Do the same to add the python program as well.
Run

	git status 
	

# Task 4: Ignore files

We don't want the files ending in ~ which are editor backup files. 

Put filenames and/or patterns to ignore in the .gitignore file .
Use the asterisk to wildcard match.
Your .gitignore file should have (to begin with) 

	*~

Make sure to test using `git status`.

Add the .gitignore file to git. 


# Task 5: Configure Git

Set up git (once) to:

	git config --global user.name "Your name here"
	git config --global user.email "Your email here"


# Task 6: Commit changes

Commit files added by using

	git commit
	
Editor will open.
Type a short message to describe the commit.


### Shorter form

	git commit -m "added some comments and readme file"
	

# Task 7: Make some changes

Make some changes to the Python program or csv file. 
Show the differences using

	git diff filename
	
If you don't specify the filename it will show all changes across all files. 

Commit your changes with a message as before. 


