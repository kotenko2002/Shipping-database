USE shipping;

INSERT INTO Countries 
VALUES 
('AUS', 'Австралія'),('BGD', 'Бангладеш'),('BEL','Бельгія'),('BRA','Бразилія'),
('VNM','В''єтнам'),('GBR','Велика Британія'),('EGY','Єгипет'),('IND','Індія'),
('IDN','Індонезія'),('IRN','Іран'),('ESP','Іспанія'),('ITA','Італія'),
('CAN','Канада'),('CHN','КНР'),('MYS','Малайзія'),('ANT','Нідерланди'),
('DEU','Німеччина'),('NOR','Норвегія'),('ARE','ОАЕ'),('PAK','Пакистан'),
('ZAF','ПАР'),('PER','Перу'),('PRK','Південна Корея'),
('SAU','Саудівська Аравія'),('SGP','Сінгапур'),('USA','США'),('THA','Таїланд'),
('TWN','Тайвань'),('TUR','Туреччина'),('UKR','Україна'),('PHL','Філіппіни'),
('FRA','Франція'),('JPN','Японія');

INSERT INTO Ports(CountryCode, Name)
VALUES 
('AUS', 'Порт-Гедленд'),('AUS', 'Дамп''єр'),('AUS', 'Ньюкасл'),('AUS', 'Хей Пойнт'),('AUS', 'Гладстон'),
('BGD', 'Читтагонг'),
('BEL', 'Антверпен'),
('BRA', 'Ітакі'),('BRA', 'Тубарао'),('BRA', 'Сантос'),('BRA', 'Ітагуай'),('BRA', 'Сан Себастьян'),('BRA', 'Паранагуа'),
('VNM', 'Сайгон'),
('GBR', 'Волсенд'),('GBR', 'Гарідж'),('GBR', 'Госпорт'),('GBR', 'Дартмут'),('GBR', 'Дувр'),('GBR', 'Портсмут'),('GBR', 'Лондон'),('GBR', 'Грімсбі'),
('EGY','Олександрія'),
('IND','Парадип'),('IND','Вішакхапатнам'),('IND','Джавахарлал Неру'),('IND','Бомбей'),('IND','Ченнаї'),('IND','Калькутта'),
('IDN','Танджунг Приок'),
('IRN','Бендер-Аббас'),('IRN','Бендер-Аббас'),
('ESP','Альхесірас'),('ESP','Валенсія'),('ESP','Барселона'),
('ITA','Трієст'),('ITA','Генуя'),
('CAN','Ванкувер'),
('CHN','Шанхай'),('CHN','Ціндао'),('CHN','Гуанчжоу'),('CHN','Нінбо'),('CHN','Тяньцзінь'),('CHN','Далянь'),('CHN','Гонконг'),('CHN','Циньхуандао'),('CHN','Сямень'),('CHN','Шеньчжень'),
('MYS','Порт-Кланг'),('MYS','Танджунг Пелепас'),('MYS','Бінтулу'),
('ANT','Роттердам'),('ANT','Амстердам'),
('DEU','Гамбург'),('DEU','Бремен'),
('NOR','Берген'),
('ARE','Дубай'),
('PAK','Карачі'),
('ZAF','Річардс-Бей'),('ZAF','Салдана Бей'),
('PER','Каяо'),
('PRK','Пусан'),('PRK','Кваньян'),('PRK','NAME'),('PRK','Ульсан'),('PRK','Інчхон'),('PRK','Даесан'),('PRK','Пхохан'),
('SAU','Ель-Джубайль'),('SAU','Янбу'),('SAU','Джидда'),
('SGP','Сінгапур'),
('USA','Південна Луїзіана'),('USA','Х''юстон'),('USA','Нью-Йорк'),('USA','Новий Орлеан'),('USA','Бомонт'),('USA','Корпус-Крісті'),
('USA','Лонг Біч'),('USA','Батон Руж'),('USA','Лос-Анджелес'),('USA','Мобіл'),('USA','Вірджинія'),('USA','Лейк Чарльз'),('USA','Плакемінс'),('USA','Лаем Чабанг'),
('THA','Лаем Чабанг'),
('TWN','Гаосюн'),('TWN','Тайчжун'),
('TUR','Ботас'),('TUR','Ізміт'),('TUR','Аліага'),
('UKR','Південний'),
('PHL','Маніла'),
('FRA','Марсель'),('FRA','Гавр'),('FRA','Дюнкерк'),
('JPN','Нагоя'),('JPN','Тіба'),('JPN','Йокогама'),('JPN','Кітакюсю'),('JPN','Кобе'),('JPN','Токіо'),('JPN','Осака');

