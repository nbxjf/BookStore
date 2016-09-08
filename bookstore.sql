-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2016 年 01 月 07 日 11:05
-- 服务器版本: 5.5.32
-- PHP 版本: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `bookstore`
--
CREATE DATABASE IF NOT EXISTS `bookstore` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bookstore`;

-- --------------------------------------------------------

--
-- 表的结构 `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `isbn` int(11) NOT NULL,
  `bname` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `press` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `publicationDate` date DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `discription` varchar(955) DEFAULT NULL,
  `cata` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `books`
--

INSERT INTO `books` (`isbn`, `bname`, `author`, `press`, `price`, `publicationDate`, `picture`, `discription`, `cata`) VALUES
(5, 'Java程序设计（第2版）', '朱喜福', ' 清华大学出版社', 35, '2010-05-01', '7.jpg', '', '第1章 Java语言基础<br/>第2章 使用Java解决简单的问题<br/>....'),
(11, '1', '33', '5342', 23, '2016-01-02', '2.jpg', '', ''),
(12, '66666', '66666', '66666', 66666, '2015-01-01', NULL, '', ''),
(13, '555555', '55555', '55555', 55555, '2015-01-03', NULL, '', ''),
(14, '777', '777', '777', 777, '2015-01-03', NULL, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `managers`
--

CREATE TABLE IF NOT EXISTS `managers` (
  `mname` int(11) NOT NULL,
  `mpass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `managers`
--

INSERT INTO `managers` (`mname`, `mpass`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `oid` int(11) NOT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `shipments` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`oid`, `isbn`, `id`, `shipments`, `date`, `price`, `number`) VALUES
(17, '9', '1', '已发货', '2016-01-06 16:47:35', 50, 1),
(18, '11', '1', '已发货', '2016-01-06 12:32:51', 23, 1),
(19, '5', '1', '已发货', '2016-01-06 12:36:10', 35, 1),
(20, '5', '1', '未发货', '2016-01-06 12:48:13', 35, 1),
(21, '5', '1', '未发货', '2016-01-06 12:48:50', 35, 1),
(22, '5', '1', '未发货', '2016-01-06 15:57:50', 35, 1),
(23, '12', '1', '未发货', '2016-01-06 15:58:12', 66666, 1),
(24, '5', '1', '未发货', '2016-01-06 16:46:08', 35, 1);

-- --------------------------------------------------------

--
-- 表的结构 `shoppingcarts`
--

CREATE TABLE IF NOT EXISTS `shoppingcarts` (
  `sid` int(11) NOT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `uname`, `upass`, `address`, `phone`, `points`) VALUES
(1, 'jianghao', 'jh', '宁波工程学院', '13454787563', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
