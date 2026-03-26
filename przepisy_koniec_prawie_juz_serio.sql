-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2026 at 05:54 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS przepisy;
CREATE DATABASE przepisy;
USE przepisy;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `przepisy`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dania_nasze`
--

CREATE TABLE `dania_nasze` (
  `ID_danie` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  `opis` text NOT NULL,
  `zdjecie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dania_nasze`
--

INSERT INTO `dania_nasze` (`ID_danie`, `nazwa`, `opis`, `zdjecie`) VALUES
(1, 'Schabowy', 'Rozbij płaty schabu, dopraw solą i pieprzem. Obtocz kolejno w mące, roztrzepanym jajku i bułce tartej. Smaż na rozgrzanym tłuszczu na złoty kolor z obu stron.', 'zdjecia/schabowy.jpg'),
(2, 'Carbonara', 'Ugotuj makaron al dente. Na patelni podsmaż guanciale lub boczek. W misce wymieszaj żółtka z serem pecorino i pieprzem. Połącz makaron z mięsem, zdejmij z ognia i wmieszaj sos jajeczny.', 'zdjecia/carbonara.jpg'),
(3, 'Rosół', 'Mięso zalej zimną wodą, zagotuj i zdejmij szumowiny. Dodaj włoszczyznę, przyprawy i opaloną cebulę. Gotuj na bardzo małym ogniu przez ok. 3 godziny. Podawaj z makaronem i marchewką.', 'zdjecia/rosol.jpg'),
(4, 'Pierogi', 'Z mąki i wody zagnieć ciasto. Ziemniaki ugotuj i wymieszaj z twarogiem oraz podsmażoną cebulką. Wycinaj kółka z ciasta, nakładaj farsz i zlepiaj brzegi. Gotuj we wrzątku do wypłynięcia.', 'zdjecia/pierogi.jpg'),
(5, 'Żurek', 'W garnku zagotuj wywar z boczku i białej kiełbasy. Dodaj zakwas żytni, czosnek i majeranek. Gotuj kilka minut, aż zgęstnieje. Podawaj z ugotowanym jajkiem i kawałkami kiełbasy.', 'zdjecia/zurek.jpg'),
(6, 'Placki', 'Ziemniaki i cebulę zetrzyj na drobnych oczkach, odciśnij nadmiar wody. Dodaj jajko, mąkę, sól i pieprz. Wymieszaj i nakładaj łyżką na gorący olej. Smaż, aż będą chrupiące.', 'zdjecia/placki.jpg'),
(7, 'Gołąbki', 'Ryż ugotuj na półtwardo i wymieszaj z surowym mięsem mielonym i przyprawami. Zawijaj farsz w sparzone liście kapusty. Układaj w garnku, zalej wywarem i duś pod przykryciem ok. 50 minut.', 'zdjecia/golabki.jpg'),
(8, 'Pizza', 'Zagnieć ciasto z mąki, drożdży, wody i oliwy, odstaw do wyrośnięcia. Rozwałkuj, posmaruj sosem pomidorowym, posyp mozzarellą i ulubionymi dodatkami. Piecz w 250°C przez ok. 10 minut.', 'zdjecia/pizza.jpg'),
(9, 'Tosty', 'Chleb tostowy przełóż plastrami sera i szynki. Złóż kanapki i włóż do rozgrzanego opiekacza lub smaż na patelni z odrobiną masła, aż ser się rozpuści, a chleb zarumieni.', 'zdjecia/tosty.jpg'),
(10, 'Sałatka', 'Warzywa (pomidor, ogórek, papryka) pokrój w kostkę, cebulę w piórka. Dodaj oliwki i ser feta. Całość skrop oliwą z oliwek, posyp suszonym oregano i delikatnie wymieszaj przed podaniem.', 'zdjecia/grecka.jpg');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dania_nasze`
--
ALTER TABLE `dania_nasze`
  ADD PRIMARY KEY (`ID_danie`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dania_nasze`
--
ALTER TABLE `dania_nasze`
  MODIFY `ID_danie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
