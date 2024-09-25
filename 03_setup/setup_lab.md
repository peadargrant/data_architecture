% Data architecture setup lab

This lab sets up your client environment for the majority of this module.

The labs in this course will use a number of technologies in both command-line and graphical environments.
Some resources will run on your local computer, others remotely on-site and others in the cloud.

Here you will setup your lab PC environment and familiarise yourself with key operations we will use each week.
The lab PCs have most of the software required already installed.

We will use a shared Linux server for some of our work in this module.
This will be accessed via *SSH* at `data.comp.dkit.ie`.


# Task 1: SSH key pair generation

Instead of a password, we'll use a key pair to access the shared server.
To create a key pair on the local machine you should use:

	ssh-keygen -t ed25519
	
Just press enter and let it create the key pair.
No need for a passphrase (unless you want to).


# Task 2: Sign-up for account on server

## Connect to the sign-up account

SSH to the sign-up user at:

	ssh signup@data.comp.dkit.ie

Wait until you see the prompt

	signup@data.comp.dkit.ie's password: 

Enter the password given by the lecturer in class.
This will *not* echo to the screen.

## Accept the usage conditions

Enter `y` to accept the usage conditions.

## Choose desired username

At the first prompt enter your desired username (should NOT be your student number). No spaces, all lowercase.

## Paste your public key in

Copy your SSH key in full from:

	~/.ssh/id_rsa.pub
	
You can do this using:

	Get-Content ~/.ssh/id_rsa.pub | Set-ClipBoard
  
Paste your SSH key in full at the second prompt and press enter.

## Complete the request

If your request is successful you'll get a confirmation message.


# Task 3: Wait for approval

The account creation process is manual.
The lecturer will tell you when this is complete.


# Task 4: Log in to server

When you have received confirmation from the lecturer that your account has been created, you can log in by SSH to:

	ssh yourname@data.comp.dkit.ie

Once you have this done you can close the window.


