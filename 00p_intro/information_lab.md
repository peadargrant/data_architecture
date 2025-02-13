% Applied Data Architecture Module Information


# Key information

**Lecturer:** Dr Peadar Grant

[Moodle page](https://2425-moodle.dkit.ie/course/view.php?id=4715)



# Online delivery

Class will be delivered online using the Zoom platform.

We will use the same Zoom link for all sessions.

As with in-person classes, students are expected to attend regularly and in full for scheduled class sessions:
- To aid review, theory portions and some demonstrations from class will be recorded.
- I will not record guided lab-based sessions or discussion classes.

Recordings will be placed on the HEANet media server, and links will be placed in the [recordings text file](../recordings.md) in the git repository. 

Recording is on a best-effort basis.
If there are difficulties with the recording setup on a particular day we will proceed with class anyway. 


# Module descriptor review

[Module descriptor link](https://courses.dkit.ie/index.cfm/page/module/moduleId/72117/)

Items for review include:

- Learning outcomes
- Indicative content
- Assessment


# Discussion questions

1. What database(s) have you used to date?

2. Did you run the database engine on your local machine or connect to a remote server?

3. What way did you interact with the database engine?

4. What way do you normally run / edit Python code?

5. Have you connected programming languages (e.g. Python) directly to your database?

6. Have you experience of using command-line software on Windows? 

7. Have you experience of using linux / UNIX operating systems?  

8. Can you use SSH?

9. Do you know what a VPN is? 

10. Have you workable experience of any the following software packages: PostgreSQL, ActiveMQ, MongoDB, Redis, Neo4J, Kafka?

11. Are you workably familiar with any of the following types of software: object-relational databases, pub/sub messaging systems, document databases, in-memory caches, graph databases, data streaming? 


# Course files

I will be using the `git` source control system to distribute course files. 

## What is git? 

*We'll skip on ahead if familiar with git already*

Git is used widely in the tech sector to:

- Distribute files amongst team members
- Maintain history of changes to files
- Allow concurrent development to be merged
- Track separate concurrent branches of work


## Installing git

First, open your Windows Terminal or Terminal.app on a Mac. 
Type `git` and press enter.
If you see the following help text or similar, then git is installed, and you can skip to the next section.

	usage: git [-v | --version] [-h | --help] [-C <path>] [-c <name>=<value>]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | -P | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           [--super-prefix=<path>] [--config-env=<name>=<envvar>]
           <command> [<args>]

	These are common Git commands used in various situations:

	start a working area (see also: git help tutorial)
	   clone     Clone a repository into a new directory
	   init      Create an empty Git repository or reinitialize an existing one

	work on the current change (see also: git help everyday)
	   add       Add file contents to the index
	   mv        Move or rename a file, a directory, or a symlink
	   restore   Restore working tree files
	   rm        Remove files from the working tree and from the index

	examine the history and state (see also: git help revisions)
	   bisect    Use binary search to find the commit that introduced a bug
	   diff      Show changes between commits, commit and working tree, etc
	   grep      Print lines matching a pattern
	   log       Show commit logs
	   show      Show various types of objects
	   status    Show the working tree status

	grow, mark and tweak your common history
	   branch    List, create, or delete branches
	   commit    Record changes to the repository
	   merge     Join two or more development histories together
	   rebase    Reapply commits on top of another base tip
	   reset     Reset current HEAD to the specified state
	   switch    Switch branches
	   tag       Create, list, delete or verify a tag object signed with GPG

	collaborate (see also: git help workflows)
	   fetch     Download objects and refs from another repository
	   pull      Fetch from and integrate with another repository or a local branch
	   push      Update remote refs along with associated objects

	'git help -a' and 'git help -g' list available subcommands and some
	concept guides. See 'git help <command>' or 'git help <concept>'
	to read about a specific subcommand or concept.
	See 'git help git' for an overview of the system.


### Windows

If you're on Windows, [download the Git installer](https://github.com/git-for-windows/git/releases/download/v2.47.1.windows.2/Git-2.47.1.2-64-bit.exe). 
Run the installer with the default options. 
Then close and re-open windows terminal, type `git` and press enter.
The above message should now print.
If it does not, then ask for help.


### Mac 

If you're on a Mac, install XCode from the App Store. 
Then open terminal and run

	xcode-select --install
	
Close and re-open terminal, type `git` and press enter.
The above message should now print.
If it does not, then ask for help.


### Linux

If you're using linux you will need to install `git` using your package manager.


## Cloning the code repository

Instructions for cloning and updating the git repository are given on Moodle.
