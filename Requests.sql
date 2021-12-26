USE shipping;

-- (1) топ 10 країн з найбільшою кількістю портів
SELECT DISTINCT Countries.Name,  Ports.CountryCode, COUNT(Ports.CountryCode) 
FROM Ports
JOIN Countries ON Countries.Code = Ports.CountryCode
GROUP BY CountryCode
ORDER BY COUNT(Ports.CountryCode) DESC
LIMIT 10;
 
-- (2) топ 10 портів світу за відвідуваністю
SELECT CountryCode, Ports_Name, COUNT(Ports_Id) 
FROM ports_contracts
GROUP BY Ports_Id
ORDER BY COUNT(Ports_Id)  DESC
LIMIT 10;

-- (3). топ 10 країн світу за відвідуваністю
SELECT countries.Name, COUNT(Ports_Id) 
FROM ports_contracts
JOIN countries ON countries.Code = CountryCode
GROUP BY countries.Code
ORDER BY COUNT(Ports_Id) DESC
LIMIT 10;
 
-- (4) кількість кораблів компаній перевізників
SELECT CountryCode, FC_Name, COUNT(FC_Id) numberOfShips
FROM freightcompanies_ships
GROUP BY  FC_Id;
 
-- (5) кількість співробітників компаній перевізників на кораблях
SELECT CountryCode, FC_Name, COUNT(workers.Id) numberOfWorkers
FROM workers
JOIN freightcompanies_ships ON S_Id = workers.ShipId
GROUP BY FC_Id;
 
-- (6) контрактна інформація компанії перевізника та компаній, які користуються її послугами
SELECT FC_Name Freight_Company_Name, freightcompanies_ships.PhoneNumber FC_PhoneNumber, freightcompanies_ships.Email FC_Email,
clients.Name Client_Company_Name, clients.PhoneNumber CC_PhoneNumber, clients.Email CC_Email
FROM contracts
JOIN freightcompanies_ships ON S_Id = contracts.ShipId
JOIN clients ON clients.Id = contracts.ClientId
GROUP BY FC_Id, clients.Id
ORDER BY FC_Id;
 
-- (7) інформація про завантаженість кожного корабля 
SELECT ships.Name, SUM(products.Weight) CurrentWeight, 
shiptypes.MaxWeight - SUM(products.Weight) FreeWeight, shiptypes.MaxWeight
FROM products
JOIN contracts ON contracts.Id = products.ContractId
RIGHT JOIN ships ON ships.Id = contracts.ShipId
JOIN shiptypes ON shiptypes.Id = ships.ShipTypeId
GROUP BY ships.Id
order by ships.Id;
 
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
GROUP BY clients.Id
ORDER BY ROUND(SUM(Price)/SUM(Weight),2) DESC;
 
-- (10)  інформація про команду корабля
SELECT FullName, positions.Name, PhoneNumber, Salary 
FROM workers
JOIN positions ON positions.Id = workers.PositionId
JOIN ships ON ships.Id = workers.ShipId
WHERE ships.Name = 'The Hateful Terror';
 
-- (11)  інформація, які порти/країни корабель повинен відвідати
SELECT Ports_Name, countries.Name Country_Name
FROM ships
JOIN ports_contracts ON ships.Id = ShipId
JOIN countries ON countries.Code = CountryCode
WHERE ships.Name = 'The Hateful Terror';

-- (12)  інформація, про всіх "назва професії" в компанії "назва компанії"
SELECT FullName WorkerName, ships.Name ShipName, workers.PhoneNumber, Salary
FROM freightcompanies
JOIN ships ON freightcompanies.Id = ships.FreightCompanyId
JOIN workers ON ships.Id =  workers.ShipId
JOIN positions ON positions.Id = workers.PositionId
WHERE freightcompanies.Name = 'A.P. Moller–Maersk Group' AND positions.Name = 'Капітан';

-- (13) компанії, продукцію яких буде перевозити корабель по Id корабля
SELECT clients.Name, SigningDate FROM ships
JOIN contracts ON contracts.ShipId = ships.Id
JOIN clients ON clients.Id = contracts.ClientId
WHERE ships.Id = 3;

 -- (14)інформація, в яких країнах побуває працівник корабля по Id працівника
SELECT DISTINCT countries.Name 
FROM workers
JOIN ships ON ships.Id = workers.ShipId
JOIN ports_contracts ON ships.Id = ports_contracts.ShipId
JOIN countries ON countries.Code = CountryCode
WHERE workers.Id = 347;

-- (15) вся продукція, що перевозиться кораблем по Id корабля
SELECT products.Name, Weight, Price 
FROM ships
JOIN contracts ON contracts.ShipId = ships.Id
JOIN products ON contracts.Id = products.ContractId
WHERE ships.Id = 3;

-- (16) інформація про кількість працівників, загальну суму ЗА, та середню ЗП в компанії по Id компанії
SELECT  COUNT(workers.Id) Toatal_workers, SUM(workers.Salary) Total_Salary, 
ROUND(SUM(workers.Salary)/COUNT(workers.Id),2) AVG_Salary
FROM workers
JOIN freightcompanies_ships ON S_Id = workers.ShipId
WHERE FC_Id = 2;

-- (17) прибуток компаній перевізників за останні "n" місяців
SELECT freightcompanies.Name, SUM(products.Price) FROM freightcompanies
JOIN ships ON ships.FreightCompanyId = freightcompanies.Id
JOIN contracts ON contracts.ShipId = ships.Id
JOIN products ON contracts.Id = products.ContractId
WHERE MONTH(NOW()) - MONTH(SigningDate) < 5
GROUP BY freightcompanies.Id;

-- (18) прибутки перевізника за різні місяці по Id компанії
SELECT freightcompanies.Name, SUM(products.Price), MONTHNAME(SigningDate) FROM freightcompanies
JOIN ships ON ships.FreightCompanyId = freightcompanies.Id
JOIN contracts ON contracts.ShipId = ships.Id
JOIN products ON contracts.Id = products.ContractId
WHERE freightcompanies.Id = 6
group by MONTH(SigningDate)
ORDER BY MONTH(SigningDate);

-- (19) кораблі, що не мають жодного контракту
SELECT S_Id Ship_Id, S_Name Ship_Name, 
shiptypes.Name Type_Name, shiptypes.MaxWeight, FC_Name Owner_Name
FROM freightcompanies_ships
JOIN shiptypes ON shiptypes.Id = ShipTypeId
WHERE NOT EXISTS 
(SELECT * FROM contracts WHERE contracts.ShipId = S_Id)
ORDER BY S_Id;

-- (20) кораблі, що не мають жодного продукту на борту
SELECT ships.Name Ship_Name, shiptypes.Name Type, shiptypes.MaxWeight 
FROM products
JOIN contracts ON contracts.Id = products.ContractId
RIGHT JOIN ships ON ships.Id = contracts.ShipId
JOIN shiptypes ON shiptypes.Id = ships.ShipTypeId
GROUP BY ships.Id
HAVING SUM(products.Weight) IS NULL
order by ships.Id;