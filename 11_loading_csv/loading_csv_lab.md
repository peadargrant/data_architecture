% Loading CSV lab

# Task 0: Login to server

Make sure you are connected to the *new* server.


# Task 1: Download the world cities database

Use the `curl` utility to download the world cities database from:

	curl -o worldcities.zip https://simplemaps.com/static/data/world-cities/basic/simplemaps_worldcities_basicv1.77.zip
	

# Task 2: Unzip the world cities database

On unix we can use the `unzip` utility to extract the ZIP archive:

	unzip worldcities.zip
	

# Task 3: Examine the world cities database

You can print out the CSV file using `cat` :

	cat worldcities.csv
	
If you want to pause the output at the top so you can navigate it you can pipe it into the `less` program:

	cat worldcities.csv | less
	
Carefully note the column names, data types, etc.


# Task 4: Create a table to hold the data

Connect to your `psql` database using

	psql

Issue the correct SQL statement to create a table named `cities` that has a column corresponding to each column in the CSV.


# Task 5: Copy the data

In PSQL, use a client-side copy to copy the data from the CSV file into the table

	\COPY cites FROM 'worldcities.csv' DELIMITER ',' CSV HEADER;

Depending on error(s) that occur, you may need to delete and re-create the `cities`  table.


