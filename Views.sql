-- вьюшка, зв'язуюча таблиці "Компанії перивізники" з "Кораблі"
DROP VIEW IF EXISTS freightcompanies_ships;
CREATE VIEW freightcompanies_ships
AS
SELECT freightcompanies.Id FC_Id, CountryCode, freightcompanies.Name FC_Name, PhoneNumber, Email,
ships.Id S_Id, ShipTypeId, FreightCompanyId, ships.Name S_Name
FROM ships 
JOIN freightcompanies ON freightcompanies.Id = ships.FreightCompanyId;

-- вьюшка, зв'язуюча таблиці "порти" з "контрактами" через табл "точки призначення"
DROP VIEW IF EXISTS ports_contracts;
CREATE VIEW ports_contracts
AS
SELECT ports.Id Ports_Id, CountryCode, ports.Name Ports_Name,
contracts.Id Contracts_Id, ShipId, ClientId, SigningDate
FROM destinations
JOIN ports ON ports.Id = destinations.PortId
JOIN contracts ON contracts.Id = destinations.ContractId;