-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2023 at 06:35 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestiontareas`
--

-- --------------------------------------------------------

--
-- Table structure for table `asigancion`
--

CREATE TABLE `asigancion` (
  `id_asignacion` int(10) NOT NULL,
  `id_tarea` int(10) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `id_estado` int(10) NOT NULL,
  `fecha_asignacion` date NOT NULL,
  `id_anterior` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asigancion`
--

INSERT INTO `asigancion` (`id_asignacion`, `id_tarea`, `id_usuario`, `id_estado`, `fecha_asignacion`, `id_anterior`) VALUES
(10, 26, 2, 1, '0000-00-00', 0),
(11, 27, 2, 1, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `estados`
--

CREATE TABLE `estados` (
  `id_estado` int(10) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estados`
--

INSERT INTO `estados` (`id_estado`, `estado`) VALUES
(1, 'Pendiente'),
(2, 'En progreso'),
(3, 'Incumplimiento'),
(4, 'Aprobado');

-- --------------------------------------------------------

--
-- Table structure for table `tareas`
--

CREATE TABLE `tareas` (
  `id_tarea` int(10) NOT NULL,
  `titulo` varchar(20) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `fecha_limite` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tareas`
--

INSERT INTO `tareas` (`id_tarea`, `titulo`, `descripcion`, `fecha_limite`) VALUES
(1, 'tarea1', 'hola', '2013-04-09'),
(8, 'tarea1', 'hola', '2023-04-19'),
(11, 'asdasdasd', 'asdasdasdas', '2023-03-29'),
(12, 'hello', 'asdasdasdas', '2023-03-29'),
(13, 'tarea de trabajar', 'asdasdasdas', '2023-03-29'),
(14, 'tarea de trabajar', 'asdasdasdas', '2023-03-29'),
(15, 'tarea de trabajar', 'asdasdasdas', '2023-03-29'),
(16, 'tarea de trabajar', 'asdasdasdas', '2023-03-29'),
(17, 'tarea de trabajar', 'asdasdasdas', '2023-03-29'),
(18, 'tarea de trabajar', 'asdasdasdas', '2023-03-29'),
(19, 'tarea de trabajar', 'asdasdasdas', '2023-03-29'),
(20, 'holaaa', 'hello', '0000-00-00'),
(21, 'holllaaa', 'asdasdasdas', '2023-03-29'),
(22, 'sadsa', 'asdasd', '2023-04-04'),
(23, 'sadsa', 'asdasd', '2023-04-04'),
(24, 'sadsa', 'asdasd', '2023-04-04'),
(25, '', '', '0000-00-00'),
(26, 'create', 'wewew', '2023-04-12'),
(27, 'tarea2', 'hola', '2023-04-05');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `nombre`, `apellido`) VALUES
(1, 'gdgdg323', 'juan', 'vidal'),
(2, 'diana123', 'diana', 'rodriguez'),
(3, 'christian12', 'christian', 'contreras');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asigancion`
--
ALTER TABLE `asigancion`
  ADD PRIMARY KEY (`id_asignacion`),
  ADD KEY `conec` (`id_usuario`,`id_tarea`,`id_estado`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_tarea` (`id_tarea`);

--
-- Indexes for table `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indexes for table `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id_tarea`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asigancion`
--
ALTER TABLE `asigancion`
  MODIFY `id_asignacion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id_tarea` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asigancion`
--
ALTER TABLE `asigancion`
  ADD CONSTRAINT `asigancion_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`),
  ADD CONSTRAINT `asigancion_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `asigancion_ibfk_3` FOREIGN KEY (`id_tarea`) REFERENCES `tareas` (`id_tarea`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
