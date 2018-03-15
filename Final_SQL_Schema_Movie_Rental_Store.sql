--SCOTT ALLONBY
--19-MAY-2017
--wipe everything from database
--drop all tables if they exist
DROP TABLE r_customers CASCADE CONSTRAINTS;
DROP TABLE r_rental_history CASCADE CONSTRAINTS;
DROP TABLE r_media CASCADE CONSTRAINTS;
DROP TABLE r_movies CASCADE CONSTRAINTS;
DROP TABLE r_actors CASCADE CONSTRAINTS;
DROP TABLE r_star_billings CASCADE CONSTRAINTS;

--create the tables
--create R_CUSTOMERS table, PK = CUSTOMER_ID
CREATE TABLE "R_CUSTOMERS"
	("CUSTOMER_ID" NUMBER(6, 0), 
	"FIRST_NAME" VARCHAR2(30) CONSTRAINT "R_CSR_FRST_NM_NN" NOT NULL ENABLE, 
	"LAST_NAME" VARCHAR2(30) CONSTRAINT "R_CSR_LST_NM_NN" NOT NULL ENABLE, 
	"HOME_PHONE" VARCHAR2(15) CONSTRAINT "R_CSR_HME_PHN_NN" NOT NULL ENABLE,
	"ADDRESS" VARCHAR2(50) CONSTRAINT "R_CSR_ADRS_NN" NOT NULL ENABLE, 
	"CITY" VARCHAR2(30) CONSTRAINT "R_CSR_CTY_NN" NOT NULL ENABLE,
	"STATE" VARCHAR2(30) CONSTRAINT "R_CSR_STT_NN" NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(50),
	"CELL_PHONE" VARCHAR2(15),
	CONSTRAINT "R_CSTMRS_EML_UK" UNIQUE ("EMAIL"),
	CONSTRAINT "R_CSTMR_CSTMR_ID_PK" PRIMARY KEY ("CUSTOMER_ID")
	);
	
--create R_MOVIES table, PK= MOVIE_ID
CREATE TABLE "R_MOVIES"
	("MOVIE_ID" NUMBER(6, 0),
	"TITLE" VARCHAR2(40) CONSTRAINT "R_MVS_TTL_NN" NOT NULL ENABLE,
	"DESCRIPTION" VARCHAR2(300) CONSTRAINT "R_MVS_DSRPT_NN" NOT NULL ENABLE,
	"RELEASE_DATE" DATE CONSTRAINT "R_MVS_RLS_DATE_NN" NOT NULL ENABLE,
	"GENRE" VARCHAR2(30) CONSTRAINT "R_MVS_GNR_NN" NOT NULL ENABLE,
	"RATING" VARCHAR2(6),
	CONSTRAINT "R_MVS_MVE_ID_PK" PRIMARY KEY ("MOVIE_ID")
	);
	
--create R_ACTORS table, PK = ACTOR_ID
CREATE TABLE "R_ACTORS"
	("ACTOR_ID" NUMBER(6, 0),
	"FIRST_NAME" VARCHAR2(30) CONSTRAINT "R_ACT_FRT_NM_NN" NOT NULL ENABLE, 
	"LAST_NAME" VARCHAR2(30) CONSTRAINT "R_ACT_LST_NM_NN" NOT NULL ENABLE, 
	"BIRTH_DATE" DATE CONSTRAINT "R_ACT_BRTH_DT_NN" NOT NULL ENABLE,
	"STAGE_NAME" VARCHAR2(60), 
	CONSTRAINT "R_ACT_ACTR_ID_PK" PRIMARY KEY ("ACTOR_ID")
	);
		
--create R_MEDIA table, PK = MEDIA_ID, FK = MOVIE_ID
CREATE TABLE "R_MEDIA"
	("MEDIA_ID" NUMBER(6, 0),
	"MOVIE_ID" NUMBER(6, 0),
	"TITLE" VARCHAR2(40) CONSTRAINT "R_MDA_TTL_NN" NOT NULL ENABLE,
	"FORMAT" VARCHAR2(15) CONSTRAINT "R_MDA_FRMT_NN" NOT NULL ENABLE,
	CONSTRAINT "R_MDA_MDA_ID_TTL_ID_PK" PRIMARY KEY ("MEDIA_ID")
	);
	