INSERT INTO Positions(Name, MinSalary)
VALUES 
('Капітан', 8000),('Старший помічник', 5500),('Другий помічник', 3500),('Старший механік', 8000),
('Механік', 3000),('Боцман', 1500),('Матрос', 1000),('Кок', 1300);

INSERT INTO ShipTypes(Name, MaxWeight)
VALUES 
('Вантажне судно загального призначення', 25000),('Вантажне судно середніх розмірів', 45000),('Вантажне судно типу LR1', 80000),
('Вантажне судно типу LR2', 160000),('Вантажне судно типу VL', 320000),('Вантажне судно типу UL', 550000);

INSERT INTO FreightCompanies(CountryCode, Name, PhoneNumber, Email)
VALUES 
('USA','A.P. Moller–Maersk Group', '+1-858-842-7616', 'MollerMaerskGroup@gmail.com'),('ITA','Mediterranean Shipping Company', '+39 038 728 472', 'MediterraneanShippingCompany@gmail.com'),
('CHN','COSCO', '17090094965', 'COSCOAdamant@gmail.com'), ('FRA','CMA CGM Group', '05 09 55 76 67', 'CMAandCGMGroup@gmail.com'),
('UKR','NIKO', '+380942139965', 'NikoHolistic@gmail.com'),('USA','Hapag-Lloyd', '+1 (530) 641-1621', 'HPJuvenile@gmail.com'),
('JPN','Ocean Network Express', '0400-186-405', 'OceanNE@gmail.com'),('TWN','Evergreen Marine Corp', '(02)0601-9518', 'EvergreenMC@gmail.com'),
('TWN','Yang Ming Marine Corporation', '(02)51350879', 'YMMCorporation@gmail.com'),('SGP','Pacific International Line', '00386 2 935 2353', 'PacificIL@gmail.com'),
('PRK','Hyundai MM', '562(84)877-29-02', 'HMMcorp@gmail.com');

