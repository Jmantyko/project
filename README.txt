Arttu testi

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
	UserAddress VARCHAR (100),
	UserPostalcode VARCHAR (50),
	UserPostoffice VARCHAR (100),
	UserType VARCHAR (25) NOT NULL,
	PRIMARY KEY (UserID)
);

CREATE TABLE Tasks (
	TaskID INT UNSIGNED NOT NULL AUTO_INCREMENT,
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