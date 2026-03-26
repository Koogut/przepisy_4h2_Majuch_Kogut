-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2026 at 05:08 PM
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
(1, 'Schabowy', '1. Rozbij mięso. 2. Obtocz. 3. Smaż. 4. Podawaj.', 'zdjecia/schabowy.jpg'),
(2, 'Carbonara', '1. Makaron. 2. Boczek. 3. Jajka. 4. Połącz.', 'zdjecia/carbonara.jpg'),
(3, 'Rosół', '1. Gotuj kurczaka. 2. Dodaj warzywa. 3. Gotuj. 4. Podawaj.', 'zdjecia/rosol.jpg'),
(4, 'Pierogi', '1. Ziemniaki. 2. Farsz. 3. Lep. 4. Gotuj.', 'zdjecia/pierogi.jpg'),
(5, 'Żurek', '1. Zakwas. 2. Kiełbasa. 3. Gotuj. 4. Podawaj.', 'zdjecia/zurek.jpg'),
(6, 'Placki', '1. Ziemniaki. 2. Jajka. 3. Smaż.', 'zdjecia/placki.jpg'),
(7, 'Gołąbki', '1. Ryż. 2. Mięso. 3. Kapusta. 4. Duś.', 'zdjecia/golabki.jpg'),
(8, 'Pizza', '1. Ciasto. 2. Sos. 3. Ser. 4. Piecz.', 'zdjecia/pizza.jpg'),
(9, 'Tosty', '1. Jajko. 2. Smaż.', 'zdjecia/tosty.jpg'),
(10, 'Sałatka', '1. Pokrój. 2. Wymieszaj.', 'zdjecia/grecka.jpg');

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
(10, 10, 102, 0.50, 'kg');

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
(1, 'Burger', '1. Smaż. 2. Złóż.', 'zdjecia/burger.jpg'),
(2, 'Kebab', '1. Kurczak. 2. Tortilla.', 'zdjecia/kebab.jpg'),
(3, 'Zapiekanka', '1. Bagietka. 2. Ser.', 'zdjecia/zapiekanka.jpg'),
(4, 'Naleśniki', '1. Ciasto. 2. Smaż.', 'zdjecia/nalesniki.jpg'),
(5, 'Pesto', '1. Makaron. 2. Sos.', 'zdjecia/pesto.jpg'),
(6, 'Ryż z kurczakiem', '1. Ryż. 2. Kurczak.', 'zdjecia/ryz.jpg'),
(7, 'Omlet', '1. Jajka. 2. Smaż.', 'zdjecia/omlet.jpg'),
(8, 'Hotdog', '1. Parówka. 2. Bułka.', 'zdjecia/hotdog.jpg'),
(9, 'Tortilla', '1. Mięso. 2. Zawiń.', 'zdjecia/tortilla.jpg'),
(10, 'Frytki', '1. Smaż ziemniaki.', 'zdjecia/frytki.jpg');

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
(1, 'epstein', 'jefrey@jefrey.com', '$2y$10$W9x75mECQLksShK7.9YXeO3Askl2WwnteQZgyuQAuQhv3Fd6wjqrC');

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
  MODIFY `id_dania_skladnik_uzytk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dania_uzytkownikow`
--
ALTER TABLE `dania_uzytkownikow`
  MODIFY `ID_danie_uzykownikow` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `skladniki`
--
ALTER TABLE `skladniki`
  MODIFY `ID_skladnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `ID_uzytkownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
