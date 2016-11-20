Arjenhallinta -sovelluksen repo.

Lyhyet ohjeet Gitin k�ytt��n:
git remote update | p�ivitt�� remote repon viittaukset, ilmeisesti
t�m� on hyv� ajaa aina ensin

git status | t�ll� komennolla selvit�t local repon statuksen

git status -uno | oman local repon suhde remote repoon

git pull | t�ll� komennolla noudat muutokset yhteisest� reposta
omalle koneellesi (jos joku sinua ennen on tehnyt muutoksia)

git add -A | ennen kuin committaat, haluat tod.n�k. lis�t� 
committiin lis�tyt/muutetut tiedostot mukaan

git push origin master | t�ll� ty�nn�t muutokset jaettuun repoon
master branchiin

Jos (ja kun) haluat kehitt�� sovellusta tarvitset seuraavat ohjelmat:

- Git https://git-scm.com/
- NetBeans 8.2 https://netbeans.org/downloads/ 
(lataa All-paketti about 220mb)
- MySQL http://dev.mysql.com/downloads/installer/ 
(lataa mysql-installer-community-5.7.16.0.msi koko about 380mb)

MySQL:�� lukuunottamatta ohjelmien asentaminen on l�hinn�
next/ok nappien klikkailua. MySQL:n asentaminen kannattaa
tehd� seuraavan tutoriaalin ohjeiden mukaan 
(https://netbeans.org/kb/docs/ide/install-and-configure-mysql-server.html).
Asentamisen aikana t�ytyy luoda MySQL servun user account.
Anna user="root" ja password="realforce".

Ohjelman k�ytt�m�n tietokannan rakenne on esitetty alla:

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
		('mattimeikalainen@meikalainen.fi', '123', 'Matti', 'Meik�l�inen', '1234567890', 'Kerroskuja 5', '82828', 'Tampere', 'customer');
		
INSERT INTO Tasks (TaskTypeID, UserID, TaskContent)
	VALUES	(1, 2, '*Harjoitukseen liittyv�� sis�l�t� tietokannasta, user 2 tekij�n�*'),
		(2, 2, '*Toiseen harjoitukseen liittyv�� sis�l�t� tietokannasta, user 2 tekij�n�*'),
		(1, 4, '*Harjoitukseen liittyv�� sis�l�t� tietokannasta, user 4 tekij�n�*'),
		(2, 4, '*Toiseen harjoitukseen liittyv�� sis�l�t� tietokannasta, user 4 tekij�n�*');
			
INSERT INTO Frontpage (PageContent)
	VALUES	('T�m� teksti on yleist� arjenhallinta.fi mainosteksti�.'),
		('Martti Puttosen esittely teksti t�h�n.'),
		('Liity teksti t�h�n.'),
		('Tietoa teksti t�h�n.'),
		('Psykoterapiapalvelut teksti t�h�n.'),
		('Yhteystiedot teksti t�h�n.');