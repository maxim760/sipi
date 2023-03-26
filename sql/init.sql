-- phpMyAdmin SQL Dump
-- version 5.3.0-dev
-- https://www.phpmyadmin.net/
--
-- Хост: 192.168.30.23
-- Время создания: Ноя 28 2022 г., 10:40
-- Версия сервера: 8.0.18
-- Версия PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pizza_project`
--

-- --------------------------------------------------------

--
-- Структура таблицы `addresses`
--

CREATE TABLE `addresses` (
                             `id` binary(16) NOT NULL,
                             `user_id` binary(16) DEFAULT NULL,
                             `country` varchar(100) DEFAULT NULL,
                             `city` varchar(100) DEFAULT NULL,
                             `street` varchar(100) DEFAULT NULL,
                             `house` varchar(100) DEFAULT NULL,
                             `entrance` varchar(100) DEFAULT NULL,
                             `flat` int(11) DEFAULT NULL,
                             `commentary` text,
                             `intercom` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `country`, `city`, `street`, `house`, `entrance`, `flat`, `commentary`, `intercom`) VALUES
                                                                                                                                  (0x0a6d0df0521211ed83ca3f5a04071965, 0x0a697ed8521211ed83ca3f5a04071965, 'Россия', 'Москва', 'Центральная', '5', '3', 31, 'Comment', 'none'),
                                                                                                                                  (0x33f14a13daf64d54bb45c8482f313302, 0x282e46a41f4e4f57b7f67f75da5c2523, 'Россия', 'Мытищи', 'Березовая', '1', '3', 22, 'Коммент', 'none'),
                                                                                                                                  (0x80db8aeb57914d70b5b0e77b4b0b4e7e, 0xca13465545584df7a3365d96c95ed712, 'Россия', 'Москва', '12', '12', '12', 12, '12', NULL),
                                                                                                                                  (0xb82fc982ecfc4ed888fec7fc627e679e, 0x0be38451ecef47a1a3d292c43f39d788, 'Россия', 'Москва', 'Улица 123', '51', '99', 1234, '12', NULL),
                                                                                                                                  (0xc838dcec343d44de9c3eb2c36c570879, 0x1192c3b1922f4bceab0aedba9efdb0ed, 'Россия', 'Кострома', '111', '12', '13', 123, '', NULL),
                                                                                                                                  (0xcc71ce3edb4b45d9ac30bb0f61ea9f62, 0x7064e58756634ec2913fadff01d3139d, '22', '22', '22', '22', '22', 22, '22', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `certificates`
--

CREATE TABLE `certificates` (
                                `id` binary(16) NOT NULL,
                                `to_user_id` binary(16) DEFAULT NULL,
                                `from_user_id` binary(16) DEFAULT NULL,
                                `price` int(11) DEFAULT NULL,
                                `date_create` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `certificates`
--

INSERT INTO `certificates` (`id`, `to_user_id`, `from_user_id`, `price`, `date_create`) VALUES
                                                                                            (0x077a62107bd64d4ca1d9e7d6ae3084f2, 0x0be38451ecef47a1a3d292c43f39d788, NULL, 1234, '28 окт. 2022 00:53:54'),
                                                                                            (0x1df8950704c14bf9bc5404bacf2f7439, 0x0a697ed8521211ed83ca3f5a04071965, 0x0be38451ecef47a1a3d292c43f39d788, 2, '28 окт. 2022 00:57:12'),
                                                                                            (0x1fdc7490993c4752a901fabda5fe7b19, 0x282e46a41f4e4f57b7f67f75da5c2523, 0x0be38451ecef47a1a3d292c43f39d788, 5000, '23 окт. 2022 14:11:59'),
                                                                                            (0x2584cd411f0d4c3e994f7386eae3de90, 0x282e46a41f4e4f57b7f67f75da5c2523, 0x1192c3b1922f4bceab0aedba9efdb0ed, 333, '23 окт. 2022 14:33:19'),
                                                                                            (0x7af27bd9305e448aafc0d03eebb9ce33, 0x0be38451ecef47a1a3d292c43f39d788, 0x0be38451ecef47a1a3d292c43f39d788, 33, '23 окт. 2022 14:11:50'),
                                                                                            (0x7e8bf06c8cab4d1f9b65f214f490a1fd, 0x282e46a41f4e4f57b7f67f75da5c2523, NULL, 234, '28 окт. 2022 00:53:49'),
                                                                                            (0x8f0ac3fbb52e4eec91f2847b5ac1e820, 0x0be38451ecef47a1a3d292c43f39d788, 0x1192c3b1922f4bceab0aedba9efdb0ed, 550, '23 окт. 2022 14:33:30');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
                         `id` binary(16) NOT NULL,
                         `good_type` varchar(100) DEFAULT NULL,
                         `discount` int(11) DEFAULT NULL,
                         `price` int(11) DEFAULT NULL,
                         `name` varchar(100) DEFAULT NULL,
                         `description` text,
                         `img` text,
                         `current_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `good_type`, `discount`, `price`, `name`, `description`, `img`, `current_price`) VALUES
                                                                                                                (0x0a6fd594521211ed83ca3f5a04071965, 'Пицца', 0, 520, 'Ветчина и сыр', 'Сливочный соус, ветчина, моцарелла, пармезан', 'https://thumb.tildacdn.com/tild3366-3337-4765-a362-613634396661/-\n/format/webp/20220518_Dostavka_02.jpg', 520),
                                                                                                                (0x0a70168a521211ed83ca3f5a04071965, 'Пицца', 0, 520, 'С цыпленком чипотле', 'Сливочный соус, моцарелла, куриные бедра, красный лук, зеленый лук, соус чипотле', ' https://thumb.tildacdn.com/tild3931-6264-4962-b238-326630363734/-\n/format/webp/20220410_Dostavka_16.jpg', 520),
                                                                                                                (0x50a5c3e39d26436db0779ea9deaffb10, 'Пицца', 10, 499, 'Веджи Fit & Fresh', 'Грибы, Маслины, Свежие томаты, Сыр Моцарелла, Сыр Фета, Томатный соус', 'https://staticy.dominospizza.ru/api/medium/ProductOsg/Web/%D0%92%D0%95%D0%94%D0%96/NULL/NULL/RU', 449),
                                                                                                                (0x860fbe68569144a9a614173b320bf76b, 'Пицца', 7, 569, 'Диабло', 'Лук, Пепперони, Перец Халапеньо, Свежие томаты, Сыр Моцарелла, Томатный соус', 'https://staticy.dominospizza.ru/api/medium/ProductOsg/Web/%D0%94%D0%98%D0%90/NULL/NULL/RU', 529),
                                                                                                                (0x889bac78521611ed83ca3f5a04071965, 'Пицца', 0, 530, 'С пармой и рукколой', 'Сливочный соус, моцарелла, парма, руккола, помидоры черри', 'https://thumb.tildacdn.com/tild3066-3665-4361-a364-653265643233/-/format/webp/20220410_Dostavka_06.jpg', 530),
                                                                                                                (0x889dcf30521611ed83ca3f5a04071965, 'Пицца', 0, 309, 'Сырная с ветчиной', 'Ветчина, Сыр Моцарелла, Томатный соус', 'https://staticy.dominospizza.ru/api/medium/ProductOsg/Web/CHHM/NULL/NULL/RU', 309),
                                                                                                                (0x889e0108521611ed83ca3f5a04071965, 'Пицца', 0, 439, 'Пепперони Ранч', 'Пепперони, Сыр Моцарелла, Соус Чесночный Оригинальный', 'https://staticy.dominospizza.ru/api/medium/ProductOsg/Web/PEPERANC/NULL/NULL/RU', 439),
                                                                                                                (0x889e3f92521611ed83ca3f5a04071965, 'Пицца', 0, 729, '4 сезона', 'Бекон, Ветчина, Грибы, Курица, Лук, Маслины, Огурцы маринованные, Охотничьи колбаски, Пепперони', 'https://staticy.dominospizza.ru/api/medium/ProductOsg/Web/4SEASON/NULL/NULL/RU', 729),
                                                                                                                (0x889e68dc521611ed83ca3f5a04071965, 'Пицца', 0, 429, 'Чикен BBQ', 'Грибы, Курица, Лук, Соус BBQ, Сыр Моцарелла, Томатный соус', 'https://staticy.dominospizza.ru/api/medium/ProductOsg/Web/%D0%A7BBQ/NULL/NULL/RU', 429),
                                                                                                                (0x889e9a8c521611ed83ca3f5a04071965, 'Пицца', 0, 429, 'Карамельный Ананас', 'Ананас, Соус Карамельный, Соус Сырный, Сыр Моцарелла', 'https://staticy.dominospizza.ru/api/medium/ProductOsg/Web/KARPNAPL/NULL/NULL/RU', 429),
                                                                                                                (0x889ebeea521611ed83ca3f5a04071965, 'Напиток', 0, 1491, 'Кофе Латте', 'Кофе Латте 300мл', 'https://staticy.dominospizza.ru/api/medium/Product/Global/LATTE300D/NULL/NULL/RU', 1491),
                                                                                                                (0x889edea2521611ed83ca3f5a04071965, 'Напиток', 0, 99, 'Lipton Лимон', 'Чай со вкусом лимона Lipton 0,5 литра.', 'https://staticy.dominospizza.ru/api/medium/Product/Global/LIPLM05/NULL/NULL/RU', 99),
                                                                                                                (0x889f0742521611ed83ca3f5a04071965, 'Закуски', 0, 189, 'Фирменный картофель из печи', 'Порция 95 г. Фирменный картофель из печи', 'https://staticy.dominospizza.ru/api/medium/Product/Global/KARPECML/NULL/NULL/RU', 189),
                                                                                                                (0x889f3186521611ed83ca3f5a04071965, 'Закуски', 0, 239, 'Куpиные крылья', 'Порция 4 шт. Аппетитные крылышки с насыщенным многогранным вкусом и нотками копчености.', 'https://staticy.dominospizza.ru/api/medium/Product/Global/CHWSM/NULL/NULL/RU', 239);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
                          `id` binary(16) NOT NULL,
                          `user_id` binary(16) DEFAULT NULL,
                          `date_create` varchar(100) DEFAULT NULL,
                          `with_delivery` tinyint(1) DEFAULT NULL,
                          `price` int(11) DEFAULT NULL,
                          `timestamp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `date_create`, `with_delivery`, `price`, `timestamp`) VALUES
                                                                                                 (0x02c15ef4997142c496bfcd614ae5de27, 0x282e46a41f4e4f57b7f67f75da5c2523, '23 окт. 2022 14:16:56', 0, 2137, 1666523816999),
                                                                                                 (0x2ed92e6c1a3d45d9b187da4ab4cc8608, 0x282e46a41f4e4f57b7f67f75da5c2523, '28 окт. 2022 00:54:06', 0, 1942, 1666907646028),
                                                                                                 (0x3ea69d81e5b04f8cac57c7e87fee788c, 0x282e46a41f4e4f57b7f67f75da5c2523, '27 окт. 2022 14:32:52', 0, 1560, 1666870372274),
                                                                                                 (0x5a151c7794044055b0d41bef8848c796, 0x282e46a41f4e4f57b7f67f75da5c2523, '23 окт. 2022 14:16:31', 0, 2519, 1666523791250),
                                                                                                 (0x656d7fd5b920475f9a6ce2a5113d470d, 0x282e46a41f4e4f57b7f67f75da5c2523, '23 окт. 2022 14:17:56', 0, 1237, 1666523876500),
                                                                                                 (0x7a15cd15f91646ab81d982a5ee236b6f, 0x282e46a41f4e4f57b7f67f75da5c2523, '23 окт. 2022 14:16:08', 1, 1545, 1666523768399),
                                                                                                 (0x8a7d01dbf6be48129ccb28925d65b837, 0x282e46a41f4e4f57b7f67f75da5c2523, '28 окт. 2022 00:33:20', 0, 1521, 1666906400764),
                                                                                                 (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x282e46a41f4e4f57b7f67f75da5c2523, '27 окт. 2022 14:31:15', 0, 29640, 1666870275151),
                                                                                                 (0xb62df36c6bbf4a699cdf0137674f8f42, 0x1192c3b1922f4bceab0aedba9efdb0ed, '23 окт. 2022 14:33:59', 1, 1217, 1666524839268),
                                                                                                 (0xbff6ce1d5d8a41deab014a5b9b059dd5, 0x282e46a41f4e4f57b7f67f75da5c2523, '28 окт. 2022 00:18:22', 0, 898, 1666905502472),
                                                                                                 (0xc14db9bf61ac4e588e6af7cbb1ae803b, 0x282e46a41f4e4f57b7f67f75da5c2523, '28 нояб. 2022 11:02:41', 0, 1560, 1669622561722),
                                                                                                 (0xd313cd7156914566b441769240cb6ce0, 0x282e46a41f4e4f57b7f67f75da5c2523, '28 окт. 2022 00:17:39', 0, 1347, 1666905459186),
                                                                                                 (0xdc51b9c5e89843f5b1cfc0d948311793, 0x282e46a41f4e4f57b7f67f75da5c2523, '23 окт. 2022 01:13:27', 0, 1249, 1666476807734),
                                                                                                 (0xf03790cf326b4584aaee6aadcc3ab5db, 0x282e46a41f4e4f57b7f67f75da5c2523, '28 окт. 2022 01:03:42', 0, 1346, 1666908222883);

-- --------------------------------------------------------

--
-- Структура таблицы `order_goods`
--

CREATE TABLE `order_goods` (
                               `order_id` binary(16) NOT NULL,
                               `goods_id` binary(16) NOT NULL,
                               `id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (arm64)
