-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Nov 22. 08:32
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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

CREATE TABLE `records` (
  `ID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `transactiontypeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `records`
--

INSERT INTO `records` (`ID`, `userID`, `type`, `amount`, `date`, `transactiontypeID`) VALUES
(12, 8, 1, 5000, '2022-10-06', 6),
(13, 8, 1, 13000, '2022-11-04', 5),
(14, 8, 1, 6750, '2022-11-09', 9),
(15, 8, 1, 23000, '2022-11-19', 10),
(16, 8, 0, 30000, '2022-11-08', 1),
(17, 8, 0, 8000, '2022-11-18', 3),
(18, 8, 0, 5000, '2022-11-02', 4),
(19, 8, 0, 9000, '2022-11-12', 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `transactiontype`
--

CREATE TABLE `transactiontype` (
  `ID` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `name` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `transactiontype`
--

INSERT INTO `transactiontype` (`ID`, `type`, `name`) VALUES
(1, 0, 'Havi Fizetés'),
(2, 0, 'Bérbeadás'),
(3, 0, 'Eladás'),
(4, 0, 'Szolgáltatás'),
(5, 1, 'Élelmiszer'),
(6, 1, 'Szórakozás'),
(7, 1, 'Villanyszámla'),
(8, 1, 'Gázszámla'),
(9, 1, 'Vízszámla'),
(10, 1, 'Közös költség'),
(11, 1, 'Egyéb');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `passwd` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `reg` datetime NOT NULL DEFAULT current_timestamp(),
  `last` datetime DEFAULT NULL,
  `startcapital` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`ID`, `name`, `email`, `passwd`, `reg`, `last`, `startcapital`) VALUES
(1, 'admin', 'admin@admin.hu', '5ea345ab330cf29f81d8de9bf5466f508fe351e1', '2022-10-12 13:37:11', '2022-10-12 13:36:48', 0),
(3, 'tesztuer 1', 'teszt1@gmail.com', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-14 10:29:08', NULL, 0),
(5, 'tesztuser 2', 'teszt2@gmail.com', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-14 10:30:32', NULL, 0),
(6, 'test5', 'teszt5@gmail.com', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-18 12:23:16', NULL, 0),
(7, 'teszt6', 'teszt6@gmail.com', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-18 12:24:13', NULL, 0),
(8, 'Alma', 'alma@alma.hu', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-27 18:34:04', NULL, 200000),
(9, 'ShalomVagyok', 'shalom@shalom.com', 'caaea2bf902fa7ba3784e616f38e1c64111b2352', '2022-10-27 21:14:46', NULL, 0),
(10, 'bela', 'be@la.com', '0540875f23bb0448290748f7518b963503f0b002', '2022-11-16 19:31:24', '2022-11-16 19:31:24', 0),
(11, 'Test11', 'test@test.com', 'b235ef73a7aa49acc72a1b6807dc715e5abac170', '2022-11-18 10:26:13', '2022-11-18 10:26:13', 0);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `transactiontype`
--
ALTER TABLE `transactiontype`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `records`
--
ALTER TABLE `records`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `transactiontype`
--
ALTER TABLE `transactiontype`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
