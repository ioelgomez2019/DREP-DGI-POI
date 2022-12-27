-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2022 a las 16:16:54
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tienda_v6`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obj_estrategico`
--

CREATE TABLE `obj_estrategico` (
  `idobjestr` int(11) NOT NULL,
  `nomobjestr` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `codoe` varchar(10) COLLATE utf8mb4_swedish_ci NOT NULL,
  `indicadoroe` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `unidadoe` varchar(45) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `obj_estrategico`
--

INSERT INTO `obj_estrategico` (`idobjestr`, `nomobjestr`, `codoe`, `indicadoroe`, `unidadoe`, `status`) VALUES
(1, 'MEJORAR LO NIVELES DE LOGRO DE APRENDIZAJE EN LOS ESTUDAINTES DE EDUCACION', 'OEI.05', 'Estudiantes', 'Estudiantes', 1),
(2, 'Asegurar el empoderamiento sobre los\r\nderechos y obligaciones de ciudadanas y\r\nciudadanos', 'OEI.01', 'Cuidadanos', 'Docentes', 1),
(3, 'Promover la creación, la protección y la\r\ndefensa de la propiedad intelectual, a\r\nfavor de personas naturales y jurídicas\r\n', 'OEI.02', 'Ciudadanos', 'Docentes', 1),
(4, 'Mejorar la eficiencia de los mercados en\r\nbeneficio de los Agentes Económicos\r\n', 'OEI.03', 'ciudadano', 'Docentes', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `obj_estrategico`
--
ALTER TABLE `obj_estrategico`
  ADD PRIMARY KEY (`idobjestr`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `obj_estrategico`
--
ALTER TABLE `obj_estrategico`
  MODIFY `idobjestr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
