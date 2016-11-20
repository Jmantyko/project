Arjenhallinta -sovelluksen repo.

Lyhyet ohjeet Gitin käyttöön:
git remote update | päivittää remote repon viittaukset, ilmeisesti
tämä on hyvä ajaa aina ensin

git status | tällä komennolla selvität local repon statuksen

git status -uno | oman local repon suhde remote repoon

git pull | tällä komennolla noudat muutokset yhteisestä reposta
omalle koneellesi (jos joku sinua ennen on tehnyt muutoksia)

git add -A | ennen kuin committaat, haluat tod.näk. lisätä 
committiin lisätyt/muutetut tiedostot mukaan

git push origin master | tällä työnnät muutokset jaettuun repoon
master branchiin

Jos (ja kun) haluat kehittää sovellusta tarvitset seuraavat ohjelmat:

- Git https://git-scm.com/
- NetBeans 8.2 https://netbeans.org/downloads/ 
(lataa All-paketti about 220mb)
- MySQL http://dev.mysql.com/downloads/installer/ 
(lataa mysql-installer-community-5.7.16.0.msi koko about 380mb)

MySQL:ää lukuunottamatta ohjelmien asentaminen on lähinnä
next/ok nappien klikkailua. MySQL:n asentaminen kannattaa
tehdä seuraavan tutoriaalin ohjeiden mukaan 
(https://netbeans.org/kb/docs/ide/install-and-configure-mysql-server.html).
Asentamisen aikana täytyy luoda MySQL servun user account.
Anna user="root" ja password="realforce".

Ohjelman käyttämän tietokannan rakenne on esitetty alla:

CREATE TABLE Users (
	UserID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	UserEmail VARCHAR (70) NOT NULL UNIQUE,
	UserPassword VARCHAR (64) NOT NULL,
	UserSessionID VARCHAR (64),
	UserName VARCHAR (50),
	UserSurname VARCHAR (50),
	UserPhonenumber VARCHAR (25),
	UserAddress VARCHAR (100),
	UserPostalcode VARCHAR (50),
	UserPostoffice VARCHAR (100),
	UserIsDeleted BOOLEAN NOT NULL DEFAULT 0,
	UserType VARCHAR (25) NOT NULL,
	PRIMARY KEY (UserID)
);

CREATE TABLE Tasks (
	TaskID INT UNSIGNED NOT NULL AUTO_INCREMENT,
	TaskTypeID INT UNSIGNED NOT NULL,
	UserID SMALLINT UNSIGNED NOT NULL,
	TaskContent LONGTEXT,
	TaskDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (TaskID),
	FOREIGN KEY (UserID) REFERENCES Users (UserID)
);

CREATE TABLE Messages (
	MessageID INT UNSIGNED NOT NULL AUTO_INCREMENT,
	UserID SMALLINT UNSIGNED NOT NULL,
	MessageContent LONGTEXT,
	MessageDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (MessageID),
	FOREIGN KEY (UserID) REFERENCES Users (UserID)
);

CREATE TABLE Frontpage (
	PageID INT UNSIGNED NOT NULL AUTO_INCREMENT,
	PageContent LONGTEXT,
	PRIMARY KEY (PageID)
);

INSERT INTO Users (UserEmail, UserPassword, UserName, UserSurname, UserPhonenumber, UserAddress, UserPostalcode, UserPostoffice, UserType)
	VALUES 	('admin@admin.fi', '123', 'Teppo', 'Terapeutti', '0501234567', 'Kauppakatu 5', '10101', 'Oulu', 'admin'),
		('customer@customer.fi', '123', 'Aki', 'Asiakas', '020202', 'Torikatu 3', '12300', 'Oulu', 'customer'),
		('erkkiesimerkki@esimerkki.fi', '123', 'Erkki', 'Esimerkki', '020544579', 'Talokatu 7', '88888', 'Helsinki', 'customer'),
		('mattimeikalainen@meikalainen.fi', '123', 'Matti', 'Meikäläinen', '1234567890', 'Kerroskuja 5', '82828', 'Tampere', 'customer');
		
INSERT INTO Tasks (TaskTypeID, UserID, TaskContent)
	VALUES	(1, 2, '*Harjoitukseen liittyvää sisälötä tietokannasta, user 2 tekijänä*'),
		(2, 2, '*Toiseen harjoitukseen liittyvää sisälötä tietokannasta, user 2 tekijänä*'),
		(1, 4, '*Harjoitukseen liittyvää sisälötä tietokannasta, user 4 tekijänä*'),
		(2, 4, '*Toiseen harjoitukseen liittyvää sisälötä tietokannasta, user 4 tekijänä*');
			
INSERT INTO Frontpage (PageContent)
	VALUES	('Tämä teksti on yleistä arjenhallinta.fi mainostekstiä.'),
		('Martti Puttosen esittely teksti tähän.'),
		('Liity teksti tähän.'),
		('Tietoa teksti tähän.'),
		('Psykoterapiapalvelut teksti tähän.'),
		('Yhteystiedot teksti tähän.');