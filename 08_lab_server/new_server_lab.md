% Lab server lab

There is a new lab server for use from this week.
The new machine is a Dell R230 in the rack in the lab.
The configuration is similar to the existing shared machine.

The existing `data.comp.dkit.ie` system will remain available.

You have a user account on the new machine with the same username as the existing one.

# Task 0: Login to new server

SSH to:

	ssh yourname@10.200.172.60

Login with the default password given during class.


# Task 1: Change your password

For now, this machine is setup for password authentication.
This may be changed at a future date to key-only.

Use the `passwd` command to change your password.

	passwd
	
It will ask for the existing (default) password and a new one.
You should use a *different* password than for your DkIT account.

Students who do not change their password will have their accounts disabled at the end of the lab.

