-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-03-2017 a las 18:32:49
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `takeaway`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `foto` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `foto`) VALUES
(1, 'Ensaladas', 'Las mejores ensaladas hechas exclusivamente con productos frescos de nuestro mercado local.', 'img/cats/ensaladas.jpg'),
(2, 'Principales', 'Estos son nuestro platos principales, todos nuestros platos están hechos solo con productos frescos y naturales. Sin aditivos ni conservantes, envasados al vacío.', 'img/cat/principales.jpg'),
(3, 'Postres', 'Los mejores postres fríos, templados y calientes', 'img/cat/postres.jpg'),
(4, 'test', 'test', 'test'),
(5, 'bbbf ad s', 'dASDsa sd ', 'img/cat/principales.jpg'),
(6, 'dddd', 'ddddd', 'dddd'),
(7, 'test', 'asfasdfa', 'asdfasd'),
(8, 'test6', 'asdfasdasdf', 'asdfasd'),
(9, 'Mango', 'asdfasdf', 'dsafa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telf` varchar(15) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `email`, `telf`, `direccion`, `cp`, `fecha_alta`) VALUES
(1, 'Cliente Express', 'express@takeaway.cat', '666778899', 'Rambla castell, 14, 1º 1ª', '08800', '2017-02-08 17:26:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactform`
--

CREATE TABLE `contactform` (
  `id` int(11) NOT NULL,
  `nombreApellidos` varchar(100) CHARACTER SET utf8 NOT NULL,
  `email` varchar(100) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contactform`
--

INSERT INTO `contactform` (`id`, `nombreApellidos`, `email`, `mensaje`, `fecha_registro`) VALUES
(1, 'Test Nombre', 'mail@mail.com', 'asdlkfjlñkasjfla', '2017-02-20 18:42:17'),
(2, 'Josep Pla', 'mailto@taa.com', 'Mensaje de test', '2017-02-21 15:04:47'),
(3, 'Josep Pla', 'mailto@taa.com', 'Mensaje de test', '2017-02-21 15:30:45'),
(4, 'Josep Pla', 'mailto@taa.com', 'Mensaje de test', '2017-02-21 15:30:58'),
(5, 'Josep Pla', 'mailto@taa.com', 'Mensaje de test', '2017-02-21 15:38:54'),
(6, 'Paco López', 'jajaja@ya.com', 'Este es mi primer mensaje directo desde el formulario', '2017-02-21 15:55:05'),
(7, 'Paco López García', 'jajaja@ya.com', 'Este es mi primer mensaje directo desde el formulario', '2017-02-21 15:56:44'),
(8, 'Xavi García', 'mail@mail.com', '', '2017-02-21 15:57:29'),
(9, 'Xavi García', 'mail@mail.com', '', '2017-02-21 16:00:08'),
(10, 'Xavi GarcÃ­a', 'mail@mail.com', '', '2017-02-21 16:02:16'),
(11, 'Xavi GarcÃ­a', 'mail@mail.com', '', '2017-02-21 16:03:29'),
(12, 'Xavi García', 'mail@mail.com', '', '2017-02-21 16:09:17'),
(13, 'Xavi García', 'mail@mail.com', '', '2017-02-21 16:09:39'),
(14, 'Xavi GarcÃ­a', 'mail@mail.com', 'mensaje de test', '2017-02-21 17:01:09'),
(15, 'Xavi Garc?a', 'mail@mail.com', 'mensaje de test', '2017-02-21 17:02:59'),
(16, 'Xavi Garc?a', 'mail@mail.com', 'mensaje de test', '2017-02-21 17:04:44'),
(17, 'Xavi Garc?a', 'mail@mail.com', 'mensaje de test', '2017-02-21 17:05:28'),
(18, 'Xavi García', 'mail@mail.com', 'mensaje de test', '2017-02-21 17:06:00'),
(19, 'Xavi García', 'mail@mail.com', '', '2017-02-23 19:09:13'),
(20, 'cvz', 'mortadelo@d.com', 'vzxcvzxc compañía', '2017-03-27 14:47:43'),
(21, 'ssa', 'mortadelo@d.com', 'dafadsfads', '2017-03-27 16:21:43'),
(22, 'sdfa', 'mortadelo@d.com', 'dfasdf', '2017-03-27 16:22:06'),
(23, 'fasdf', 'xass@gmail.com', 'asdfadsfas', '2017-03-27 16:22:44'),
(24, 'ghsdf', 'wewqewq@dsad.com', 'sdfgsdf', '2017-03-27 16:23:51'),
(25, 'fsdfas', 'xass@gmail.com', 'asdfasd', '2017-03-27 16:24:25'),
(26, 'dfasd', 'xass@gmail.com', 'asdfasdf', '2017-03-27 16:25:05'),
(27, 'dsfas', 'xavcet@gmail.com', 'dsafaa', '2017-03-27 16:28:25'),
(28, 'asdfa', 'xass@gmail.com', 'dasfa', '2017-03-27 16:29:10'),
(29, 'asdfas', 'xass@gmail.com', 'dasfasd', '2017-03-27 16:29:35'),
(30, 'dsfa', 'mortadelo@d.com', 'dsfasdfasdfa', '2017-03-27 16:30:08'),
(31, 'asdfa', 'mortadelo@d.com', 'asdfasf', '2017-03-27 16:31:21'),
(32, 'dfa', 'mortadelo@d.com', 'adfasd', '2017-03-27 16:32:46'),
(33, 'dfa', 'mortadelo@d.com', 'asdfa', '2017-03-27 16:32:59'),
(34, 'dsa', 'wewqewq@dsad.com', 'asdfasd', '2017-03-27 16:33:25'),
(35, 'sda', 'wewqewq@dsad.com', 'dsfasdfasd', '2017-03-27 16:33:52'),
(36, 'dsd', 'mortadelo@d.com', 'gfhg g  hddgh dh ', '2017-03-27 16:34:16'),
(37, 'sada', 'xass@gmail.com', 'dfsafasd', '2017-03-27 16:35:05'),
(38, 'asdfa', 'mortadelo@d.com', 'asdfasdf', '2017-03-27 16:35:38'),
(39, 'asda', 'wewqewq@dsad.com', 'dfasdf', '2017-03-27 16:36:00'),
(40, 'asdfa', 'xass@gmail.com', 'asdfasdfas', '2017-03-27 16:37:16'),
(41, 'sdfasd', 'wewqewq@dsad.com', 'dsfasdf', '2017-03-27 16:37:41'),
(42, 'cdc', 'mortadelo@d.com', 'fasddfad', '2017-03-27 16:37:58'),
(43, 'fasa', 'xavcet@gmail.com', 'fasdfasd as asdf af s', '2017-03-27 16:40:16'),
(44, 'asdfas', 'mortadelo@d.com', 'asdfasd', '2017-03-27 16:40:49'),
(45, 'fd', 'mortadelo@d.com', 'asdfa', '2017-03-27 16:41:07'),
(46, 'fds', 'mortadelo@d.com', 'sdafasdf', '2017-03-27 16:42:23'),
(47, 'ss', 'mortadelo@d.com', 'sada', '2017-03-27 16:43:22'),
(48, 'd', 'mortadelo@d.com', 'asdfa', '2017-03-27 16:43:45'),
(49, 'ff', 'mortadelo@d.com', 'asfasdfa', '2017-03-27 16:44:22'),
(50, 'dsdsa', 'mortadelo@d.com', 'asdasdfa', '2017-03-27 16:45:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_plato` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `importe` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `id_pedido`, `id_plato`, `cantidad`, `importe`) VALUES
(1, 10, 2, 4, '0.00'),
(2, 10, 1, 3, '0.00'),
(3, 12, 2, 43, '15.00'),
(4, 12, 1, 3, '12.00'),
(5, 13, 3, 4, '20.00'),
(6, 13, 2, 3, '15.00'),
(7, 13, 1, 2, '8.00'),
(8, 14, 3, 4, '20.00'),
(9, 14, 2, 3, '15.00'),
(10, 14, 1, 2, '8.00'),
(11, 15, 3, 4, '20.00'),
(12, 15, 2, 3, '15.00'),
(13, 15, 1, 2, '8.00'),
(14, 16, 3, 4, '20.00'),
(15, 16, 2, 3, '15.00'),
(16, 16, 1, 2, '8.00'),
(17, 17, 3, 4, '20.00'),
(18, 17, 2, 3, '15.00'),
(19, 17, 1, 2, '8.00'),
(20, 18, 3, 4, '20.00'),
(21, 18, 2, 3, '15.00'),
(22, 18, 1, 2, '8.00'),
(23, 19, 3, 4, '20.00'),
(24, 19, 2, 3, '15.00'),
(25, 19, 1, 2, '8.00'),
(26, 20, 3, 4, '20.00'),
(27, 20, 2, 3, '15.00'),
(28, 20, 1, 2, '8.00'),
(29, 21, 3, 4, '20.00'),
(30, 21, 2, 3, '15.00'),
(31, 21, 1, 2, '8.00'),
(32, 22, 3, 4, '20.00'),
(33, 22, 2, 3, '15.00'),
(34, 22, 1, 2, '8.00'),
(35, 23, 3, 4, '20.00'),
(36, 23, 2, 3, '15.00'),
(37, 23, 1, 2, '8.00'),
(38, 24, 3, 4, '20.00'),
(39, 24, 2, 3, '15.00'),
(40, 24, 1, 2, '8.00'),
(41, 25, 3, 4, '20.00'),
(42, 25, 2, 3, '15.00'),
(43, 25, 1, 2, '8.00'),
(44, 26, 3, 4, '20.00'),
(45, 26, 2, 3, '15.00'),
(46, 26, 1, 2, '8.00'),
(47, 27, 3, 4, '20.00'),
(48, 27, 2, 3, '15.00'),
(49, 27, 1, 2, '8.00'),
(50, 28, 3, 4, '20.00'),
(51, 28, 2, 3, '15.00'),
(52, 28, 1, 2, '8.00'),
(53, 29, 3, 4, '20.00'),
(54, 29, 2, 3, '15.00'),
(55, 29, 1, 2, '8.00'),
(56, 30, 3, 4, '20.00'),
(57, 30, 2, 3, '15.00'),
(58, 30, 1, 2, '8.00'),
(59, 31, 3, 4, '20.00'),
(60, 31, 2, 3, '15.00'),
(61, 31, 1, 2, '8.00'),
(62, 32, 3, 4, '20.00'),
(63, 32, 2, 3, '15.00'),
(64, 32, 1, 2, '8.00'),
(65, 33, 3, 4, '20.00'),
(66, 33, 2, 3, '15.00'),
(67, 33, 1, 2, '8.00'),
(68, 34, 3, 4, '20.00'),
(69, 34, 2, 3, '15.00'),
(70, 34, 1, 2, '8.00'),
(71, 35, 3, 4, '20.00'),
(72, 35, 2, 3, '15.00'),
(73, 35, 1, 2, '8.00'),
(74, 36, 3, 4, '20.00'),
(75, 36, 2, 3, '15.00'),
(76, 36, 1, 2, '8.00'),
(77, 37, 3, 4, '20.00'),
(78, 37, 2, 3, '15.00'),
(79, 37, 1, 2, '8.00'),
(80, 38, 3, 4, '20.00'),
(81, 38, 2, 3, '15.00'),
(82, 38, 1, 2, '8.00'),
(83, 39, 3, 4, '20.00'),
(84, 39, 2, 3, '15.00'),
(85, 39, 1, 2, '8.00'),
(86, 40, 3, 4, '20.00'),
(87, 40, 2, 3, '15.00'),
(88, 40, 1, 2, '8.00'),
(89, 41, 3, 4, '20.00'),
(90, 41, 2, 3, '15.00'),
(91, 41, 1, 2, '8.00'),
(92, 42, 3, 4, '20.00'),
(93, 42, 2, 3, '15.00'),
(94, 42, 1, 2, '8.00'),
(95, 43, 3, 4, '20.00'),
(96, 43, 2, 3, '15.00'),
(97, 43, 1, 2, '8.00'),
(98, 44, 3, 4, '20.00'),
(99, 44, 2, 3, '15.00'),
(100, 44, 1, 2, '8.00'),
(101, 45, 3, 4, '20.00'),
(102, 45, 2, 3, '15.00'),
(103, 45, 1, 2, '8.00'),
(104, 46, 3, 4, '20.00'),
(105, 46, 2, 3, '15.00'),
(106, 46, 1, 2, '8.00'),
(107, 47, 3, 4, '20.00'),
(108, 47, 2, 3, '15.00'),
(109, 47, 1, 2, '8.00'),
(110, 48, 3, 4, '20.00'),
(111, 48, 2, 3, '15.00'),
(112, 48, 1, 2, '8.00'),
(113, 49, 3, 4, '20.00'),
(114, 49, 2, 3, '15.00'),
(115, 49, 1, 2, '8.00'),
(116, 50, 3, 4, '20.00'),
(117, 50, 2, 3, '15.00'),
(118, 50, 1, 2, '8.00'),
(119, 51, 3, 4, '20.00'),
(120, 51, 2, 3, '15.00'),
(121, 51, 1, 2, '8.00'),
(122, 52, 3, 4, '20.00'),
(123, 52, 2, 3, '15.00'),
(124, 52, 1, 2, '8.00'),
(125, 53, 3, 4, '20.00'),
(126, 53, 2, 3, '15.00'),
(127, 53, 1, 2, '8.00'),
(128, 54, 3, 3, '15.00'),
(129, 54, 1, 4, '16.00'),
(130, 55, 2, 4, '20.00'),
(131, 56, 2, 4, '20.00'),
(132, 58, 2, 4, '20.00'),
(133, 59, 2, 11, '20.00'),
(134, 60, 2, 3, '15.00'),
(135, 61, 2, 3, '15.00'),
(136, 63, 2, 3, '15.00'),
(137, 64, 2, 8, '20.00'),
(138, 64, 3, 3, '15.00'),
(139, 65, 2, 3, '15.00'),
(140, 66, 2, 3, '15.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `newsletter`
--

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecharegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `fecharegistro`) VALUES
(1, 'elmai@momo.com', '2017-02-21 18:31:56'),
(2, 'amamam@mao.com', '2017-02-21 18:45:01'),
(3, 'amamam@mao.com', '2017-02-21 19:06:29'),
(4, 'xavcet@gmail.com', '2017-02-21 19:06:33'),
(5, 'xavcet@gmail.com', '2017-02-21 19:07:28'),
(6, 'mail@mail.com', '2017-02-21 19:07:31'),
(7, 'mail@mail.com', '2017-02-21 19:08:29'),
(8, 'thaisfortb@hotmail.com', '2017-02-21 19:08:39'),
(9, 'thaisfortb@hotmail.com', '2017-02-21 19:09:51'),
(10, 'thaisfortb@hotmail.com', '2017-02-21 19:09:57'),
(11, 'elmai@momo.com', '2017-02-21 19:10:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_hoy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `importe` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_cliente`, `fecha_hoy`, `importe`) VALUES
(1, 1, '2017-03-24 17:18:39', '40.00'),
(2, 1, '2017-03-24 17:23:06', '40.00'),
(3, 1, '2017-03-24 17:31:02', '70.00'),
(4, 1, '2017-03-24 17:32:43', '70.00'),
(5, 1, '2017-03-24 17:33:08', '55.00'),
(6, 1, '2017-03-24 17:33:28', '55.00'),
(7, 1, '2017-03-24 17:34:03', '55.00'),
(8, 1, '2017-03-24 17:34:12', '55.00'),
(9, 1, '2017-03-24 17:34:20', '55.00'),
(10, 1, '2017-03-27 17:34:24', '681.00'),
(11, 1, '2017-03-28 16:28:33', '681.00'),
(12, 1, '2017-03-28 16:31:00', '681.00'),
(13, 1, '2017-03-28 16:32:49', '141.00'),
(14, 1, '2017-03-28 17:40:07', '141.00'),
(15, 1, '2017-03-28 17:42:57', '141.00'),
(16, 1, '2017-03-28 17:42:57', '141.00'),
(17, 1, '2017-03-28 17:42:58', '141.00'),
(18, 1, '2017-03-28 17:42:58', '141.00'),
(19, 1, '2017-03-28 17:42:58', '141.00'),
(20, 1, '2017-03-28 17:42:58', '141.00'),
(21, 1, '2017-03-28 17:42:58', '141.00'),
(22, 1, '2017-03-28 17:42:59', '141.00'),
(23, 1, '2017-03-28 17:42:59', '141.00'),
(24, 1, '2017-03-28 17:42:59', '141.00'),
(25, 1, '2017-03-28 17:43:00', '141.00'),
(26, 1, '2017-03-28 17:43:03', '141.00'),
(27, 1, '2017-03-28 17:43:03', '141.00'),
(28, 1, '2017-03-28 17:43:04', '141.00'),
(29, 1, '2017-03-28 17:43:04', '141.00'),
(30, 1, '2017-03-28 17:43:04', '141.00'),
(31, 1, '2017-03-28 17:43:04', '141.00'),
(32, 1, '2017-03-28 17:43:04', '141.00'),
(33, 1, '2017-03-28 17:43:05', '141.00'),
(34, 1, '2017-03-28 17:43:05', '141.00'),
(35, 1, '2017-03-28 17:43:06', '141.00'),
(36, 1, '2017-03-28 17:43:06', '141.00'),
(37, 1, '2017-03-28 17:43:06', '141.00'),
(38, 1, '2017-03-28 17:43:07', '141.00'),
(39, 1, '2017-03-28 17:43:07', '141.00'),
(40, 1, '2017-03-28 17:43:07', '141.00'),
(41, 1, '2017-03-28 17:43:07', '141.00'),
(42, 1, '2017-03-28 17:43:08', '141.00'),
(43, 1, '2017-03-28 17:43:08', '141.00'),
(44, 1, '2017-03-28 17:43:08', '141.00'),
(45, 1, '2017-03-28 17:43:08', '141.00'),
(46, 1, '2017-03-28 17:43:08', '141.00'),
(47, 1, '2017-03-28 17:43:09', '141.00'),
(48, 1, '2017-03-28 17:43:09', '141.00'),
(49, 1, '2017-03-28 17:43:11', '141.00'),
(50, 1, '2017-03-28 17:43:11', '141.00'),
(51, 1, '2017-03-28 17:43:12', '141.00'),
(52, 1, '2017-03-28 17:43:12', '141.00'),
(53, 1, '2017-03-28 18:00:44', '141.00'),
(54, 1, '2017-03-28 18:01:40', '109.00'),
(55, 1, '2017-03-28 18:05:04', '80.00'),
(56, 1, '2017-03-28 18:05:42', '80.00'),
(57, 1, '2017-03-28 18:05:47', '0.00'),
(58, 1, '2017-03-28 18:06:01', '80.00'),
(59, 1, '2017-03-28 18:08:14', '220.00'),
(60, 1, '2017-03-28 18:11:57', '45.00'),
(61, 1, '2017-03-28 18:13:23', '45.00'),
(62, 1, '2017-03-28 18:13:30', '0.00'),
(63, 1, '2017-03-28 18:13:54', '45.00'),
(64, 1, '2017-03-29 14:41:52', '205.00'),
(65, 1, '2017-03-29 14:48:38', '45.00'),
(66, 1, '2017-03-29 14:49:25', '45.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platos`
--

CREATE TABLE `platos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(4,2) NOT NULL,
  `descripcion` text NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `activado` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `platos`
--

INSERT INTO `platos` (`id`, `nombre`, `precio`, `descripcion`, `foto`, `id_categoria`, `activado`) VALUES
(1, 'Kiwi y Naranja', '4.00', 'Exquisita cuajada', 'img/kiwi_naranja.jpg', 3, 'on'),
(2, 'Xató Vilanova', '5.00', 'Escarola de temporada limpiada y cuidadosamente seleccionada de nuestro propio huerto.', 'img/escarolaAnchoas.jpg', 1, NULL),
(3, 'Fresas y Arándanos', '5.00', 'Texto de ejemplo', 'img/fresa_arandano.jpg', 3, 'on');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contactform`
--
ALTER TABLE `contactform`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `platos`
--
ALTER TABLE `platos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `contactform`
--
ALTER TABLE `contactform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT de la tabla `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT de la tabla `platos`
--
ALTER TABLE `platos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
