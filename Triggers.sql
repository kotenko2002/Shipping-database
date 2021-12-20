USE shipping;

DROP TRIGGER IF EXISTS validate_contract;
DELIMITER |
CREATE TRIGGER validate_contract 
BEFORE  INSERT ON Products
	FOR EACH ROW BEGIN
	IF (
    (
    SELECT SUM(Weight) 
	FROM Products
	JOIN Contracts ON Contracts.Id = Products.ContractId
	WHERE ShipId = (
				SELECT ShipId 
				FROM Contracts 
				WHERE Contracts.Id = NEW.ContractId 
				LIMIT 1
					) 
     ) + NEW.Weight > 
     (
		SELECT Shiptypes.MaxWeight
		FROM Contracts
		JOIN Ships ON Ships.Id = Contracts.ShipId
		JOIN Shiptypes ON Shiptypes.Id = Ships.ShipTypeId
	WHERE 
		Ships.Id = (
				SELECT ShipId 
				FROM Contracts 
				WHERE Contracts.Id = NEW.ContractId 
				LIMIT 1
				   ) 
		LIMIT 1
	  )
	)
	  THEN
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = "Overweight on the ship";
	END IF;
END;





SELECT 
    SUM(Weight)
FROM
    Products
        JOIN
    Contracts ON Contracts.Id = Products.ContractId
WHERE
    ShipId = 2;