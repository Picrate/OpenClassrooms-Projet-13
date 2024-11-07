----
-- RENTAL APP TABLES CREATION SCRIPT
----
-- USER TABLE
CREATE TABLE IF NOT EXISTS app_user
(	
	user_id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	username VARCHAR(255) UNIQUE NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	user_password VARCHAR(255) NOT NULL,
	firstname VARCHAR(255) NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	bithdate DATE NOT NULL,
	lang_id bigint	
);
-- USER LANGUAGE CODE TABLE BASED ON ISO 639-1 CODES
-- https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes
CREATE TABLE IF NOT EXISTS user_lang
(
	lang_id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	code VARCHAR(2) UNIQUE NOT NULL, -- fr, en, de
	name VARCHAR(255), -- French, English, German
	endonym VARCHAR(255) -- Français, English, Deutsch	
);
-- ADDRESS
CREATE TABLE IF NOT EXISTS address
(
	address_id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	street_number integer,
	street VARCHAR(255) NOT NULL,
	city_id bigint
);
-- CITIES
CREATE TABLE IF NOT EXISTS city
(
	city_id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255) NOT NULL,
	zipcode VARCHAR(255) NOT NULL,
	country_id bigint
);
-- COUNTRIES TABLE BASED ON ISO 3166 CODES
-- https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes
CREATE TABLE IF NOT EXISTS country
(
	country_id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255) NOT NULL, -- France
	iso_a2 VARCHAR(2) NOT NULL, -- FR
	iso_a3 VARCHAR(3) -- FRA
);
-- RENTAL AGENCIES
CREATE TABLE IF NOT EXISTS agency
(
	agency_id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(255) NOT NULL,
	address_id bigint
);
-- RENTALS
CREATE TABLE IF NOT EXISTS rental
(
	rental_id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	internal_ref VARCHAR(255) UNIQUE NOT NULL,
	created_date TIMESTAMP NOT NULL,
	departure_date TIMESTAMP NOT NULL,
	arrival_date TIMESTAMP NOT NULL,
	price float(10) NOT NULL,
	status VARCHAR(255), -- ORDERED, CANCELED, PAYED
	customer_id bigint,
	agency_id  bigint,
	car_id bigint,
	departure_city_id bigint,
	arrival_city_id bigint
);
-- CARS TO RENT
CREATE TABLE IF NOT EXISTS car
(
	car_id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	acriss_code VARCHAR(4) UNIQUE NOT NULL, -- https://www.acriss.org/car-codes/
	description VARCHAR(255),
	car_status VARCHAR(255), -- RENTED | FREE | MAINTENANCE
	agency_id  bigint
);
-- USER ADDRESSES
CREATE TABLE IF NOT EXISTS user_address
(
	user_id bigint,
	address_id bigint,
	CONSTRAINT user_address_pk PRIMARY KEY (user_id, address_id)
);
----
-- CONSTRAINTS
----
ALTER TABLE app_user ADD CONSTRAINT fk_user_lang FOREIGN KEY (lang_id) REFERENCES user_lang (lang_id);

ALTER TABLE address ADD CONSTRAINT fk_address_city FOREIGN KEY (city_id) REFERENCES city (city_id);

ALTER TABLE city ADD CONSTRAINT fk_city_country FOREIGN KEY (country_id) REFERENCES country (country_id);

ALTER TABLE agency ADD CONSTRAINT fk_agency_address FOREIGN KEY (address_id) REFERENCES address (address_id);

ALTER TABLE car ADD CONSTRAINT fk_car_agency FOREIGN KEY (agency_id) REFERENCES agency (agency_id);

ALTER TABLE user_address ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES app_user (user_id);
ALTER TABLE user_address ADD CONSTRAINT fk_address FOREIGN KEY (address_id) REFERENCES address (address_id);

ALTER TABLE rental ADD CONSTRAINT positive_price CHECK (price > 0);
ALTER TABLE rental ADD CONSTRAINT later_arrival CHECK (arrival_date > departure_date);
ALTER TABLE rental ADD CONSTRAINT fk_rental_customer FOREIGN KEY (customer_id) REFERENCES app_user (user_id);
ALTER TABLE rental ADD CONSTRAINT fk_rental_agency FOREIGN KEY (agency_id) REFERENCES agency (agency_id);
ALTER TABLE rental ADD CONSTRAINT fk_rental_car FOREIGN KEY (car_id) REFERENCES car (car_id);
ALTER TABLE rental ADD CONSTRAINT fk_rental_departure FOREIGN KEY (departure_city_id) REFERENCES city (city_id);
ALTER TABLE rental ADD CONSTRAINT fk_rental_arrival FOREIGN KEY (arrival_city_id) REFERENCES city (city_id);
----