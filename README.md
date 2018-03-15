"# ORACLE-SQL-Movie-Rental-Store" 
This file is my final project for my Oracle Database and Design class that I took Spring 2017.

The file uses Oracle Database to create a database on the iAcademy3 interface, and populate it with data.

First, the schema attempts to drop all tables that the file will work on in the future. This includes the tables "r_customers", "r_rental_history", "r_media", "r_movies", "r_actors", and "r_star_billings".

Second, the schema creates the templates for the tables. This includes identifying primary, secondary, and foreign keys, identifying unique values, and the constraints. Lastly in this step, the schema attaches foreign keys to the tables that need them. This continues for each of the tables. 

Third, the schema populates each table. For the "r_customers" table, I used random name, phone number, and address generators. I then created "fake" emails using the first letter of the random first name and the entirity of the last name. For example: "Kyle McSmith" has the email "kmcsmith@students.deltacollege.edu". 

For the "r_movies" table, I used real movies that already exist and populated those tables with as much real, accurate data as I could find. Fields such as name, release date, title, description, genre, and rating were mostly pulled from IMDb.
For the "r_media" table, I hand-picked IDs to use for the "media_id" and "movie_id" columns. "media_id" starts at 100 and goes to 118, while "movie_id" starts at 1000, and goes to 1007.
For the "r_actors" table, I used IMDb to make sure as much data was accurate as possible. Again, this table was populated with actual actors.
For the "r_rental_history" table, I populated it by hand. Nothing particular fancy or difficult here. The hardest part was making sure the start date and return dates made sense. No getting a movie on March 4th and returning it March 2nd. Unless you're a timewizard, then go ahead I suppose. I can garauntee the clerk isn't paid enough to deal with time-traveling wizards though.
For the "r_star_billings" table, I again used IMDb to populate the fields. Same concept with the primary and secondary keys as in the "r_media" table, where one started at "1" and the other column started at "1000" in order to more easily differentiate the two.