--
-- Host: localhost    Database: pizza_project
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `order_goods`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-28 14:54:15
--
-- Дамп данных таблицы `order_goods`
--

INSERT INTO `order_goods` (`order_id`, `goods_id`, `id`) VALUES
                                                             (0xdc51b9c5e89843f5b1cfc0d948311793, 0x0a70168a521211ed83ca3f5a04071965, 15),
                                                             (0xdc51b9c5e89843f5b1cfc0d948311793, 0x889e3f92521611ed83ca3f5a04071965, 16),
                                                             (0x7a15cd15f91646ab81d982a5ee236b6f, 0x50a5c3e39d26436db0779ea9deaffb10, 18),
                                                             (0x7a15cd15f91646ab81d982a5ee236b6f, 0x50a5c3e39d26436db0779ea9deaffb10, 19),
                                                             (0x7a15cd15f91646ab81d982a5ee236b6f, 0x889ebeea521611ed83ca3f5a04071965, 20),
                                                             (0x7a15cd15f91646ab81d982a5ee236b6f, 0x889ebeea521611ed83ca3f5a04071965, 21),
                                                             (0x7a15cd15f91646ab81d982a5ee236b6f, 0x889edea2521611ed83ca3f5a04071965, 22),
                                                             (0x5a151c7794044055b0d41bef8848c796, 0x0a6fd594521211ed83ca3f5a04071965, 23),
                                                             (0x5a151c7794044055b0d41bef8848c796, 0x0a6fd594521211ed83ca3f5a04071965, 24),
                                                             (0x5a151c7794044055b0d41bef8848c796, 0x0a6fd594521211ed83ca3f5a04071965, 25),
                                                             (0x5a151c7794044055b0d41bef8848c796, 0x889bac78521611ed83ca3f5a04071965, 26),
                                                             (0x5a151c7794044055b0d41bef8848c796, 0x889e9a8c521611ed83ca3f5a04071965, 27),
                                                             (0x02c15ef4997142c496bfcd614ae5de27, 0x889bac78521611ed83ca3f5a04071965, 28),
                                                             (0x02c15ef4997142c496bfcd614ae5de27, 0x50a5c3e39d26436db0779ea9deaffb10, 29),
                                                             (0x02c15ef4997142c496bfcd614ae5de27, 0x889e68dc521611ed83ca3f5a04071965, 30),
                                                             (0x02c15ef4997142c496bfcd614ae5de27, 0x889e3f92521611ed83ca3f5a04071965, 31),
                                                             (0x656d7fd5b920475f9a6ce2a5113d470d, 0x0a70168a521211ed83ca3f5a04071965, 32),
                                                             (0x656d7fd5b920475f9a6ce2a5113d470d, 0x889f3186521611ed83ca3f5a04071965, 33),
                                                             (0x656d7fd5b920475f9a6ce2a5113d470d, 0x889f3186521611ed83ca3f5a04071965, 34),
                                                             (0x656d7fd5b920475f9a6ce2a5113d470d, 0x889f3186521611ed83ca3f5a04071965, 35),
                                                             (0xb62df36c6bbf4a699cdf0137674f8f42, 0x889f0742521611ed83ca3f5a04071965, 40),
                                                             (0xb62df36c6bbf4a699cdf0137674f8f42, 0x889dcf30521611ed83ca3f5a04071965, 41),
                                                             (0xb62df36c6bbf4a699cdf0137674f8f42, 0x50a5c3e39d26436db0779ea9deaffb10, 42),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 44),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 45),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 46),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 47),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 48),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 49),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 50),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 51),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 52),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 53),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 54),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 55),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 56),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 57),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 58),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 59),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 60),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 61),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 62),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 63),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 64),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 65),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 66),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 67),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 68),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 69),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 70),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 71),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 72),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 73),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 74),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 75),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 76),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 77),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 78),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 79),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 80),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 81),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 82),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 83),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 84),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 85),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 86),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 87),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 88),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 89),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 90),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 91),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 92),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 93),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 94),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 95),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 96),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 97),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 98),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 99),
                                                             (0xb53fb8f63b7c474f9ddf32e01a4f3294, 0x0a6fd594521211ed83ca3f5a04071965, 100),
                                                             (0x3ea69d81e5b04f8cac57c7e87fee788c, 0x0a6fd594521211ed83ca3f5a04071965, 101),
                                                             (0x3ea69d81e5b04f8cac57c7e87fee788c, 0x0a6fd594521211ed83ca3f5a04071965, 102),
                                                             (0x3ea69d81e5b04f8cac57c7e87fee788c, 0x0a6fd594521211ed83ca3f5a04071965, 103),
                                                             (0xd313cd7156914566b441769240cb6ce0, 0x50a5c3e39d26436db0779ea9deaffb10, 104),
                                                             (0xd313cd7156914566b441769240cb6ce0, 0x50a5c3e39d26436db0779ea9deaffb10, 105),
                                                             (0xd313cd7156914566b441769240cb6ce0, 0x50a5c3e39d26436db0779ea9deaffb10, 106),
                                                             (0xbff6ce1d5d8a41deab014a5b9b059dd5, 0x50a5c3e39d26436db0779ea9deaffb10, 107),
                                                             (0xbff6ce1d5d8a41deab014a5b9b059dd5, 0x50a5c3e39d26436db0779ea9deaffb10, 108),
                                                             (0x8a7d01dbf6be48129ccb28925d65b837, 0x889edea2521611ed83ca3f5a04071965, 109),
                                                             (0x8a7d01dbf6be48129ccb28925d65b837, 0x889f0742521611ed83ca3f5a04071965, 110),
                                                             (0x8a7d01dbf6be48129ccb28925d65b837, 0x889f0742521611ed83ca3f5a04071965, 111),
                                                             (0x8a7d01dbf6be48129ccb28925d65b837, 0x889f0742521611ed83ca3f5a04071965, 112),
                                                             (0x8a7d01dbf6be48129ccb28925d65b837, 0x889f0742521611ed83ca3f5a04071965, 113),
                                                             (0x8a7d01dbf6be48129ccb28925d65b837, 0x889f0742521611ed83ca3f5a04071965, 114),
                                                             (0x8a7d01dbf6be48129ccb28925d65b837, 0x889f0742521611ed83ca3f5a04071965, 115),
                                                             (0x8a7d01dbf6be48129ccb28925d65b837, 0x889f0742521611ed83ca3f5a04071965, 116),
                                                             (0x8a7d01dbf6be48129ccb28925d65b837, 0x889edea2521611ed83ca3f5a04071965, 117),
                                                             (0x2ed92e6c1a3d45d9b187da4ab4cc8608, 0x889e9a8c521611ed83ca3f5a04071965, 118),
                                                             (0x2ed92e6c1a3d45d9b187da4ab4cc8608, 0x889e9a8c521611ed83ca3f5a04071965, 119),
                                                             (0x2ed92e6c1a3d45d9b187da4ab4cc8608, 0x889ebeea521611ed83ca3f5a04071965, 120),
                                                             (0x2ed92e6c1a3d45d9b187da4ab4cc8608, 0x889ebeea521611ed83ca3f5a04071965, 121),
                                                             (0x2ed92e6c1a3d45d9b187da4ab4cc8608, 0x889f0742521611ed83ca3f5a04071965, 122),
                                                             (0x2ed92e6c1a3d45d9b187da4ab4cc8608, 0x889f0742521611ed83ca3f5a04071965, 123),
                                                             (0x2ed92e6c1a3d45d9b187da4ab4cc8608, 0x889f0742521611ed83ca3f5a04071965, 124),
                                                             (0x2ed92e6c1a3d45d9b187da4ab4cc8608, 0x889f3186521611ed83ca3f5a04071965, 125),
                                                             (0xf03790cf326b4584aaee6aadcc3ab5db, 0x889f0742521611ed83ca3f5a04071965, 126),
                                                             (0xf03790cf326b4584aaee6aadcc3ab5db, 0x889f0742521611ed83ca3f5a04071965, 127),
                                                             (0xf03790cf326b4584aaee6aadcc3ab5db, 0x889f3186521611ed83ca3f5a04071965, 128),
                                                             (0xf03790cf326b4584aaee6aadcc3ab5db, 0x889e3f92521611ed83ca3f5a04071965, 129),
                                                             (0xc14db9bf61ac4e588e6af7cbb1ae803b, 0x0a70168a521211ed83ca3f5a04071965, 130),
                                                             (0xc14db9bf61ac4e588e6af7cbb1ae803b, 0x0a70168a521211ed83ca3f5a04071965, 131),
                                                             (0xc14db9bf61ac4e588e6af7cbb1ae803b, 0x0a70168a521211ed83ca3f5a04071965, 132);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
                            `id` binary(16) NOT NULL,
                            `count` int(11) DEFAULT NULL,
                            `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `count`, `name`) VALUES
                                                   (0x0b2c3bea573a4529986924a26d056f7c, 10, 'Лук'),
                                                   (0x889f74de521611ed83ca3f5a04071965, 78, 'Парма'),
                                                   (0x889f8488521611ed83ca3f5a04071965, 100, 'Руколла'),
                                                   (0x889f84ce521611ed83ca3f5a04071965, 66, 'Помидоры черри'),
                                                   (0x889f8528521611ed83ca3f5a04071965, 94, 'Томатный соус'),
                                                   (0x889f8550521611ed83ca3f5a04071965, 23, 'Соус чесночный'),
                                                   (0x889f8578521611ed83ca3f5a04071965, 122, 'Пеперонни'),
                                                   (0x889f8596521611ed83ca3f5a04071965, 228, 'Маслины'),
                                                   (0x889f85aa521611ed83ca3f5a04071965, 233, 'Бекон'),
                                                   (0x889f85c8521611ed83ca3f5a04071965, 93, 'Грибы'),
                                                   (0x889f85fa521611ed83ca3f5a04071965, 499, 'Курица'),
                                                   (0x889f8618521611ed83ca3f5a04071965, 94, 'Огурцы'),
                                                   (0x889f862c521611ed83ca3f5a04071965, 108, 'Соус BBQ'),
                                                   (0x889f864a521611ed83ca3f5a04071965, 11, 'Ананас'),
                                                   (0x889f86cc521611ed83ca3f5a04071965, 108, 'Соус карамельный'),
                                                   (0x889f86f4521611ed83ca3f5a04071965, 898, 'Соус сырный'),
                                                   (0x889f8708521611ed83ca3f5a04071965, 38, 'Кофе латте 300мл'),
                                                   (0x889f8726521611ed83ca3f5a04071965, 94, 'Чай липтон'),
                                                   (0x889f8744521611ed83ca3f5a04071965, 6, 'Картофель из печи фирменный'),
                                                   (0x889f8762521611ed83ca3f5a04071965, 92, 'Куриные крылья'),
                                                   (0x9f45f32e521211ed83ca3f5a04071965, 27, 'Сливочный соус'),
                                                   (0x9f461714521211ed83ca3f5a04071965, 17, 'Моцарелла'),
                                                   (0x9f461a20521211ed83ca3f5a04071965, 90, 'Куриные бедра'),
                                                   (0x9f461a84521211ed83ca3f5a04071965, 496, 'Красный лук'),
                                                   (0x9f461ad4521211ed83ca3f5a04071965, 90, 'Зеленый лук'),
                                                   (0x9f461b1a521211ed83ca3f5a04071965, 90, 'Соус чипотле'),
                                                   (0x9f461b6a521211ed83ca3f5a04071965, 234, 'Ветчина'),
                                                   (0x9f461c64521211ed83ca3f5a04071965, 440, 'Пармезан'),
                                                   (0xadcffe3188434371815d58a91b64b6b4, 10, 'Сыр фета'),
                                                   (0xdd82387507994f7cb150719769fa313a, 40, 'Помидоры'),
                                                   (0xe3bc84961a594a66887b13a6ffc842f8, 35, 'Перец Халапеньо');

-- --------------------------------------------------------

--
-- Структура таблицы `product_goods`
--

CREATE TABLE `product_goods` (
                                 `product_id` binary(16) NOT NULL,
                                 `goods_id` binary(16) NOT NULL,
                                 `id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `product_goods`