INSERT INTO Ships(ShipTypeId, FreightCompanyId, Name)
VALUES 
(1, 1, 'The Hateful Terror'),(5, 1, 'The Disgrace of the Coward'),(3, 1, 'The Shadows of the Executioners'),
(5, 1, 'The Corrupted Galley'),(2, 1, 'The Liberty Grail'),(6, 1, 'The Madness of the Disgrace'),
(4, 1, 'The Buccaneers Shark'),(4, 1, 'The Poseidon''s Tortuga'),(1, 1, 'The Happy Hades'),
(4, 1, 'The Howl of the Doom'),(2, 1, 'The Bearded Wolf'),(3, 1, 'The Poison Delight'),
(4, 1, 'The Revenge Deceit'),(1, 1, 'The Corsair'),(2, 1, 'The Revenge Doubloon'),
(2, 2, 'The Victory Secret'),(4, 2, 'The Black Curse'),(3, 2, 'The Delight'),
(1, 2, 'The Most Sun'),(3, 2, 'The Adventure Sun'),(3, 2, 'The Disgrace of the Strumpet'),
(4, 2, 'The Nights Murderer'),(3, 2, 'The Last Executioner'),(2, 2, 'The Evil Wolf'),
(3, 2, 'The Rovers'),(3, 2, 'The Gold Plunder'),(2, 2, 'The Evil Tainted'),
(2, 2, 'The Fortune'),(3, 2, 'The Hades Tide'),(2, 2, 'The Howling Murderer'),
(2, 2, 'The Mayflower Rose'),(1, 2, 'The Death of James'),(3, 2, 'The Hellish Pillager'),
(3, 2, 'The Curse of the Plunderer'),(3, 2, 'The Deceitful Knave'),(2, 2, 'The Greedy Cutlass'),
(1, 2, 'The Deceit of Trinity'),(3, 2, 'The Sadness of the Deceit'),(3, 2, 'The Speedy Deceit'),
(3, 2, 'The Grand Executioners'),(1, 2, 'The Festering Wolf'),(1, 2, 'The Black Slave'),
(2, 2, 'The Hell-born Jewel'),(2, 2, 'The Davy Jones Pearl'),(4, 2, 'The Poisoned Captain'),
(2, 2, 'The Rising Marauders'),(5, 2, 'The Plundering Hind'),(3, 2, 'The Revenge Delight'),
(3, 2, 'The Howling Murderers'),(2, 2, 'The Cursed Buccaneers'),(1, 2, 'The Good Fear'),
(2, 2, 'The Red Murderer'),(2, 2, 'The Fearful Demon'),(3, 2, 'The Privateers Killers'),
(3, 3, 'The Rising Hangman'),(2, 3, 'The Black Sea Rovers'),(4, 3, 'The New Dagger'),
(1, 3, 'The Dishonorable Wolf'),(4, 3, 'The Mermaid''s Dragon'),(2, 3, 'The Davy Jones Pearl'),
(4, 3, 'The Revenge Damnation'),(1, 3, 'The Cacophonous Trinity'),(4, 3, 'The Rising Deceit'),
(6, 3, 'The Disrespectful Hind'),(3, 3, 'The Nights Pearl'),(4, 3, 'The Murderers Damned'),
(2, 3, 'The Sudden Delivery'),(5, 3, 'The Murderous Fear'),(3, 3, 'The Fortune Strumpet'),
(4, 3, 'The Pride of the Deceit'),(1, 3, 'The Hell-born Swashbucklers'),(3, 3, 'The White Sun'),
(4, 3, 'The Hell-born Fall'),(3, 3, 'The Murderers Sun'),(2, 3, 'The Devils Gold'),
(2, 3, 'The Corrupted Doubloon'),(3, 3, 'The Speedy Saber'),(2, 3, 'The Damned Strumpet'),
(4, 3, 'The Sea Plunderers'),(3, 3, 'The Murderous Fear'),(1, 3, 'The White Anger'),
(1, 3, 'The Little Treasure'),(5, 3, 'The Grief of the Delight'),(3, 3, 'The Golden Rovers'),
(2, 3, 'The Poseidon''s Fortune'),(4, 3, 'The Anger of the Strumpet'),(2, 3, 'The Uncultured Killers'),
(2, 3, 'The Sudden Saber'),(4, 3, 'The Angry Princess'),(1, 3, 'The Vile Sea Rovers'),
(3, 4, 'The Fall of Killer'),(1, 4, 'The Night Delivery'),(2, 4, 'The Neptune''s Storm'),
(1, 4, 'The Plundering Atlantis'),(3, 4, 'The Most Murderer'),(1, 4, 'The Nights North'),
(2, 4, 'The Sanguine Damnation'),(2, 4, 'The Killers Saber'),(4, 4, 'The Sadness of the Dragon'),
(2, 4, 'The Disgrace of the Privateer'),(3, 4, 'The Uncultured Pillager'),(3, 4, 'The Broken Rose'),
(5, 4, 'The Pirates Horror'),(2, 4, 'The Foul Serpent of Delight'),(2, 4, 'The Sudden Return'),
(2, 4, 'The Neptune''s Scorn'),(5, 4, 'The Neptune''s Jewel'),(4, 4, 'The Grief of the Executioners'),
(1, 4, 'The Disrespectful Scorn'),(3, 4, 'The Disgraced Saber'),(2, 4, 'The Disgrace of the Caribbean'),
(3, 4, 'The Revenge Delight'),(1, 4, 'The Uncultured Ranger'),(2, 4, 'The Uncultured Scream'),
(2, 4, 'The Mangy Damnation'),(2, 4, 'The Drunken Captain'),
(2, 5, 'The Privateer'),(2, 5, 'The Pearl'),(1, 5, 'The Angry Serpent'),
(3, 5, 'The White Dagger'),(3, 5, 'The Mad Fear'),(4, 5, 'The Madness of the Corsair'),
(1, 5, 'The Rude Strumpet'),(2, 5, 'The Hateful Serpent'),(4, 5, 'The Grief of the Demon'),
(3, 5, 'The Uncultured Lightning'),(3, 5, 'The Killers Anger'),(3, 5, 'The Privateers Manta'),
(4, 5, 'The Mayflower Coward'),
(2, 6, 'The Disgraceful Hangman'),(6, 6, 'The Howling Doom'),(3, 6, 'The Curse of the Hind'),
(1, 6, 'The Sanguine Privateer'),(3, 6, 'The Rancid Eel'),(3, 6, 'The Red Damnation'),
(3, 6, 'The Nights Murderer'),(3, 6, 'The Mad Slave'),(3, 6, 'The Fearful Grail of Hades'),
(1, 6, 'The Devils Hangman'),(6, 6, 'The Sudden Serpent'),(5, 6, 'The Oceans Demon'),
(2, 6, 'The Victory Galley'),(6, 6, 'The Fortune'),(3, 6, 'The Victory Dagger'),
(3, 6, 'The Howling Night'),(1, 6, 'The Burning Shark'),(4, 6, 'The Deceit of Eel'),
(4, 6, 'The Night Seas'),(3, 6, 'The Red King'),(3, 6, 'The Rude Coward'),
(2, 6, 'The Cry of the Fall'),(5, 6, 'The Bloody Rovers'),(3, 6, 'The Murderers'),
(2, 6, 'The Corrupted Fear'),(2, 6, 'The Plundering Anger'),(3, 6, 'The Corrupted Pearl'),
(1, 6, 'The Festering Hangman'),(4, 6, 'The Burning Strumpet'),(2, 6, 'The Rancid Trinity'),
(2, 6, 'The Homicidal Caribbean'),(1, 6, 'The Dragons Strumpet'),(3, 6, 'The Sudden James'),
(1, 6, 'The Poisoned Dagger'),(2, 6, 'The Disrespectful Howl'),(4, 6, 'The Loyal Seas'),
(5, 6, 'The Cursed Insanity'),(5, 6, 'The Cruel Wolf'),(3, 6, 'The Speedy Eel'),
(3, 6, 'The Good Privateer'),(3, 6, 'The Vile Rambler'),(1, 6, 'The Filthy Grail'),
(2, 6, 'The Mad Deceit'),
(2, 7, 'The Broken Demon'),(3, 7, 'The Curse of the Seas'),(3, 7, 'The Shadows of the Pirate'),
(3, 7, 'The Captains Plunderer'),(4, 7, 'The Howling Ghost'),(2, 7, 'The Foul Serpent of Night'),
(3, 7, 'The White Ranger'),(4, 7, 'The Cacophonous Fear'),(4, 7, 'The Greed of the Damned'),
(1, 7, 'The Pride of the Sun'),(3, 7, 'The Oceans Curse'),(3, 7, 'The New Ranger'),
(4, 7, 'The Howl of the Terror'),(3, 7, 'The Scurvy Pearl'),(3, 7, 'The Secret'),
(1, 7, 'The Poisonous Hades'),(4, 7, 'The Cutlass'),(3, 7, 'The Howling Delivery'),
(3, 7, 'The Victory Princess'),(1, 7, 'The Disgrace of the Manta'),(3, 7, 'The Scurvy Tortuga'),
(6, 7, 'The Uncultured Curse'),(5, 7, 'The Crimson Howl'),
(1, 8, 'The Pirates Death'),(2, 8, 'The Drunken Privateer'),(1, 8, 'The Burning Tortuga'),
(3, 8, 'The Death of Raider'),(2, 8, 'The Red Killer'),(2, 8, 'The Lust of the Servant'),
(1, 8, 'The Dishonorable Princess'),(3, 8, 'The Damned Doubloon'),(3, 8, 'The Elusive James'),
(4, 8, 'The Foul Serpent of Delivery'),(3, 8, 'The Howling Trinity'),(3, 8, 'The Scurvy Terror'),
(4, 8, 'The Hades Plague'),(3, 8, 'The Plundering Saber'),(3, 8, 'The Plundering Abandoned'),
(3, 8, 'The Poseidon''s Hangman'),(6, 8, 'The Murderous Night'),
(4, 9, 'The Night Night'),(3, 9, 'The Foul Serpent of Fortune'),(3, 9, 'The Corrupted Seven Seas'),
(5, 9, 'The Dragons Curse'),(3, 9, 'The Anger of the Lust'),(2, 9, 'The Last Doom'),
(1, 9, 'The Mermaid''s Strumpet'),(3, 9, 'The Disgrace of the Killer'),(3, 9, 'The Privateer'),
(3, 9, 'The Bloody Killers'),(1, 9, 'The Filthy Damnation'),(3, 9, 'The Speedy Ranger'),
(4, 9, 'The Good Seas'),(3, 9, 'The Howling Lust'),(3, 9, 'The Mangy Plunderers'),
(2, 9, 'The Victory Dagger'),(3, 9, 'The Mayflower Pirate'),(5, 9, 'The Damned Galley'),
(1, 9, 'The Shadows of the Night'),(4, 9, 'The Poison Seas'),(3, 9, 'The Mad Disgrace'),
(1, 9, 'The Bloodthirsty Corsair'),(4, 9, 'The Black Tortuga'),(1, 9, 'The Uncultured Damnation'),
(4, 9, 'The Shadows of the Pearl'),(4, 9, 'The Golden Lust'),(5, 9, 'The Poison Murderers'),
(3, 9, 'The Davy Jones Captain'),(3, 9, 'The Howling Damnation'),(4, 9, 'The Blasted Manta'),
(3, 9, 'The Happy North'),(3, 9, 'The Plunderer'),(2, 9, 'The Corrupted Tide'),
(2, 9, 'The Liberty Sun'),(2, 9, 'The Snap Coward'),(1, 9, 'The Snap Slave'),
(2, 10, 'The Seas Servants'),(3, 10, 'The Most James'),(1, 10, 'The Rude Rift'),
(2, 10, 'The Cursed Hind'),(3, 10, 'The White Death'),(1, 10, 'The Blasted Damnation'),
(3, 10, 'The Happy Minnow'),(3, 10, 'The Elusive Swashbucklers'),(2, 10, 'The Sadness of the Hades'),
(2, 10, 'The Poseidon''s Lightning'),(3, 10, 'The Captains Grail'),(2, 10, 'The Murderous Seven Seas'),
(3, 10, 'The Filthy Return'),(1, 10, 'The Pirates Cutlass'),(3, 10, 'The Devils Seas'),
(4, 10, 'The Damnation of the Seas'),(3, 10, 'The Davy Jones King'),(3, 10, 'The Discourteous Damnation'),
(1, 10, 'The Evil Fortune'),(3, 10, 'The Cry of the Plunderers'),(1, 10, 'The Damned Disgrace'),
(3, 10, 'The Nights Servants'),(3, 10, 'The Return'),(2, 10, 'The Fall of Plunderers'),
(4, 10, 'The Shadows of the Dagger'),(3, 10, 'The Festering Disgrace'),(3, 10, 'The Lust of the Rose'),
(1, 10, 'The Murderous Night'),(4, 10, 'The Grand Sea Rovers'),(1, 10, 'The Poisoned Privateer'),
(3, 10, 'The Liberty Terror'),(3, 10, 'The Plunderer'),(3, 10, 'The Howl of the Treasure'),
(3, 11, 'The Flying Fear'),(3, 11, 'The Blasted Delivery'),(5, 11, 'The Revenge Hind'),
(6, 11, 'The Mangy Killers'),(3, 11, 'The Gold Ghost'),(5, 11, 'The New Fortune'),
(4, 11, 'The Poisonous Plague'),(3, 11, 'The Blind Dragon'),(3, 11, 'The Pride of the Pillager');

