-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-10-2020 a las 22:08:20
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `adonai`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calles`
--

CREATE TABLE `calles` (
  `CAL_CODIGOCALLE` int(10) NOT NULL,
  `CAL_NOMBRECALLE` varchar(30) DEFAULT NULL,
  `CAL_CODIGOLOCALIDAD` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `folios`
--

CREATE TABLE `folios` (
  `FOL_CODFOLIO` int(10) NOT NULL,
  `FOL_NUMERO` int(10) DEFAULT NULL,
  `FOL_CODLIBRO` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `LIB_CODLIBRO` int(10) NOT NULL,
  `LIB_NUMERO` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `LOC_CODIGOLOCALIDAD` int(10) NOT NULL,
  `LOC_NOMBRELOCALIDAD` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `NOT_CODNOTA` int(18) NOT NULL,
  `NOT_FOTO` blob DEFAULT NULL,
  `NOT_CODPERSONA` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `PER_CODPERSONA` int(10) NOT NULL,
  `PER_NOMBRE` varchar(50) DEFAULT NULL,
  `PER_APELLIDO` varchar(50) DEFAULT NULL,
  `PER_DNI` varchar(10) DEFAULT NULL,
  `PER_FECHANAC` datetime DEFAULT NULL,
  `PER_TELEFONO` varchar(20) DEFAULT NULL,
  `PER_CODFOLIO` int(10) DEFAULT NULL,
  `PER_CODLIBRO` int(10) DEFAULT NULL,
  `PER_CONSAGRADO` tinyint(1) DEFAULT NULL,
  `PER_ALTURA` int(10) DEFAULT NULL,
  `PER_NACIONALIDAD` varchar(40) DEFAULT NULL,
  `PER_HABILITADO` tinyint(1) DEFAULT NULL,
  `PER_SEXO` varchar(10) DEFAULT NULL,
  `PER_CODIGOCALLE` int(10) DEFAULT NULL,
  `PER_CODIGOLOCALIDAD` int(10) DEFAULT NULL,
  `PER_CODLOCNAC` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`PER_CODPERSONA`, `PER_NOMBRE`, `PER_APELLIDO`, `PER_DNI`, `PER_FECHANAC`, `PER_TELEFONO`, `PER_CODFOLIO`, `PER_CODLIBRO`, `PER_CONSAGRADO`, `PER_ALTURA`, `PER_NACIONALIDAD`, `PER_HABILITADO`, `PER_SEXO`, `PER_CODIGOCALLE`, `PER_CODIGOLOCALIDAD`, `PER_CODLOCNAC`) VALUES
(1, 'FEDERICO', 'BLANCO CAVALLERO', '43732713', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ROL_CODROL` int(2) NOT NULL,
  `ROL_DESCRIPCION` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sacramentos`
--

CREATE TABLE `sacramentos` (
  `SAC_CODSACRAMENTO` int(10) NOT NULL,
  `SAC_DESCRIPCION` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sacramentos_personas`
--