--

INSERT INTO `product_goods` (`product_id`, `goods_id`, `id`) VALUES
                                                                 (0x9f45f32e521211ed83ca3f5a04071965, 0x0a6fd594521211ed83ca3f5a04071965, 1),
                                                                 (0x9f45f32e521211ed83ca3f5a04071965, 0x0a70168a521211ed83ca3f5a04071965, 2),
                                                                 (0x9f461714521211ed83ca3f5a04071965, 0x0a6fd594521211ed83ca3f5a04071965, 3),
                                                                 (0x9f461714521211ed83ca3f5a04071965, 0x0a70168a521211ed83ca3f5a04071965, 4),
                                                                 (0x9f461a20521211ed83ca3f5a04071965, 0x0a70168a521211ed83ca3f5a04071965, 5),
                                                                 (0x9f461a84521211ed83ca3f5a04071965, 0x0a70168a521211ed83ca3f5a04071965, 6),
                                                                 (0x9f461ad4521211ed83ca3f5a04071965, 0x0a70168a521211ed83ca3f5a04071965, 7),
                                                                 (0x9f461b1a521211ed83ca3f5a04071965, 0x0a70168a521211ed83ca3f5a04071965, 8),
                                                                 (0x9f461b6a521211ed83ca3f5a04071965, 0x0a6fd594521211ed83ca3f5a04071965, 9),
                                                                 (0x9f461c64521211ed83ca3f5a04071965, 0x0a6fd594521211ed83ca3f5a04071965, 10),
                                                                 (0x889f74de521611ed83ca3f5a04071965, 0x889bac78521611ed83ca3f5a04071965, 11),
                                                                 (0x889f8488521611ed83ca3f5a04071965, 0x889bac78521611ed83ca3f5a04071965, 12),
                                                                 (0x889f84ce521611ed83ca3f5a04071965, 0x889bac78521611ed83ca3f5a04071965, 13),
                                                                 (0x889f8528521611ed83ca3f5a04071965, 0x889dcf30521611ed83ca3f5a04071965, 14),
                                                                 (0x889f8528521611ed83ca3f5a04071965, 0x889e68dc521611ed83ca3f5a04071965, 15),
                                                                 (0x889f8550521611ed83ca3f5a04071965, 0x889e0108521611ed83ca3f5a04071965, 16),
                                                                 (0x889f8578521611ed83ca3f5a04071965, 0x889e0108521611ed83ca3f5a04071965, 17),
                                                                 (0x889f8596521611ed83ca3f5a04071965, 0x889e3f92521611ed83ca3f5a04071965, 18),
                                                                 (0x889f85aa521611ed83ca3f5a04071965, 0x889e3f92521611ed83ca3f5a04071965, 19),
                                                                 (0x889f85c8521611ed83ca3f5a04071965, 0x889e3f92521611ed83ca3f5a04071965, 20),
                                                                 (0x889f85c8521611ed83ca3f5a04071965, 0x889e68dc521611ed83ca3f5a04071965, 21),
                                                                 (0x889f85fa521611ed83ca3f5a04071965, 0x889e3f92521611ed83ca3f5a04071965, 22),
                                                                 (0x889f85fa521611ed83ca3f5a04071965, 0x889e68dc521611ed83ca3f5a04071965, 23),
                                                                 (0x889f8618521611ed83ca3f5a04071965, 0x889e3f92521611ed83ca3f5a04071965, 24),
                                                                 (0x889f862c521611ed83ca3f5a04071965, 0x889e68dc521611ed83ca3f5a04071965, 25),
                                                                 (0x889f864a521611ed83ca3f5a04071965, 0x889e9a8c521611ed83ca3f5a04071965, 26),
                                                                 (0x889f86cc521611ed83ca3f5a04071965, 0x889e9a8c521611ed83ca3f5a04071965, 27),
                                                                 (0x889f86f4521611ed83ca3f5a04071965, 0x889e9a8c521611ed83ca3f5a04071965, 28),
                                                                 (0x889f8708521611ed83ca3f5a04071965, 0x889ebeea521611ed83ca3f5a04071965, 29),
                                                                 (0x889f8726521611ed83ca3f5a04071965, 0x889edea2521611ed83ca3f5a04071965, 30),
                                                                 (0x889f8744521611ed83ca3f5a04071965, 0x889f0742521611ed83ca3f5a04071965, 31),
                                                                 (0x889f8762521611ed83ca3f5a04071965, 0x889f3186521611ed83ca3f5a04071965, 32),
                                                                 (0x889f8528521611ed83ca3f5a04071965, 0x50a5c3e39d26436db0779ea9deaffb10, 33),
                                                                 (0x889f8596521611ed83ca3f5a04071965, 0x50a5c3e39d26436db0779ea9deaffb10, 34),
                                                                 (0x889f85c8521611ed83ca3f5a04071965, 0x50a5c3e39d26436db0779ea9deaffb10, 35),
                                                                 (0x9f461714521211ed83ca3f5a04071965, 0x50a5c3e39d26436db0779ea9deaffb10, 36),
                                                                 (0xadcffe3188434371815d58a91b64b6b4, 0x50a5c3e39d26436db0779ea9deaffb10, 37),
                                                                 (0xdd82387507994f7cb150719769fa313a, 0x50a5c3e39d26436db0779ea9deaffb10, 38),
                                                                 (0x0b2c3bea573a4529986924a26d056f7c, 0x860fbe68569144a9a614173b320bf76b, 39),
                                                                 (0x889f8528521611ed83ca3f5a04071965, 0x860fbe68569144a9a614173b320bf76b, 40),
                                                                 (0x889f8578521611ed83ca3f5a04071965, 0x860fbe68569144a9a614173b320bf76b, 41),
                                                                 (0x9f461714521211ed83ca3f5a04071965, 0x860fbe68569144a9a614173b320bf76b, 42),
                                                                 (0xdd82387507994f7cb150719769fa313a, 0x860fbe68569144a9a614173b320bf76b, 43),
                                                                 (0xe3bc84961a594a66887b13a6ffc842f8, 0x860fbe68569144a9a614173b320bf76b, 44);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
                         `id` binary(16) NOT NULL,
                         `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
                                       (0x0a6c48e8521211ed83ca3f5a04071965, 'user'),
                                       (0xf4e1a956b4a049e09037ebed8d303d7c, 'ADMIN');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
                         `id` binary(16) NOT NULL,
                         `first_name` varchar(100) DEFAULT NULL,
                         `last_name` varchar(100) DEFAULT NULL,
                         `username` varchar(100) DEFAULT NULL,
                         `phone` varchar(100) DEFAULT NULL,
                         `password` varchar(128) DEFAULT NULL,
                         `email` varchar(100) DEFAULT NULL,
                         `cash` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `phone`, `password`, `email`, `cash`) VALUES
                                                                                                            (0x0a697ed8521211ed83ca3f5a04071965, 'maxim', 'smirnov', 'maxim22', '888000', '0000', 'test@mil.ru', 24),
                                                                                                            (0x0be38451ecef47a1a3d292c43f39d788, 'Admin', 'Account', 'ADMIN', '92033344455', '$2a$10$n7M8QSgF32D8Xtvs8SZxrupBFRuLVHfaFE2CA8/qIWcWGDO1aG6QC', 'maks.tomanov@admin.admin', 85849),
                                                                                                            (0x1192c3b1922f4bceab0aedba9efdb0ed, 'user', 'user', 'user', '234', '$2a$10$EnqEjc8lPMWCOCglyzNeUOXBSUEeagx9kKJrJjeXUnu2.t0Dn0cEO', 'USER@USER.USER', 7890),
                                                                                                            (0x282e46a41f4e4f57b7f67f75da5c2523, 'maxim', 'TOmanov', 'maxim760', '833456', '$2a$10$jWwo3Vm99MRtqBTAsrWe2O.zBLUQRlnYiWMCu8RXQfj1DTwzXNfuK', 'maks.tonaniv@mailry.ert', 74514),
                                                                                                            (0x7064e58756634ec2913fadff01d3139d, 'user2', 'user2', 'user2', '22', '$2a$10$dtgYpRm2uhddMEd0RUaA/OcHSjzQZG0ThXu0m56bM.hso1hWqY7Si', 'wer@wer.ww', 123),
                                                                                                            (0xca13465545584df7a3365d96c95ed712, 'Admin', 'Admin', 'MAIN', '23', '$2a$10$nTyUgO4GS489CuEqYZt0HOAfN8h5yytHWCloS5xHX33eGR/nDH87q', 'mail@mail.ru', 13368);

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
                              `user_id` binary(16) NOT NULL,
                              `role_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
                                                    (0x0a697ed8521211ed83ca3f5a04071965, 0x0a6c48e8521211ed83ca3f5a04071965),
                                                    (0x0be38451ecef47a1a3d292c43f39d788, 0x0a6c48e8521211ed83ca3f5a04071965),
                                                    (0x1192c3b1922f4bceab0aedba9efdb0ed, 0x0a6c48e8521211ed83ca3f5a04071965),
                                                    (0x282e46a41f4e4f57b7f67f75da5c2523, 0x0a6c48e8521211ed83ca3f5a04071965),
                                                    (0x7064e58756634ec2913fadff01d3139d, 0x0a6c48e8521211ed83ca3f5a04071965),
                                                    (0xca13465545584df7a3365d96c95ed712, 0x0a6c48e8521211ed83ca3f5a04071965),
                                                    (0x0be38451ecef47a1a3d292c43f39d788, 0xf4e1a956b4a049e09037ebed8d303d7c),
                                                    (0xca13465545584df7a3365d96c95ed712, 0xf4e1a956b4a049e09037ebed8d303d7c);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `addresses`
