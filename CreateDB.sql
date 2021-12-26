DROP DATABASE IF EXISTS shipping;
CREATE DATABASE shipping;

USE shipping;

CREATE TABLE Countries (
    Code CHAR(3) PRIMARY KEY,
    Name VARCHAR(20) NOT NULL
);
CREATE TABLE FreightCompanies (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    CountryCode CHAR(3),
    Name VARCHAR(30) NOT NULL,
    PhoneNumber VARCHAR(17) NOT NULL,
    Email VARCHAR(40) NOT NULL,
    FOREIGN KEY (CountryCode)
        REFERENCES Countries (Code)
);
CREATE TABLE ShipTypes (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(40) NOT NULL,
    MaxWeight INT NOT NULL
);
CREATE TABLE Ships (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    ShipTypeId INT,
    FreightCompanyId INT,
    Name VARCHAR(40) NOT NULL,
    FOREIGN KEY (ShipTypeId)
        REFERENCES ShipTypes (Id),
    FOREIGN KEY (FreightCompanyId)
        REFERENCES FreightCompanies (Id)
);
CREATE TABLE Positions (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(20) NOT NULL,
    MinSalary INT NOT NULL
);
CREATE TABLE Workers (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    PositionId INT,
    ShipId INT,
    FullName VARCHAR(30) NOT NULL,
    PhoneNumber VARCHAR(17) NOT NULL,
    Salary INT NOT NULL,
    FOREIGN KEY (PositionId)
        REFERENCES Positions (Id),
    FOREIGN KEY (ShipId)
        REFERENCES Ships (Id)
);
CREATE TABLE Ports (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    CountryCode CHAR(3),
    Name VARCHAR(20) NOT NULL,
    FOREIGN KEY (CountryCode)
        REFERENCES Countries (Code)
);
CREATE TABLE Clients (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(20) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Email VARCHAR(35) NOT NULL
);
CREATE TABLE Contracts (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    ShipId INT NULL,
    ClientId INT NOT NULL,
    -- TotalWeight INT DEFAULT 0,
    -- TotalPrice INT NOT NULL,
    SigningDate DATE NOT NULL,
    FOREIGN KEY (ShipId)
        REFERENCES Ships (Id),
    FOREIGN KEY (ClientId)
        REFERENCES Clients (Id)
);
CREATE TABLE Destinations (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    PortId INT,
    ContractId INT,
    FOREIGN KEY (PortId)
        REFERENCES Ports (Id),
    FOREIGN KEY (ContractId)
        REFERENCES Contracts (Id)
);
CREATE TABLE Products (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    ContractId INT,
    Name VARCHAR(18) NOT NULL,
    Weight INT NOT NULL,
    Price INT NOT NULL,
    FOREIGN KEY (ContractId)
        REFERENCES Contracts (Id)
);