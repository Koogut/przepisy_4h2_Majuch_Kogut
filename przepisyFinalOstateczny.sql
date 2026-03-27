-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2026 at 07:36 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12
DROP DATABASE IF EXISTS przepisy;
CREATE DATABASE przepisy;
USE przepisy;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


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

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dania_skladnik_nasze`
--

CREATE TABLE `dania_skladnik_nasze` (
  `id_dania_skladnik` int(11) NOT NULL,
  `id_danie` int(11) DEFAULT NULL,
  `id_skladnik` int(11) DEFAULT NULL,
  `ilosc` decimal(8,2) DEFAULT NULL,
  `jednostka` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dania_skladnik_nasze`
--

INSERT INTO `dania_skladnik_nasze` (`id_dania_skladnik`, `id_danie`, `id_skladnik`, `ilosc`, `jednostka`) VALUES
(1, 1, 101, 0.30, 'kg'),
(2, 1, 102, 0.50, 'kg'),
(3, 2, 108, 200.00, 'g'),
(4, 2, 107, 100.00, 'g'),
(5, 3, 110, 0.50, 'kg'),
(6, 4, 102, 0.50, 'kg'),
(7, 5, 107, 100.00, 'g'),
(8, 6, 102, 0.50, 'kg'),
(9, 7, 111, 1.00, 'szt'),
(10, 8, 113, 100.00, 'g'),
(11, 9, 103, 2.00, 'szt'),
(12, 10, 114, 2.00, 'szt');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dania_skladnik_uzytkownikow`
--

CREATE TABLE `dania_skladnik_uzytkownikow` (
  `id_dania_skladnik_uzytk` int(11) NOT NULL,
  `id_danie_uzytk` int(11) DEFAULT NULL,
  `id_skladnik` int(11) DEFAULT NULL,
  `ilosc` decimal(8,2) DEFAULT NULL,
  `jednostka` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dania_skladnik_uzytkownikow`
--

INSERT INTO `dania_skladnik_uzytkownikow` (`id_dania_skladnik_uzytk`, `id_danie_uzytk`, `id_skladnik`, `ilosc`, `jednostka`) VALUES
(1, 1, 101, 0.20, 'kg'),
(2, 2, 110, 0.30, 'kg'),
(3, 3, 118, 1.00, 'szt'),
(4, 4, 103, 2.00, 'szt'),
(5, 5, 108, 200.00, 'g'),
(6, 6, 112, 200.00, 'g'),
(7, 7, 103, 3.00, 'szt'),
(8, 8, 120, 1.00, 'szt'),
(9, 9, 110, 0.30, 'kg'),
(10, 10, 102, 0.50, 'kg'),
(11, 11, 107, 3.00, 'amper');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dania_uzytkownikow`
--

CREATE TABLE `dania_uzytkownikow` (
  `ID_danie_uzykownikow` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `opis` text DEFAULT NULL,
  `zdjecie` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dania_uzytkownikow`
--

