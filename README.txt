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
	UserActivityDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UserActivityEvent VARCHAR (25) DEFAULT 'Tilin luonti',
	PRIMARY KEY (UserID)
);

CREATE TABLE Details (
	DetailID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	UserID SMALLINT UNSIGNED NOT NULL,
	DetailAge VARCHAR (50),
	DetailResidencemodel LONGTEXT,
	DetailLifestyle LONGTEXT,
	DetailHealthServices VARCHAR (50),
	DetailProblems LONGTEXT,
	PRIMARY KEY (DetailID),
	FOREIGN KEY (UserID) REFERENCES Users (UserID)
);

CREATE TABLE Tasks (
	TaskID INT UNSIGNED NOT NULL AUTO_INCREMENT,
	TaskTypeID INT UNSIGNED NOT NULL,
	UserID SMALLINT UNSIGNED NOT NULL,
	TaskContent LONGTEXT,
	TaskIsReturned BOOLEAN NOT NULL DEFAULT 0,
	TaskIsActive BOOLEAN NOT NULL DEFAULT 1,
	TaskIsClosed BOOLEAN NOT NULL DEFAULT 0,
	TaskDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (TaskID),
	FOREIGN KEY (UserID) REFERENCES Users (UserID)
);

CREATE TABLE Memos (
	MemoID INT UNSIGNED NOT NULL AUTO_INCREMENT,
	TaskID SMALLINT UNSIGNED,
	MemoTime VARCHAR (128),
	MemoDoing LONGTEXT,
	MemoSuojaPercentage VARCHAR (64),
	MemoTehtPercentage VARCHAR (64),
	MemoPositivePercentage VARCHAR (64),
	MemoNegativePercentage VARCHAR (64),
	PRIMARY KEY (MemoID)
);

CREATE TABLE Messages (
	MessageID INT UNSIGNED NOT NULL AUTO_INCREMENT,
	TaskID SMALLINT UNSIGNED,
	DetailID SMALLINT UNSIGNED,
	UserType VARCHAR (25),
	MessageContent LONGTEXT,
	MessageDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (MessageID)
);

CREATE TABLE Frontpage (
	PageID INT UNSIGNED NOT NULL AUTO_INCREMENT,
	PageContent LONGTEXT,
	PRIMARY KEY (PageID)
);

INSERT INTO Users (UserEmail, UserPassword, UserName, UserSurname, UserPhonenumber, UserAddress, UserPostalcode, UserPostoffice, UserType)
	VALUES 	('martti.puttonen@gmail.com', 'abc12345', 'Martti', 'Puttonen', '0505335698', 'Karankatu 25 G', ' ', 'Hyvink��', 'admin');
			
INSERT INTO Frontpage (PageContent)
	VALUES	('T�m� teksti on yleist� arjenhallinta.fi mainosteksti�.'),
		('Martti Puttosen esittely teksti t�h�n.'),
		('Liity teksti t�h�n.'),
		('Tietoa teksti t�h�n.'),
		('Psykoterapiapalvelut teksti t�h�n.'),
		('Yhteystiedot teksti t�h�n.');