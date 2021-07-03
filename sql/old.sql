-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 20, 2021 at 02:14 AM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `6sbfehBxi9`
--

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` int(10) NOT NULL,
  `name` varchar(90) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `course_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chapters`
--

INSERT INTO `chapters` (`id`, `name`, `course_id`) VALUES
(1, 'Capítulo 1: Introducción', 1),
(2, 'Capítulo 2: Conceptos Fundamentales', 1),
(3, 'Capítulo 3: Conceptos avanzados', 1),
(4, 'Capítulo 4: Anteproytecto', 1),
(5, 'Capítulo 5: Gestión del Alcance', 1),
(6, 'Capítulo 6: Recopilación de requisitos', 1),
(7, 'Capítulo 7: Como crear la EDT', 1),
(8, 'Capítulo 8: Linea Base del Alcance', 1),
(9, 'Capítulo 9: Gestion de la comunicación', 1),
(10, 'Capítulo 10: Actividades de los grupos de Procesos', 1),
(11, 'Capítulo 11: Video de Preguntas', 1),
(12, 'Capítulo 1: Marcos Agiles', 2),
(13, 'Capítulo 2: Scrum', 2),
(14, 'Capítulo 3: Roles en Scrum', 2),
(15, 'Capítulo 4: Elementos SCRUM', 2),
(16, 'Capítulo 5: Desarrollo SCRUM', 2);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) NOT NULL,
  `name` varchar(90) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`) VALUES
(1, 'PMP'),
(2, 'SCRUM');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` int(10) NOT NULL,
  `name` varchar(90) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `chapter_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `name`, `link`, `chapter_id`) VALUES