INSERT INTO `dania_uzytkownikow` (`ID_danie_uzykownikow`, `nazwa`, `opis`, `zdjecie`) VALUES
(1, 'Burger', 'Uformuj i dopraw mięso wołowe. Smaż na patelni grillowej. Przekrój bułkę, podpiecz ją, nałóż sos, sałatę, gotowe mięso i ulubione dodatki.', 'zdjecia/burger.jpg'),
(2, 'Kebab', 'Zamarynuj kurczaka w przyprawie do kebaba i usmaż. Tortillę podgrzej, nałóż mięso, świeże warzywa oraz sos czosnkowy, a następnie ciasno zawiń.', 'zdjecia/kebab.jpg'),
(3, 'Zapiekanka', 'Przekrój bagietkę wzdłuż. Nałóż podsmażone pieczarki i starty ser żółty. Piecz w 200°C przez ok. 8-10 minut, aż ser się rozpuści. Podawaj z keczupem.', 'zdjecia/zapiekanka.jpg'),
(4, 'Naleśniki', 'Zmiksuj mąkę, mleko, jajka i szczyptę soli na gładką masę. Wylewaj porcje ciasta na rozgrzaną, natłuszczoną patelnię i smaż z obu stron na złoty kolor.', 'zdjecia/nalesniki.jpg'),
(5, 'Pesto', 'Ugotuj makaron w osolonej wodzie. Wymieszaj go z gotowym sosem pesto (bazylia, orzeszki, ser, oliwa). Możesz dodać pomidorki koktajlowe i parmezan.', 'zdjecia/pesto.jpg'),
(6, 'Ryż z kurczakiem', 'Ryż ugotuj na sypko. Kurczaka pokrój w kostkę, dopraw i usmaż na patelni. Połącz ryż z mięsem i ulubionymi warzywami lub sosem curry.', 'zdjecia/ryz.jpg'),
(7, 'Omlet', 'Roztrzep jajka z odrobiną mleka i soli. Wylej na patelnię z masłem. Smaż pod przykryciem na małym ogniu, aż góra się zetnie. Złóż na pół przed podaniem.', 'zdjecia/omlet.jpg'),
(8, 'Hotdog', 'Parówki podgrzej w wodzie lub na grillu. Bułki do hot-dogów natnij i podpiecz. Włóż parówkę do bułki, dodaj prażoną cebulkę, musztardę i keczup.', 'zdjecia/hotdog.jpg'),
(9, 'Tortilla', 'Placek tortilli posmaruj sosem. Nałóż podsmażone kawałki mięsa, kukurydzę, fasolę i sałatę. Zawiń dół, a potem boki, tworząc szczelny rulon.', 'zdjecia/tortilla.jpg'),
(10, 'Frytki', 'Ziemniaki obierz i pokrój w słupki. Osusz je dokładnie i smaż w głębokim tłuszczu lub piecz w piekarniku z oliwą i solą, aż staną się chrupiące.', 'zdjecia/frytki.jpg'),
(11, 'Epstein', 'Jeffrey Epstein był ██████████ finansistą i osobą o szerokich kontaktach wśród ██████████ elit politycznych, biznesowych i towarzyskich. Urodził się w ███████ i zbudował swoją fortunę w sposób, który do dziś pozostaje ██████████.\r\n\r\nZnany był z organizowania spotkań na swojej prywatnej wyspie ██████████, gdzie według śledczych dochodziło do ████████████████████████. W 2008 roku został skazany za ██████████, jednak wyrok i sposób jego odbywania wzbudziły █████████████ kontrowersje.\r\n\r\nW 2019 roku ponownie został aresztowany pod zarzutami █████████████████, co wywołało globalne zainteresowanie i falę spekulacji dotyczących jego powiązań z ███████████████. Zmarł w areszcie w ██████████ w okolicznościach oficjalnie uznanych za ██████████, choć wiele osób uważa je za █████████████.', 'zdjecia/1774593139_Einstein.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skladniki`
--

CREATE TABLE `skladniki` (
  `ID_skladnik` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `kcal_100g` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skladniki`
--

INSERT INTO `skladniki` (`ID_skladnik`, `nazwa`, `kcal_100g`) VALUES
(101, 'Mięso wieprzowe', 242),
(102, 'Ziemniaki', 77),
(103, 'Jajka', 155),
(104, 'Mąka', 364),
(105, 'Bułka tarta', 351),
(106, 'Olej', 6),
(107, 'Boczek', 20),
(108, 'Makaron', 5),
(109, 'Parmezan', 30),
(110, 'Kurczak', 239),
(111, 'Kapusta', 25),
(112, 'Ryż', 130),
(113, 'Mozzarella', 280),
(114, 'Pomidor', 18),
(115, 'Ogórek', 15),
(116, 'Feta', 264),
(117, 'Oliwki', 145),
(118, 'Bułka', 265),
(119, 'Sałata', 15),
(120, 'Parówka', 290);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ulubione_danie`
--

CREATE TABLE `ulubione_danie` (
  `ID_ulubione` int(11) NOT NULL,
  `ID_uzytkownik` int(11) NOT NULL,
  `ID_danie` int(11) NOT NULL,
  `typ` enum('nasze','uzytkownika') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ulubione_danie`
--

INSERT INTO `ulubione_danie` (`ID_ulubione`, `ID_uzytkownik`, `ID_danie`, `typ`) VALUES
(10, 1, 1, 'nasze'),
(6, 1, 2, 'nasze'),
(7, 1, 4, 'uzytkownika'),
(9, 1, 6, 'nasze');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `ID_uzytkownik` int(11) NOT NULL,
  `login` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `haslo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`ID_uzytkownik`, `login`, `email`, `haslo`) VALUES
(1, 'epstein', 'jefrey@jefrey.com', '$2y$10$W9x75mECQLksShK7.9YXeO3Askl2WwnteQZgyuQAuQhv3Fd6wjqrC'),
(2, 'Epstein2', 'epstein@1', '$2y$10$7Sf1Iqlv0h4nmHgRGUVpyOeEwRzDomLq511rbhGU03HAYao5LDKba');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dania_nasze`
--
ALTER TABLE `dania_nasze`
  ADD PRIMARY KEY (`ID_danie`);

--
-- Indeksy dla tabeli `dania_skladnik_nasze`
--
ALTER TABLE `dania_skladnik_nasze`
  ADD PRIMARY KEY (`id_dania_skladnik`);

--
-- Indeksy dla tabeli `dania_skladnik_uzytkownikow`
--
ALTER TABLE `dania_skladnik_uzytkownikow`
  ADD PRIMARY KEY (`id_dania_skladnik_uzytk`);

--
-- Indeksy dla tabeli `dania_uzytkownikow`
--
ALTER TABLE `dania_uzytkownikow`
  ADD PRIMARY KEY (`ID_danie_uzykownikow`);

--
-- Indeksy dla tabeli `skladniki`
--
ALTER TABLE `skladniki`
  ADD PRIMARY KEY (`ID_skladnik`);

--
-- Indeksy dla tabeli `ulubione_danie`
--
ALTER TABLE `ulubione_danie`
  ADD PRIMARY KEY (`ID_ulubione`),
  ADD UNIQUE KEY `ID_uzytkownik` (`ID_uzytkownik`,`ID_danie`,`typ`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`ID_uzytkownik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dania_nasze`
--
ALTER TABLE `dania_nasze`
  MODIFY `ID_danie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dania_skladnik_nasze`
--
ALTER TABLE `dania_skladnik_nasze`
  MODIFY `id_dania_skladnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dania_skladnik_uzytkownikow`
--
ALTER TABLE `dania_skladnik_uzytkownikow`
  MODIFY `id_dania_skladnik_uzytk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `dania_uzytkownikow`
--
ALTER TABLE `dania_uzytkownikow`
  MODIFY `ID_danie_uzykownikow` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `skladniki`
--
ALTER TABLE `skladniki`
  MODIFY `ID_skladnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `ulubione_danie`
--
ALTER TABLE `ulubione_danie`
  MODIFY `ID_ulubione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `ID_uzytkownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ulubione_danie`
--
ALTER TABLE `ulubione_danie`
  ADD CONSTRAINT `ulubione_danie_ibfk_1` FOREIGN KEY (`ID_uzytkownik`) REFERENCES `uzytkownicy` (`ID_uzytkownik`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
