-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2025 a las 03:49:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bibloteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_admin` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `primer_apellido` varchar(100) NOT NULL,
  `segundo_apellido` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `usuario` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_admin`, `nombre`, `primer_apellido`, `segundo_apellido`, `correo`, `telefono`, `foto`, `usuario`, `contraseña`, `estado`, `fecha_creacion`) VALUES
(1, 'Jose Angel', 'Alvarez', 'Flores', 'angel.alvarez@gmail.com', '7771230001', NULL, 'jangel', 'pass123', 1, '2025-06-13 18:31:20'),
(2, 'Charbel Alexis', 'Merales', 'Melgar', 'charbel.melgar@hotmail.com', '7771230002', NULL, 'charbelm', 'pass456', 1, '2025-06-13 18:31:20'),
(3, 'Josue Salvador', 'Pantaleon', 'Avila', 'josue.pantaleon@gmail.com', '7771230003', NULL, 'josuepa', 'pass789', 0, '2025-06-13 18:31:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Filosofía'),
(2, 'Tecnología'),
(3, 'Literatura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id_config` int(11) NOT NULL,
  `dias_default_prestamo` int(11) NOT NULL,
  `monto_multa_por_dia` decimal(8,2) NOT NULL,
  `color_primario` varchar(20) NOT NULL,
  `color_secundario` varchar(20) NOT NULL,
  `logo` text NOT NULL,
  `nombre_institucion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id_config`, `dias_default_prestamo`, `monto_multa_por_dia`, `color_primario`, `color_secundario`, `logo`, `nombre_institucion`) VALUES
(1, 7, 2.50, '#112233', '#445566', 'logo_charbel.png', 'Instituto Charbel'),
(2, 10, 1.75, '#223344', '#667788', 'logo_josue.png', 'Centro Josue'),
(3, 14, 3.00, '#334455', '#8899AA', 'logo_miguel.png', 'Biblioteca Miguel Ángel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dashboard_log`
--

CREATE TABLE `dashboard_log` (
  `id_log` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `accion` enum('prestamo','devolucion','multa') NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dashboard_log`
--

INSERT INTO `dashboard_log` (`id_log`, `id_libro`, `id_usuario`, `accion`, `fecha`) VALUES
(4, 1, 1, 'prestamo', '2025-06-13 18:42:46'),
(5, 1, 2, 'devolucion', '2025-06-13 18:42:46'),
(6, 2, 3, 'multa', '2025-06-13 18:42:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `nombre_genero` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `nombre_genero`) VALUES
(1, 'Ensayo'),
(2, 'Poesía'),
(3, 'Ciencia Ficción');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id_libro` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `isbn` varchar(50) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `foto` text NOT NULL,
  `stock_total` int(11) NOT NULL,
  `stock_disponible` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id_libro`, `titulo`, `isbn`, `id_categoria`, `id_genero`, `foto`, `stock_total`, `stock_disponible`, `estado`) VALUES
(1, 'Filosofía Moderna', '978-0-111-11111-1', 1, 1, 'filosofia.jpg', 5, 4, 1),
(2, 'Poesía Mexicana', '978-0-222-22222-2', 2, 2, 'poesia.jpg', 3, 2, 1),
(3, 'Viaje al Futuro', '978-0-333-33333-3', 3, 3, 'cienciaficcion.jpg', 7, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id_prestamo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `dias_prestamo` int(11) NOT NULL,
  `multa_aplicada` decimal(8,2) NOT NULL,
  `estado_prestamo` enum('prestado','devuelto','vencido') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `id_usuario`, `id_libro`, `fecha_prestamo`, `fecha_entrega`, `fecha_devolucion`, `dias_prestamo`, `multa_aplicada`, `estado_prestamo`) VALUES
(4, 1, 1, '2025-06-10', '2025-06-17', NULL, 7, 0.00, 'prestado'),
(5, 2, 2, '2025-06-01', '2025-06-08', '2025-06-09', 7, 2.00, 'devuelto'),
(6, 3, 3, '2025-05-20', '2025-05-27', NULL, 7, 7.00, 'vencido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `superadmin`
--

CREATE TABLE `superadmin` (
  `id_superadmin` int(11) NOT NULL,
  `usuario` varchar(110) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `superadmin`
--

INSERT INTO `superadmin` (`id_superadmin`, `usuario`, `contraseña`) VALUES
(1, 'YahirCL', 'yahirpass'),
(2, 'EmilianoGS', 'emilianopass'),
(3, 'MiguelAA', 'miguelpass');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `primer_apellido` varchar(100) NOT NULL,
  `segundo_apellido` varchar(100) NOT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `primer_apellido`, `segundo_apellido`, `direccion`, `telefono`, `correo`, `foto`, `estado`) VALUES
(1, 'Emiliano', 'Galeana', 'de la Sancha', 'Colonia Las Palmas', '7771231001', 'emiliano.galeana@gmail.com', NULL, 1),
(2, 'Josue Salvador', 'Pantaleon', 'Avila', 'Jardines de Cuernavaca', '7771231002', 'josue.pantaleon@gmail.com', NULL, 1),
(3, 'Miguel Angel', 'Vergara', 'Araizaga', 'Fracc. Mirador', '7771231003', 'miguel.vergara@gmail.com', NULL, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id_config`);

--
-- Indices de la tabla `dashboard_log`
--
ALTER TABLE `dashboard_log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_libro` (`id_libro`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `superadmin`
--
ALTER TABLE `superadmin`
  ADD PRIMARY KEY (`id_superadmin`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id_config` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `dashboard_log`
--
ALTER TABLE `dashboard_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `superadmin`
--
ALTER TABLE `superadmin`
  MODIFY `id_superadmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dashboard_log`
--
ALTER TABLE `dashboard_log`
  ADD CONSTRAINT `dashboard_log_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`),
  ADD CONSTRAINT `dashboard_log_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `prestamo_ibfk_3` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