(1, 'Lección 1: Presentanción', 'Cap%201%20Lecci%C3%B3n%201%20(Aura)Version2.mp4', 1),
(2, 'Lección 2: Concepto proyecto', 'Cap%201%20Lecc%202%20El%20Proyecto.mp4', 1),
(3, 'Lección 3: Direccion de Proyectos Parte 1', 'Cap%201%20Lec%203.mp4', 1),
(4, 'Lección 4: Direccion de Proyectos Parte 2', 'lecci%C3%B3n%204%20Direcci%C3%B3n%20de%20proyectos%202.mp4', 1),
(5, 'Lección 5: Resumen', 'Cap%201%20Leec%205.%20Resumen%201..mp4', 1),
(6, 'Lección 1: Programas', 'Cap 2 Lecc 1 Programas.mp4', 2),
(7, 'Lección 2: Portafolio', 'Cap 2 Lecc 2 Portafolios.mp4', 2),
(8, 'Lección 3: OPM3 - PMO', 'Cap 2 lecc 3 OPM3-PMO.mp4', 2),
(9, 'Lección 4: Resumen', 'Cap 2 Leec 4. Resumen 2..mp4', 2),
(10, 'Lección 1: Estructura Organizacional', 'CAP 3 LECC 1 Estructura organizacional.mp4', 3),
(11, 'Lección 2: Ciclo de vida del proyecto', 'Cap 3 Lecc 2 Ciclos del proyecto.mp4', 3),
(12, 'Lección 3: Competencias del director de proyecto -Parte 1', 'Cap 3 Lecc 3 Competencias del director de proyecto Parte 1.mp4', 3),
(13, 'Lección 4: Competencias del director de proyecto -Parte 2', 'Cap 3 Lecc  4  Competencias del director de proyecto Parte 2.mp4', 3),
(14, 'Lección 5: Interesados del Proyecto', 'Cap 3 Lecc 5 Interesados del proyecto.mp4', 3),
(15, 'Lección 6: Registro de interesados', 'Cap 3 Lecc 5 Interesados del proyecto.mp4', 3),
(16, 'Lección 1: Definición de anteproyecto', 'Cap 4 Lecc 1 Definicion de ante proyecto.mp4', 4),
(17, 'Lección 2: Importancia del anteproyecto', 'Cap 4 Lecc 3 Plan de gestion de beneficios.mp4', 4),
(18, 'Lección 3: Plan de gestion de beneficios', 'Cap 4 Lecc 3 Plan de gestion de beneficios.mp4', 4),
(19, 'Lección 1: Gestión del alcance -Parte 1 ', 'Cap 5 Lecc 1 Gestion del alcance Parte 1.mp4', 5),
(20, 'Lección 2: Gestión del alcance -Parte 2 ', 'Cap5Lecc2.mp4', 5),
(21, 'Lección 3: Estructura de desglose del Trabajo EDT', 'Cap 5 lecc 3 Estructura de desglose del trabajo.mp4', 5),
(22, 'Lección 4: Gestión del alcance -Parte 3 ', '', 5),
(23, 'Lección 5: Planificar la gestión del alcance', '', 5),
(24, 'Lección 1: Recopilación de requisitos -Parte 1', 'Cap 6 Lecc 1 Recopilacion de requisitos Parte 1.mp4', 6),
(25, 'Lección 2: Recopilación de requisitos -Parte 2', 'Cap 6 Lecc 2 Recopilacion de requisitos Parte 2.mp4', 6),
(26, 'Lección 1: Importancia de la EDT', 'Cap 7 Lecc 1 Importancia de la EDT.mp4', 7),
(27, 'Lección 2: Como crear la EDT -Parte 1 ', 'Cap 7 Lecc 2 Como crear la EDT..mp4', 7),
(28, 'Lección 3: Como crear la EDT -Parte 2 ', 'Cap 7 Lecc 3 Desglose de la EDT..mp4', 7),
(29, 'Lección 4: Como crear la EDT -Parte 3 ', 'Cap 7 Lecc 4 Puntos a tener en cuenta para crear la EDT.mp4', 7),
(30, 'Lección 5: Como crear la EDT -Parte 4', 'Cap 7 Lecc  5 Puntos finales EDT..mp4', 7),
(31, 'Lección 1: Linea Base del alcance -Parte 1', 'Cap 8 Lecc 1 Linea Base del alcance Parte 1.mp4', 8),
(32, 'Lección 2: Linea Base del alcance -Parte 2', 'Cap 8 Lecc 2 Linea Base del alcance Parte 2..mp4', 8),
(33, 'Lección 3: Validar el alcance -Parte 1', 'Cap 8 Lecc 3 Validar el alcance Parte 1.mp4', 8),
(34, 'Lección 4: Validar el alcance -Parte 2', 'Cap 8 Lecc 4 Validar el alcance Parte 2.mp4', 8),
(35, 'Lección 5: Validar el alcance -Parte 3', 'Cap 8 Lecc 5 Validar el alcance Parte 3.mp4', 8),
(36, 'Lección 6: Controlar el alcance', 'Cap 8 Lecc 6 Controlar el alcance..mp4', 8),
(37, 'Lección 1: Importancia de las comunicaciones', 'Cap 9 Lecc 1 Importancia de las comunicaciones..mp4', 9),
(38, 'Lección 2: Conceptos basicos de la comunicación', 'Cap 9 Lecc 2 Conceptos basicos de la comunicacion.mp4', 9),
(39, 'Lección 3: Metodos de comunicación', 'Cap 9 Lecc 3 Metodos de comunicacion.mp4', 9),
(40, 'Lección 1: Actividades del grupo de procesos de inicio -Parte 1', 'Cap 10 lecc 1Actividades del grupo de procesos  del inicio del proyecto.mp4', 10),
(41, 'Lección 2: Actividades del grupo de procesos de inicio -Parte 2', 'Cap 10 Lecc 2 Actividades del Inicio del proyecto.mp4', 10),
(42, 'Lección 1: Video - Practicar preguntas para el examen', 'preguntasRepo.mp4', 11),
(43, 'Lección 2: Marcos agiles', 'CAP 1 LECC 2 Marcos agiles.mp4', 12),
(44, 'Lección 3: Entornos VICA', 'CAP 1 LECC 3 Entornos VICA.mp4', 12),
(45, 'Lección 4: Definición de ágil', 'Cap 1 Lecc 4 Definicion de Agil.mp4', 12),
(46, 'Lección 5: Manifiesto ágil', 'Cap 1 LECC 5 Manifiesto Ágil.mp4', 12),
(47, 'Lección 6: Declaración de independencia', 'CAP 1 LECC 6 Declaracion de Independencia.mp4', 12),
(48, 'Lección 7: Agilidad', 'CAP 1 LECC 7 Agilidad.mp4', 12),
(49, 'Lección 1: Scrum', 'CAP 2 LECC 1 que es SCRUM.mp4', 13),
(50, 'Lección 2: Ento', 'CAP 2 LECC 2 Empirismo en SCRUM.mp4', 13),
(51, 'Lección 4: Definición de ágil', 'CAP 2 LECC 3 Pilares de SCRUM.mp4', 13),
(52, 'Lección 5: Manifiesto ágil', 'CAP 2 LECC 4 Proceso Iterativo e incremental.mp4', 13),
(53, 'Lección 6: Declaración de independencia', 'Cap 2 Lecc 5 Valores y Esencia de SCRUM.mp4', 13),
(54, 'Lección 7: Agilidad', 'CAP 1 LECC 7 Agilidad.mp4', 13),
(55, 'Lección 1: Roles de SCRUM', 'CAP 3 LEC 1 Roles de SCRUM (1),.mp4', 14),
(56, 'Lección 2: Rol del Dueño del producto', 'CAP 3 LECC 2 Rol del El Dueño de Producto o producto Owner.mp4', 14),
(57, 'Lección 3: SCRUM Master', 'CAP 3 LECC 3 SCRUM Master.mp4', 14),
(58, 'Lección 4: Habilidades blandas y rituales del SCRUM Master', 'CAP 3 LECC 4 Habilidades blandas y rituales del SCRUM Master.mp4', 14),
(59, 'Lección 5: Responsanilidades del SCRUM Master', 'CAP 3 LECC 5 Responsanilidades del SCRUM Master.mp4', 14),
(60, 'Lección 6: Development Team (Equipo de desarrollo) y Caracteristicas', 'Cap 3 Lecc  6 DEVELOPMENT TEAM y Caracteristicas.mp4', 14),
(61, 'Lección 7: Responsabilidades del equipo de desarrollo', 'CAP 3 LECC 7 Responsabilidades del equipo de desarrollo.mp4', 14),
(62, 'Lección 8: Equipo de desarrollo Complemento', 'CAP 3 Lecc 8 Equipo de desarrollo complemento.mp4', 14),
(63, 'Lección 1: Stakeholders-Interesados', 'Cap 4 Lecc 1 Stakeholders.mp4', 15),
(64, 'Lección 2: Historias de Usuarios y Epicas', 'Copia de Cap 4 lecc 2 User Stories. y EPICAS.mp4', 15),
(65, 'Lección 3: Tareas', 'Copia de CAP 4 LECC 3 Task (Tareas).mp4', 15),
(66, 'Lección 4: Tablero SCRUM', 'Cap 4 lecc 4 SCRUM BOARD.mp4', 15),
(67, 'Lección 5: Defiición de Terminado', 'CAP 4 LECC 5 Definicion de DONE.mp4', 15),
(68, 'Lección 6: Time Boxing', 'Cap 4 Lec 6 Time Boxing.mp4', 15),
(69, 'Lección 1: Stakeholders-Interesados', 'Cap 4 Lecc 1 Stakeholders.mp4', 16),
(70, 'Lección 2: Historias de Usuarios y Epicas', 'Copia de Cap 4 lecc 2 User Stories. y EPICAS.mp4', 16),
(71, 'Lección 3: Tareas', 'Copia de CAP 4 LECC 3 Task (Tareas).mp4', 16),
(72, 'Lección 4: Tablero SCRUM', 'Cap 4 lecc 4 SCRUM BOARD.mp4', 16),
(73, 'Lección 5: Defiición de Terminado', 'CAP 4 LECC 5 Definicion de DONE.mp4', 16),
(74, 'Lección 6: Time Boxing', 'Cap 4 Lec 6 Time Boxing.mp4', 16);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`) VALUES
(1, 'david@gmail.com', '$2b$10$JR7TnCSqbVyRD0BbLCmyG.iLCNolMxabq/wjMwWOEWx5q01hg6X3u', 'david'),
(2, 'daniel@gmail.com', '$2b$10$vGD7aZ8Fh7pCNo8Y2yqkA.qchLY028q0AwAySa4RdPJ7yBshxBkE6', 'Daniel'),
(3, 'ivan@gmail.com', '$2b$10$KpgfPRp7IuBJ8x0xRdLg3.LwVRbcSzIUT0GQ2cIuOtM70G96n.5PS', 'ivan');

-- --------------------------------------------------------

--
-- Table structure for table `user_lessons`
--

CREATE TABLE `user_lessons` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_lessons`
--

INSERT INTO `user_lessons` (`id`, `user_id`, `lesson_id`, `viewed`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 2, 0),
(4, 2, 3, 1),
(5, 2, 4, 1),
(6, 2, 5, 1),
(7, 2, 6, 1),
(8, 2, 7, 1),
(9, 1, 7, 0),
(10, 2, 10, 1),
(11, 1, 6, 1),
(12, 1, 3, 1),
(13, 1, 4, 1),
(14, 1, 5, 1),
(15, 3, 1, 1),
(16, 3, 6, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapters_ibfk_1` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_ibfk_1` (`chapter_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_lessons`
--
ALTER TABLE `user_lessons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lesson_user` (`user_id`,`lesson_id`) USING BTREE,
  ADD KEY `user_lesson_idx` (`lesson_id`),
  ADD KEY `user_lesson_idx1` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_lessons`
--
ALTER TABLE `user_lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `chapters_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_lessons`
--
ALTER TABLE `user_lessons`
  ADD CONSTRAINT `lesson_user` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_lesson` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
