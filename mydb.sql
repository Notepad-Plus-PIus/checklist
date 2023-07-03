-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3300
-- Время создания: Июл 03 2023 г., 16:19
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mydb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `lists`
--

CREATE TABLE `lists` (
  `item_id` int NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lists`
--

INSERT INTO `lists` (`item_id`, `title`, `description`) VALUES
(1, 'Robots.txt', 'Robots.txt — это текстовый файл, который содержит параметры индексирования сайта для роботов поисковых систем. В robots.txt можно ограничить индексирование роботами страниц сайта, что может снизить нагрузку на сайт и ускорить его работу. Примечание. Ограниченные в robots.txt страницы могут участвовать в поиске Яндекса. Чтобы удалить страницы из поиска, укажите директиву noindex в HTML-коде страницы или настройте HTTP-заголовок.'),
(2, 'Закрыть ненужные служебные разделы', 'Подобно последнему, на носителях OEM-устройств могут также существовать неудаляемые служебные Recovery-разделы, необходимые для отката Windows до заводских настроек.'),
(3, 'Задано главное зеркало для Яндекса', 'Чтобы сайты не дублировали информацию в результатах поиска, Яндекс объединяет их в группу зеркал: главное зеркало — адрес, который участвует в результатах поиска; неглавное зеркало — адрес, который не участвует в поиске. ... Зеркалами считаются сайты, доступные по разным адресам, но имеющие одинаковый контент. Чтобы сайты не дублировали информацию в результатах поиска, Яндекс объединяет их в группу зеркал: главное зеркало — адрес, который участвует в результатах поиска; неглавное зеркало — адрес, который не участвует в поиске.');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `login` varchar(15) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `login`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'user', '123'),
(8, 'artem', '555'),
(9, 'asd', 'asd'),
(10, 'nikita', 'nikita');

-- --------------------------------------------------------

--
-- Структура таблицы `users_lists`
--

CREATE TABLE `users_lists` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `item_id` int NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users_lists`
--

INSERT INTO `users_lists` (`id`, `id_user`, `item_id`, `status`) VALUES
(1, 1, 1, 0),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 2, 1, 0),
(5, 2, 2, 1),
(6, 2, 3, 0),
(7, 9, 1, 0),
(8, 9, 2, 0),
(9, 9, 3, 0),
(10, 8, 1, 1),
(11, 8, 2, 1),
(12, 8, 3, 1),
(13, 10, 1, 1),
(14, 10, 2, 1),
(15, 10, 3, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `lists`
--
ALTER TABLE `lists`
  ADD PRIMARY KEY (`item_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Индексы таблицы `users_lists`
--
ALTER TABLE `users_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users_lists`
--
ALTER TABLE `users_lists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `users_lists`
--
ALTER TABLE `users_lists`
  ADD CONSTRAINT `users_lists_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `users_lists_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `lists` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
