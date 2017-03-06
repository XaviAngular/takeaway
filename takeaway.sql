-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-03-2017 a las 16:36:28
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

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
(6, 'dddd', 'ddddd', 'dddd');

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
(19, 'Xavi García', 'mail@mail.com', '', '2017-02-23 19:09:13');

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
  `id_plato` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_uni` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'Cuajada', '4.00', 'Exquisita cuajada', 'img/cat/principales.jpg', 0, 'on'),
(2, 'Escarola con anchoas', '5.00', 'Escarola de temporada limpiada y cuidadosamente seleccionada de nuestro propio huerto.', 'img/escarolaAnchoas.jpg', 0, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `contactform`
--
ALTER TABLE `contactform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `platos`
--
ALTER TABLE `platos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
