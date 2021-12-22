USE shipping;

DROP TRIGGER IF EXISTS validate_product;
DELIMITER |
CREATE TRIGGER validate_product 
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

DROP TRIGGER IF EXISTS validate_worker;
CREATE TRIGGER validate_worker 
BEFORE  INSERT ON Workers
	FOR EACH ROW BEGIN
	IF (
		NEW.Salary < (
		SELECT MinSalary 
		FROM workers
		JOIN positions ON positions.Id = NEW.PositionId
        LIMIT 1
		)
    )
	  THEN
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = "The value 'Salary' is less than the minimum wage";
	END IF;
END;
