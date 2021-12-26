USE shipping;

-- функція для знаходження мінімальної запрлати по Id професії. Використовується в тригері
DROP FUNCTION IF EXISTS get_MinSalary_by_PositionId;
DELIMITER $$
CREATE FUNCTION get_MinSalary_by_PositionId(PosId INT)
RETURNS INT
BEGIN
	DECLARE minSal INT;
	SELECT MinSalary INTO minSal
	FROM positions
	WHERE positions.Id = PosId;
    RETURN minSal;
END$$
DELIMITER ;
SELECT get_MinSalary_by_PositionId(5);

-- функція для знахождення поточної ваги товару на кораблі. Використовується в тригері
DROP FUNCTION IF EXISTS get_current_ShipWeight;
DELIMITER $$
CREATE FUNCTION get_current_ShipWeight(C_Id INT)
RETURNS INT
BEGIN
	DECLARE currentWeight INT;
	SELECT SUM(Weight) INTO currentWeight
	FROM Products
	JOIN Contracts ON Contracts.Id = Products.ContractId
	WHERE ShipId = (
				SELECT ShipId 
				FROM Contracts 
				WHERE Contracts.Id = C_Id
				LIMIT 1
					) ;
    RETURN currentWeight;
END$$
DELIMITER ;
SELECT get_current_ShipWeight(1);

-- функція для знахождення максимальної вантажопідйомності корабля. Використовується в тригері
DROP FUNCTION IF EXISTS get_MaxWeight_by_ContractId;
DELIMITER $$
CREATE FUNCTION get_MaxWeight_by_ContractId(C_Id INT)
RETURNS INT
BEGIN
	DECLARE maxW INT;
	SELECT Shiptypes.MaxWeight INTO maxW
		FROM Contracts
		JOIN Ships ON Ships.Id = Contracts.ShipId
		JOIN Shiptypes ON Shiptypes.Id = Ships.ShipTypeId
	WHERE 
		Ships.Id = (
				SELECT ShipId 
				FROM Contracts 
				WHERE Contracts.Id = C_Id
				LIMIT 1
				   )
		LIMIT 1;
    RETURN maxW;
END$$
DELIMITER ;
SELECT get_MaxWeight_by_ContractId(500);

-- процедура для знахождення всіх кораблів вказаного типу компаній перевізників
DROP PROCEDURE IF EXISTS get_all_ships_for_all_FC_by_ShipTypeId;
DELIMITER $$
CREATE PROCEDURE get_all_ships_for_all_FC_by_ShipTypeId(IN typeOfShips INT)
BEGIN
		SELECT FC_Name, COUNT(FC_Id) numberOfShips
		FROM freightcompanies_ships
		WHERE ShipTypeId = typeOfShips
		GROUP BY  FC_Id;
END$$
DELIMITER ;
CALL get_all_ships_for_all_FC_by_ShipTypeId(2);

-- процедура для знахождення всіх портів за назвою країни
DROP PROCEDURE IF EXISTS get_all_Ports_by_CountryName;
DELIMITER $$
CREATE PROCEDURE get_all_Ports_by_CountryName(IN NameOfCountry VARCHAR(20))
BEGIN
	SELECT ports.Id, ports.Name FROM countries
	JOIN ports ON ports.CountryCode = countries.Code
	WHERE countries.Name = NameOfCountry;
END$$
DELIMITER ;
CALL get_all_Ports_by_CountryName('США');