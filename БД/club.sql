-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 26 2023 г., 09:51
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `club`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `data_working` date NOT NULL DEFAULT current_timestamp(),
  `data_born` char(255) NOT NULL,
  `phone` char(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`id`, `fio`, `data_working`, `data_born`, `phone`, `email`, `login`, `password`) VALUES
(1, 'Воробьев Максим Артёмович', '2023-02-01', '19.03.2000', '7 911 123-45-67', 'admin66@gmail.com', '123', '123'),
(2, 'Данилов Иван Константинович', '2013-02-01', '30.06.1994', '7 999 444-11-11', 'ivan@gmail.com', 'admin', 'admin666'),
(3, 'Смирнова Арина Кирилловна', '2003-02-12', '23.11.1987', '7 999 444-55-32', 'arina243@gmail.com', 'test', 'test123'),
(4, 'Минаев Даниил Платонович', '2016-05-25', '14.05.1994', '8 999 777-88-88', 'daniilplanovich1987@mail.ru', 'daniil', 'daniil1987'),
(5, 'Лебедев Лев Никитич', '2023-04-19', '10.05.2000', '+7 (456) 975-98-88', 'lebedev2002@gmail.com', '1234', '1234'),
(7, 'Егорова Ева Алексеевна', '2023-04-23', '11.05.2003', '+7 894 897-44-95', 'egorovaeva2003@gmail.com', 'EvaPro', 'eva'),
(8, 'Павлова Вера Александровна', '2023-04-23', '23.06.2001', '+7 987 987-98-87', 'pavlova2003vera@gmail.com', 'pavlova2003', 'pavlova2003');

-- --------------------------------------------------------

--
-- Структура таблицы `basket`
--

