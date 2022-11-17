-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Nov 17. 22:08
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `expendituretype`
--

CREATE TABLE `expendituretype` (
  `ID` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `expendituretype`
--

INSERT INTO `expendituretype` (`ID`, `type`) VALUES
(1, 'Élelmiszer'),
(2, 'Villanyszámla'),
(3, 'Gázszámla'),
(4, 'Vízszámla'),
(5, 'Közös költség'),
(6, 'Szórakozás'),
(7, 'Egyéb');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `incometype`
--

CREATE TABLE `incometype` (
  `ID` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `incometype`
--

INSERT INTO `incometype` (`ID`, `type`) VALUES
(1, 'Havi Fizetés'),
(2, 'Bérbeadás'),
(3, 'Eladás'),
(4, 'Szolgáltatás');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `records`
--

CREATE TABLE `records` (
  `ID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `amount` int(11) NOT NULL,
  `incometypeID` int(11) DEFAULT NULL,
  `expendituretypeID` int(11) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

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
  `startcapital` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`ID`, `name`, `email`, `passwd`, `reg`, `last`, `startcapital`) VALUES
(1, 'admin', 'admin@admin.hu', '5ea345ab330cf29f81d8de9bf5466f508fe351e1', '2022-10-12 13:37:11', '2022-10-12 13:36:48', NULL),
(3, 'tesztuer 1', 'teszt1@gmail.com', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-14 10:29:08', NULL, NULL),
(5, 'tesztuser 2', 'teszt2@gmail.com', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-14 10:30:32', NULL, NULL),
(6, 'test5', 'teszt5@gmail.com', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-18 12:23:16', NULL, NULL),
(7, 'teszt6', 'teszt6@gmail.com', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-18 12:24:13', NULL, NULL),
(8, 'Alma', 'alma@alma.hu', '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', '2022-10-27 18:34:04', NULL, NULL),
(9, 'ShalomVagyok', 'shalom@shalom.com', 'caaea2bf902fa7ba3784e616f38e1c64111b2352', '2022-10-27 21:14:46', NULL, NULL),
(10, 'bela', 'be@la.com', '0540875f23bb0448290748f7518b963503f0b002', '2022-11-16 19:31:24', '2022-11-16 19:31:24', NULL);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `expendituretype`
--
ALTER TABLE `expendituretype`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `incometype`
--
ALTER TABLE `incometype`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `records`
--
ALTER TABLE `records`
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
-- AUTO_INCREMENT a táblához `expendituretype`
--
ALTER TABLE `expendituretype`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `incometype`
--
ALTER TABLE `incometype`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `records`
--
ALTER TABLE `records`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
