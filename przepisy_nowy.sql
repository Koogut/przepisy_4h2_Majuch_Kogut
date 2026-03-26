DROP DATABASE IF EXISTS przepisy;
CREATE DATABASE przepisy;
USE przepisy;

-- ========================
-- TABELA: dania_nasze
-- ========================
CREATE TABLE dania_nasze (
  ID_danie int AUTO_INCREMENT PRIMARY KEY,
  nazwa varchar(50) NOT NULL,
  opis text NOT NULL,
  zdjecie varchar(255) NOT NULL
);

INSERT INTO dania_nasze (ID_danie, nazwa, opis, zdjecie) VALUES
(1,'Schabowy','1. Rozbij mięso. 2. Obtocz. 3. Smaż. 4. Podawaj.','zdjecia/schabowy.jpg'),
(2,'Carbonara','1. Makaron. 2. Boczek. 3. Jajka. 4. Połącz.','zdjecia/carbonara.jpg'),
(3,'Rosół','1. Gotuj kurczaka. 2. Dodaj warzywa. 3. Gotuj. 4. Podawaj.','uploads/rosol.jpg'),
(4,'Pierogi','1. Ziemniaki. 2. Farsz. 3. Lep. 4. Gotuj.','uploads/pierogi.jpg'),
(5,'Żurek','1. Zakwas. 2. Kiełbasa. 3. Gotuj. 4. Podawaj.','uploads/zurek.jpg'),
(6,'Placki','1. Ziemniaki. 2. Jajka. 3. Smaż.','uploads/placki.jpg'),
(7,'Gołąbki','1. Ryż. 2. Mięso. 3. Kapusta. 4. Duś.','uploads/golabki.jpg'),
(8,'Pizza','1. Ciasto. 2. Sos. 3. Ser. 4. Piecz.','uploads/pizza.jpg'),
(9,'Tosty','1. Jajko. 2. Smaż.','uploads/tosty.jpg'),
(10,'Sałatka','1. Pokrój. 2. Wymieszaj.','uploads/grecka.jpg');

-- ========================
-- TABELA: skladniki
-- ========================
CREATE TABLE skladniki (
  ID_skladnik int AUTO_INCREMENT PRIMARY KEY,
  nazwa varchar(50),
  cena decimal(6,2)
);

INSERT INTO skladniki VALUES
(101,'Mięso wieprzowe',25),
(102,'Ziemniaki',2),
(103,'Jajka',1),
(104,'Mąka',3),
(105,'Bułka tarta',4),
(106,'Olej',6),
(107,'Boczek',20),
(108,'Makaron',5),
(109,'Parmezan',30),
(110,'Kurczak',18),
(111,'Kapusta',4),
(112,'Ryż',5),
(113,'Mozzarella',12),
(114,'Pomidor',5),
(115,'Ogórek',4),
(116,'Feta',10),
(117,'Oliwki',8),
(118,'Bułka',2),
(119,'Sałata',3),
(120,'Parówka',5);

-- ========================
-- TABELA: dania_skladnik_nasze
-- ========================
CREATE TABLE dania_skladnik_nasze (
  id_dania_skladnik int AUTO_INCREMENT PRIMARY KEY,
  id_danie int,
  id_skladnik int,
  ilosc decimal(8,2),
  jednostka varchar(10)
);

INSERT INTO dania_skladnik_nasze (id_danie,id_skladnik,ilosc,jednostka) VALUES
(1,101,0.3,'kg'),(1,102,0.5,'kg'),
(2,108,200,'g'),(2,107,100,'g'),
(3,110,0.5,'kg'),
(4,102,0.5,'kg'),
(5,107,100,'g'),
(6,102,0.5,'kg'),
(7,111,1,'szt'),
(8,113,100,'g'),
(9,103,2,'szt'),
(10,114,2,'szt');

-- ========================
-- TABELA: dania_uzytkownikow
-- ========================
CREATE TABLE dania_uzytkownikow (
  ID_danie_uzykownikow int AUTO_INCREMENT PRIMARY KEY,
  nazwa varchar(50),
  opis text,
  zdjecie varchar(255)
);

INSERT INTO dania_uzytkownikow VALUES
(1,'Burger','1. Smaż. 2. Złóż.','uploads/burger.jpg'),
(2,'Kebab','1. Kurczak. 2. Tortilla.','uploads/kebab.jpg'),
(3,'Zapiekanka','1. Bagietka. 2. Ser.','uploads/zapiekanka.jpg'),
(4,'Naleśniki','1. Ciasto. 2. Smaż.','uploads/nalesniki.jpg'),
(5,'Pesto','1. Makaron. 2. Sos.','uploads/pesto.jpg'),
(6,'Ryż z kurczakiem','1. Ryż. 2. Kurczak.','uploads/ryz.jpg'),
(7,'Omlet','1. Jajka. 2. Smaż.','uploads/omlet.jpg'),
(8,'Hotdog','1. Parówka. 2. Bułka.','uploads/hotdog.jpg'),
(9,'Tortilla','1. Mięso. 2. Zawiń.','uploads/tortilla.jpg'),
(10,'Frytki','1. Smaż ziemniaki.','uploads/frytki.jpg');

-- ========================
-- TABELA: dania_skladnik_uzytkownikow
-- ========================
CREATE TABLE dania_skladnik_uzytkownikow (
  id_dania_skladnik_uzytk int AUTO_INCREMENT PRIMARY KEY,
  id_danie_uzytk int,
  id_skladnik int,
  ilosc decimal(8,2),
  jednostka varchar(10)
);

INSERT INTO dania_skladnik_uzytkownikow (id_danie_uzytk,id_skladnik,ilosc,jednostka) VALUES
(1,101,0.2,'kg'),
(2,110,0.3,'kg'),
(3,118,1,'szt'),
(4,103,2,'szt'),
(5,108,200,'g'),
(6,112,200,'g'),
(7,103,3,'szt'),
(8,120,1,'szt'),
(9,110,0.3,'kg'),
(10,102,0.5,'kg');

-- ========================
-- TABELA: uzytkownicy (bez zmian)
-- ========================
CREATE TABLE uzytkownicy (
  ID_uzytkownik int AUTO_INCREMENT PRIMARY KEY,
  login varchar(20),
  email varchar(50),
  haslo varchar(255)
);

INSERT INTO uzytkownicy VALUES
(1,'admin','admin@example.com','c90d91066c01d92ed214'),
(2,'mesjekok','koko@gmail.com','hash'),
(3,'admin2','admin@admin.com','hash'),
(4,'majuch','sztywno@67.com','hash'),
(5,'admin3','admin3@gmail.com','hash'),
(6,'admin4','lol@lol','hash'),
(7,'admin67','email@e','hash');