CREATE DATABASE WebImmobiliare;

CREATE TABLE user (
	id INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(30) NOT NULL UNIQUE,
	email VARCHAR(30) NOT NULL UNIQUE,
	password VARCHAR(30) NOT NULL
);

CREATE TABLE wallet (
	id INT AUTO_INCREMENT PRIMARY KEY,
	credit DECIMAL(20,2) NOT NULL,
	id_user INT NOT NULL UNIQUE,
	FOREIGN KEY (id_user) REFERENCES user(id) ON DELETE CASCADE
);

--update on house --> dependency on marker

CREATE TABLE building (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	address VARCHAR(100) NOT NULL,
	city VARCHAR(60),
	latitude FLOAT(10,6) NOT NULL,
	longitude FLOAT(10,6) NOT NULL,
	type VARCHAR(30) NOT NULL,
	price DECIMAL(20,2) NOT NULL,
	area INT NOT NULL,
	E_class CHAR NOT NULL
);

CREATE TABLE city {
	id  INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(60) UNIQUE NOT NULL,
	latitude DOUBLE NOT NULL,
	longitude DOUBLE NOT NULL
};


INSERT INTO building(name,address,city,latitude,longitude,type,price,area,E_class) VALUES ('building1', 'Viale Lunigiana, 15', 'Milano', 45.491684, 9.204736, 'Trilocale', 100000.00, 100, 'B');
INSERT INTO building(name,address,city,latitude,longitude,type,price,area,E_class) VALUES ('building2', 'Via Angelo De Vincenti, 6', 'Milano', 45.477931, 9.141652, 'Bilocale', 120000.00, 120, 'C');
INSERT INTO building(name,address,city,latitude,longitude,type,price,area,E_class) VALUES ('building3', 'Via Pinamonte da Vimercate, 3', 'Milano', 45.479081, 9.182454, 'Trilocale', 130000.00, 90, 'A');
INSERT INTO building(name,address,city,latitude,longitude,type,price,area,E_class) VALUES ('building4', 'Corso di Porta Nuova, 34', 'Milano', 45.477285, 9.192178, 'Quadrilocale', 305000.00, 95, 'A');
INSERT INTO building(name,address,city,latitude,longitude,type,price,area,E_class) VALUES ('building5', 'Via Emilio Cornalia, 12', 'Milano', 45.483139, 9.197228, 'Loft', 180000.00, 110, 'G');
INSERT INTO building(name,address,city,latitude,longitude,type,price,area,E_class) VALUES ('building6', 'Via Filippo Turati, 29', 'Milano', 45.477429, 9.195515, 'Plurilocale', 350000.00, 105, 'A');
INSERT INTO building(name,address,latitude,longitude,price,area,E_class,type) VALUES ("casa rione monti", "",41.89311999315887, 12.478371015625044, 300000, 80, 'F', "Bilocale");
INSERT INTO building(name,address,latitude,longitude,price,area,E_class,type) VALUES ("casa casal bertone","", 41.89652612618998, 12.527809492187544, 180000, 90, 'G', "Bilocale");
INSERT INTO building(name,address,latitude,longitude,price,area,E_class,type) VALUES ("casa colosseo", "",41.89095196158848, 12.489292423508232, 200000, 40, 'B', "Bilocale");
INSERT INTO building(name,address,latitude,longitude,price,area,E_class,type) VALUES ("casa tivoli terme", "",41.94964825517216, 12.710799551425566, 130000, 70, 'A', "Bilocale");

INSERT INTO city(name,latitude,longitude) VALUES('Roma',41.89193,12.51133)
INSERT INTO city(name,latitude,longitude) VALUES('Milano',45.46427,9.18951)