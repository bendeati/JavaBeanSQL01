-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2019. Okt 12. 17:14
-- Kiszolgáló verziója: 10.1.30-MariaDB
-- PHP verzió: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `filmek`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `filmek`
--

CREATE TABLE `filmek` (
  `id` int(11) NOT NULL,
  `cim` varchar(200) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `ev` int(11) DEFAULT NULL,
  `mufaj` varchar(30) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `nemzetiseg` varchar(10) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `ido` int(11) DEFAULT NULL,
  `jegyar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `filmek`
--

INSERT INTO `filmek` (`id`, `cim`, `ev`, `mufaj`, `nemzetiseg`, `ido`, `jegyar`) VALUES
(1, 'Az ördög maga', 1998, 'Akció', 'USA', 176, 2000),
(2, 'Hyppolit a lakáj', 1936, 'Vígjáték', 'H', 76, 5000),
(3, 'Titanic', 1998, 'Dráma', 'USA', 190, 10000),
(4, 'Piedone', 1978, 'Vígjáték', 'I', 150, 2000),
(5, 'Csinibaba', 1995, 'Vígjáték', 'H', 120, 1000),
(6, 'Lesz ez még így se!', 1997, 'Vígjáték', 'USA', 120, 1000);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `filmek`
--
ALTER TABLE `filmek`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `filmek`
--
ALTER TABLE `filmek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