CREATE TABLE `sacramentos_personas` (
  `S_P_CODSACRAMENTO` int(10) NOT NULL,
  `S_P_FECHA` datetime DEFAULT NULL,
  `S_P_CODTEMPLO` int(10) DEFAULT NULL,
  `S_P_ORDEN` int(10) NOT NULL,
  `S_P_PRINCIPAL` int(10) DEFAULT NULL,
  `S_P_MADRE` int(10) DEFAULT NULL,
  `S_P_PADRE` int(10) DEFAULT NULL,
  `S_P_PADRINO` int(10) DEFAULT NULL,
  `S_P_MADRINA` int(10) DEFAULT NULL,
  `S_P_SACERDOTE` int(10) DEFAULT NULL,
  `S_P_ESPOSA` int(10) DEFAULT NULL,
  `S_P_ESPOSO` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `templos`
--

CREATE TABLE `templos` (
  `TEM_CODTEMPLO` int(10) NOT NULL,
  `TEM_NOMBRETEMPLO` varchar(70) DEFAULT NULL,
  `TEM_ALTURA` int(10) DEFAULT NULL,
  `TEM_DIOCESIS` varchar(40) DEFAULT NULL,
  `TEM_CODIGOCALLE` int(10) DEFAULT NULL,
  `TEM_CODIGOLOCALIDAD` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `USU_CODUSUARIO` int(10) NOT NULL,
  `USU_NICKNAME` varchar(50) DEFAULT NULL,
  `USU_CONTRASENA` varchar(50) DEFAULT NULL,
  `USU_CODPERSONA` int(10) DEFAULT NULL,
  `USU_CODROL` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calles`
--
ALTER TABLE `calles`
  ADD PRIMARY KEY (`CAL_CODIGOCALLE`,`CAL_CODIGOLOCALIDAD`),
  ADD UNIQUE KEY `XPKCALLES` (`CAL_CODIGOCALLE`,`CAL_CODIGOLOCALIDAD`),
  ADD KEY `XIF1CALLES` (`CAL_CODIGOLOCALIDAD`);

--
-- Indices de la tabla `folios`
--
ALTER TABLE `folios`
  ADD PRIMARY KEY (`FOL_CODLIBRO`,`FOL_CODFOLIO`),
  ADD UNIQUE KEY `XPKFOLIOS` (`FOL_CODLIBRO`,`FOL_CODFOLIO`),
  ADD KEY `XIF1FOLIOS` (`FOL_CODLIBRO`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`LIB_CODLIBRO`),
  ADD UNIQUE KEY `XPKLIBROS` (`LIB_CODLIBRO`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`LOC_CODIGOLOCALIDAD`),
  ADD UNIQUE KEY `XPKLOCALIDADES` (`LOC_CODIGOLOCALIDAD`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`NOT_CODPERSONA`,`NOT_CODNOTA`),
  ADD UNIQUE KEY `XPKNOTAS` (`NOT_CODPERSONA`,`NOT_CODNOTA`),
  ADD KEY `XIF1NOTAS` (`NOT_CODPERSONA`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`PER_CODPERSONA`),
  ADD UNIQUE KEY `XPKPERSONAS` (`PER_CODPERSONA`),
  ADD KEY `XIF4PERSONAS` (`PER_CODFOLIO`,`PER_CODLIBRO`),
  ADD KEY `XIF5PERSONAS` (`PER_CODIGOCALLE`,`PER_CODIGOLOCALIDAD`),
  ADD KEY `XIF6PERSONAS` (`PER_CODLOCNAC`),
  ADD KEY `FOLIOS_PERSONAS` (`PER_CODLIBRO`,`PER_CODFOLIO`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ROL_CODROL`),
  ADD UNIQUE KEY `XPKROLES` (`ROL_CODROL`);

--
-- Indices de la tabla `sacramentos`
--
ALTER TABLE `sacramentos`
  ADD PRIMARY KEY (`SAC_CODSACRAMENTO`),
  ADD UNIQUE KEY `XPKSACRAMENTOS` (`SAC_CODSACRAMENTO`);

--
-- Indices de la tabla `sacramentos_personas`
--
ALTER TABLE `sacramentos_personas`
  ADD PRIMARY KEY (`S_P_CODSACRAMENTO`,`S_P_ORDEN`),
  ADD UNIQUE KEY `XPKSACRAMENTOS_PERSONAS` (`S_P_CODSACRAMENTO`,`S_P_ORDEN`),
  ADD KEY `XIF1SACRAMENTOS_PERSONAS` (`S_P_CODSACRAMENTO`),
  ADD KEY `XIF8SACRAMENTOS_PERSONAS` (`S_P_CODTEMPLO`),
  ADD KEY `XIF9SACRAMENTOS_PERSONAS` (`S_P_PRINCIPAL`),
  ADD KEY `XIF11SACRAMENTOS_PERSONAS` (`S_P_MADRE`),
  ADD KEY `XIF12SACRAMENTOS_PERSONAS` (`S_P_PADRE`),
  ADD KEY `XIF13SACRAMENTOS_PERSONAS` (`S_P_PADRINO`),
  ADD KEY `XIF14SACRAMENTOS_PERSONAS` (`S_P_MADRINA`),
  ADD KEY `XIF15SACRAMENTOS_PERSONAS` (`S_P_SACERDOTE`),
  ADD KEY `XIF17SACRAMENTOS_PERSONAS` (`S_P_ESPOSA`),
  ADD KEY `XIF19SACRAMENTOS_PERSONAS` (`S_P_ESPOSO`);

--
-- Indices de la tabla `templos`
--
ALTER TABLE `templos`
  ADD PRIMARY KEY (`TEM_CODTEMPLO`),
  ADD UNIQUE KEY `XPKTEMPLOS` (`TEM_CODTEMPLO`),
  ADD KEY `XIF1TEMPLOS` (`TEM_CODIGOCALLE`,`TEM_CODIGOLOCALIDAD`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`USU_CODUSUARIO`),
  ADD UNIQUE KEY `XPKUSUARIOS` (`USU_CODUSUARIO`),
  ADD KEY `XIF1USUARIOS` (`USU_CODPERSONA`),
  ADD KEY `XIF2USUARIOS` (`USU_CODROL`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calles`
--
ALTER TABLE `calles`
  ADD CONSTRAINT `R_63` FOREIGN KEY (`CAL_CODIGOLOCALIDAD`) REFERENCES `localidades` (`LOC_CODIGOLOCALIDAD`);

--
-- Filtros para la tabla `folios`
--
ALTER TABLE `folios`
  ADD CONSTRAINT `LIBROS_FOLIOS` FOREIGN KEY (`FOL_CODLIBRO`) REFERENCES `libros` (`LIB_CODLIBRO`);

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `R_68` FOREIGN KEY (`NOT_CODPERSONA`) REFERENCES `personas` (`PER_CODPERSONA`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `FOLIOS_PERSONAS` FOREIGN KEY (`PER_CODLIBRO`,`PER_CODFOLIO`) REFERENCES `folios` (`FOL_CODLIBRO`, `FOL_CODFOLIO`),
  ADD CONSTRAINT `R_64` FOREIGN KEY (`PER_CODIGOCALLE`,`PER_CODIGOLOCALIDAD`) REFERENCES `calles` (`CAL_CODIGOCALLE`, `CAL_CODIGOLOCALIDAD`),
  ADD CONSTRAINT `R_65` FOREIGN KEY (`PER_CODLOCNAC`) REFERENCES `localidades` (`LOC_CODIGOLOCALIDAD`);

--
-- Filtros para la tabla `sacramentos_personas`
--
ALTER TABLE `sacramentos_personas`
  ADD CONSTRAINT `R_50` FOREIGN KEY (`S_P_PRINCIPAL`) REFERENCES `personas` (`PER_CODPERSONA`),
  ADD CONSTRAINT `R_53` FOREIGN KEY (`S_P_MADRE`) REFERENCES `personas` (`PER_CODPERSONA`),
  ADD CONSTRAINT `R_54` FOREIGN KEY (`S_P_PADRE`) REFERENCES `personas` (`PER_CODPERSONA`),
  ADD CONSTRAINT `R_55` FOREIGN KEY (`S_P_PADRINO`) REFERENCES `personas` (`PER_CODPERSONA`),
  ADD CONSTRAINT `R_56` FOREIGN KEY (`S_P_MADRINA`) REFERENCES `personas` (`PER_CODPERSONA`),
  ADD CONSTRAINT `R_57` FOREIGN KEY (`S_P_SACERDOTE`) REFERENCES `personas` (`PER_CODPERSONA`),
  ADD CONSTRAINT `R_59` FOREIGN KEY (`S_P_ESPOSA`) REFERENCES `personas` (`PER_CODPERSONA`),
  ADD CONSTRAINT `R_61` FOREIGN KEY (`S_P_ESPOSO`) REFERENCES `personas` (`PER_CODPERSONA`),
  ADD CONSTRAINT `SACRAMENTOS_SACRAMENTOS_PERSONAS` FOREIGN KEY (`S_P_CODSACRAMENTO`) REFERENCES `sacramentos` (`SAC_CODSACRAMENTO`),
  ADD CONSTRAINT `TEMPLOS_SACRAMENTOS_PERSONAS` FOREIGN KEY (`S_P_CODTEMPLO`) REFERENCES `templos` (`TEM_CODTEMPLO`);

--
-- Filtros para la tabla `templos`
--
ALTER TABLE `templos`
  ADD CONSTRAINT `R_67` FOREIGN KEY (`TEM_CODIGOCALLE`,`TEM_CODIGOLOCALIDAD`) REFERENCES `calles` (`CAL_CODIGOCALLE`, `CAL_CODIGOLOCALIDAD`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `PERSONAS_USUARIOS` FOREIGN KEY (`USU_CODPERSONA`) REFERENCES `personas` (`PER_CODPERSONA`),
  ADD CONSTRAINT `ROLES_USUARIOS` FOREIGN KEY (`USU_CODROL`) REFERENCES `roles` (`ROL_CODROL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
