-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sty 28, 2026 at 07:51 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

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
-- Struktura tabeli dla tabeli `dania`
--

CREATE TABLE `dania` (
  `ID_danie` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  `opis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `dania`
--

INSERT INTO `dania` (`ID_danie`, `nazwa`, `opis`) VALUES
(1, 'Schabowy z ziemniakami', 'Tradycyjny polski obiad: kotlet schabowy, ziemniaki i mizeria.'),
(2, 'Spaghetti Carbonara', 'Włoski klasyk z jajkiem, boczkiem (pancetta) i serem.'),
(3, 'Burger', 'Dobry burger z wołowinką');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dania_skladnik`
--

CREATE TABLE `dania_skladnik` (
  `id_dania_skladnik` int(11) NOT NULL,
  `id_danie` int(11) NOT NULL,
  `id_skladnik` int(11) NOT NULL,
  `ilosc` decimal(8,2) NOT NULL,
  `jednostka` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `dania_skladnik`
--

INSERT INTO `dania_skladnik` (`id_dania_skladnik`, `id_danie`, `id_skladnik`, `ilosc`, `jednostka`) VALUES
(1, 1, 101, 0.20, 'kg'),
(2, 1, 102, 0.40, 'kg'),
(3, 1, 103, 1.00, 'szt'),
(4, 1, 104, 0.05, 'kg'),
(5, 1, 105, 0.10, 'kg'),
(6, 1, 106, 0.10, 'litr');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skladniki`
--

CREATE TABLE `skladniki` (
  `ID_skladnik` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL DEFAULT 'jajko',
  `cena` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `skladniki`
--

INSERT INTO `skladniki` (`ID_skladnik`, `nazwa`, `cena`) VALUES
(101, 'Mięso wieprzowe', 25.50),
(102, 'Ziemniaki', 2.10),
(103, 'Jajka', 0.80),
(104, 'Mąka', 3.00),
(105, 'Bułka tarta', 4.50),
(106, 'Olej rzepakowy', 6.00),
(107, 'Boczek wędzony', 32.00),
(108, 'Makaron spaghetti', 5.00),
(109, 'Ser Parmezan', 80.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ulubione_danie`
--

CREATE TABLE `ulubione_danie` (
  `ID_ulubione` int(11) NOT NULL,
  `ID_uzytkownik` int(11) NOT NULL,
  `ID_danie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `ulubione_danie`
--

INSERT INTO `ulubione_danie` (`ID_ulubione`, `ID_uzytkownik`, `ID_danie`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `ID_uzytkownik` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `haslo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`ID_uzytkownik`, `login`, `email`, `haslo`) VALUES
(1, 'admin', 'admin@example.com', 'c90d91066c01d92ed214'),
(2, 'mesjekok', 'koko@gmail.com', '$2y$10$y8.SIciGZDzz8613Y9J.RON46rsmpKGzCJYqb4hzTedmi45eHptuW'),
(3, 'admin2', 'admin@admin.com', '$2y$10$/sMEU2f7ZVKQMTX6R/hLJ.dgfEFBPPmmEVN3rezAjpGUqa6oFpw6S'),
(4, 'majuch', 'sztywno@67.com', '$2y$10$rktn1WYTwoqiuA.MahVr4.VroBnWkKXArhATCb4TEws5pwKhqsuXC'),
(5, 'admin3', 'admin3@gmail.com', '$2y$10$9h0L/EqMF9vQUW7nq95yiuLx10ajefE/r1fp0vQmetPj.EEGI3NSK'),
(6, 'admin4', 'lol@lol', '$2y$10$95CB0jPhCiL3axWWybrAXuYi2tguGzncccH/EX71vEqT9ZBtf1sCy');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dania`
--
ALTER TABLE `dania`
  ADD PRIMARY KEY (`ID_danie`);

--
-- Indeksy dla tabeli `dania_skladnik`
--
ALTER TABLE `dania_skladnik`
  ADD PRIMARY KEY (`id_dania_skladnik`),
  ADD KEY `id_danie` (`id_danie`),
  ADD KEY `id_skladnik` (`id_skladnik`);

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
  ADD KEY `ID_uzytkownik` (`ID_uzytkownik`,`ID_danie`),
  ADD KEY `ID_danie` (`ID_danie`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`ID_uzytkownik`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dania`
--
ALTER TABLE `dania`
  MODIFY `ID_danie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dania_skladnik`
--
ALTER TABLE `dania_skladnik`
  MODIFY `id_dania_skladnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `skladniki`
--
ALTER TABLE `skladniki`
  MODIFY `ID_skladnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `ulubione_danie`
--
ALTER TABLE `ulubione_danie`
  MODIFY `ID_ulubione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `ID_uzytkownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dania_skladnik`
--
ALTER TABLE `dania_skladnik`
  ADD CONSTRAINT `dania_skladnik_ibfk_1` FOREIGN KEY (`id_skladnik`) REFERENCES `skladniki` (`ID_skladnik`) ON DELETE CASCADE,
  ADD CONSTRAINT `dania_skladnik_ibfk_2` FOREIGN KEY (`id_danie`) REFERENCES `dania` (`ID_danie`) ON DELETE CASCADE;

--
-- Constraints for table `ulubione_danie`
--
ALTER TABLE `ulubione_danie`
  ADD CONSTRAINT `ulubione_danie_ibfk_1` FOREIGN KEY (`ID_uzytkownik`) REFERENCES `uzytkownicy` (`ID_uzytkownik`) ON DELETE CASCADE,
  ADD CONSTRAINT `ulubione_danie_ibfk_2` FOREIGN KEY (`ID_danie`) REFERENCES `dania` (`ID_danie`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
