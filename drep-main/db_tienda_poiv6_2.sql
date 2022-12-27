-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2022 a las 14:25:45
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tienda_poiv6_2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_estrategica`
--

CREATE TABLE `acc_estrategica` (
  `idAccEstr` int(11) NOT NULL,
  `AccionEstr` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `CodigoAEI` varchar(10) COLLATE utf8mb4_swedish_ci NOT NULL,
  `indicadorAEI` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `acc_estrategica`
--

INSERT INTO `acc_estrategica` (`idAccEstr`, `AccionEstr`, `CodigoAEI`, `indicadorAEI`) VALUES
(1, 'SERVICIO DE SEGURIDAD OPORTUNA, INTEGRAL Y DE CALUDAD A LA POBLACION', 'AE05.01', 'DOCENTES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `codActividad` int(11) NOT NULL,
  `nombreActividad` varchar(500) COLLATE utf8mb4_swedish_ci NOT NULL,
  `unidadMedida` int(11) NOT NULL,
  `prioridad` varchar(10) COLLATE utf8mb4_swedish_ci NOT NULL,
  `metaMes` varchar(15) COLLATE utf8mb4_swedish_ci NOT NULL,
  `cuadro_necesidades_idNecesidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` bigint(20) NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro_costo`
--

CREATE TABLE `centro_costo` (
  `idCentroCosto` int(11) NOT NULL,
  `NomCentroCosto` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `centro_costo`
--

INSERT INTO `centro_costo` (`idCentroCosto`, `NomCentroCosto`) VALUES
(2, 'Educacion Inicial'),
(3, 'Educacion Primaria'),
(4, 'Educacion Secundaria Comunicacion'),
(5, 'Educaion Secundaria Comunicacion'),
(1, 'Gestion Pedagogica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuadro_necesidades`
--

CREATE TABLE `cuadro_necesidades` (
  `idNecesidad` int(11) NOT NULL,
  `codItem` int(11) NOT NULL,
  `BienServicio` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `UnidadUso` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL,
  `PrecioUnitario` int(11) NOT NULL,
  `EspecificaGasto` varchar(20) COLLATE utf8mb4_swedish_ci NOT NULL,
  `gastoMES` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` bigint(20) NOT NULL,
  `pedidoid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `id` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `CodInsumo` int(11) NOT NULL,
  `CatProducto` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL,
  `DesProducto` varchar(500) COLLATE utf8mb4_swedish_ci NOT NULL,
  `UnidadMed` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `costoUnitario` varchar(10) COLLATE utf8mb4_swedish_ci NOT NULL,
  `EspGasto` varchar(15) COLLATE utf8mb4_swedish_ci NOT NULL,
  `cuadro_necesidades_idNecesidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `idmodulo` bigint(20) NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`idmodulo`, `titulo`, `descripcion`, `status`) VALUES
(1, 'Dashboard', 'Dashboard', 1),
(2, 'Usuarios', 'Usuarios del sistema', 1),
(3, 'Clientes', 'Clientes de tienda', 1),
(4, 'Ficha_POI', 'productos de ceplan', 1),
(5, 'Pedidos', 'Pedidos', 1),
(6, 'Caterogías', 'Caterogías Productos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obj_estrategico`
--

CREATE TABLE `obj_estrategico` (
  `idObjEstr` int(11) NOT NULL,
  `NomObjEstr` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `CodOE` varchar(10) COLLATE utf8mb4_swedish_ci NOT NULL,
  `indicadorOEI` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `obj_estrategico`
--

INSERT INTO `obj_estrategico` (`idObjEstr`, `NomObjEstr`, `CodOE`, `indicadorOEI`) VALUES
(1, 'MEJORAR LO NIVELES DE LOGRO DE APRENDIZAJE EN LOS ESTUDAINTES DE EDUCACION ', '0E05', 'Estudiantes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idpedido` bigint(20) NOT NULL,
  `personaid` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `monto` decimal(11,2) NOT NULL,
  `tipopagoid` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idpermiso` bigint(20) NOT NULL,
  `rolid` bigint(20) NOT NULL,
  `moduloid` bigint(20) NOT NULL,
  `r` int(11) NOT NULL DEFAULT 0,
  `w` int(11) NOT NULL DEFAULT 0,
  `u` int(11) NOT NULL DEFAULT 0,
  `d` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `rolid`, `moduloid`, `r`, `w`, `u`, `d`) VALUES
(230, 2, 1, 1, 0, 0, 0),
(231, 2, 2, 0, 0, 0, 0),
(232, 2, 3, 0, 0, 0, 0),
(233, 2, 4, 0, 0, 0, 0),
(234, 2, 5, 0, 0, 0, 0),
(235, 2, 6, 0, 0, 0, 0),
(320, 7, 1, 1, 0, 0, 0),
(321, 7, 2, 0, 0, 0, 0),
(322, 7, 3, 0, 0, 0, 0),
(323, 7, 4, 1, 0, 0, 0),
(324, 7, 5, 0, 0, 0, 0),
(325, 7, 6, 0, 0, 0, 0),
(338, 1, 1, 1, 1, 1, 1),
(339, 1, 2, 1, 1, 1, 1),
(340, 1, 3, 1, 1, 1, 1),
(341, 1, 4, 1, 1, 1, 1),
(342, 1, 5, 1, 1, 1, 1),
(343, 1, 6, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` bigint(20) NOT NULL,
  `identificacion` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nombres` varchar(80) COLLATE utf8mb4_swedish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `email_user` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` varchar(75) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nit` varchar(20) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nombrefiscal` varchar(80) COLLATE utf8mb4_swedish_ci NOT NULL,
  `direccionfiscal` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `rolid` bigint(20) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1,
  `area` varchar(25) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `nit`, `nombrefiscal`, `direccionfiscal`, `token`, `rolid`, `datecreated`, `status`, `area`) VALUES
(1, '71052981', 'Joel Santos', 'Gomez Alanoca', 9857452871, 'ioelgomez2019@gmail.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '24252622', 'Joel sga', 'peru lima', '6f15c99cc5b3a8778122-3335597e1301b85c9b15-6087b73cc787a8719d71-49708807a79dcf28ad32', 1, '2020-08-13 00:51:44', 1, 'DGI'),
(2, '7865421565', 'Carlos', 'Hernández', 789465487, 'carlos@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '2c52a34f7988a0afc63e-dfe4badca8d2cb2b93e6-94824d050567a0ccd851-56165c5603c4ca020', 1, '2020-08-13 00:54:08', 1, ''),
(3, '879846545454', 'Pablo', 'Arana', 784858856, 'pablo@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 3, '2020-08-14 01:42:34', 0, ''),
(4, '65465465', 'Jorge David', 'Arana', 987846545, 'jorge@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 1, '2020-08-22 00:27:17', 1, ''),
(5, '4654654', 'Carme', 'Arana', 646545645, 'carmen@infom.com', 'be63ad947e82808780278e044bcd0267a6ac6b3cd1abdb107cc10b445a182eb0', '', '', '', '', 1, '2020-08-22 00:35:04', 1, ''),
(6, '8465484', 'Alex Fernando', 'Méndez', 222222222, 'alex@info.com', '608cfa9ffc1dac43e8710cb23bbcf1d5215beee7ca8632c6a4a5a63a56f59aeb', '', '', '', '', 7, '2020-08-22 00:48:50', 0, ''),
(7, '54684987', 'Francisco', 'Herrera', 6654456545, 'francisco@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', 2, '2020-08-22 01:55:57', 1, ''),
(8, '54646849844', 'Axel Gudiel', 'Vela', 654687454, 'axel@info.com', '993fdea29acd1f7c6a6423c038601b175bb282382fc85b306a85f134fff4a63e', '', '', '', '', 3, '2020-09-07 01:30:52', 1, ''),
(9, '46548454', 'Alan', 'Arenales', 45687954, 'alan@info.com', 'dc4e32154482eff8c1a2061374a0fc2ca40fbf9b893197e949c79be535b06b23', 'CF', 'Alan', 'Ciudad', '', 7, '2020-10-11 01:30:23', 1, ''),
(10, '46545678', 'Marta', 'Cardona', 78548578, 'marta@info.com', '959b633150ca56bdbe8eefb0b510d720ec00714fc3f6160832dd2ae0c0a0611b', 'CF', 'Marta', 'peru', '', 7, '2020-10-11 01:43:30', 1, ''),
(11, '54789656458', 'Joel Eduardo', 'Cabrera', 54124528, 'joel@joel.com', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', 'CF', 'Joel Eduardo', 'peru', '', 7, '2020-10-11 01:44:30', 1, ''),
(12, '56874657', 'IOEL', 'IGOMEZ IALANOCA', 98776543, 'gomez@gmail.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'CF', 'Pablo', 'peru', '', 7, '2020-10-11 01:59:45', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` bigint(20) NOT NULL,
  `categoriaid` bigint(20) NOT NULL,
  `codigo` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registropoi`
--

CREATE TABLE `registropoi` (
  `IDregistro` int(11) NOT NULL,
  `centroCosto` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `objEstrInst` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `codigoOE` varchar(10) COLLATE utf8mb4_swedish_ci NOT NULL,
  `indicadorOE` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `unidMedidaOE` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `metaOE` int(11) NOT NULL,
  `accEstrInst` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `codigoAE` varchar(10) COLLATE utf8mb4_swedish_ci NOT NULL,
  `indicadorAE` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `unidMedidaAE` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `metaAE` int(11) NOT NULL,
  `centro_costo_idCentroCosto` int(11) NOT NULL,
  `obj_estrategico_idObjEstr` int(11) NOT NULL,
  `acc_estrategica_idAccEstr` int(11) NOT NULL,
  `actividad_codActividad` int(11) NOT NULL,
  `persona_idpersona` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_gastos`
--

CREATE TABLE `registro_gastos` (
  `idactividad_curso` int(11) NOT NULL,
  `RegBienServicio` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `UnidadUso` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `RegPrecioUnitario` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `RegTotal` varchar(45) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `cuadro_necesidades_idNecesidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` bigint(20) NOT NULL,
  `nombrerol` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombrerol`, `descripcion`, `status`) VALUES
(1, 'Administrador', 'Acceso a todo el sistema', 1),
(2, 'Supervisor', 'Supervisor', 1),
(3, 'Secretaria', 'Secretaria de las areas', 1),
(4, 'Servicio al cliente', 'Servicio al cliente sistema', 0),
(5, 'Bodega', 'Bodega', 0),
(6, 'Resporteria', 'Resporteria Sistema', 0),
(7, 'Usuario', 'Usuarios', 1),
(8, 'Ejemplo rol', 'Ejemplo rol sitema', 0),
(9, 'Coordinador', 'Coordinador', 0),
(10, 'Consulta Ventas', 'Consulta Ventas', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acc_estrategica`
--
ALTER TABLE `acc_estrategica`
  ADD PRIMARY KEY (`idAccEstr`);

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`codActividad`),
  ADD KEY `fk_actividad_cuadro_necesidades1_idx` (`cuadro_necesidades_idNecesidad`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `centro_costo`
--
ALTER TABLE `centro_costo`
  ADD PRIMARY KEY (`idCentroCosto`),
  ADD UNIQUE KEY `NomCentroCosto` (`NomCentroCosto`);

--
-- Indices de la tabla `cuadro_necesidades`
--
ALTER TABLE `cuadro_necesidades`
  ADD PRIMARY KEY (`idNecesidad`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidoid` (`pedidoid`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`CodInsumo`),
  ADD UNIQUE KEY `EspGasto` (`EspGasto`),
  ADD KEY `fk_insumos_cuadro_necesidades1_idx` (`cuadro_necesidades_idNecesidad`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`idmodulo`);

--
-- Indices de la tabla `obj_estrategico`
--
ALTER TABLE `obj_estrategico`
  ADD PRIMARY KEY (`idObjEstr`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idpedido`),
  ADD KEY `personaid` (`personaid`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermiso`),
  ADD KEY `rolid` (`rolid`),
  ADD KEY `moduloid` (`moduloid`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`),
  ADD KEY `rolid` (`rolid`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `categoriaid` (`categoriaid`);

--
-- Indices de la tabla `registropoi`
--
ALTER TABLE `registropoi`
  ADD PRIMARY KEY (`IDregistro`,`persona_idpersona`),
  ADD UNIQUE KEY `centroCosto` (`centroCosto`),
  ADD KEY `fk_registropoi_centro_costo1_idx` (`centro_costo_idCentroCosto`),
  ADD KEY `fk_registropoi_obj_estrategico1_idx` (`obj_estrategico_idObjEstr`),
  ADD KEY `fk_registropoi_acc_estrategica1_idx` (`acc_estrategica_idAccEstr`),
  ADD KEY `fk_registropoi_actividad1_idx` (`actividad_codActividad`),
  ADD KEY `fk_registropoi_persona1_idx` (`persona_idpersona`);

--
-- Indices de la tabla `registro_gastos`
--
ALTER TABLE `registro_gastos`
  ADD PRIMARY KEY (`idactividad_curso`,`cuadro_necesidades_idNecesidad`),
  ADD KEY `fk_Registro_gastos_cuadro_necesidades1_idx` (`cuadro_necesidades_idNecesidad`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acc_estrategica`
--
ALTER TABLE `acc_estrategica`
  MODIFY `idAccEstr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `codActividad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `centro_costo`
--
ALTER TABLE `centro_costo`
  MODIFY `idCentroCosto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cuadro_necesidades`
--
ALTER TABLE `cuadro_necesidades`
  MODIFY `idNecesidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `CodInsumo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `idmodulo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `obj_estrategico`
--
ALTER TABLE `obj_estrategico`
  MODIFY `idObjEstr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idpedido` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermiso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registropoi`
--
ALTER TABLE `registropoi`
  MODIFY `IDregistro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `fk_actividad_cuadro_necesidades1` FOREIGN KEY (`cuadro_necesidades_idNecesidad`) REFERENCES `cuadro_necesidades` (`idNecesidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedidoid`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD CONSTRAINT `fk_insumos_cuadro_necesidades1` FOREIGN KEY (`cuadro_necesidades_idNecesidad`) REFERENCES `cuadro_necesidades` (`idNecesidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoriaid`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registropoi`
--
ALTER TABLE `registropoi`
  ADD CONSTRAINT `fk_registropoi_acc_estrategica1` FOREIGN KEY (`acc_estrategica_idAccEstr`) REFERENCES `acc_estrategica` (`idAccEstr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registropoi_actividad1` FOREIGN KEY (`actividad_codActividad`) REFERENCES `actividad` (`codActividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registropoi_centro_costo1` FOREIGN KEY (`centro_costo_idCentroCosto`) REFERENCES `centro_costo` (`idCentroCosto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registropoi_obj_estrategico1` FOREIGN KEY (`obj_estrategico_idObjEstr`) REFERENCES `obj_estrategico` (`idObjEstr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registropoi_persona1` FOREIGN KEY (`persona_idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registro_gastos`
--
ALTER TABLE `registro_gastos`
  ADD CONSTRAINT `fk_Registro_gastos_cuadro_necesidades1` FOREIGN KEY (`cuadro_necesidades_idNecesidad`) REFERENCES `cuadro_necesidades` (`idNecesidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
