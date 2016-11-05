Arjenhallinta -sovelluksen repo.

Jos (ja kun) haluat kehitt‰‰ sovellusta tarvitset seuraavat ohjelmat:

- Git (duh) https://git-scm.com/
- NetBeans 8.2 https://netbeans.org/downloads/ 
(lataa All-paketti about 220mb)
- MySQL http://dev.mysql.com/downloads/installer/ 
(lataa mysql-installer-community-5.7.16.0.msi koko about 380mb)

MySQL:‰‰ lukuunottamatta ohjelmien asentaminen on l‰hinn‰
next/ok nappien klikkailua. MySQL:n asentaminen kannattaa
tehd‰ seuraavan tutoriaalin ohjeiden mukaan 
(https://netbeans.org/kb/docs/ide/install-and-configure-mysql-server.html).
Asentamisen aikana t‰ytyy luoda MySQL servun user account.
Anna user="root" ja password="realforce".

Ohjelman k‰ytt‰m‰n tietokannan rakenne on esitetty alla:

CREATE TABLE Users (
	UserID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	UserEmail VARCHAR (70) NOT NULL UNIQUE,
	UserPassword VARCHAR (64) NOT NULL,
	UserSessionID VARCHAR (64),
	UserName VARCHAR (50),
	UserSurname VARCHAR (50),
	UserType TINYINT UNSIGNED NOT NULL,
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