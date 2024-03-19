# Cron lab

## Setup

On your XOA virtual machine:

1. Login over SSH.
2. cd into `tools_for_sd` and use `git pull --rebase` to update it.
3. cd into `tools_for_sd_labs` and use `git pull --rebase` to update it also.
4. Make a `lab10` folder and change into it.
5. Change back in to your home directory.
6. Confirm using `pwd` that you are in `/home/administrator`.


## Basic script

Compose a basic script called `status_update.sh` using `emacs` with the following specification:

Execute the following commands in order (you will have to discover / look up the appropriate commands and their switches):

1. Print the date and time
2. Print a 1-line description of the operating system version. 
3. Print out the disk usage of the machine in human-readable form (MB, GB etc).
4. List out the users currently logged in to the system
5. Print out the IP configuration

Make the appropriate changes so that you can run your script from Bash as `status_update.sh`. 


## Basic cron job

We are now going to run your script as a cron job.
To do this we need to edit the crontab file.

We do this using the `crontab -e` command that will launch an editor with a temporary copy of the crontab file.
When we save and exit, the cron system verifies that the crontab is correctly formatted.
(A similar pattern exists with certain files that configure `sudo`, `passwd` and others.)

Write an appropriate cron expression to:
Run the `status_update.sh` script every minute, directing the output to a file `latest_status.txt`.

Confirm that this functions correctly.
Don't move on until this works.


## Improved cron expression

Alter the cron expression to run the status update script every 5 minutes between 9AM-1PM Monday to Friday during the month of March.


## Submission

1. Change directory to `~/tools_for_sd_labs/lab10` folder.
2. Copy the files:
   - `status_update.sh`
   - `latest_status.txt`
   to this folder.
3. List out your cron jobs and re-direct this to a file `cron_jobs.txt`. 
4. Use `git add` to add the files in this folder to git.
5. Commit using `git commit -m 'message'` replacing 'message' with a suitable short message.
6. Push your commit(s) to GitLab using `git push`.