INSERT INTO Clients(Name, PhoneNumber, Email)
VALUES 
('Amazon','978(4931)859-86-24','neihasseimmeunni-1645@yopmail.com'),('eBay','817(899)129-21-96','cosufroupropoi-3031@yopmail.com'),('Auchan','2(688)362-46-46','feipaddassaneu-8943@yopmail.com'),('Alibaba','293(0673)802-78-07','sexauquadere-3549@yopmail.com'), -- всё подряд
('Кернел','1(5212)462-54-22','wexoisobatre-4704@yopmail.com'),('НИБУЛОН','098-4624-324','xeunoipaquoipri-3176@yopmail.com'),('IGT','4(4194)990-98-64','gradauffepreumme-2771@yopmail.com'),('УкрЭлеваторПром','388(70)744-29-96','seunnaffeussukeu-6589@yopmail.com'), -- зерно
('Nucor Corporation','00(40)644-14-27','bitouhaunifre-4285@yopmail.com'),('Метинвест','096-3488-091','jerevesewoi-9947@yopmail.com'),('ArcelorMittal','732(383)017-29-62','paufretrebrena-4145@yopmail.com'),('Tata Steel','23(139)507-09-78','xeddecaucreje-6303@yopmail.com'), -- металурги
('Volkswagen','0(14)402-27-32','friyefunneuqui-1011@yopmail.com'),('Ford','60(941)250-56-24','quixeigufreja-3217@yopmail.com'),('Honda','822(074)792-84-67','queuddemmidoidoi-4159@yopmail.com'),('Toyota ','960(9813)475-55-39','brennoussigrumu-5252@yopmail.com'), -- авто
('Nestle','0(110)767-17-14','bipruzuyassa-7137@yopmail.com'),('Coca-Cola','46(934)484-72-01','kovatreprauprou-6788@yopmail.com'),('Danone','9(575)405-70-44','hoibejugroceu-8942@yopmail.com'),('PepsiCo','838(4289)120-44-90','baxuvaubaddou-5911@yopmail.com'), -- продукты питания
('ДЕРЕВОРУБ','738(348)607-41-91','xetrojoulleipro-1190@yopmail.com'),('Wood Work','539(202)230-34-50','trappeikifreipeu-5484@yopmail.com'); -- дерево

INSERT INTO Contracts(ShipId, ClientId)
VALUES 
(2,5),(4,15),(22,20),(2,3);

INSERT INTO Products(ContractId, Name, Weight, Price)
VALUES 
(1,"Пиво",15000, 30000),(1,"Сидр",21000, 42000),(1,"Водка",37000, 74000),(1,"Вино",9000, 18000),
(4,"Виски",55000, 11000),(4,"Шампанское",13000, 26000),(2,"Понос",777, 1000);

INSERT INTO Products(ContractId, Name, Weight, Price)
VALUES 
(1,"XXX",25000, 30000);