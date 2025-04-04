-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: mysql:3306
-- Létrehozás ideje: 2025. Ápr 04. 11:00
-- Kiszolgáló verziója: 8.3.0
-- PHP verzió: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `computer`
--
CREATE DATABASE IF NOT EXISTS `computer` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `computer`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `comp`
--

CREATE TABLE `comp` (
  `Id` char(36) NOT NULL,
  `Brand` varchar(37) DEFAULT NULL,
  `Type` varchar(30) DEFAULT NULL,
  `Display` double DEFAULT NULL,
  `Memory` int DEFAULT NULL,
  `CreatedTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `OsId` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- A tábla adatainak kiíratása `comp`
--

INSERT INTO `comp` (`Id`, `Brand`, `Type`, `Display`, `Memory`, `CreatedTime`, `OsId`) VALUES
('40fdef7a-44da-4921-8464-65d9751b60b3', 'Lenovo', 'lenovo II.', 15.7, 8, '2024-11-21 11:33:30', '0501d537-bc03-45b8-86ea-dc101a970426'),
('440b500d-136f-4061-8dbf-2a8ce2ec0872', 'Asus', 'Type5', 17.2, 8, '2024-11-28 08:19:25', '4dc5fa6f-cb26-4900-b3f8-07f4b6d4a0cf'),
('721c2333-8b02-428b-969a-0d132ed24e2f', 'Mac', 'Type1', 19.2, 16, '2024-11-28 10:56:37', '0501d537-bc03-45b8-86ea-dc101a970426'),
('d90f6c50-0ca0-4585-b11a-0030e9517afc', 'Samsung', 'samsung II.', 17.7, 12, '2024-11-21 11:34:22', '0501d537-bc03-45b8-86ea-dc101a970426');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `osystem`
--

CREATE TABLE `osystem` (
  `Id` char(36) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CreatedTime` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- A tábla adatainak kiíratása `osystem`
--

INSERT INTO `osystem` (`Id`, `Name`, `CreatedTime`) VALUES
('0501d537-bc03-45b8-86ea-dc101a970426', 'Linux', '2024-11-21 09:46:08'),
('4dc5fa6f-cb26-4900-b3f8-07f4b6d4a0cf', 'Microsoft Vista Business', '2024-11-21 09:56:51'),
('a49fbac6-578d-4711-908b-70fe60d546ba', 'Microsoft Vista Home HU', '2024-11-21 10:12:25');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `comp`
--
ALTER TABLE `comp`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OsId` (`OsId`);

--
-- A tábla indexei `osystem`
--
ALTER TABLE `osystem`
  ADD PRIMARY KEY (`Id`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `comp`
--
ALTER TABLE `comp`
  ADD CONSTRAINT `comp_ibfk_1` FOREIGN KEY (`OsId`) REFERENCES `osystem` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
