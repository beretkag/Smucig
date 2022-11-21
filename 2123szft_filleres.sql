-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Nov 21. 21:49
-- Kiszolgáló verziója: 10.4.25-MariaDB
-- PHP verzió: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `2123szft_filleres`
--
CREATE DATABASE IF NOT EXISTS `2123szft_filleres` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `2123szft_filleres`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `records`
--

CREATE TABLE IF NOT EXISTS `records` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `transactiontypeID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `records`
--

INSERT INTO `records` (`ID`, `userID`, `type`, `amount`, `date`, `transactiontypeID`) VALUES
(15, 8, 1, 5000, '2022-11-03', 5),
(16, 8, 1, 16000, '2022-11-06', 8),
(17, 8, 0, 11000, '2022-11-08', 4),
(18, 8, 0, 6000, '2022-11-09', 3),
(19, 8, 1, 9000, '2022-11-11', 9),
(20, 8, 0, 17000, '2022-11-15', 2),
(21, 8, 0, 12000, '2022-11-04', 4),
(22, 10, 1, 1234, '2022-11-02', 7),
(23, 10, 1, 5000, '2022-11-11', 5),
(24, 10, 0, 500000, '2022-11-01', 1),
(25, 10, 1, 92000, '2022-11-13', 11),
(26, 10, 1, 17000, '2022-11-19', 5),
(27, 10, 0, 32000, '2022-11-01', 4),
(28, 8, 0, 90000, '2022-11-02', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `transactiontype`
--

CREATE TABLE IF NOT EXISTS `transactiontype` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `name` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `transactiontype`
--

INSERT INTO `transactiontype` (`ID`, `type`, `name`) VALUES
(1, 0, 'Havi Fizetés'),
(2, 0, 'Bérbeadás'),
(3, 0, 'Szolgáltatás'),
(4, 0, 'Részesedés'),
(5, 1, 'Élelmiszer'),
(6, 1, 'Villanyszámla'),
(7, 1, 'Gázszámla'),
(8, 1, 'Vízszámla'),
(9, 1, 'Szórakozás'),
(10, 1, 'Fogyócikk'),
(11, 1, 'Egyéb');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `passwd` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `reg` datetime NOT NULL DEFAULT current_timestamp(),
  `last` datetime DEFAULT NULL,
  `startcapital` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`ID`, `name`, `email`, `passwd`, `reg`, `last`, `startcapital`) VALUES
(1, 'admin', 'admin@admin.hu', '5ea345ab330cf29f81d8de9bf5466f508fe351e1', '2022-10-12 13:37:11', '2022-10-12 13:36:48', 0),
(3, 'tesztuer 1', 'teszt1@gmail.com', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-14 10:29:08', NULL, 0),
(5, 'tesztuser 2', 'teszt2@gmail.com', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-14 10:30:32', NULL, 0),
(6, 'test5', 'teszt5@gmail.com', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-18 12:23:16', NULL, 0),
(7, 'teszt6', 'teszt6@gmail.com', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-18 12:24:13', NULL, 0),
(8, 'Alma', 'alma@alma.hu', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-27 18:34:04', NULL, 24000),
(9, 'ShalomVagyok', 'shalom@shalom.com', 'caaea2bf902fa7ba3784e616f38e1c64111b2352', '2022-10-27 21:14:46', NULL, 0),
(10, 'én', 'en@en.com', '2c17f2127fa5ce1af98a85626e6088782a3b14b7', '2022-11-21 19:55:23', '2022-11-21 19:55:23', 450000);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