--add foreign keys to "R_MEDIA"
ALTER TABLE "R_MEDIA" ADD CONSTRAINT "R_MDA_R_MVE_ID_FK" FOREIGN KEY ("MOVIE_ID")
	REFERENCES "R_MOVIES" ("MOVIE_ID") ENABLE;
	
--create R_RENTAL_HISTORY table, PK = RENTAL_DATE, FK= MEDIA_ID, CUSTOMER_ID
CREATE TABLE "R_RENTAL_HISTORY"
	("RENTAL_DATE" DATE CONSTRAINT "R_RNT_HST_DATE_NN" NOT NULL ENABLE,
	"RETURN_DATE" DATE,
	"RENTAL_PRICE" NUMBER(5, 0),
	"MEDIA_ID" NUMBER(6, 0) CONSTRAINT "R_RNT_HST_MDA_ID_NN" NOT NULL ENABLE,
	"CUSTOMER_ID" NUMBER(5, 0) CONSTRAINT "R_RNT_HST_CSTMR_ID_NN" NOT NULL ENABLE,
	CONSTRAINT "R_RNT_HST_MDA_ID_CSTMR_ID_PK" PRIMARY KEY ("RENTAL_DATE", "MEDIA_ID")
	);
	
--add foreign keys to "R_RENTAL_HISTORY"
ALTER TABLE "R_RENTAL_HISTORY" ADD CONSTRAINT "R_RNTL_HSTRY_R_MDA_FK" FOREIGN KEY ("MEDIA_ID")
	REFERENCES "R_MEDIA" ("MEDIA_ID") ENABLE;

		
--create R_STAR_BILLINGS table
CREATE TABLE "R_STAR_BILLINGS"
	("COMMENTS" VARCHAR2(300), 
	"ACTOR_ID" NUMBER(6, 0) CONSTRAINT "R_STR_BLG_ACTR_ID_NN" NOT NULL ENABLE,
	"MOVIE_ID" NUMBER(6, 0) CONSTRAINT "R_STR_BLG_MVE_ID_NN" NOT NULL ENABLE,
	CONSTRAINT "R_STR_BLG_MVE_ID_PK" PRIMARY KEY ("MOVIE_ID", "ACTOR_ID")
	);
	
--add foreign keys and index to R_STAR_BILLINGS
ALTER TABLE "R_STAR_BILLINGS" ADD CONSTRAINT "R_STR_BLG_MVE_FK" FOREIGN KEY ("MOVIE_ID") 
	REFERENCES "R_MOVIES" ("MOVIE_ID") ENABLE;
ALTER TABLE "R_STAR_BILLINGS" ADD CONSTRAINT "R_STR_BLG_ACT_FK" FOREIGN KEY ("ACTOR_ID") 
	REFERENCES "R_ACTORS" ("ACTOR_ID") ENABLE;

--populate R_CUSTOMERS table (number, char, char, char, char, char, char, char, char)
INSERT INTO R_CUSTOMERS (customer_id, first_name, last_name, home_phone, address, city, state, email, cell_phone)
VALUES (100, 'Scott', 'Allonby', '(510)669-8309', '2151 Stevens Street', 'Stockton', 'CA', 'sallonby609@students.deltacollege.edu', NULL);
INSERT INTO R_CUSTOMERS (customer_id, first_name, last_name, home_phone, address, city, state, email, cell_phone)
VALUES (101, 'Kyle', 'McSmith', '(425)489-2558', '1897 Wipp Blvd', 'Lodi', 'CA', 'kmcsmith259@students.deltacollege.edu', '(425)789-2556');
INSERT INTO R_CUSTOMERS (customer_id, first_name, last_name, home_phone, address, city, state, email, cell_phone)
VALUES (102, 'Jen', 'Nerry', '(209)758-8898', '115 McKinley Ct. Apt #5', 'Stockton', 'CA', 'jnerry1992@yahoo.com', '(209)447-0901');
INSERT INTO R_CUSTOMERS (customer_id, first_name, last_name, home_phone, address, city, state, email, cell_phone)
VALUES (103, 'Lauryn', 'Deane', '(209)405-1347', '2817 London Way', 'Stockton', 'CA', 'ldeane107@students.deltacollege.edu', NULL);
INSERT INTO R_CUSTOMERS (customer_id, first_name, last_name, home_phone, address, city, state, email, cell_phone)
VALUES (104, 'Savannah', 'Cooper', '(209)405-1348', '2817 London Way', 'Stockton', 'CA', 'scooper578@gmail.com', NULL);

