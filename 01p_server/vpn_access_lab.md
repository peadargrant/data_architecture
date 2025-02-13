% VPN lab

The VPN service enables you to connect to some resources on campus, mainly a shared linux server, but later on some more machines, from outside the lab. 

This lab will show you how to connect to the lab VPN.
You'll have to repeat most of the steps here to connect to the lab VPN and disconnect from it when finished working.


# How it works

A VPN is essentially the same as theoretically plugging a long network cable into one of the network jacks in the lab.
It tunnels traffic through your computers existing WiFi or ethernet connection via the internet to a gateway located in DkIT.
Your computer temporarily gets an additional virtual IP address that is within a DkIT range.


# Requirements

To connect from outside or from WiFi you will need:

- **Supported:** Windows or Mac computer
- **Unsupported:**
  - Linux apparently works but I have not tested it
  - Android or iOS device and a suitable SSH app (e.g. Termius, others available)


# Usage guidance

The VPN service is designed solely for accessing specified learning and teaching resources from remote locations.
You are not authorised to use it for any other purpose.

You are free to use the VPN during class time and outside of class time for your own private study.

As with connecting to any network you should ensure that your computer is reasonably secure and patched.
You may need to consider what network accessible services (if any) are running from your own computer.

The VPN service is provisioned through shared hardware and software that has limits on concurrent users:
As a consideration to your fellow students please connect only when needed for working and disconnect immediately afterwards.

Issues with the VPN should be reported to me (your lecturer) by e-mail with as much detail as possible.

Students who abuse the VPN service will be removed from it, will be unable to complete required class work and may face further institutional sanctions for breaches of the IT Policies.


# Task 1: Log in to the VPN gateway (every day)

Open a new web browser window and navigate to [https://dkitvpn.dkit.ie/](https://dkitvpn.dkit.ie).

Log in with your **DkIT** username, password and 2FA.


## Task 2: Download and Install MotionPro client (first-time only)

You will need to install the MotionPro client, through the link on the VPN page.

Once the MotionPro client is installed you don't need to open it.
It'll launch automationally from a link on the web site.


# Task 3: Connect to VPN network (every day)

Under the *VPN Network* heading hit the *Connect* button.
This will launch the separate MotionPro application to setup the VPN tunnel. 
It should show an IP address at the bottom. 

(The DesktopDirect button has no function for this module so you can ignore it.)


# Task 4: Test connectivity (first-time only and in case of issues)

Open Windows Terminal.
Navigate to the folder where this page is.

Use the supplied PowerShell script to test connectivity:

	./test_connectivity.ps1

It tries to connect to the database server that we will discuss later on.
You should see the message printed in green:

	your connection is ok.
	
If this doesn't appear then ask for help.


# Task 5: Using the VPN

At this point you can use the resources you need through the VPN.


## Connect over SSH to the server

Here we'll connect to the shared server named `dblab` using the command:

	ssh yourname@10.200.172.60
	
Connect using the **server username** assigned to you and the temporary password given in class.
Note that in UNIX generally you don't get asterisks for password entry.
It looks like the entry is being ignored but it is going in!


## Changing your server password

Change your server password using the command

	passwd

Following the prompts that appear.
Similar to the logon password, you don't get asterisks for password entry.
It looks like the entry is being ignored but it is going in!


## Task 5: Disconnect

When you are finished working with the VPN please disconnect to conserve capacity for your fellow students.

Click the *Disconnect* button under *VPN Network*.
