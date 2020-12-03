-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Дек 03 2020 г., 16:03
-- Версия сервера: 8.0.22-0ubuntu0.20.04.3
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `battles`
--

CREATE TABLE `battles` (
  `name` varchar(20) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `battles`
--

INSERT INTO `battles` (`name`, `date`) VALUES
('Guadalcanal', '1942-11-15 00:00:00'),
('North Atlantic', '1941-05-27 00:00:00'),
('North Cape', '1943-12-26 00:00:00'),
('Surigao Strait', '1944-10-25 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `classes`
--

CREATE TABLE `classes` (
  `class` varchar(50) NOT NULL,
  `type` varchar(2) NOT NULL,
  `country` varchar(20) NOT NULL,
  `numGuns` smallint DEFAULT NULL,
  `bore` double DEFAULT NULL,
  `displacement` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `classes`
--

INSERT INTO `classes` (`class`, `type`, `country`, `numGuns`, `bore`, `displacement`) VALUES
('Bismarck', 'bb', 'Germany', 8, 15, 42000),
('Iowa', 'bb', 'USA', 9, 16, 46000),
('Kongo', 'bc', 'Japan', 8, 14, 32000),
('North Carolina', 'bb', 'USA', 12, 16, 37000),
('Renown', 'bc', 'Gt.Britain', 6, 15, 32000),
('Revenge', 'bb', 'Gt.Britain', 8, 15, 29000),
('Tennessee', 'bb', 'USA', 12, 14, 32000),
('Yamato', 'bb', 'Japan', 9, 18, 65000);

-- --------------------------------------------------------

--
-- Структура таблицы `outcomes`
--

CREATE TABLE `outcomes` (
  `ship` varchar(50) NOT NULL,
  `battle` varchar(20) DEFAULT NULL,
  `result` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `outcomes`
--

INSERT INTO `outcomes` (`ship`, `battle`, `result`) VALUES
('Bismarck', 'North Atlantic', 'sunk'),
('California', 'Surigao Strait', 'ok'),
('Duke of York', 'North Cape', 'ok'),
('Fuso', 'Surigao Strait', 'sunk'),
('Hood', 'North Atlantic', 'sunk'),
('King George V', 'North Atlantic', 'ok'),
('Kirishima', 'Guadalcanal', 'sunk'),
('Prince of Wales', 'North Atlantic', 'damaged'),
('Rodney', 'North Atlantic', 'ok'),
('Scharnhorst', 'North Cape', 'sunk'),
('South Dakota', 'Guadalcanal', 'ok'),
('West Virginia', 'Surigao Strait', 'ok'),
('Yamashiro', 'Surigao Strait', 'sunk');

-- --------------------------------------------------------

--
-- Структура таблицы `ships`
--

CREATE TABLE `ships` (
  `name` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL,
  `launched` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ships`
--

INSERT INTO `ships` (`name`, `class`, `launched`) VALUES
('California', 'Tennessee', 1921),
('Haruna', 'Kongo', 1916),
('Hiei', 'Kongo', 1914),
('Iowa', 'Iowa', 1943),
('Kirishima', 'Kongo', 1915),
('Kongo', 'Kongo', 1913),
('Missouri', 'Iowa', 1944),
('Musashi', 'Yamato', 1942),
('New Jersey', 'Iowa', 1943),
('North Carolina', 'North Carolina', 1941),
('Ramillies', 'Revenge', 1917),
('Renown', 'Renown', 1916),
('Repulse', 'Renown', 1916),
('Resolution', 'Renown', 1916),
('Revenge', 'Revenge', 1916),
('Royal Oak', 'Revenge', 1916),
('Royal Sovereign', 'Revenge', 1916),
('South Dakota', 'North Carolina', 1941),
('Tennessee', 'Tennessee', 1920),
('Washington', 'North Carolina', 1941),
('Wisconsin', 'Iowa', 1944),
('Yamato', 'Yamato', 1941);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `battles`
--
ALTER TABLE `battles`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class`),
  ADD KEY `class` (`class`) USING BTREE,
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `outcomes`
--
ALTER TABLE `outcomes`
  ADD PRIMARY KEY (`ship`),
  ADD KEY `result` (`result`),
  ADD KEY `battle` (`battle`);

--
-- Индексы таблицы `ships`
--
ALTER TABLE `ships`
  ADD PRIMARY KEY (`name`),
  ADD KEY `class` (`class`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `outcomes`
--
ALTER TABLE `outcomes`
  ADD CONSTRAINT `outcomes_ibfk_1` FOREIGN KEY (`battle`) REFERENCES `battles` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ships`
--
ALTER TABLE `ships`
  ADD CONSTRAINT `ships_ibfk_1` FOREIGN KEY (`class`) REFERENCES `classes` (`class`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