--populate R_MOVIES table (number, char, char, date, char, char)
--all information taken from their respective pages from "www.IMDb.com"
INSERT INTO R_MOVIES (movie_id, title, description, release_date, genre, rating)
VALUES (1000, 'Titanic', 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.', TO_DATE('19-12-1997', 'dd-mm-yyyy'), 'Romance', '7.7/10');
INSERT INTO R_MOVIES (movie_id, title, description, release_date, genre, rating)
VALUES (1001, 'Jurassic Park', 'During a preview tour, a theme park suffers a major power breakdown that allows its cloned dinosaur exhibits to run amok.', TO_DATE('11-06-1993', 'dd-mm-yyyy'), 'Thriller', '8.1/10');
INSERT INTO R_MOVIES (movie_id, title, description, release_date, genre, rating)
VALUES (1002, 'Harry Potter and the Sorcerer''s Stone', 'Rescued from the outrageous neglect of his aunt and uncle, a young boy with a great destiny proves his worth while attending Hogwarts School of Witchcraft and Wizardry.', TO_DATE('16-11-2001', 'dd-mm-yyyy'), 'Family', '7.5/10');
INSERT INTO R_MOVIES (movie_id, title, description, release_date, genre, rating)
VALUES (1003, 'Beauty and the Beast', 'A young woman whose father has been imprisoned by a terrifying beast offers herself in his place, unaware that her captor is actually a prince, physically altered by a magic spell.', TO_DATE('22-11-1991', 'dd-mm-yyyy'), 'Family', '8.0/10');
INSERT INTO R_MOVIES (movie_id, title, description, release_date, genre, rating)
VALUES (1004, 'Django Unchained', 'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.', TO_DATE('25-12-2012', 'dd-mm-yyyy'), 'Western', '8.4/10');
INSERT INTO R_MOVIES (movie_id, title, description, release_date, genre, rating)
VALUES (1005, 'Gremlins', 'A boy inadvertently breaks three important rules concerning his new pet and unleashes a horde of malevolently mischievous monsters on a small town.', TO_DATE('08-06-1984', 'dd-mm-yyyy'), 'Comedy', '7.2/10');
INSERT INTO R_MOVIES (movie_id, title, description, release_date, genre, rating)
VALUES (1006, 'Poltergeist', 'A family''s home is haunted by a host of ghosts.', TO_DATE('04-06-1982', 'dd-mm-yyyy'), 'Horror', '7.7/10');
INSERT INTO R_MOVIES (movie_id, title, description, release_date, genre, rating)
VALUES (1007, 'E.T. the Extra-terrestrial', 'A troubled child summons the courage to help a friendly alien escape Earth and return to his home world.', TO_DATE('11-06-1982', 'dd-mm-yyyy'), 'Family', '7.9/10');

--populate R_MEDIA table (number, number, char, char)
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (100, 1000, 'Titanic', 'DVD');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (101, 1000, 'Titanic', 'DVD');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (102, 1000, 'Titanic', 'VHS');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (103, 1001, 'Jurassic Park', 'DVD');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (104, 1001, 'Jurassic Park', 'DVD');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (105, 1002, 'Harry Potter and the Sorcerer''s Stone', 'VHS');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (106, 1002,'Harry Potter and the Sorcerer''s Stone', 'DVD');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (107, 1003, 'Beauty and the Beast', 'DVD');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (108, 1004, 'Django Unchained', 'DVD');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (109, 1004, 'Django Unchained', 'DVD');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (110, 1005, 'Gremlins', 'VHS');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (111, 1005, 'Gremlins', 'VHS');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (112, 1005, 'Gremlins', 'DVD');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (113, 1006, 'Poltergeist', 'VHS');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (114, 1006, 'Poltergeist', 'VHS');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (115, 1006, 'Poltergeist', 'DVD');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (116, 1007, 'E.T. the Extra-terrestrial', 'VHS');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (117, 1007, 'E.T. the Extra-terrestrial', 'VHS');
INSERT INTO R_MEDIA (media_id, movie_id, title, format)
VALUES (118, 1007, 'E.T. the Extra-terrestrial', 'DVD');

--populate R_ACTORS table (number, char, char, date, char)
--all information taken from their respective pages from "www.IMDb.com"
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (1, 'Leonardo', 'DiCaprio', TO_DATE('11-11-1974', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (2, 'Kate', 'Winslet', TO_DATE('05-10-1975', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (3, 'Nigel', 'Neill', TO_DATE('14-09-1947', 'dd-mm-yyyy'), 'Sam Neill');
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (4, 'Laura', 'Dern', TO_DATE('10-02-1967', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (5, 'Jeffrey', 'Goldblum', TO_DATE('22-10-1952', 'dd-mm-yyyy'), 'Jeff Goldblum');
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (6, 'Daniel', 'Radcliffe', TO_DATE('23-07-1989', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (7, 'Rupert', 'Grint', TO_DATE('24-08-1988', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (8, 'Emma', 'Watson', TO_DATE('15-04-1990', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (9, 'Alan', 'Rickman', TO_DATE('21-02-1946', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (10, 'Donna', 'Helmintoller', TO_DATE('10-05-1956', 'dd-mm-yyyy'), 'Paige O''Hara');
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (11, 'Robin', 'Segal', TO_DATE('21-01-1956', 'dd-mm-yyyy'), 'Robby Benson');
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (12, 'Jesse', 'Corti', TO_DATE('3-07-1955', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (13, 'Eric', 'Bishop', TO_DATE('13-12-1967', 'dd-mm-yyyy'), 'Jamie Foxx');
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (14, 'Christoph', 'Waltz', TO_DATE('04-10-1956', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (15, 'Zachary', 'Galligan', TO_DATE('14-02-1964', 'dd-mm-yyyy'), 'Zach Galligan');
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (16, 'Phoebe', 'Cates', TO_DATE('16-07-1963', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (17, 'Hoyt', 'Axton', TO_DATE('25-03-1938', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (18, 'Heather', 'O''Rourke', TO_DATE('27-12-1975', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (19, 'Margaret', 'Williams', TO_DATE('06-12-1948', 'dd-mm-yyyy'), 'JoBeth Williams');
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (20, 'Craig', 'Nelson', TO_DATE('04-04-1944', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (21, 'Henry', 'Thomas', TO_DATE('09-09-1971', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (22, 'Drew', 'Barrymore', TO_DATE('22-02-1975', 'dd-mm-yyyy'), NULL);
INSERT INTO R_ACTORS (actor_id, first_name, last_name, birth_date, stage_name)
VALUES (23, 'Rachmil', 'Cohon', TO_DATE('10-10-1941', 'dd-mm-yyyy'), 'Peter Coyote');

--populate R_RENTAL_HISTORY table (date, number, date, number, number)
INSERT INTO R_RENTAL_HISTORY (rental_date, return_date, rental_price, media_id, customer_id)
VALUES (TO_DATE('15-11-2013', 'dd-mm-yyyy'), TO_DATE('18-11-2013', 'dd-mm-yyyy'), 12.00, 101, 100);
INSERT INTO R_RENTAL_HISTORY (rental_date, return_date, rental_price, media_id, customer_id)
VALUES (TO_DATE('29-08-2013', 'dd-mm-yyyy'), TO_DATE('30-08-2013', 'dd-mm-yyyy'), 8.00, 103, 100);
INSERT INTO R_RENTAL_HISTORY (rental_date, return_date, rental_price, media_id, customer_id)
VALUES (TO_DATE('18-03-2014', 'dd-mm-yyyy'), TO_DATE('20-03-2014', 'dd-mm-yyyy'), 10.00, 115, 100);
INSERT INTO R_RENTAL_HISTORY (rental_date, return_date, rental_price, media_id, customer_id)
VALUES (TO_DATE('13-01-2013', 'dd-mm-yyyy'), TO_DATE('15-01-2013', 'dd-mm-yyyy'), 10.00, 107, 101);
INSERT INTO R_RENTAL_HISTORY (rental_date, return_date, rental_price, media_id, customer_id)
VALUES (TO_DATE('08-07-2017', 'dd-mm-yyyy'), TO_DATE('10-07-2017', 'dd-mm-yyyy'), 10.00, 106, 101);
INSERT INTO R_RENTAL_HISTORY (rental_date, return_date, rental_price, media_id, customer_id)
VALUES (TO_DATE('01-12-2015', 'dd-mm-yyyy'), TO_DATE('04-12-2015', 'dd-mm-yyyy'), 12.00, 108, 102);
INSERT INTO R_RENTAL_HISTORY (rental_date, return_date, rental_price, media_id, customer_id)
VALUES (TO_DATE('15-09-2016', 'dd-mm-yyyy'), TO_DATE('16-09-2016', 'dd-mm-yyyy'), 8.00, 104, 102);
INSERT INTO R_RENTAL_HISTORY (rental_date, return_date, rental_price, media_id, customer_id)
VALUES (TO_DATE('22-05-2017', 'dd-mm-yyyy'), TO_DATE('23-05-2017', 'dd-mm-yyyy'), 8.00, 109, 103);
INSERT INTO R_RENTAL_HISTORY (rental_date, return_date, rental_price, media_id, customer_id)
VALUES (TO_DATE('24-02-2016', 'dd-mm-yyyy'), TO_DATE('27-02-2016', 'dd-mm-yyyy'), 12.00, 117, 103);
INSERT INTO R_RENTAL_HISTORY (rental_date, return_date, rental_price, media_id, customer_id)
VALUES (TO_DATE('14-05-2017', 'dd-mm-yyyy'), NULL, NULL, 117, 103);
INSERT INTO R_RENTAL_HISTORY (rental_date, return_date, rental_price, media_id, customer_id)
VALUES (TO_DATE('09-04-2013', 'dd-mm-yyyy'), TO_DATE('12-04-2013', 'dd-mm-yyyy'), 12.00, 116, 104);
INSERT INTO R_RENTAL_HISTORY (rental_date, return_date, rental_price, media_id, customer_id)
VALUES (TO_DATE('03-10-2013', 'dd-mm-yyyy'), TO_DATE('06-10-2013', 'dd-mm-yyyy'), 12.00, 112, 104);
INSERT INTO R_RENTAL_HISTORY (rental_date, return_date, rental_price, media_id, customer_id)
VALUES (TO_DATE('24-03-2017', 'dd-mm-yyyy'), TO_DATE('26-03-2017', 'dd-mm-yyyy'), 10.00, 111, 104);
INSERT INTO R_RENTAL_HISTORY (rental_date, return_date, rental_price, media_id, customer_id)
VALUES (TO_DATE('19-01-2015', 'dd-mm-yyyy'), TO_DATE('20-01-2015', 'dd-mm-yyyy'), 8.00, 118, 104);

--populate R_STAR_BILLINGS table (number, number, char)
--all information taken from their respective pages from "www.IMDb.com"
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (1, 1000, 'Was 23 years old when Titanic released');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (1, 1004, 'Leonardo was extrememly uncomfortable with his character Calvin Candie because of how racist the character was.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (2, 1000, 'When Kate found out she would have to pose naked for DiCaprio, she flashed him when they first met to break the ice.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (3, 1001, 'The character Alan Grant was based off of Paleontologist Jack Horner');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (4, 1001, 'The flirting from the movie was real, and caused a relationship between Jeff Goldblum and Laura Dern.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (5, 1001, 'Jeff Goldbum says "must go faster" in both Jurassic Park and in Independence Day.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (6, 1002, 'During filming, Radcliffe changed the language on Coltrane''s phone to Turkish as a prank.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (7, 1002, 'Today, Rupert owns an ice-cream truck and gives ice-cream away in poor neighbourhoods.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (8, 1002, 'Watson was one of the few girls at her school who orignally did not want to audition to be in the movie.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (9, 1002, 'J.K. Rowling gave Alan Rickman secret backstory for his character Snape. This secret would not come out until the last movie.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (10, 1003, 'Belle is the only character to wear blue in the village, to symbolize how she feels different than everyone else.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (11, 1003, 'Most of the sculptures seen in the castle are different, earlier versions of the Beast');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (12, 1003, 'The character Lefou was drawn to look like Jesse Corti in real life.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (13, 1004, 'Jamie Foxx used his own horse for the movie.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (14, 1004, 'Christoph said he would only play this character if the character was nothing but good and pure.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (15, 1005, 'The gremlins cost $40,000-50,000 to make each.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (16, 1005, 'One of the screams at the beginning is genuine; a cockroach crawled onto set and she screamed.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (17, 1005, ' ');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (18, 1006, 'Heather passed away only eight months after the movie released, at the age of 12.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (19, 1006, 'The skeletons that come out of the pool are real human skeletons. Williams didn''t know this until after the scene was shot.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (20, 1006, ' ');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (21, 1007, 'Most of the movie was shot from the eye-level of a child to further connect Elliot and E.T.');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (22, 1007, ' ');
INSERT INTO R_STAR_BILLINGS (actor_id, movie_id, comments)
VALUES (23, 1007, ' ');