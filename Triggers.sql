USE shipping;

DROP TRIGGER IF EXISTS validate_product_Insert;
DELIMITER |
CREATE TRIGGER validate_product_Insert
BEFORE  INSERT ON Products
	FOR EACH ROW BEGIN
	IF (get_current_ShipWeight(NEW.ContractId) + NEW.Weight > get_MaxWeight_by_ContractId(NEW.ContractId))
	  THEN
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = "Overweight on the ship";
	END IF;
END;


DROP TRIGGER IF EXISTS validate_worker_Insert;
DELIMITER ||
CREATE TRIGGER validate_worker_Insert 
BEFORE  INSERT ON Workers
	FOR EACH ROW BEGIN
	IF (NEW.Salary < get_MinSalary_by_PositionId(NEW.PositionId))
	  THEN
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = "The value 'Salary' is less than the minimum wage";
	END IF;
END;

DROP TRIGGER IF EXISTS validate_product_Update;
DELIMITER |
CREATE TRIGGER validate_product_Update 
BEFORE UPDATE 
ON Workers
	FOR EACH ROW BEGIN
	IF (NEW.Salary < get_MinSalary_by_PositionId(OLD.PositionId))
	  THEN
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = "The new value of 'Salary' is less than the minimum wagep";
	END IF;
END;