-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2022 a las 01:38:42
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `artesanias_doncorrea`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artesanias`
--

CREATE TABLE `artesanias` (
  `codigo` varchar(25) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `categoria` varchar(35) NOT NULL,
  `color` varchar(15) NOT NULL,
  `precio` float NOT NULL,
  `dimensiones` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabrica`
--

CREATE TABLE `fabrica` (
  `id` varchar(20) NOT NULL,
  `ubicacion` int(80) NOT NULL,
  `categorias` varchar(20) NOT NULL,
  `turno` int(15) NOT NULL,
  `telefono` int(12) NOT NULL,
  `num_trabajadores` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `num_control` varchar(35) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `turno` varchar(15) NOT NULL,
  `especialidad_tipo` varchar(50) NOT NULL,
  `piezas-dia` int(3) NOT NULL,
  `salario` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artesanias`
--
ALTER TABLE `artesanias`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `tipo` (`tipo`),
  ADD KEY `cate` (`categoria`);

--
-- Indices de la tabla `fabrica`
--
ALTER TABLE `fabrica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `control` (`num_trabajadores`),
  ADD KEY `cat` (`categorias`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `esp_tipo` (`especialidad_tipo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `artesanias`
--
ALTER TABLE `artesanias`
  ADD CONSTRAINT `artesanias_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `trabajadores` (`especialidad_tipo`);

--
-- Filtros para la tabla `fabrica`
--
ALTER TABLE `fabrica`
  ADD CONSTRAINT `fabrica_ibfk_1` FOREIGN KEY (`num_trabajadores`) REFERENCES `trabajadores` (`num_control`),
  ADD CONSTRAINT `fabrica_ibfk_2` FOREIGN KEY (`categorias`) REFERENCES `artesanias` (`categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
