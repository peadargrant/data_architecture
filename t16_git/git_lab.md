Local source control lab
========================

0. Switch to using notepad as editor 
	git config --global core.editor notepad
	
1. Locate at least 2 files (python, CSV, .txt)
2. Put in a few folder
3. Initialise a git repository in the folder.
	git init
	
4. Add + commit the 2 related files with the message 'initial commit' (-m)
5. See what happens if you make a change to file (git status)
6. Get git to show the differences (git diff) 

7. Add + Commit the change you made with a message.

8. Do from step 5 onwards but revert the change.


Remote source control lab
=========================

1. Go to https://gitlab.comp.dkit.ie with DkIT username/password.
2. Create new project (blank). TURN OFF ADD A README file. 
3. Copy project URL
4. git remote add origin https://gitlab.comp.dkit.ie/grantp/analysis
5. git push -u origin master
6. check that you can see your code by refreshing gitlab page

