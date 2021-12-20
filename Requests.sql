USE shipping;

-- топ 10 країн з найбільшою кількістю портів
SELECT DISTINCT Countries.Name,  Ports.CountryCode, COUNT(Ports.CountryCode)
FROM Ports
JOIN Countries ON Countries.Code = Ports.CountryCode
GROUP BY CountryCode
ORDER BY COUNT(Ports.CountryCode) DESC
LIMIT 10;

SELECT ShipTypeId, COUNT(ShipTypeId) FROM shipping.ships
GROUP BY ShipTypeId;

SELECT COUNT(ShipTypeId) FROM ships;