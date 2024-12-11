-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 09 2024 г., 19:09
-- Версия сервера: 5.7.39
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `AA LANGUAGE III`
--

-- --------------------------------------------------------

--
-- Структура таблицы `descipline`
--

CREATE TABLE `descipline` (
  `id-discipline` int(1) NOT NULL,
  `name-discipline` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `descipline`
--

INSERT INTO `descipline` (`id-discipline`, `name-discipline`) VALUES
(1, 'Русский язык'),
(2, 'Математика'),
(3, 'История');

-- --------------------------------------------------------

--
-- Структура таблицы `exam`
--

CREATE TABLE `exam` (
  `id-exam` int(1) NOT NULL,
  `type-exam` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `exam`
--

INSERT INTO `exam` (`id-exam`, `type-exam`) VALUES
(1, 'Экзамен'),
(2, 'Зачет');

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id-group` int(2) NOT NULL,
  `name-group` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id-group`, `name-group`) VALUES
(1, 'CA 21-21'),
(2, 'CA 21-22'),
(3, 'CA 22-21'),
(4, 'CA 22-22'),
(5, 'CA 23-21'),
(6, 'ИСП 21-21'),
(7, 'ИСП 21-22'),
(8, 'ИСП 22-21'),
(9, 'ОБС 20-2'),
(10, 'ОБС 21-2'),
(11, 'ОБС 22-2'),
(12, 'ОБС 23-2'),
(13, 'БАС 22-2'),
(14, 'БАС 23-2');

-- --------------------------------------------------------

--
-- Структура таблицы `kurator`
--

CREATE TABLE `kurator` (
  `id-kurator` int(2) NOT NULL,
  `id-group` int(2) DEFAULT NULL,
  `id-spetiality` int(1) DEFAULT NULL,
  `FIO-kurator` varchar(32) DEFAULT NULL,
  `login-kurator` varchar(8) DEFAULT NULL,
  `password-kurator` varchar(8) DEFAULT NULL,
  `email-kurator` varchar(30) DEFAULT NULL,
  `phone-kurator` varchar(13) DEFAULT NULL,
  `adres-kurator` varchar(69) DEFAULT NULL,
  `INN-kurator` bigint(10) DEFAULT NULL,
  `rating-kurator` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `kurator`
--

INSERT INTO `kurator` (`id-kurator`, `id-group`, `id-spetiality`, `FIO-kurator`, `login-kurator`, `password-kurator`, `email-kurator`, `phone-kurator`, `adres-kurator`, `INN-kurator`, `rating-kurator`) VALUES
(1, 1, 1, 'Бычай Елена Васильевна', 'prepod1', 'prepod1', 'aleksandraivanova@ml.ru', '493 123 45 67', '652050, Кемеровская область, город Юрга, ул. Лесная, 15', 2222455179, 7),
(2, 2, 1, 'Мартиросян Татьяна Эдвардовна', 'prepod2', 'prepod2', 'vppetrov@vl.ru', '987 123 56 78', '164500, Архангельская область, город Северодвинск, ул. Строителей, 18', 3333888520, 7),
(3, 3, 1, 'Пономарчук Анастасия Анатольевна', 'prepod3', 'prepod3', 'ansolovev@st.ru', '812 223 32 00', '188910, Ленинградская область, город Приморск, ул. Парковая, 21', 4440391035, 7),
(4, 4, 1, 'Петровская Татьяна Николаевна', 'prepod4', 'prepod4', 'ekaterina.vorobeva@ml.ru', '444 222 33 11', '143960, Московская область, город Реутов, ул. Свободы, 51', 1111520857, 5),
(5, 5, 1, 'Сидорова Оксана Андреевна', 'prepod5', 'prepod5', 'stepanov@stepan.ru', '912 888 33 33', '309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', 5552431140, 10),
(6, 6, 2, 'Бобылёва Марина Анатольевна', 'prepod6', 'prepod6', 'o8540342@yandex.ru', '900 670 691', '309500, Белгородская область, город Старый Оскол, ул. Рабочая, 123', 5552431141, 7),
(7, 7, 2, 'Прокофьева Галина Алексеевна', 'prepod7', 'prepod7', 'faimsahapov@mail.ru', '952 673 10 31', '309500, Белгородская область, город Старый Оскол, ул. Рабочая, 124', 5552431142, 7),
(8, 8, 2, 'Кондакова Виктория Евгеньевна', 'prepod8', 'prepod8', 'tr_tanua2001@mail.ru', '911 794 963', '309500, Белгородская область, город Старый Оскол, ул. Рабочая, 125', 5552431143, 7),
(9, 9, 3, 'Бычай Алексей Петрович', 'prepod9', 'prepod9', 'patupikovdo@gmail.com', '964 237 20 77', '309500, Белгородская область, город Старый Оскол, ул. Рабочая, 126', 5552431144, 5),
(10, 10, 3, 'Кучиева Наталия Анатольевна', 'prepod10', 'prepod10', 'irina2003874@gmail.com', '911 954 03 42', '309500, Белгородская область, город Старый Оскол, ул. Рабочая, 127', 5552431145, 6),
(11, 11, 3, 'Бледных Ольга Витальевна', 'prepod11', 'prepod11', 'alenadyuzhikva@mail.ru', '952 707 250', '309500, Белгородская область, город Старый Оскол, ул. Рабочая, 128', 5552431146, 7),
(12, 12, 3, 'Кузякин Алексей Николаевич', 'prepod12', 'prepod12', 'zmvmax@yandex.ru', '901 393 25 30', '309500, Белгородская область, город Старый Оскол, ул. Рабочая, 129', 5552431147, 7),
(13, 13, 4, 'Шимина Наталья Георгиевна', 'prepod13', 'prepod13', 'kia54@mail.ru', '962 170 97 01', '309500, Белгородская область, город Старый Оскол, ул. Рабочая, 130', 5552431148, 7),
(14, 14, 4, 'Юркина Наталья Алексеевна', 'prepod14', 'prepod14', 'lunina.angelinka2002@gmail.com', '950 676 781', '309500, Белгородская область, город Старый Оскол, ул. Рабочая, 131', 5552431149, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `mark`
--

CREATE TABLE `mark` (
  `id-mark` int(2) NOT NULL,
  `id-student` int(2) DEFAULT NULL,
  `id-descipline` int(1) DEFAULT NULL,
  `mark-mark` int(1) DEFAULT NULL,
  `id-type-exam` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mark`
--

INSERT INTO `mark` (`id-mark`, `id-student`, `id-descipline`, `mark-mark`, `id-type-exam`) VALUES
(1, 1, 1, 5, 1),
(2, 1, 2, 4, 1),
(3, 1, 3, 3, 2),
(4, 2, 1, 5, 1),
(5, 2, 2, 2, 1),
(6, 2, 3, 3, 2),
(7, 3, 1, 4, 1),
(8, 3, 2, 5, 1),
(9, 3, 3, 2, 2),
(10, 4, 1, 5, 1),
(11, 4, 2, 4, 1),
(12, 4, 3, 2, 2),
(13, 5, 1, 3, 1),
(14, 5, 2, 4, 1),
(15, 5, 3, 4, 2),
(16, 6, 1, 4, 1),
(17, 6, 2, 5, 1),
(18, 6, 3, 3, 2),
(19, 7, 1, 3, 1),
(20, 7, 2, 5, 1),
(21, 7, 3, 5, 2),
(22, 8, 1, 3, 1),
(23, 8, 2, 2, 1),
(24, 8, 3, 5, 2),
(25, 9, 1, 3, 1),
(26, 9, 2, 3, 1),
(27, 9, 3, 4, 2),
(28, 10, 1, 4, 1),
(29, 10, 2, 5, 1),
(30, 10, 3, 3, 2),
(31, 11, 1, 5, 1),
(32, 11, 2, 2, 1),
(33, 11, 3, 4, 2),
(34, 12, 1, 3, 1),
(35, 12, 2, 5, 1),
(36, 12, 3, 5, 2),
(37, 13, 1, 5, 1),
(38, 13, 2, 3, 1),
(39, 13, 3, 3, 2),
(40, 14, 1, 3, 1),
(41, 14, 2, 4, 1),
(42, 14, 3, 3, 2),
(43, 15, 1, 4, 1),
(44, 15, 2, 3, 1),
(45, 15, 3, 5, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `spetiality`
--

CREATE TABLE `spetiality` (
  `id-spetiality` int(1) NOT NULL,
  `code-spetiality` varchar(8) DEFAULT NULL,
  `name-spetiality` varchar(47) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `spetiality`
--

INSERT INTO `spetiality` (`id-spetiality`, `code-spetiality`, `name-spetiality`) VALUES
(1, '09.02.06', 'Сетевое и системное администрирование'),
(2, '09.02.07', 'Информационные системы и программирование'),
(3, '10.02.05', 'Безопасность информационных систем'),
(4, '25.02.08', 'Управление беспилотными летательными аппаратами');

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `id-student` int(2) NOT NULL,
  `id-group` int(2) DEFAULT NULL,
  `FIO-student` varchar(28) DEFAULT NULL,
  `login-student` varchar(9) DEFAULT NULL,
  `password-student` varchar(9) DEFAULT NULL,
  `zachet-student` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`id-student`, `id-group`, `FIO-student`, `login-student`, `password-student`, `zachet-student`) VALUES
(1, 1, 'Башлаков Михаил Андреевич', 'student1', 'student1', '5360/22'),
(2, 1, 'Бобло Мелина Константиновна', 'student2', 'student2', '5361/22'),
(3, 2, 'Борская Виктория Игоревна', 'student3', 'student3', '5362/22'),
(4, 5, 'Глазунов Александр Павлович', 'student4', 'student4', '5363/22'),
(5, 6, 'Дёмин Максим Александрович', 'student5', 'student5', '5364/22'),
(6, 7, 'Евграфов Сергей Артурович', 'student6', 'student6', '5365/22'),
(7, 8, 'Качанов Александр Евгеньевич', 'student7', 'student7', '5366/22'),
(8, 9, 'Корнилов Глеб Олегович', 'student8', 'student8', '5368/22'),
(9, 10, 'Кульков Антон Дмитриевич', 'student9', 'student9', '5369/22'),
(10, 11, 'Мирошник Максим', 'student10', 'student10', '5371/22'),
(11, 12, 'Митенева Варвара Руслановна', 'student11', 'student11', '5372/22'),
(12, 13, 'Родин Иван Анатольевич', 'student12', 'student12', '5374/22'),
(13, 14, 'Сергеев Матвей Леонидович', 'student13', 'student13', '5376/22'),
(14, 14, 'Чиджавадзе Давид Османович', 'student14', 'student14', '5377/22'),
(15, 11, 'Эртель Данил Иванович', 'student15', 'student15', '5379/22');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `descipline`
--
ALTER TABLE `descipline`
  ADD PRIMARY KEY (`id-discipline`);

--
-- Индексы таблицы `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id-exam`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id-group`);

--
-- Индексы таблицы `kurator`
--
ALTER TABLE `kurator`
  ADD PRIMARY KEY (`id-kurator`),
  ADD KEY `id-group` (`id-group`),
  ADD KEY `id-spetiality` (`id-spetiality`);

--
-- Индексы таблицы `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`id-mark`),
  ADD KEY `id-student` (`id-student`),
  ADD KEY `id-descipline` (`id-descipline`),
  ADD KEY `id-type-exam` (`id-type-exam`);

--
-- Индексы таблицы `spetiality`
--
ALTER TABLE `spetiality`
  ADD PRIMARY KEY (`id-spetiality`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id-student`),
  ADD KEY `id-group` (`id-group`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `descipline`
--
ALTER TABLE `descipline`
  MODIFY `id-discipline` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `exam`
--
ALTER TABLE `exam`
  MODIFY `id-exam` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id-group` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `kurator`
--
ALTER TABLE `kurator`
  MODIFY `id-kurator` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `mark`
--
ALTER TABLE `mark`
  MODIFY `id-mark` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `spetiality`
--
ALTER TABLE `spetiality`
  MODIFY `id-spetiality` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `student`
--
ALTER TABLE `student`
  MODIFY `id-student` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `kurator`
--
ALTER TABLE `kurator`
  ADD CONSTRAINT `kurator_ibfk_1` FOREIGN KEY (`id-group`) REFERENCES `groups` (`id-group`),
  ADD CONSTRAINT `kurator_ibfk_2` FOREIGN KEY (`id-spetiality`) REFERENCES `spetiality` (`id-spetiality`);

--
-- Ограничения внешнего ключа таблицы `mark`
--
ALTER TABLE `mark`
  ADD CONSTRAINT `mark_ibfk_1` FOREIGN KEY (`id-student`) REFERENCES `student` (`id-student`),
  ADD CONSTRAINT `mark_ibfk_3` FOREIGN KEY (`id-descipline`) REFERENCES `descipline` (`id-discipline`),
  ADD CONSTRAINT `mark_ibfk_4` FOREIGN KEY (`id-type-exam`) REFERENCES `exam` (`id-exam`);

--
-- Ограничения внешнего ключа таблицы `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`id-group`) REFERENCES `groups` (`id-group`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
