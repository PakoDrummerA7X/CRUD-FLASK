-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-11-2020 a las 06:51:27
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `flaskcontacts`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `contacts`
--

INSERT INTO `contacts` (`id`, `fullname`, `phone`, `email`) VALUES
(1, 'pako lopez', '866 186 1420', 'pakodw29@gmail.com'),
(2, 'pako lopez de los santos', '866 294 2847', 'pako29@gmail.com'),
(6, 'italo', '866 204 2847', 'ItaloCobas@gmail.com'),
(7, 'Joab ', '866 123 395', 'joab@gmail.com'),
(8, 'jose', '866 123 1234', 'pepe@gmail.com'),
(9, 'ex', '866 395 2947', 'ex@gmail.com'),
(10, 'otro', '866 333 5555', 'otro@gmail.com'),
(17, '1', '1', '1'),
(18, 'z', 'z', 'z'),
(22, 'A', 'x', 'x@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `passwd` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idUser`, `nombre`, `username`, `passwd`) VALUES
(1, '2', '2', '$2b$12$FN6F447ejpsejCkMi1UH2OzyaMhUKMfywPH1qWrRAREij72ZwlZga'),
(2, 'Juan Francisco', 'PakoDrumer', '$2b$12$T.fU7dIc0d7R.U/DxbOGWetIYkWCozG2ry1JFVeyaDGjAOwQRGxkC'),
(3, 'paco ', 'pako', '$2b$12$bJfYBpd96lt.Y83CCaDwv.RM9ZH1oQCzHHsAGZyCxVPa5Ux/iMmY2'),
(4, 'jose', 'pepe', '$2b$12$MNKZy8FeuffEQsO.ehOReeTbN8D62fuMz1HAzWmdHTF7F6ImiU6dC'),
(5, 'jose', 'jose', '$2b$12$MJTUQ/XO2wqNjZKO6Y1Fre9R0yzI2xlDO16C/2Y3ufMgTtPp7nvCa'),
(6, 'juan', 'juan', '$2b$12$R13DgkH6b3XYTRNROAhlxu/wVm6nKJNLLE9Yyt1Ov4/p5WUE3BTrS');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
