-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2026 at 11:51 AM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

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
-- Struktura tabeli dla tabeli `skladniki`
--

CREATE TABLE `skladniki` (
  `ID_skladnik` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
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
(109, 'Ser Parmezan', 80.00),
(110, 'Naleśniki', 0.00),
(111, 'Naleśniki', 0.00),
(112, 'Naleśniki', 0.00),
(113, 'Ser żólty', 0.00),
(114, 'Mleko', 0.00),
(125, 'Filet z kurczaka', 21.00),
(126, 'Passata pomidorowa', 6.50),
(127, 'Cukinia', 6.00),
(128, 'Bakłażan', 7.00),
(129, 'Pieczarki', 8.00),
(130, 'Szynka', 12.00),
(131, 'Parówki', 9.00),
(132, 'Bagietka', 4.00),
(133, 'Dżem truskawkowy', 8.00),
(134, 'Kasza gryczana', 5.50);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `skladniki`
--
ALTER TABLE `skladniki`
  ADD PRIMARY KEY (`ID_skladnik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `skladniki`
--
ALTER TABLE `skladniki`
  MODIFY `ID_skladnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
