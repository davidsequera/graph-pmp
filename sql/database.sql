-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: pmp
-- ------------------------------------------------------
-- Server version	5.6.48-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chapters`
--


DROP TABLE IF EXISTS `chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapters` (
  `id` varchar(24) COLLATE utf8_estonian_ci NOT NULL DEFAULT (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))) ,
  `name` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `course_id` varchar(24) COLLATE utf8_estonian_ci NOT NULL DEFAULT (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))) ,
  PRIMARY KEY (`id`),
  KEY `chapters_ibfk_1` (`course_id`),
  CONSTRAINT `chapters_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` varchar(24) COLLATE utf8_estonian_ci NOT NULL DEFAULT (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))) ,
  `name` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `id` varchar(24) COLLATE utf8_estonian_ci NOT NULL DEFAULT (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))) ,
  `name` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `chapter_id` varchar(24) COLLATE utf8_estonian_ci NOT NULL DEFAULT (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))) ,
  PRIMARY KEY (`id`),
  KEY `lessons_ibfk_1` (`chapter_id`),
  CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` varchar(24) COLLATE utf8_estonian_ci NOT NULL DEFAULT (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))) ,
  `token` varchar(45) DEFAULT NULL,
  `user_id` varchar(24) COLLATE utf8_estonian_ci NOT NULL DEFAULT (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))) ,
  `creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `user_token_idx` (`user_id`),
  CONSTRAINT `user_token` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_lessons`
--

DROP TABLE IF EXISTS `user_lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_lessons` (
  `id` varchar(24) COLLATE utf8_estonian_ci NOT NULL DEFAULT (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))) ,
  `user_id` varchar(24) COLLATE utf8_estonian_ci NOT NULL DEFAULT (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),
  `lesson_id` varchar(24) COLLATE utf8_estonian_ci NOT NULL DEFAULT (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),
  `viewed` tinyint(1) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lesson_user` (`user_id`,`lesson_id`) USING BTREE,
  KEY `user_lesson_idx` (`lesson_id`),
  KEY `user_lesson_idx1` (`user_id`),
  CONSTRAINT `lesson_user` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_lesson` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(24) COLLATE utf8_estonian_ci NOT NULL DEFAULT (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))) ,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



--
-- Dumping data for table `courses`
--


SET @PMP_ID = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND(UNIX_TIMESTAMP())*(16))))));
SET @SCRUM_ID = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));

SET @PMP_1 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @PMP_2 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @PMP_3 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @PMP_4 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @PMP_5 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @PMP_6 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @PMP_7 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @PMP_8 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @PMP_9 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @PMP_10 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @PMP_11 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @SCRUM_1 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @SCRUM_2 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @SCRUM_3 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @SCRUM_4 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));
SET @SCRUM_5 = (LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16))))));


LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES 
(@PMP_ID,'PMP','2021-06-21 14:40:45'),
(@SCRUM_ID,'SCRUM','2021-06-21 14:40:45');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `chapters` WRITE;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
INSERT INTO `chapters` VALUES 
(@PMP_1,'Capítulo 1: Introducción',@PMP_ID),
(@PMP_2,'Capítulo 2: Conceptos Fundamentales',@PMP_ID),
(@PMP_3,'Capítulo 3: Conceptos avanzados',@PMP_ID),
(@PMP_4,'Capítulo 4: Anteproytecto',@PMP_ID),
(@PMP_5,'Capítulo 5: Gestión del Alcance',@PMP_ID),
(@PMP_6,'Capítulo 6: Recopilación de requisitos',@PMP_ID),
(@PMP_7,'Capítulo 7: Como crear la EDT',@PMP_ID),
(@PMP_8,'Capítulo 8: Linea Base del Alcance',@PMP_ID),
(@PMP_9,'Capítulo 9: Gestion de la comunicación',@PMP_ID),
(@PMP_10,'Capítulo 10: Actividades de los grupos de Procesos',@PMP_ID),
(@PMP_11,'Capítulo 11: Video de Preguntas',@PMP_ID),
(@SCRUM_1,'Capítulo 1: Marcos Agiles',@SCRUM_ID),
(@SCRUM_2,'Capítulo 2: Scrum',@SCRUM_ID),
(@SCRUM_3,'Capítulo 3: Roles en Scrum',@SCRUM_ID),
(@SCRUM_4,'Capítulo 4: Elementos SCRUM',@SCRUM_ID),
(@SCRUM_5,'Capítulo 5: Desarrollo SCRUM',@SCRUM_ID);
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES 
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Presentanción','Cap%201%20Lecci%C3%B3n%201%20(Aura)Version2.mp4',@PMP_1),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Concepto proyecto','Cap%201%20Lecc%202%20El%20Proyecto.mp4',@PMP_1),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 3: Direccion de Proyectos Parte 1','Cap%201%20Lec%203.mp4',@PMP_1),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 4: Direccion de Proyectos Parte 2','lecci%C3%B3n%204%20Direcci%C3%B3n%20de%20proyectos%202.mp4',@PMP_1),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 5: Resumen','Cap%201%20Leec%205.%20Resumen%201..mp4',@PMP_1),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Programas','Cap 2 Lecc 1 Programas.mp4',@PMP_2),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Portafolio','Cap 2 Lecc 2 Portafolios.mp4',@PMP_2),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 3: OPM3 - PMO','Cap 2 lecc 3 OPM3-PMO.mp4',@PMP_2),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 4: Resumen','Cap 2 Leec 4. Resumen 2..mp4',@PMP_2),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Estructura Organizacional','CAP 3 LECC 1 Estructura organizacional.mp4',@PMP_3),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Ciclo de vida del proyecto','Cap 3 Lecc 2 Ciclos del proyecto.mp4',@PMP_3),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 3: Competencias del director de proyecto -Parte 1','Cap 3 Lecc 3 Competencias del director de proyecto Parte 1.mp4',@PMP_3),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 4: Competencias del director de proyecto -Parte 2','Cap 3 Lecc  4  Competencias del director de proyecto Parte 2.mp4',@PMP_3),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 5: Interesados del Proyecto','Cap 3 Lecc 5 Interesados del proyecto.mp4',@PMP_3),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 6: Registro de interesados','Cap 3 Lecc 5 Interesados del proyecto.mp4',@PMP_3),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Definición de anteproyecto','Cap 4 Lecc 1 Definicion de ante proyecto.mp4',@PMP_4),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Importancia del anteproyecto','Cap 4 Lecc 3 Plan de gestion de beneficios.mp4',@PMP_4),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 3: Plan de gestion de beneficios','Cap 4 Lecc 3 Plan de gestion de beneficios.mp4',@PMP_4),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Gestión del alcance -Parte 1 ','Cap 5 Lecc 1 Gestion del alcance Parte 1.mp4',@PMP_5),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Gestión del alcance -Parte 2 ','Cap5Lecc2.mp4',@PMP_5),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 3: Estructura de desglose del Trabajo EDT','Cap 5 lecc 3 Estructura de desglose del trabajo.mp4',@PMP_5),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 4: Gestión del alcance -Parte 3 ','',@PMP_5),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 5: Planificar la gestión del alcance','',@PMP_5),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Recopilación de requisitos -Parte 1','Cap 6 Lecc 1 Recopilacion de requisitos Parte 1.mp4',@PMP_6),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Recopilación de requisitos -Parte 2','Cap 6 Lecc 2 Recopilacion de requisitos Parte 2.mp4',@PMP_6),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Importancia de la EDT','Cap 7 Lecc 1 Importancia de la EDT.mp4',@PMP_7),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Como crear la EDT -Parte 1 ','Cap 7 Lecc 2 Como crear la EDT..mp4',@PMP_7),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 3: Como crear la EDT -Parte 2 ','Cap 7 Lecc 3 Desglose de la EDT..mp4',@PMP_7),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 4: Como crear la EDT -Parte 3 ','Cap 7 Lecc 4 Puntos a tener en cuenta para crear la EDT.mp4',@PMP_7),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 5: Como crear la EDT -Parte 4','Cap 7 Lecc  5 Puntos finales EDT..mp4',@PMP_7),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Linea Base del alcance -Parte 1','Cap 8 Lecc 1 Linea Base del alcance Parte 1.mp4',@PMP_8),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Linea Base del alcance -Parte 2','Cap 8 Lecc 2 Linea Base del alcance Parte 2..mp4',@PMP_8),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 3: Validar el alcance -Parte 1','Cap 8 Lecc 3 Validar el alcance Parte 1.mp4',@PMP_8),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 4: Validar el alcance -Parte 2','Cap 8 Lecc 4 Validar el alcance Parte 2.mp4',@PMP_8),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 5: Validar el alcance -Parte 3','Cap 8 Lecc 5 Validar el alcance Parte 3.mp4',@PMP_8),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 6: Controlar el alcance','Cap 8 Lecc 6 Controlar el alcance..mp4',@PMP_8),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Importancia de las comunicaciones','Cap 9 Lecc 1 Importancia de las comunicaciones..mp4',@PMP_9),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Conceptos basicos de la comunicación','Cap 9 Lecc 2 Conceptos basicos de la comunicacion.mp4',@PMP_9),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 3: Metodos de comunicación','Cap 9 Lecc 3 Metodos de comunicacion.mp4',@PMP_9),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Actividades del grupo de procesos de inicio -Parte 1','Cap 10 lecc 1Actividades del grupo de procesos  del inicio del proyecto.mp4',@PMP_10),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Actividades del grupo de procesos de inicio -Parte 2','Cap 10 Lecc 2 Actividades del Inicio del proyecto.mp4',@PMP_10),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Video - Practicar preguntas para el examen','preguntasRepo.mp4',@PMP_11),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Marcos agiles','CAP 1 LECC 2 Marcos agiles.mp4',@SCRUM_1),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 3: Entornos VICA','CAP 1 LECC 3 Entornos VICA.mp4',@SCRUM_1),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 4: Definición de ágil','Cap 1 Lecc 4 Definicion de Agil.mp4',@SCRUM_1),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 5: Manifiesto ágil','Cap 1 LECC 5 Manifiesto Ágil.mp4',@SCRUM_1),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 6: Declaración de independencia','CAP 1 LECC 6 Declaracion de Independencia.mp4',@SCRUM_1),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 7: Agilidad','CAP 1 LECC 7 Agilidad.mp4',@SCRUM_1),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Scrum','CAP 2 LECC 1 que es SCRUM.mp4',@SCRUM_2),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Ento','CAP 2 LECC 2 Empirismo en SCRUM.mp4',@SCRUM_2),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 4: Definición de ágil','CAP 2 LECC 3 Pilares de SCRUM.mp4',@SCRUM_2),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 5: Manifiesto ágil','CAP 2 LECC 4 Proceso Iterativo e incremental.mp4',@SCRUM_2),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 6: Declaración de independencia','Cap 2 Lecc 5 Valores y Esencia de SCRUM.mp4',@SCRUM_2),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 7: Agilidad','CAP 1 LECC 7 Agilidad.mp4',@SCRUM_2),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Roles de SCRUM','CAP 3 LEC 1 Roles de SCRUM @SCRUM_1),.mp4',@SCRUM_3),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Rol del Dueño del producto','CAP 3 LECC 2 Rol del El Dueño de Producto o producto Owner.mp4',@SCRUM_3),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 3: SCRUM Master','CAP 3 LECC 3 SCRUM Master.mp4',@SCRUM_3),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 4: Habilidades blandas y rituales del SCRUM Master','CAP 3 LECC 4 Habilidades blandas y rituales del SCRUM Master.mp4',@SCRUM_3),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 5: Responsanilidades del SCRUM Master','CAP 3 LECC 5 Responsanilidades del SCRUM Master.mp4',@SCRUM_3),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 6: Development Team (Equipo de desarrollo) y Caracteristicas','Cap 3 Lecc  6 DEVELOPMENT TEAM y Caracteristicas.mp4',@SCRUM_3),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 7: Responsabilidades del equipo de desarrollo','CAP 3 LECC 7 Responsabilidades del equipo de desarrollo.mp4',@SCRUM_3),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 8: Equipo de desarrollo Complemento','CAP 3 Lecc 8 Equipo de desarrollo complemento.mp4',@SCRUM_3),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Stakeholders-Interesados','Cap 4 Lecc 1 Stakeholders.mp4',@SCRUM_4),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Historias de Usuarios y Epicas','Copia de Cap 4 lecc 2 User Stories. y EPICAS.mp4',@SCRUM_4),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 3: Tareas','Copia de CAP 4 LECC 3 Task (Tareas).mp4',@SCRUM_4),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 4: Tablero SCRUM','Cap 4 lecc 4 SCRUM BOARD.mp4',@SCRUM_4),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 5: Defiición de Terminado','CAP 4 LECC 5 Definicion de DONE.mp4',@SCRUM_4),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 6: Time Boxing','Cap 4 Lec 6 Time Boxing.mp4',@SCRUM_4),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 1: Stakeholders-Interesados','Cap 4 Lecc 1 Stakeholders.mp4',@SCRUM_5),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 2: Historias de Usuarios y Epicas','Copia de Cap 4 lecc 2 User Stories. y EPICAS.mp4',@SCRUM_5),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 3: Tareas','Copia de CAP 4 LECC 3 Task (Tareas).mp4',@SCRUM_5),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 4: Tablero SCRUM','Cap 4 lecc 4 SCRUM BOARD.mp4',@SCRUM_5),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 5: Defiición de Terminado','CAP 4 LECC 5 Definicion de DONE.mp4',@SCRUM_5),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'Lección 6: Time Boxing','Cap 4 Lec 6 Time Boxing.mp4',@SCRUM_5);
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES 
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'david@gmail.com','$2b$10$JR7TnCSqbVyRD0BbLCmyG.iLCNolMxabq/wjMwWOEWx5q01hg6X3u','david','2021-06-21 14:37:56','2021-06-21 14:39:39'),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'daniel@gmail.com','$2b$10$vGD7aZ8Fh7pCNo8Y2yqkA.qchLY028q0AwAySa4RdPJ7yBshxBkE6','Daniel','2021-06-21 14:37:56','2021-06-21 14:39:39'),
((LOWER(CONCAT(HEX(UNIX_TIMESTAMP()),HEX(UUID_SHORT()),HEX(FLOOR(RAND()*(16)))))),'ivan@gmail.com','$2b$10$KpgfPRp7IuBJ8x0xRdLg3.LwVRbcSzIUT0GQ2cIuOtM70G96n.5PS','ivan','2021-06-21 14:37:56','2021-06-21 14:39:39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-28 16:07:47