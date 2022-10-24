-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-10-2022 a las 17:19:01
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela_gfcg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `clave` varchar(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL,
  `horas_totales` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`clave`, `nombre`, `horas_semana`, `horas_totales`) VALUES
('1011', 'Construye BD', 9, 127),
('123', 'Inglés', 5, 120),
('1234', 'Cálculo Integral', 5, 120),
('567', 'Física II', 4, 96),
('5678', 'CTSV', 3, 72),
('910', 'DAWCBD', 9, 127);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(20) NOT NULL,
  `turno` varchar(15) DEFAULT NULL,
  `lider_academia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('Contabilidad', 'Mixto', ''),
('Electricidad', 'Matutino', ''),
('Logística', 'Vespertino', ''),
('Mecánica', 'Matutino', ''),
('Programacion', 'Mixto', 'Ricardo Méndez Rojas'),
('Recursos Humanos', 'Mixto', ''),
('Soporte y Mantenimie', 'Mixto', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `num_control` varchar(15) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `edad` varchar(3) NOT NULL,
  `domicilio` varchar(80) NOT NULL,
  `grupo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`num_control`, `nombre`, `apellidos`, `telefono`, `edad`, `domicilio`, `grupo`) VALUES
('0484984', 'Mario', 'Kart', '048465', '15', 'Calle 4 #3B', '5CM'),
('12345', 'Pepe', 'Chuy', '41182054', '17', 'Calle 1 #3B', '5CM'),
('123456', 'Mago', 'Mar', '15156460', '17', 'Calle E #4A', '5PM'),
('1234567', 'Diego', 'Jiménez', '015631548', '17', 'Calle 2 #6N', '5M'),
('12345678', 'Kazumi', 'Contreras', '019840', '17', 'Calle M #28', '5EM'),
('123456789', 'Montserrat', 'Bt', '0318987', '17', 'Calle 33', '5PV'),
('1510565', 'Mario', 'Kart', '048465', '15', 'Calle 4 #3B', '5CM'),
('203999999', 'Edgar', 'Milián Briones', '418 222 666', '17', 'Camote #6A', '5PV'),
('4840684', 'Omar', 'De las Nieves', '41182054', '16', 'Calle 8 #1B', '5PM'),
('666', 'M', 'A B illar', '418 555 666', '17', 'Cactus #8B', '5PV'),
('98098', 'G', 'Gon', '65464', '18', 'Calle T #2B', '5PV'),
('989840', 'Omar', 'De las Nieves', '41182054', '16', 'Calle 8 #1B', '5PM'),
('9999999', 'Mario', 'Kart', '988978978', '15', 'Calle 4 #3B', '5CM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura`
--

CREATE TABLE `estudiante_asignatura` (
  `num_control` varchar(14) NOT NULL,
  `asignatura` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `semestre` tinyint(4) NOT NULL,
  `calificacion` float NOT NULL,
  `parcial` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante_asignatura`
--

INSERT INTO `estudiante_asignatura` (`num_control`, `asignatura`, `fecha`, `semestre`, `calificacion`, `parcial`) VALUES
('12345', '1011', '2022-10-22', 5, 10, 1),
('12345', '910', '2022-10-22', 5, 10, 1),
('123456789', '1011', '2022-10-22', 5, 10, 1),
('123456789', '910', '2022-10-22', 5, 10, 1),
('666', '1011', '2022-10-22', 5, 10, 1),
('666', '910', '2022-10-22', 5, 10, 1),
('98098', '1011', '2022-10-22', 5, 10, 1),
('98098', '910', '2022-10-22', 5, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(3) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `representante` varchar(60) DEFAULT NULL,
  `tutor` varchar(30) DEFAULT NULL,
  `carrera` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `representante`, `tutor`, `carrera`) VALUES
('5CM', 'Matutino', '', '', 'Contabilidad'),
('5CV', 'Vespertino', '', '', 'Contabilidad'),
('5EM', 'Matutino', '', '', 'Electricidad'),
('5LV', 'Vespertino', '', '', 'Logistica'),
('5M', 'Matutino', '', '', 'Mecanica'),
('5PM', 'Matutino', '', '', 'Programacion'),
('5PV', 'Vespertino', 'Dulce Alejandra', 'Silvia Carrillo Mastache', 'Programación'),
('5RM', 'Matutino', '', '', 'Recursos Humanos'),
('5RV', 'Vespertino', '', '', 'Recursos Humanos'),
('5SM', 'Matutino', '', '', 'Soporte y Mantenimie'),
('5SV', 'Vespertino', '', '', 'Soporte y Mantenimie');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `index_grupo` (`grupo`);

--
-- Indices de la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD PRIMARY KEY (`num_control`,`asignatura`),
  ADD KEY `asignatura` (`asignatura`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `indice_carrera` (`carrera`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `grupo` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`clave`),
  ADD CONSTRAINT `num_control` FOREIGN KEY (`num_control`) REFERENCES `estudiante` (`num_control`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