CREATE TABLE `basket` (
  `title` varchar(255) NOT NULL,
  `price` char(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `data_born` char(60) NOT NULL,
  `date_reg` date NOT NULL DEFAULT current_timestamp(),
  `login` varchar(255) NOT NULL,
  `phone` char(60) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `fio`, `data_born`, `date_reg`, `login`, `phone`, `email`) VALUES
(1, 'Алексеев Гарри Сергеевич', '11.11.1999', '2023-04-20', 'test444', '7 999 444-55-66', 'test444@gmail.com'),
(2, 'Безруков Давид Алексеевич', '16.07.2007', '2023-04-19', 'david225', '8 994 785-54-99', 'david225@mail.ru'),
(3, 'Волков Александр Михайлович', '12.12.2012', '2023-04-20', 'volkov421', '7 889 789-45-41', 'volkov421@gmail.com'),
(4, 'Григорьева София Львовна', '19.07.2003', '2023-04-21', 'sofia200341', '8 995 785-66-32', 'sofia2003@gmail.com'),
(5, 'Захаров Александр Дмитриевич', '03.07.2003', '2023-04-17', 'azaharov03', '7 999 354-11-11', 'sashazaharov331@gmail.com'),
(6, 'Новикова Виктория Константиновна', '03.02.2007', '2023-04-22', 'victory113', '8 999 777-81-22', 'victory113@gmail.com'),
(7, 'Чернов Адам Романович', '04.10.1990', '2023-04-23', 'adamaid', '8 999 448-88-98', 'aid666@gmail.com'),
(8, 'Яшин Роман Маркович', '07.05.2000', '2023-04-23', 'Roman2010', '7 999 888-75-17', 'roman2000@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `pc`
--

CREATE TABLE `pc` (
  `id` int(11) NOT NULL,
  `characteristic` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `pc`
--

INSERT INTO `pc` (`id`, `characteristic`) VALUES
(1, 'Работает стабильно\r\n'),
(2, 'Работает стабильно\r\n'),
(3, 'Работает стабильно\r\n'),
(4, 'Работает стабильно\r\n'),
(5, 'Работает стабильно\r\n'),
(6, 'Работает стабильно'),
(7, 'Работает стабильно\r\n'),
(8, 'Работает стабильно\r\n'),
(9, 'Работает стабильно\r\n'),
(10, 'Работает стабильно\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `category`, `price`) VALUES
(1, 'Клубничное морожное', 'Десерты', '89'),
(2, 'Морожное Шоколадное', 'Десерты', '89'),
(3, 'Морожное Карамельное', 'Десерты', '89'),
(4, 'Вафельный рожок', 'Десерты', '39'),
(5, 'Пирожок Вишневый', 'Десерты', '100'),
(6, 'Лесной Вкус', 'Десерты', '129'),
(7, 'Coca Cola', 'Напитки', '69'),
(8, 'Pepsi', 'Напитки', '69'),
(9, 'Fanta', 'Напитки', '69'),
(10, 'Капучино', 'Напитки', '79'),
(11, 'Латте', 'Напитки', '129'),
(12, 'Американо', 'Напитки', '119'),
(13, 'Сэндвич овощной', 'Сэндвич', '99'),
(14, 'Бутерброд', 'Сэндвич', '129'),
(15, 'Сэндвич с курицей', 'Сэндвич', '119'),
(16, 'Чизбургер', 'Сэндвич', '99'),
(17, 'Гамбургер', 'Сэндвич', '89'),
(18, 'Фиш Бургер', 'Сэндвич', '99');

-- --------------------------------------------------------

--
-- Структура таблицы `specifications_pc`
--

CREATE TABLE `specifications_pc` (
  `processor` text NOT NULL COMMENT 'Процессор',
  `ozy` text NOT NULL COMMENT 'ОЗУ',
  `chipset` text NOT NULL COMMENT 'Чипсет',
  `video` text NOT NULL COMMENT 'Видео',
  `hard_drive` text NOT NULL COMMENT 'Жесткий диск',
  `psu` text NOT NULL COMMENT 'Блок питания',
  `type_of_system` text NOT NULL COMMENT 'Тип системы',
  `screen` text NOT NULL COMMENT 'Монитор',
  `keyboard` text NOT NULL COMMENT 'Клавиатура',
  `mouse` text NOT NULL COMMENT 'Мышь',
  `headphones` text NOT NULL COMMENT 'Наушники'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `specifications_pc`
--

INSERT INTO `specifications_pc` (`processor`, `ozy`, `chipset`, `video`, `hard_drive`, `psu`, `type_of_system`, `screen`, `keyboard`, `mouse`, `headphones`) VALUES
('AMD RYZEN THREADRIPPER 2990WX', 'XPG SPECTRIX D50|32 ГБ ', 'i450NX PCIset: Profusion', 'NVIDIA GeForce RTX 3080', 'Seagate Barracuda 1 ТБ ST1000DM010', 'Chieftec BDF-500S (500 Вт)', '64-разрядная операционная система, процессор x64', 'Acer Predator XB323UGPbmiiphzx, 2560x1440, 170 Гц, IPS', 'SteelSeries Apex Pro FAQ', 'Razer Naga', 'HyperX CloudX Stringer Core');

-- --------------------------------------------------------

--
-- Структура таблицы `visit`
--

CREATE TABLE `visit` (
  `id` int(11) NOT NULL,
  `id_clients` int(11) NOT NULL,
  `id_pc` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `time` char(255) NOT NULL,
  `sum` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `visit`
--

INSERT INTO `visit` (`id`, `id_clients`, `id_pc`, `id_admin`, `datetime`, `time`, `sum`) VALUES
(1, 3, 5, 3, '2023-04-23 10:13:27', '1:30', '150'),
(3, 2, 4, 5, '2023-04-23 18:36:10', '1:00', '100'),
(5, 3, 5, 3, '2023-04-25 19:33:14', '2:00', '200'),
(6, 2, 6, 3, '2023-04-25 19:33:22', '1:30', '150');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fio` (`fio`) USING BTREE;

--
-- Индексы таблицы `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Индексы таблицы `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_clients` (`id_clients`),
  ADD KEY `id_pc` (`id_pc`),
  ADD KEY `id_admin` (`id_admin`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `basket`
--
ALTER TABLE `basket`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `pc`
--
ALTER TABLE `pc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `visit`
--
ALTER TABLE `visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`title`) REFERENCES `products` (`title`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_admin` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `visit_clients` FOREIGN KEY (`id_clients`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `visit_pc` FOREIGN KEY (`id_pc`) REFERENCES `pc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
