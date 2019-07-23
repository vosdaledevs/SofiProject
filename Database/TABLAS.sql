/*CREATE DATABASE IF NOT EXIST vosdaled_DBColgatePalmolive;*/

/*Use vosdaled_DBColgatePalmolive;*/
CREATE TABLE Role
(
	PKRole int AUTO_INCREMENT primary key not null,
	NameRole varchar(15) not null
)ENGINE=InnoDB;

CREATE TABLE Users
(
    Username  varchar(15) primary key not null,
    FirstName varchar(15) not null,
    LastName varchar(15) not null,
    Password varchar(50) not null
)ENGINE=InnoDB;

CREATE TABLE UserRole
(
	FKUsername varchar(15) not null,
	FKRole int not null,
	Description varchar(50) not null,
	foreign key (FKUsername) references Users(Username) on update cascade on delete restrict,
    foreign key (FKRole) references Role(PKRole) on update cascade on delete restrict
)ENGINE=InnoDB;

CREATE TABLE Barcode
(
	PKCode varchar (15) primary key not null,
	status int not null,
	DateOfAdd TIMESTAMP not null
)ENGINE=InnoDB;

CREATE TABLE Category
(
	PKCategory int AUTO_INCREMENT primary key not null,
	Name varchar(15) not null
)ENGINE=InnoDB;

CREATE TABLE Relations
(
	PKRelations int AUTO_INCREMENT primary key not null,
	Comment varchar(15) not null
)ENGINE=InnoDB;

CREATE TABLE Company
(
	PKCompany int AUTO_INCREMENT not null,
	FKRelation int not null,
	Name varchar(15) not null,
	CoAddress varchar(50) not null,
	foreign key (FKRelation) references Relations(PKRelations) on update cascade on delete restrict
)ENGINE=InnoDB;

CREATE TABLE Presentation
(
	PKPresentation int AUTO_INCREMENT primary key not null,
	Units varchar(10) not null,
	Unitqty decimal(18,2) not null
)ENGINE=InnoDB;

CREATE TABLE Supermarket
(
	PKSuperMarket int primary key not null,
	Name varchar(15) not null,
	Address varchar(50) not null
)ENGINE=InnoDB;

CREATE TABLE Product
(
    PKProduct int AUTO_INCREMENT primary key not null, 
    Name varchar(15) not null,
    Description varchar (50) not null
)ENGINE=InnoDB;

CREATE TABLE ProdDetail
(
	FKProduct int not null,
	FKCode varchar(15) not null,
	IDCategory int not null,
    IDPresentation int not null,
    IDCompany int not null,
	Price decimal(18,2) not null,
	Photo blob,
	foreign key (FKProduct) references Product(PKProduct) on update cascade on delete restrict,
	foreign key (FKCode) references Barcode(PKCode) on update cascade on delete restrict,
	foreign key (IDCategory) references Category(PKCategory) on update cascade on delete restrict,
    foreign key (IDPresentation) references Presentation(PKPresentation) on update cascade on delete restrict,
    foreign key (IDCompany) references Company(PKCompany) on update cascade on delete restrict
)ENGINE=InnoDB;

CREATE TABLE SOM
(
	FKProduct int not null,
	FKSuperMarket int not null,
	Qty decimal(18,2) not null,
	DateOfAdd TIMESTAMP NOT NULL,
	foreign key (FKProduct) references Product(PKProduct) on update cascade on delete restrict,
	foreign key (FKSuperMarket) references Supermarket(PKSuperMarket) on update cascade on delete restrict
)ENGINE=InnoDB;

ALTER TABLE ProdDetail ADD PRIMARY KEY( FKProduct, FKCode);
ALTER TABLE Company ADD PRIMARY KEY( PKCompany,FKRelation);
/*ALTER TABLE `Company` DROP PRIMARY KEY, ADD PRIMARY KEY( `PKCompany`, `FKRelation`);*/