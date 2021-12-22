USE shipping;

-- (1) топ 10 країн з найбільшою кількістю портів
SELECT DISTINCT Countries.Name,  Ports.CountryCode, COUNT(Ports.CountryCode)
FROM Ports
JOIN Countries ON Countries.Code = Ports.CountryCode
GROUP BY CountryCode
ORDER BY COUNT(Ports.CountryCode) DESC
LIMIT 10;
 
-- (2) топ 10 портів світу за відвідуваністю
SELECT ports.CountryCode, ports.Name, COUNT(ports.Id) 
FROM destinations
JOIN ports ON ports.Id = destinations.PortId
JOIN contracts ON contracts.Id = destinations.ContractId
GROUP BY ports.Id
ORDER BY ports.CountryCode DESC
; 
 
-- (3). топ 10 країн світу за відвідуваністю
SELECT countries.Name, COUNT(ports.Id) 
FROM destinations
JOIN ports ON ports.Id = destinations.PortId
JOIN contracts ON contracts.Id = destinations.ContractId
JOIN countries ON countries.Code = ports.CountryCode
GROUP BY countries.Code
ORDER BY COUNT(ports.Id) DESC
LIMIT 10;
 
-- (4) кількість кораблів компаній перевізників
SELECT CountryCode, freightcompanies.Name, COUNT(freightcompanies.Id) numberOfShips
FROM ships
JOIN freightcompanies ON freightcompanies.Id = ships.FreightCompanyId
GROUP BY  freightcompanies.Id;
 
-- (5) кількість співробітників компаній перевізників на кораблях
SELECT CountryCode, freightcompanies.Name, COUNT(workers.Id) numberOfWorkers
FROM workers
JOIN ships ON ships.Id = workers.ShipId
JOIN freightcompanies ON freightcompanies.Id = ships.FreightCompanyId
GROUP BY freightcompanies.Id;
 
-- (6) контрактна інформація компанії перевізника та компаній, які користуються її послугами
SELECT freightcompanies.Name Freight_Company_Name, freightcompanies.PhoneNumber FK_PhoneNumber, freightcompanies.Email FK_Email,
clients.Name Client_Company_Name, clients.PhoneNumber CC_PhoneNumber, clients.Email CC_Email
FROM contracts
JOIN ships ON ships.Id = contracts.ShipId
JOIN clients ON clients.Id = contracts.ClientId
JOIN freightcompanies ON freightcompanies.Id = ships.FreightCompanyId
GROUP BY freightcompanies.Id, clients.Id
ORDER BY freightcompanies.Id;
 
-- (7) інформація про завантаженість кожного корабля 
SELECT  ships.Name, SUM(products.Weight) CurrentWeight, 
shiptypes.MaxWeight - SUM(products.Weight) FreeWeight, shiptypes.MaxWeight
FROM products
JOIN contracts ON contracts.Id = products.ContractId
JOIN ships ON ships.Id = contracts.ShipId
JOIN shiptypes ON shiptypes.Id = ships.ShipTypeId
GROUP BY ships.Id;
 
-- (8) повна інформація про продукт
SELECT products.Name ProductName, clients.Name ClientName, Weight, Price
FROM products
JOIN contracts ON contracts.Id = products.ContractId
JOIN clients ON clients.Id = contracts.ClientId;
 
-- (9) середня ціна однієї тонни вантажу кожного клієнта
SELECT clients.Name, ROUND(SUM(Price)/SUM(Weight),2) 
FROM products
JOIN contracts ON contracts.Id = products.ContractId
JOIN clients ON clients.Id = contracts.ClientId
GROUP BY clients.Id;
 
-- (10)  інформація про команду корабля
SELECT FullName, positions.Name, PhoneNumber, Salary 
FROM workers
JOIN positions ON positions.Id = workers.PositionId
JOIN ships ON ships.Id = workers.ShipId
WHERE ships.Name = 'The Hateful Terror';
 
-- (11)  інформація, які порти/країни корабель повинен відвідати
SELECT ports.Name, countries.Name FROM ships
JOIN contracts ON ships.Id = contracts.ShipId
JOIN destinations ON contracts.Id = destinations.ContractId
JOIN ports ON ports.Id = destinations.PortId
JOIN countries ON countries.Code = ports.CountryCode
WHERE ships.Name = 'The Hateful Terror';

-- (12)  інформація, про всіх "назва професії" в компанії "назва компанії"
SELECT FullName WorkerName, ships.Name ShipName, workers.PhoneNumber, Salary
FROM freightcompanies
JOIN ships ON freightcompanies.Id = ships.FreightCompanyId
JOIN workers ON ships.Id =  workers.ShipId
JOIN positions ON positions.Id = workers.PositionId
WHERE freightcompanies.Name = 'A.P. Moller–Maersk Group' AND positions.Name = 'Капітан';


SELECT freightcompanies.Name, COUNT(freightcompanies.Id) numberOfShips
FROM ships
JOIN freightcompanies ON freightcompanies.Id = ships.FreightCompanyId
GROUP BY  freightcompanies.Id, ships.ShipTypeId;

SELECT ShipTypeId, COUNT(ShipTypeId) FROM shipping.ships
GROUP BY ShipTypeId;

SELECT COUNT(ShipTypeId) FROM ships;