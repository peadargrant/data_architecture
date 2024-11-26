% VPN access lab

The VPN service enables you to connect to the shared database server from outside the lab. 

# Requirements

To connect from outside or from WiFi you will need:

- Currently supported Windows or Mac computer
- Linux apparently works but I have not tested it
- Android or iOS device and a suitable SSH app (e.g. Termius, others available)

**Important note:**
I can only directly support the use of lab computers in the lab to connect to the shared server.
Your own device's configuration is your own responsibility.


# Usage guidance

The VPN service is designed solely for accessing specified learning and teaching resources from remote locations, specifically the data architecture shared server at 10.200.172.60.
You are not authorised to use it for any other purpose.

The VPN service is provisioned through hardware and software that has limits on concurrent users:
- As a consideration to your fellow students please connect only when needed for working and disconnect immediately afterwards.
- Please continue to use lab computers for in-class work.

Repeated authentication failures to the shared server will activate the fail2ban block for approx 10 minutes, which will drop any further connections from your IP address.

Issues with the VPN or shared server should be reported to me (your lecturer) by e-mail with as much detail as possible.
Queries raised outside of normal working hours will be dealt with on the next working day where possible.

Students who abuse the VPN service will be removed from it, and may face further sanctions for breaches of the IT Policies.


# Setup and connection

## Task 0: Log in to the VPN server

Open a new web browser window and navigate to [https://dkitvpn.dkit.ie/](https://dkitvpn.dkit.ie).

Log in with your DkIT username, password and 2FA.


## Task 1: Download MotionPro client (first-time only)

You will need to install the MotionPro client, through the link on the VPN page.

This is supported for Windows and Mac.


## Task 2: Connect to VPN network

Under the *VPN Network* heading hit the *Connect* button.

(The DesktopDirect button has no function for this module.)


## Task 3: Connect to the server

On Windows or Mac, open Windows Terminal / Terminal.app and connect to the server as normal:

	ssh username@10.200.172.60

The username and password here is the one you created on the shared server, *not* your DkIT one.


## Task 4: Disconnect

When you are finished working with the VPN please disconnect to conserve capacity for your fellow students.

Click the *Disconnect* button under *VPN Network*.