--
ALTER TABLE `addresses`
    ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `certificates`
--
ALTER TABLE `certificates`
    ADD PRIMARY KEY (`id`),
  ADD KEY `to_user_id` (`to_user_id`),
  ADD KEY `from_user_id` (`from_user_id`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
    ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `order_goods`
--
ALTER TABLE `order_goods`
    ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_goods`
--
ALTER TABLE `product_goods`
    ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `goods_id` (`goods_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
    ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `order_goods`
--
ALTER TABLE `order_goods`
    MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT для таблицы `product_goods`
--
ALTER TABLE `product_goods`
    MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `addresses`
--
ALTER TABLE `addresses`
    ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `certificates`
--
ALTER TABLE `certificates`
    ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `certificates_ibfk_2` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
    ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_goods`
--
ALTER TABLE `order_goods`
    ADD CONSTRAINT `order_goods_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_goods_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_goods`
--
ALTER TABLE `product_goods`
    ADD CONSTRAINT `product_goods_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_goods_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
    ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- triggers

DELIMITER ;;
CREATE TRIGGER order_goods_AFTER_INSERT
    AFTER INSERT
    ON `order_goods` FOR EACH ROW
BEGIN
    update products
        inner join product_goods
    on products.id = product_goods.product_id
        inner join goods
        on goods.id = product_goods.goods_id
        set count = count - 1
    where goods.id = new.goods_id;
END;;
DELIMITER ;

DELIMITER ;;
CREATE TRIGGER users_AFTER_DELETE
    AFTER DELETE
    ON `users` FOR EACH ROW
BEGIN
	delete from addresses where user_id = old.id;
    delete from user_roles where user_roles.user_id = old.id;
    delete from orders where orders.user_id = old.id;
    delete order_goods from order_goods
    left join orders
    on order_goods.order_id = orders.id
    where orders.user_id = old.id;
END;;
DELIMITER ;