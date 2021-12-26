CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'Aqwerty';
GRANT ALL PRIVILEGES ON shipping.* TO 'Admin'@'localhost';

CREATE USER 'TransportationManager'@'localhost' IDENTIFIED BY 'Tqwerty';
GRANT INSERT ON shipping.ships TO 'TransportationManager'@'localhost';
GRANT INSERT ON shipping.workers TO 'TransportationManager'@'localhost';
GRANT SELECT ON shipping.ships TO 'TransportationManager'@'localhost';
GRANT SELECT ON shipping.workers TO 'TransportationManager'@'localhost';
GRANT SELECT ON shipping.freightcompanies TO 'TransportationManager'@'localhost';
GRANT SELECT ON shipping.countries TO 'TransportationManager'@'localhost';
GRANT SELECT ON shipping.shiptypes TO 'TransportationManager'@'localhost';
GRANT SELECT ON shipping.positions TO 'TransportationManager'@'localhost';

CREATE USER 'OrderManager'@'localhost' IDENTIFIED BY 'Oqwerty';
GRANT INSERT ON shipping.contracts TO 'OrderManager'@'localhost';
GRANT INSERT ON shipping.destinations TO 'OrderManager'@'localhost';
GRANT INSERT ON shipping.products TO 'OrderManager'@'localhost';
GRANT SELECT ON shipping.contracts TO 'OrderManager'@'localhost';
GRANT SELECT ON shipping.destinations TO 'OrderManager'@'localhost';
GRANT SELECT ON shipping.products TO 'OrderManager'@'localhost';
GRANT SELECT ON shipping.clients TO 'OrderManager'@'localhost';
GRANT SELECT ON shipping.ports TO 'OrderManager'@'localhost';
GRANT SELECT ON shipping.ships TO 'OrderManager'@'localhost';

CREATE USER 'GeographyManager'@'localhost' IDENTIFIED BY 'Gqwerty';
GRANT INSERT ON shipping.countries TO 'GeographyManager'@'localhost';
GRANT SELECT ON shipping.countries TO 'GeographyManager'@'localhost';
GRANT INSERT ON shipping.ports TO 'GeographyManager'@'localhost';
GRANT SELECT ON shipping.ports TO 'GeographyManager'@'localhost';
