-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 10.1.1.3    Database: azucarera
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ajuste`
--

DROP TABLE IF EXISTS `ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ajuste` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `local_id` bigint(20) NOT NULL,
  `moneda_id` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `operacion` varchar(5) NOT NULL,
  `io` varchar(2) NOT NULL,
  `documento` varchar(5) NOT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `estado` varchar(45) NOT NULL,
  `total_importe` decimal(18,2) DEFAULT '0.00',
  `tasa_cambio` float DEFAULT '0',
  `operacion_otros` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajuste`
--

LOCK TABLES `ajuste` WRITE;
/*!40000 ALTER TABLE `ajuste` DISABLE KEYS */;
INSERT INTO `ajuste` VALUES (1,2,1,1029,'2018-02-23 17:27:45','09','1','1','aa','aa','1',0.00,0,NULL);
/*!40000 ALTER TABLE `ajuste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ajuste_detalle`
--

DROP TABLE IF EXISTS `ajuste_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ajuste_detalle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ajuste_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `unidad_id` bigint(20) NOT NULL,
  `cantidad` decimal(18,2) NOT NULL,
  `costo_unitario` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajuste_detalle`
--

LOCK TABLES `ajuste_detalle` WRITE;
/*!40000 ALTER TABLE `ajuste_detalle` DISABLE KEYS */;
INSERT INTO `ajuste_detalle` VALUES (1,1,1,1,50.00,0),(2,1,2,1,50.00,0),(3,1,3,1,50.00,0);
/*!40000 ALTER TABLE `ajuste_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ajustedetalle`
--

DROP TABLE IF EXISTS `ajustedetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ajustedetalle` (
  `id_ajustedetalle` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ajusteinventario` bigint(20) DEFAULT NULL,
  `cantidad_detalle` float DEFAULT NULL,
  `fraccion_detalle` float DEFAULT NULL,
  `old_cantidad` float DEFAULT NULL,
  `old_fraccion` float DEFAULT NULL,
  `id_producto_almacen` bigint(20) DEFAULT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ajustedetalle`),
  KEY `fk_1_idx` (`id_ajusteinventario`),
  KEY `fk_ajustedetalle_2_idx` (`id_producto_almacen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajustedetalle`
--

LOCK TABLES `ajustedetalle` WRITE;
/*!40000 ALTER TABLE `ajustedetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajustedetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ajusteinventario`
--

DROP TABLE IF EXISTS `ajusteinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ajusteinventario` (
  `id_ajusteinventario` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `local_id` bigint(20) DEFAULT NULL,
  `usuario_encargado` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_ajusteinventario`),
  KEY `ajusteinventario_fk_1_idx` (`local_id`),
  KEY `usuario_encargado` (`usuario_encargado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajusteinventario`
--

LOCK TABLES `ajusteinventario` WRITE;
/*!40000 ALTER TABLE `ajusteinventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajusteinventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banco`
--

DROP TABLE IF EXISTS `banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banco` (
  `banco_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `banco_nombre` varchar(255) DEFAULT NULL,
  `banco_numero_cuenta` varchar(255) DEFAULT NULL,
  `banco_saldo` decimal(18,2) DEFAULT NULL,
  `banco_cuenta_contable` varchar(255) DEFAULT NULL,
  `banco_titular` varchar(255) DEFAULT NULL,
  `banco_status` tinyint(1) DEFAULT '1',
  `cuenta_id` bigint(20) NOT NULL,
  PRIMARY KEY (`banco_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco`
--

LOCK TABLES `banco` WRITE;
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local_id` bigint(20) NOT NULL,
  `moneda_id` bigint(20) NOT NULL,
  `responsable_id` bigint(20) NOT NULL,
  `estado` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` VALUES (1,1,1,2,1);
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja_desglose`
--

DROP TABLE IF EXISTS `caja_desglose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caja_desglose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caja_id` int(11) NOT NULL,
  `responsable_id` bigint(20) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `saldo` decimal(18,2) NOT NULL DEFAULT '0.00',
  `principal` tinyint(2) NOT NULL DEFAULT '0',
  `retencion` tinyint(2) NOT NULL DEFAULT '0',
  `estado` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja_desglose`
--

LOCK TABLES `caja_desglose` WRITE;
/*!40000 ALTER TABLE `caja_desglose` DISABLE KEYS */;
INSERT INTO `caja_desglose` VALUES (1,1,2,'CTA PRINCIPAL',43.00,1,0,1);
/*!40000 ALTER TABLE `caja_desglose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja_movimiento`
--

DROP TABLE IF EXISTS `caja_movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caja_movimiento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `caja_desglose_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  `fecha_mov` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `movimiento` varchar(45) NOT NULL,
  `operacion` varchar(45) NOT NULL,
  `medio_pago` varchar(45) NOT NULL,
  `saldo` decimal(18,2) NOT NULL,
  `saldo_old` decimal(18,2) NOT NULL,
  `ref_id` varchar(50) DEFAULT NULL,
  `ref_val` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja_movimiento`
--

LOCK TABLES `caja_movimiento` WRITE;
/*!40000 ALTER TABLE `caja_movimiento` DISABLE KEYS */;
INSERT INTO `caja_movimiento` VALUES (1,1,2,'2018-02-23 21:44:06','2018-02-23 21:44:06','INGRESO','VENTA','3',3.00,0.00,'2',''),(2,1,2,'2018-02-23 21:44:09','2018-02-23 21:44:09','INGRESO','VENTA','3',40.00,3.00,'1','');
/*!40000 ALTER TABLE `caja_movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caja_pendiente`
--

DROP TABLE IF EXISTS `caja_pendiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caja_pendiente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `caja_desglose_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `IO` tinyint(4) NOT NULL,
  `monto` decimal(18,2) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `ref_id` varchar(45) DEFAULT NULL,
  `ref_val` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja_pendiente`
--

LOCK TABLES `caja_pendiente` WRITE;
/*!40000 ALTER TABLE `caja_pendiente` DISABLE KEYS */;
INSERT INTO `caja_pendiente` VALUES (1,1,2,'COMPRA',2,487.50,0,'1',NULL),(2,1,2,'COMPRA',2,162.50,0,'2',NULL),(3,1,2,'COMPRA',2,162.50,0,'3',NULL);
/*!40000 ALTER TABLE `caja_pendiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('322e1da0068125ebd71a987a422398073eb0c164','::1',1497374092,'__ci_last_regenerate|i:1497374092;'),('0bc91759e2bc01de69dba30b31b37e2793ffe7e8','::1',1512405011,'__ci_last_regenerate|i:1512404631;nUsuCodigo|s:1:\"2\";username|s:5:\"admin\";var_usuario_clave|s:32:\"202cb962ac59075b964b07152d234b70\";activo|s:1:\"1\";nombre|s:5:\"Admin\";grupo|s:1:\"2\";id_local|s:1:\"1\";deleted|s:1:\"0\";identificacion|s:8:\"12345678\";esSuper|N;int_local_id|s:1:\"1\";local_nombre|s:8:\"AYACUCHO\";local_status|s:1:\"1\";principal|s:1:\"1\";distrito_id|s:1:\"2\";direccion|s:18:\"JR. AYACUCHO - 822\";telefono|s:9:\"426 28 19\";id_grupos_usuarios|s:1:\"2\";nombre_grupos_usuarios|s:13:\"Administrador\";status_grupos_usuarios|s:1:\"1\";password|s:32:\"202cb962ac59075b964b07152d234b70\";EMPRESA_NOMBRE|s:4:\"DEMO\";VENTA_DEFAULT|s:6:\"NOMBRE\";INICIAL_PORCENTAJE_VTA_CRED|s:2:\"30\";TASA_INTERES|s:1:\"0\";DATABASE_IP|N;DATABASE_NAME|N;DATABASE_USERNAME|N;MODIFICADOR_PRECIO|s:2:\"SI\";CODIGO_DEFAULT|s:7:\"INTERNO\";VALOR_UNICO|s:6:\"NOMBRE\";PRODUCTO_SERIE|s:1:\"1\";MAXIMO_CUOTAS_CREDITO|s:2:\"50\";GENERAR_FACTURACION|s:2:\"NO\";PAGOS_ANTICIPADOS|s:1:\"0\";ADELANTO_PAGO_CUOTA|s:1:\"0\";VENTAS_COBRAR|s:2:\"NO\";CONTABLE_COSTO|s:2:\"SI\";FACTURAR_INGRESO|s:2:\"SI\";VISTA_CREDITO|s:8:\"AVANZADO\";PRECIO_BASE|s:5:\"COSTO\";PRECIO_DE_VENTA|s:6:\"MANUAL\";BUSCAR_PRODUCTOS_VENTA|s:6:\"NOMBRE\";PRECIO_INGRESO|s:5:\"COSTO\";ACTIVAR_FACTURACION_VENTA|s:1:\"1\";ACTIVAR_FACTURACION_INGRESO|s:1:\"1\";ACTIVAR_SHADOW|s:1:\"0\";CREDITO_INICIAL|s:1:\"0\";CREDITO_TASA|s:1:\"0\";CREDITO_CUOTAS|s:2:\"10\";COSTO_AUMENTO|N;INCORPORAR_IGV|s:1:\"0\";INGRESO_COSTO|s:1:\"2\";INGRESO_UTILIDAD|s:1:\"8\";COBRAR_CAJA|s:1:\"1\";'),('1ae980277ca6640c8c43a9970cf592a0d0c13e71','10.1.1.1',1519423226,'__ci_last_regenerate|i:1519423105;nUsuCodigo|s:1:\"2\";username|s:5:\"admin\";var_usuario_clave|s:32:\"b867d9cd482834bbf35e785855f416d5\";activo|s:1:\"1\";nombre|s:5:\"Admin\";grupo|s:1:\"2\";id_local|s:1:\"1\";deleted|s:1:\"0\";identificacion|s:8:\"12345678\";esSuper|N;int_local_id|s:1:\"1\";local_nombre|s:9:\"PRINCIPAL\";local_status|s:1:\"1\";principal|s:1:\"1\";distrito_id|s:1:\"2\";direccion|s:9:\"DIRECCION\";telefono|s:8:\"11111111\";id_grupos_usuarios|s:1:\"2\";nombre_grupos_usuarios|s:13:\"Administrador\";status_grupos_usuarios|s:1:\"1\";password|s:32:\"b867d9cd482834bbf35e785855f416d5\";EMPRESA_NOMBRE|s:4:\"DEMO\";VENTA_DEFAULT|s:6:\"NOMBRE\";INICIAL_PORCENTAJE_VTA_CRED|s:2:\"30\";TASA_INTERES|s:1:\"0\";DATABASE_IP|N;DATABASE_NAME|N;DATABASE_USERNAME|N;MODIFICADOR_PRECIO|s:2:\"SI\";CODIGO_DEFAULT|s:7:\"INTERNO\";VALOR_UNICO|s:6:\"NOMBRE\";PRODUCTO_SERIE|s:1:\"1\";MAXIMO_CUOTAS_CREDITO|s:2:\"50\";GENERAR_FACTURACION|s:2:\"NO\";PAGOS_ANTICIPADOS|s:1:\"0\";ADELANTO_PAGO_CUOTA|s:1:\"0\";VENTAS_COBRAR|s:2:\"NO\";CONTABLE_COSTO|s:2:\"SI\";FACTURAR_INGRESO|s:2:\"SI\";VISTA_CREDITO|s:8:\"AVANZADO\";PRECIO_BASE|s:5:\"COSTO\";PRECIO_DE_VENTA|s:6:\"MANUAL\";BUSCAR_PRODUCTOS_VENTA|s:6:\"NOMBRE\";PRECIO_INGRESO|s:5:\"COSTO\";ACTIVAR_FACTURACION_VENTA|s:1:\"1\";ACTIVAR_FACTURACION_INGRESO|s:1:\"1\";ACTIVAR_SHADOW|s:1:\"0\";CREDITO_INICIAL|s:1:\"0\";CREDITO_TASA|s:1:\"0\";CREDITO_CUOTAS|s:2:\"10\";COSTO_AUMENTO|N;INCORPORAR_IGV|s:1:\"0\";INGRESO_COSTO|s:1:\"2\";INGRESO_UTILIDAD|s:1:\"8\";COBRAR_CAJA|s:1:\"1\";'),('f5c5552a4ffbb62a1a90ab409ea6b2908ebf144e','10.1.1.1',1521961694,'__ci_last_regenerate|i:1521961434;nUsuCodigo|s:1:\"2\";username|s:5:\"admin\";var_usuario_clave|s:32:\"b867d9cd482834bbf35e785855f416d5\";activo|s:1:\"1\";nombre|s:5:\"Admin\";grupo|s:1:\"2\";id_local|s:1:\"1\";deleted|s:1:\"0\";identificacion|s:8:\"12345678\";esSuper|N;int_local_id|s:1:\"1\";local_nombre|s:9:\"PRINCIPAL\";local_status|s:1:\"1\";principal|s:1:\"1\";distrito_id|s:1:\"2\";direccion|s:9:\"DIRECCION\";telefono|s:8:\"11111111\";id_grupos_usuarios|s:1:\"2\";nombre_grupos_usuarios|s:13:\"Administrador\";status_grupos_usuarios|s:1:\"1\";password|s:32:\"b867d9cd482834bbf35e785855f416d5\";EMPRESA_NOMBRE|s:4:\"DEMO\";VENTA_DEFAULT|s:6:\"NOMBRE\";INICIAL_PORCENTAJE_VTA_CRED|s:2:\"30\";TASA_INTERES|s:1:\"0\";DATABASE_IP|N;DATABASE_NAME|N;DATABASE_USERNAME|N;MODIFICADOR_PRECIO|s:2:\"SI\";CODIGO_DEFAULT|s:7:\"INTERNO\";VALOR_UNICO|s:6:\"NOMBRE\";PRODUCTO_SERIE|s:1:\"1\";MAXIMO_CUOTAS_CREDITO|s:2:\"50\";GENERAR_FACTURACION|s:2:\"NO\";PAGOS_ANTICIPADOS|s:1:\"0\";ADELANTO_PAGO_CUOTA|s:1:\"0\";VENTAS_COBRAR|s:2:\"NO\";CONTABLE_COSTO|s:2:\"SI\";FACTURAR_INGRESO|s:2:\"SI\";VISTA_CREDITO|s:8:\"AVANZADO\";PRECIO_BASE|s:5:\"COSTO\";PRECIO_DE_VENTA|s:6:\"MANUAL\";BUSCAR_PRODUCTOS_VENTA|s:6:\"NOMBRE\";PRECIO_INGRESO|s:5:\"COSTO\";ACTIVAR_FACTURACION_VENTA|s:1:\"1\";ACTIVAR_FACTURACION_INGRESO|s:1:\"1\";ACTIVAR_SHADOW|s:1:\"0\";CREDITO_INICIAL|s:1:\"0\";CREDITO_TASA|s:1:\"0\";CREDITO_CUOTAS|s:2:\"10\";COSTO_AUMENTO|N;INCORPORAR_IGV|s:1:\"0\";INGRESO_COSTO|s:1:\"2\";INGRESO_UTILIDAD|s:1:\"8\";COBRAR_CAJA|s:1:\"1\";');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudades` (
  `ciudad_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ciudad_nombre` varchar(45) DEFAULT NULL,
  `estado_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ciudad_id`),
  KEY `ciudad_pk_1_idx` (`estado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'Chachapoyas',1),(2,'Bagua',1),(3,'Bongará',1),(4,'Condorcanqui',1),(5,'Luya',1),(6,'Rodríguez de Mendoza',1),(7,'Utcubamba',1),(8,'Huaraz',2),(9,'Aija',2),(10,'Antonio Raymondi',2),(11,'Asunción',2),(12,'Bolognesi',2),(13,'Carhuaz',2),(14,'Carlos Fermín Fitzcarrald',2),(15,'Casma',2),(16,'Corongo',2),(17,'Huari',2),(18,'Huarmey',2),(19,'Huaylas',2),(20,'Mariscal Luzuriaga',2),(21,'Ocros',2),(22,'Pallasca',2),(23,'Pomabamba',2),(24,'Recuay',2),(25,'Santa',2),(26,'Sihuas',2),(27,'Yungay',2),(28,'Abancay',3),(29,'Andahuaylas',3),(30,'Antabamba',3),(31,'Aymaraes',3),(32,'Cotabambas',3),(33,'Chincheros',3),(34,'Grau',3),(35,'Arequipa',4),(36,'Camaná',4),(37,'Caravelí',4),(38,'Castilla',4),(39,'Caylloma',4),(40,'Condesuyos',4),(41,'Islay',4),(42,'La Uniòn',4),(43,'Huamanga',5),(44,'Cangallo',5),(45,'Huanca Sancos',5),(46,'Huanta',5),(47,'La Mar',5),(48,'Lucanas',5),(49,'Parinacochas',5),(50,'Pàucar del Sara Sara ',5),(51,'Sucre',5),(52,'Víctor Fajardo',5),(53,'Vilcas Huamán',5),(54,'Cajamarca',6),(55,'Cajabamba',6),(56,'Celendín',6),(57,'Chota',6),(58,'Contumazá',6),(59,'Cutervo',6),(60,'Hualgayoc',6),(61,'Jaén',6),(62,'San Ignacio',6),(63,'San Marcos',6),(64,'San Miguel',6),(65,'San Pablo',6),(66,'Santa Cruz',6),(67,'Prov. Const. del Callao',7),(68,'Cusco',8),(69,'Acomayo',8),(70,'Anta',8),(71,'Calca',8),(72,'Canas',8),(73,'Canchis',8),(74,'Chumbivilcas',8),(75,'Espinar',8),(76,'La Convención',8),(77,'Paruro',8),(78,'Paucartambo',8),(79,'Quispicanchi',8),(80,'Urubamba',8),(81,'Huancavelica',9),(82,'Acobamba',9),(83,'Angaraes',9),(84,'Castrovirreyna',9),(85,'Churcampa',9),(86,'Huaytará',9),(87,'Tayacaja',9),(88,'Huánuco',10),(89,'Ambo',10),(90,'Dos de Mayo',10),(91,'Huacaybamba',10),(92,'Huamalíes',10),(93,'Leoncio Prado',10),(94,'Marañón',10),(95,'Pachitea',10),(96,'Puerto Inca',10),(97,'Lauricocha',10),(98,'Yarowilca',10),(99,'Ica',11),(100,'Chincha',11),(101,'Nazca',11),(102,'Palpa',11),(103,'Pisco',11),(104,'Huancayo',12),(105,'Concepción',12),(106,'Chanchamayo',12),(107,'Jauja',12),(108,'Junín',12),(109,'Satipo',12),(110,'Tarma',12),(111,'Yauli',12),(112,'Chupaca',12),(113,'Trujillo',13),(114,'Ascope',13),(115,'Bolívar',13),(116,'Chepén',13),(117,'Julcán',13),(118,'Otuzco',13),(119,'Pacasmayo',13),(120,'Pataz',13),(121,'Sánchez Carrión',13),(122,'Santiago de Chuco',13),(123,'Gran Chimú',13),(124,'Virú',13),(125,'Chiclayo',14),(126,'Ferreñafe',14),(127,'Lambayeque',14),(128,'Lima',15),(129,'Barranca',15),(130,'Cajatambo',15),(131,'Canta',15),(132,'Cañete',15),(133,'Huaral',15),(134,'Huarochirí',15),(135,'Huaura',15),(136,'Oyón',15),(137,'Yauyos',15),(138,'Maynas',16),(139,'Alto Amazonas',16),(140,'Loreto',16),(141,'Mariscal Ramón Castilla',16),(142,'Requena',16),(143,'Ucayali',16),(144,'Datem del Marañón',16),(145,'Putumayo',16),(146,'Tambopata',17),(147,'Manu',17),(148,'Tahuamanu',17),(149,'Mariscal Nieto',18),(150,'General Sánchez Cerro',18),(151,'Ilo',18),(152,'Pasco',19),(153,'Daniel Alcides Carrión',19),(154,'Oxapampa',19),(155,'Piura',20),(156,'Ayabaca',20),(157,'Huancabamba',20),(158,'Morropón',20),(159,'Paita',20),(160,'Sullana',20),(161,'Talara',20),(162,'Sechura',20),(163,'Puno',21),(164,'Azángaro',21),(165,'Carabaya',21),(166,'Chucuito',21),(167,'El Collao',21),(168,'Huancané',21),(169,'Lampa',21),(170,'Melgar',21),(171,'Moho',21),(172,'San Antonio de Putina ',21),(173,'San Román',21),(174,'Sandia',21),(175,'Yunguyo',21),(176,'Moyobamba',22),(177,'Bellavista',22),(178,'El Dorado',22),(179,'Huallaga',22),(180,'Lamas',22),(181,'Mariscal Cáceres',22),(182,'Picota',22),(183,'Rioja',22),(184,'San Martín',22),(185,'Tocache',22),(186,'Tacna',23),(187,'Candarave',23),(188,'Jorge Basadre',23),(189,'Tarata',23),(190,'Tumbes',24),(191,'Contralmirante Villar',24),(192,'Zarumilla',24),(193,'Coronel Portillo',25),(194,'Atalaya',25),(195,'Padre Abad',25),(196,'Purús',25);
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` bigint(20) NOT NULL AUTO_INCREMENT,
  `ciudad_id` bigint(20) DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `direccion` text,
  `provincia` bigint(20) DEFAULT NULL,
  `ciudad` bigint(20) DEFAULT NULL,
  `distrito` bigint(20) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `grupo_id` bigint(20) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `identificacion` varchar(45) DEFAULT NULL,
  `pagina_web` varchar(255) DEFAULT NULL,
  `telefono1` varchar(45) DEFAULT NULL,
  `telefono2` varchar(45) DEFAULT NULL,
  `nota` text,
  `cliente_status` tinyint(1) DEFAULT '1',
  `categoria_precio` bigint(20) DEFAULT NULL,
  `tipo_cliente` varchar(20) DEFAULT NULL,
  `dni` varchar(225) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `apellido_materno` varchar(255) DEFAULT NULL,
  `apellido_paterno` varchar(255) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `direccion_maps` text,
  `latitud` varchar(255) DEFAULT NULL,
  `longitud` varchar(255) DEFAULT NULL,
  `ruc` varchar(45) DEFAULT NULL,
  `representante_apellido_pat` varchar(255) DEFAULT NULL,
  `representante_apellido_mat` varchar(255) DEFAULT NULL,
  `representante_genero` varchar(255) DEFAULT NULL,
  `representante_nombre` varchar(255) DEFAULT NULL,
  `representante_dni` varchar(255) DEFAULT NULL,
  `agente_retension` tinyint(1) DEFAULT NULL,
  `agente_retension_valor` decimal(18,2) DEFAULT NULL,
  `linea_credito` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `cliente_fk_1_idx` (`grupo_id`),
  KEY `cliente_fk_2_idx` (`ciudad_id`),
  KEY `categoria_precio` (`categoria_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,0,'',NULL,NULL,NULL,'',2,'Cliente Frecuente','23434565','','','','',1,1,'1','','','','','','','','','2','','','','','',NULL,NULL,NULL),(2,NULL,NULL,'compania',NULL,NULL,NULL,'proveedor',1,'Descripcion1519405462','subgrupo',NULL,NULL,'1',NULL,1,NULL,'0','locallizacion','numero_serie','ubicacion','19/03/1925','1',NULL,NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_campo_valor`
--

DROP TABLE IF EXISTS `cliente_campo_valor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_campo_valor` (
  `id_campo` bigint(20) NOT NULL AUTO_INCREMENT,
  `campo_cliente` bigint(20) NOT NULL,
  `campo_valor` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_campo` bigint(20) DEFAULT NULL,
  `referencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_campo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_campo_valor`
--

LOCK TABLES `cliente_campo_valor` WRITE;
/*!40000 ALTER TABLE `cliente_campo_valor` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_campo_valor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_tipo_campo`
--

DROP TABLE IF EXISTS `cliente_tipo_campo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_tipo_campo` (
  `id_tipo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `padre_id` bigint(20) DEFAULT NULL,
  `input_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`),
  KEY `padre_id` (`padre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_tipo_campo`
--

LOCK TABLES `cliente_tipo_campo` WRITE;
/*!40000 ALTER TABLE `cliente_tipo_campo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_tipo_campo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_tipo_campo_padre`
--

DROP TABLE IF EXISTS `cliente_tipo_campo_padre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_tipo_campo_padre` (
  `tipo_campo_padre_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo_campo_padre_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_campo_padre_slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`tipo_campo_padre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_tipo_campo_padre`
--

LOCK TABLES `cliente_tipo_campo_padre` WRITE;
/*!40000 ALTER TABLE `cliente_tipo_campo_padre` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_tipo_campo_padre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `columnas`
--

DROP TABLE IF EXISTS `columnas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columnas` (
  `nombre_columna` varchar(255) NOT NULL,
  `nombre_join` varchar(45) NOT NULL,
  `nombre_mostrar` varchar(255) NOT NULL,
  `tabla` varchar(45) DEFAULT NULL,
  `mostrar` tinyint(1) DEFAULT '1',
  `activo` tinyint(1) DEFAULT '1',
  `id_columna` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_columna`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columnas`
--

LOCK TABLES `columnas` WRITE;
/*!40000 ALTER TABLE `columnas` DISABLE KEYS */;
INSERT INTO `columnas` VALUES ('producto_id','producto_id','ID','producto',1,0,35),('producto_codigo_barra','producto_codigo_barra','Código de barra','producto',1,1,36),('producto_nombre','producto_nombre','Nombre','producto',1,0,37),('producto_descripcion','producto_descripcion','Descripción','producto',0,1,38),('producto_marca','nombre_marca','Marca','producto',1,1,39),('produto_grupo','nombre_grupo','Grupo','producto',1,1,40),('producto_familia','nombre_familia','Familia','producto',1,1,41),('producto_linea','nombre_linea','Linea','producto',0,0,42),('producto_modelo','producto_modelo','Modelo','producto',0,0,43),('producto_proveedor','proveedor_nombre','Proveedor','producto',0,1,53),('producto_stockminimo','producto_stockminimo','Stock Mínimo','producto',0,1,54),('producto_impuesto','nombre_impuesto','Impuesto','producto',0,0,55),('producto_largo','producto_largo','Largo','producto',0,0,56),('producto_ancho','producto_ancho','Ancho','producto',0,0,57),('producto_alto','producto_alto','Alto','producto',0,0,58),('producto_peso','producto_peso','Peso','producto',0,0,59),('producto_nota','producto_nota','Nota','producto',0,0,60),('producto_cualidad','producto_cualidad','Cualidad','producto',0,0,61),('producto_codigo_interno','producto_codigo_interno','Código Interno','producto',1,0,63),('producto_titulo_imagen','producto_titulo_imagen','Titulo Imagen','producto',0,0,64),('producto_descripcion_img','producto_descripcion_img','Descripcion Imagen','producto',0,0,65),('producto_vencimiento','producto_vencimiento','Fecha de Vencimiento','producto',0,0,66);
/*!40000 ALTER TABLE `columnas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condiciones_pago`
--

DROP TABLE IF EXISTS `condiciones_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condiciones_pago` (
  `id_condiciones` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_condiciones` varchar(255) NOT NULL,
  `status_condiciones` tinyint(1) DEFAULT '1',
  `dias` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_condiciones`,`nombre_condiciones`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condiciones_pago`
--

LOCK TABLES `condiciones_pago` WRITE;
/*!40000 ALTER TABLE `condiciones_pago` DISABLE KEYS */;
INSERT INTO `condiciones_pago` VALUES (1,'Contado',1,0),(2,'Crédito',1,30);
/*!40000 ALTER TABLE `condiciones_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuraciones`
--

DROP TABLE IF EXISTS `configuraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuraciones` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(255) DEFAULT NULL,
  `config_value` varchar(255) DEFAULT NULL,
  KEY `config_id` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuraciones`
--

LOCK TABLES `configuraciones` WRITE;
/*!40000 ALTER TABLE `configuraciones` DISABLE KEYS */;
INSERT INTO `configuraciones` VALUES (1,'EMPRESA_NOMBRE','DEMO'),(4,'VENTA_DEFAULT','NOMBRE'),(5,'INICIAL_PORCENTAJE_VTA_CRED','30'),(7,'TASA_INTERES','0'),(7,'TASA_INTERES','0'),(7,'TASA_INTERES','0'),(9,'DATABASE_IP',NULL),(10,'DATABASE_NAME',NULL),(11,'DATABASE_USERNAME',NULL),(12,'MODIFICADOR_PRECIO','SI'),(17,'CODIGO_DEFAULT','INTERNO'),(18,'VALOR_UNICO','NOMBRE'),(19,'PRODUCTO_SERIE','1'),(20,'MAXIMO_CUOTAS_CREDITO','50'),(21,'GENERAR_FACTURACION','NO'),(16,'GENERAR_FACTURACION','NO'),(22,'PAGOS_ANTICIPADOS','0'),(23,'ADELANTO_PAGO_CUOTA','0'),(24,'VENTAS_COBRAR','NO'),(25,'CONTABLE_COSTO','SI'),(26,'FACTURAR_INGRESO','SI'),(27,'FACTURAR_INGRESO','SI'),(28,'VISTA_CREDITO','AVANZADO'),(29,'PRECIO_BASE','COSTO'),(30,'PRECIO_DE_VENTA','MANUAL'),(31,'BUSCAR_PRODUCTOS_VENTA','NOMBRE'),(32,'PRECIO_INGRESO','COSTO'),(33,'ACTIVAR_FACTURACION_VENTA','1'),(34,'ACTIVAR_FACTURACION_INGRESO','1'),(35,'ACTIVAR_SHADOW','0'),(36,'CREDITO_INICIAL','0'),(37,'CREDITO_TASA','0'),(38,'CREDITO_CUOTAS','10'),(39,'COSTO_AUMENTO',NULL),(40,'INCORPORAR_IGV','0'),(41,'INGRESO_COSTO','2'),(42,'INGRESO_UTILIDAD','8'),(43,'COBRAR_CAJA','1');
/*!40000 ALTER TABLE `configuraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contado`
--

DROP TABLE IF EXISTS `contado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contado` (
  `id_venta` bigint(20) NOT NULL,
  `status` varchar(13) NOT NULL,
  `montopagado` decimal(18,2) NOT NULL,
  PRIMARY KEY (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contado`
--

LOCK TABLES `contado` WRITE;
/*!40000 ALTER TABLE `contado` DISABLE KEYS */;
INSERT INTO `contado` VALUES (1,'PagoCancelado',40.00),(2,'PagoCancelado',3.00);
/*!40000 ALTER TABLE `contado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correlativos`
--

DROP TABLE IF EXISTS `correlativos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correlativos` (
  `id_local` int(11) NOT NULL,
  `id_documento` int(11) NOT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `correlativo` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_local`,`id_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correlativos`
--

LOCK TABLES `correlativos` WRITE;
/*!40000 ALTER TABLE `correlativos` DISABLE KEYS */;
INSERT INTO `correlativos` VALUES (1,6,'0001',2),(2,3,'0001',1),(4,6,'0001',1);
/*!40000 ALTER TABLE `correlativos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credito`
--

DROP TABLE IF EXISTS `credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credito` (
  `id_venta` bigint(20) NOT NULL,
  `int_credito_nrocuota` int(11) NOT NULL,
  `dec_credito_montocuota` decimal(18,2) NOT NULL,
  `var_credito_estado` varchar(20) NOT NULL,
  `dec_credito_montodebito` decimal(18,2) DEFAULT '0.00',
  `num_corre` varchar(20) DEFAULT NULL,
  `id_moneda` int(11) DEFAULT NULL,
  `tasa_cambio` decimal(4,2) DEFAULT NULL,
  `fec_emi_compro` date DEFAULT NULL,
  `num_corre_gr` varchar(20) DEFAULT NULL,
  `pago_anticipado` int(10) DEFAULT NULL,
  `fecha_cancelado` datetime DEFAULT NULL,
  PRIMARY KEY (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credito`
--

LOCK TABLES `credito` WRITE;
/*!40000 ALTER TABLE `credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credito_cuotas`
--

DROP TABLE IF EXISTS `credito_cuotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credito_cuotas` (
  `id_credito_cuota` bigint(20) NOT NULL AUTO_INCREMENT,
  `nro_letra` varchar(20) NOT NULL,
  `fecha_giro` datetime DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `monto` decimal(6,2) DEFAULT NULL,
  `isgiro` int(11) DEFAULT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `ispagado` int(11) DEFAULT '0',
  `ultimo_pago` datetime DEFAULT NULL,
  PRIMARY KEY (`id_credito_cuota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credito_cuotas`
--

LOCK TABLES `credito_cuotas` WRITE;
/*!40000 ALTER TABLE `credito_cuotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `credito_cuotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credito_cuotas_abono`
--

DROP TABLE IF EXISTS `credito_cuotas_abono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credito_cuotas_abono` (
  `abono_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `credito_cuota_id` bigint(20) DEFAULT NULL,
  `monto_abono` decimal(18,2) DEFAULT NULL,
  `fecha_abono` datetime NOT NULL,
  `tipo_pago` bigint(20) DEFAULT NULL,
  `monto_restante` decimal(18,2) DEFAULT NULL,
  `usuario_pago` bigint(20) DEFAULT NULL,
  `banco_id` bigint(20) DEFAULT NULL,
  `nro_operacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`abono_id`),
  KEY `credito_cuota_id` (`credito_cuota_id`),
  KEY `tipo_pago` (`tipo_pago`),
  KEY `usuario_pago` (`usuario_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credito_cuotas_abono`
--

LOCK TABLES `credito_cuotas_abono` WRITE;
/*!40000 ALTER TABLE `credito_cuotas_abono` DISABLE KEYS */;
/*!40000 ALTER TABLE `credito_cuotas_abono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cronogramapago`
--

DROP TABLE IF EXISTS `cronogramapago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronogramapago` (
  `nCPagoCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `int_cronpago_nrocuota` int(11) NOT NULL,
  `dat_cronpago_fecinicio` date NOT NULL,
  `dat_cronpago_fecpago` date NOT NULL,
  `dec_cronpago_pagocuota` decimal(18,2) NOT NULL,
  `dec_cronpago_pagorecibido` decimal(18,2) DEFAULT '0.00',
  `nVenCodigo` bigint(20) NOT NULL,
  PRIMARY KEY (`nCPagoCodigo`),
  KEY `cronogramapago_venta_idx` (`nVenCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cronogramapago`
--

LOCK TABLES `cronogramapago` WRITE;
/*!40000 ALTER TABLE `cronogramapago` DISABLE KEYS */;
/*!40000 ALTER TABLE `cronogramapago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_venta` (
  `id_detalle` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_venta` bigint(20) DEFAULT NULL,
  `id_producto` bigint(20) DEFAULT NULL,
  `precio` decimal(18,2) DEFAULT NULL,
  `cantidad` decimal(18,3) NOT NULL DEFAULT '0.000',
  `unidad_medida` bigint(20) DEFAULT NULL,
  `detalle_importe` decimal(18,2) DEFAULT NULL,
  `detalle_costo_promedio` decimal(18,2) DEFAULT '0.00',
  `detalle_utilidad` decimal(18,2) DEFAULT '0.00',
  PRIMARY KEY (`id_detalle`),
  KEY `R_9` (`id_venta`),
  KEY `transaccion_ibfk_2_idx` (`precio`),
  KEY `transaccion_ibfk_3_idx` (`unidad_medida`),
  KEY `transaccion_ibfk_4_idx` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,1,1.00,40.000,1,40.00,0.00,0.00),(2,2,2,1.00,3.000,1,3.00,0.00,0.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleingreso`
--

DROP TABLE IF EXISTS `detalleingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleingreso` (
  `id_detalle_ingreso` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ingreso` bigint(20) DEFAULT NULL,
  `id_producto` bigint(20) DEFAULT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `precio` decimal(18,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `unidad_medida` bigint(20) DEFAULT NULL,
  `total_detalle` decimal(20,2) DEFAULT NULL,
  `precio_venta` decimal(18,2) DEFAULT '0.00',
  PRIMARY KEY (`id_detalle_ingreso`),
  KEY `DetalleOrdenCompraFKOrdenCompra_idx` (`id_ingreso`),
  KEY `fk_detalle_ingreso2_idx` (`id_producto`),
  KEY `fk_detalle_ingreso3_idx` (`unidad_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleingreso`
--

LOCK TABLES `detalleingreso` WRITE;
/*!40000 ALTER TABLE `detalleingreso` DISABLE KEYS */;
INSERT INTO `detalleingreso` VALUES (1,3,1,50.00,3.25,1,1,162.50,1.00);
/*!40000 ALTER TABLE `detalleingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleingreso_contable`
--

DROP TABLE IF EXISTS `detalleingreso_contable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleingreso_contable` (
  `id_detalle_ingreso` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_ingreso` bigint(20) DEFAULT NULL,
  `id_producto` bigint(20) DEFAULT NULL,
  `cantidad` decimal(18,2) DEFAULT NULL,
  `precio` decimal(18,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `unidad_medida` bigint(20) DEFAULT NULL,
  `total_detalle` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_ingreso`),
  KEY `id_ingreso` (`id_ingreso`),
  KEY `id_producto` (`id_producto`),
  KEY `unidad_medida` (`unidad_medida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleingreso_contable`
--

LOCK TABLES `detalleingreso_contable` WRITE;
/*!40000 ALTER TABLE `detalleingreso_contable` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleingreso_contable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distrito`
--

DROP TABLE IF EXISTS `distrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ciudad_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `idUbigeo` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1857 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distrito`
--

LOCK TABLES `distrito` WRITE;
/*!40000 ALTER TABLE `distrito` DISABLE KEYS */;
INSERT INTO `distrito` VALUES (1,1,'Chachapoyas',NULL,'010101'),(2,1,'Asunción',NULL,'010102'),(3,1,'Balsas',NULL,'010103'),(4,1,'Cheto',NULL,'010104'),(5,1,'Chiliquin',NULL,'010105'),(6,1,'Chuquibamba',NULL,'010106'),(7,1,'Granada',NULL,'010107'),(8,1,'Huancas',NULL,'010108'),(9,1,'La Jalca',NULL,'010109'),(10,1,'Leimebamba',NULL,'010110'),(11,1,'Levanto',NULL,'010111'),(12,1,'Magdalena',NULL,'010112'),(13,1,'Mariscal Castilla',NULL,'010113'),(14,1,'Molinopampa',NULL,'010114'),(15,1,'Montevideo',NULL,'010115'),(16,1,'Olleros',NULL,'010116'),(17,1,'Quinjalca',NULL,'010117'),(18,1,'San Francisco de Daguas',NULL,'010118'),(19,1,'San Isidro de Maino',NULL,'010119'),(20,1,'Soloco',NULL,'010120'),(21,1,'Sonche',NULL,'010121'),(22,2,'Bagua',NULL,'010201'),(23,2,'Aramango',NULL,'010202'),(24,2,'Copallin',NULL,'010203'),(25,2,'El Parco',NULL,'010204'),(26,2,'Imaza',NULL,'010205'),(27,2,'La Peca',NULL,'010206'),(28,3,'Jumbilla',NULL,'010301'),(29,3,'Chisquilla',NULL,'010302'),(30,3,'Churuja',NULL,'010303'),(31,3,'Corosha',NULL,'010304'),(32,3,'Cuispes',NULL,'010305'),(33,3,'Florida',NULL,'010306'),(34,3,'Jazan',NULL,'010307'),(35,3,'Recta',NULL,'010308'),(36,3,'San Carlos',NULL,'010309'),(37,3,'Shipasbamba',NULL,'010310'),(38,3,'Valera',NULL,'010311'),(39,3,'Yambrasbamba',NULL,'010312'),(40,4,'Nieva',NULL,'010401'),(41,4,'El Cenepa',NULL,'010402'),(42,4,'Río Santiago',NULL,'010403'),(43,5,'Lamud',NULL,'010501'),(44,5,'Camporredondo',NULL,'010502'),(45,5,'Cocabamba',NULL,'010503'),(46,5,'Colcamar',NULL,'010504'),(47,5,'Conila',NULL,'010505'),(48,5,'Inguilpata',NULL,'010506'),(49,5,'Longuita',NULL,'010507'),(50,5,'Lonya Chico',NULL,'010508'),(51,5,'Luya',NULL,'010509'),(52,5,'Luya Viejo',NULL,'010510'),(53,5,'María',NULL,'010511'),(54,5,'Ocalli',NULL,'010512'),(55,5,'Ocumal',NULL,'010513'),(56,5,'Pisuquia',NULL,'010514'),(57,5,'Providencia',NULL,'010515'),(58,5,'San Cristóbal',NULL,'010516'),(59,5,'San Francisco de Yeso',NULL,'010517'),(60,5,'San Jerónimo',NULL,'010518'),(61,5,'San Juan de Lopecancha',NULL,'010519'),(62,5,'Santa Catalina',NULL,'010520'),(63,5,'Santo Tomas',NULL,'010521'),(64,5,'Tingo',NULL,'010522'),(65,5,'Trita',NULL,'010523'),(66,6,'San Nicolás',NULL,'010601'),(67,6,'Chirimoto',NULL,'010602'),(68,6,'Cochamal',NULL,'010603'),(69,6,'Huambo',NULL,'010604'),(70,6,'Limabamba',NULL,'010605'),(71,6,'Longar',NULL,'010606'),(72,6,'Mariscal Benavides',NULL,'010607'),(73,6,'Milpuc',NULL,'010608'),(74,6,'Omia',NULL,'010609'),(75,6,'Santa Rosa',NULL,'010610'),(76,6,'Totora',NULL,'010611'),(77,6,'Vista Alegre',NULL,'010612'),(78,7,'Bagua Grande',NULL,'010701'),(79,7,'Cajaruro',NULL,'010702'),(80,7,'Cumba',NULL,'010703'),(81,7,'El Milagro',NULL,'010704'),(82,7,'Jamalca',NULL,'010705'),(83,7,'Lonya Grande',NULL,'010706'),(84,7,'Yamon',NULL,'010707'),(85,8,'Huaraz',NULL,'020101'),(86,8,'Cochabamba',NULL,'020102'),(87,8,'Colcabamba',NULL,'020103'),(88,8,'Huanchay',NULL,'020104'),(89,8,'Independencia',NULL,'020105'),(90,8,'Jangas',NULL,'020106'),(91,8,'La Libertad',NULL,'020107'),(92,8,'Olleros',NULL,'020108'),(93,8,'Pampas Grande',NULL,'020109'),(94,8,'Pariacoto',NULL,'020110'),(95,8,'Pira',NULL,'020111'),(96,8,'Tarica',NULL,'020112'),(97,9,'Aija',NULL,'020201'),(98,9,'Coris',NULL,'020202'),(99,9,'Huacllan',NULL,'020203'),(100,9,'La Merced',NULL,'020204'),(101,9,'Succha',NULL,'020205'),(102,10,'Llamellin',NULL,'020301'),(103,10,'Aczo',NULL,'020302'),(104,10,'Chaccho',NULL,'020303'),(105,10,'Chingas',NULL,'020304'),(106,10,'Mirgas',NULL,'020305'),(107,10,'San Juan de Rontoy',NULL,'020306'),(108,11,'Chacas',NULL,'020401'),(109,11,'Acochaca',NULL,'020402'),(110,12,'Chiquian',NULL,'020501'),(111,12,'Abelardo Pardo Lezameta',NULL,'020502'),(112,12,'Antonio Raymondi',NULL,'020503'),(113,12,'Aquia',NULL,'020504'),(114,12,'Cajacay',NULL,'020505'),(115,12,'Canis',NULL,'020506'),(116,12,'Colquioc',NULL,'020507'),(117,12,'Huallanca',NULL,'020508'),(118,12,'Huasta',NULL,'020509'),(119,12,'Huayllacayan',NULL,'020510'),(120,12,'La Primavera',NULL,'020511'),(121,12,'Mangas',NULL,'020512'),(122,12,'Pacllon',NULL,'020513'),(123,12,'San Miguel de Corpanqui',NULL,'020514'),(124,12,'Ticllos',NULL,'020515'),(125,13,'Carhuaz',NULL,'020601'),(126,13,'Acopampa',NULL,'020602'),(127,13,'Amashca',NULL,'020603'),(128,13,'Anta',NULL,'020604'),(129,13,'Ataquero',NULL,'020605'),(130,13,'Marcara',NULL,'020606'),(131,13,'Pariahuanca',NULL,'020607'),(132,13,'San Miguel de Aco',NULL,'020608'),(133,13,'Shilla',NULL,'020609'),(134,13,'Tinco',NULL,'020610'),(135,13,'Yungar',NULL,'020611'),(136,14,'San Luis',NULL,'020701'),(137,14,'San Nicolás',NULL,'020702'),(138,14,'Yauya',NULL,'020703'),(139,15,'Casma',NULL,'020801'),(140,15,'Buena Vista Alta',NULL,'020802'),(141,15,'Comandante Noel',NULL,'020803'),(142,15,'Yautan',NULL,'020804'),(143,16,'Corongo',NULL,'020901'),(144,16,'Aco',NULL,'020902'),(145,16,'Bambas',NULL,'020903'),(146,16,'Cusca',NULL,'020904'),(147,16,'La Pampa',NULL,'020905'),(148,16,'Yanac',NULL,'020906'),(149,16,'Yupan',NULL,'020907'),(150,17,'Huari',NULL,'021001'),(151,17,'Anra',NULL,'021002'),(152,17,'Cajay',NULL,'021003'),(153,17,'Chavin de Huantar',NULL,'021004'),(154,17,'Huacachi',NULL,'021005'),(155,17,'Huacchis',NULL,'021006'),(156,17,'Huachis',NULL,'021007'),(157,17,'Huantar',NULL,'021008'),(158,17,'Masin',NULL,'021009'),(159,17,'Paucas',NULL,'021010'),(160,17,'Ponto',NULL,'021011'),(161,17,'Rahuapampa',NULL,'021012'),(162,17,'Rapayan',NULL,'021013'),(163,17,'San Marcos',NULL,'021014'),(164,17,'San Pedro de Chana',NULL,'021015'),(165,17,'Uco',NULL,'021016'),(166,18,'Huarmey',NULL,'021101'),(167,18,'Cochapeti',NULL,'021102'),(168,18,'Culebras',NULL,'021103'),(169,18,'Huayan',NULL,'021104'),(170,18,'Malvas',NULL,'021105'),(171,19,'Caraz',NULL,'021201'),(172,19,'Huallanca',NULL,'021202'),(173,19,'Huata',NULL,'021203'),(174,19,'Huaylas',NULL,'021204'),(175,19,'Mato',NULL,'021205'),(176,19,'Pamparomas',NULL,'021206'),(177,19,'Pueblo Libre',NULL,'021207'),(178,19,'Santa Cruz',NULL,'021208'),(179,19,'Santo Toribio',NULL,'021209'),(180,19,'Yuracmarca',NULL,'021210'),(181,20,'Piscobamba',NULL,'021301'),(182,20,'Casca',NULL,'021302'),(183,20,'Eleazar Guzmán Barron',NULL,'021303'),(184,20,'Fidel Olivas Escudero',NULL,'021304'),(185,20,'Llama',NULL,'021305'),(186,20,'Llumpa',NULL,'021306'),(187,20,'Lucma',NULL,'021307'),(188,20,'Musga',NULL,'021308'),(189,21,'Ocros',NULL,'021401'),(190,21,'Acas',NULL,'021402'),(191,21,'Cajamarquilla',NULL,'021403'),(192,21,'Carhuapampa',NULL,'021404'),(193,21,'Cochas',NULL,'021405'),(194,21,'Congas',NULL,'021406'),(195,21,'Llipa',NULL,'021407'),(196,21,'San Cristóbal de Rajan',NULL,'021408'),(197,21,'San Pedro',NULL,'021409'),(198,21,'Santiago de Chilcas',NULL,'021410'),(199,22,'Cabana',NULL,'021501'),(200,22,'Bolognesi',NULL,'021502'),(201,22,'Conchucos',NULL,'021503'),(202,22,'Huacaschuque',NULL,'021504'),(203,22,'Huandoval',NULL,'021505'),(204,22,'Lacabamba',NULL,'021506'),(205,22,'Llapo',NULL,'021507'),(206,22,'Pallasca',NULL,'021508'),(207,22,'Pampas',NULL,'021509'),(208,22,'Santa Rosa',NULL,'021510'),(209,22,'Tauca',NULL,'021511'),(210,23,'Pomabamba',NULL,'021601'),(211,23,'Huayllan',NULL,'021602'),(212,23,'Parobamba',NULL,'021603'),(213,23,'Quinuabamba',NULL,'021604'),(214,24,'Recuay',NULL,'021701'),(215,24,'Catac',NULL,'021702'),(216,24,'Cotaparaco',NULL,'021703'),(217,24,'Huayllapampa',NULL,'021704'),(218,24,'Llacllin',NULL,'021705'),(219,24,'Marca',NULL,'021706'),(220,24,'Pampas Chico',NULL,'021707'),(221,24,'Pararin',NULL,'021708'),(222,24,'Tapacocha',NULL,'021709'),(223,24,'Ticapampa',NULL,'021710'),(224,25,'Chimbote',NULL,'021801'),(225,25,'Cáceres del Perú',NULL,'021802'),(226,25,'Coishco',NULL,'021803'),(227,25,'Macate',NULL,'021804'),(228,25,'Moro',NULL,'021805'),(229,25,'Nepeña',NULL,'021806'),(230,25,'Samanco',NULL,'021807'),(231,25,'Santa',NULL,'021808'),(232,25,'Nuevo Chimbote',NULL,'021809'),(233,26,'Sihuas',NULL,'021901'),(234,26,'Acobamba',NULL,'021902'),(235,26,'Alfonso Ugarte',NULL,'021903'),(236,26,'Cashapampa',NULL,'021904'),(237,26,'Chingalpo',NULL,'021905'),(238,26,'Huayllabamba',NULL,'021906'),(239,26,'Quiches',NULL,'021907'),(240,26,'Ragash',NULL,'021908'),(241,26,'San Juan',NULL,'021909'),(242,26,'Sicsibamba',NULL,'021910'),(243,27,'Yungay',NULL,'022001'),(244,27,'Cascapara',NULL,'022002'),(245,27,'Mancos',NULL,'022003'),(246,27,'Matacoto',NULL,'022004'),(247,27,'Quillo',NULL,'022005'),(248,27,'Ranrahirca',NULL,'022006'),(249,27,'Shupluy',NULL,'022007'),(250,27,'Yanama',NULL,'022008'),(251,28,'Abancay',NULL,'030101'),(252,28,'Chacoche',NULL,'030102'),(253,28,'Circa',NULL,'030103'),(254,28,'Curahuasi',NULL,'030104'),(255,28,'Huanipaca',NULL,'030105'),(256,28,'Lambrama',NULL,'030106'),(257,28,'Pichirhua',NULL,'030107'),(258,28,'San Pedro de Cachora',NULL,'030108'),(259,28,'Tamburco',NULL,'030109'),(260,29,'Andahuaylas',NULL,'030201'),(261,29,'Andarapa',NULL,'030202'),(262,29,'Chiara',NULL,'030203'),(263,29,'Huancarama',NULL,'030204'),(264,29,'Huancaray',NULL,'030205'),(265,29,'Huayana',NULL,'030206'),(266,29,'Kishuara',NULL,'030207'),(267,29,'Pacobamba',NULL,'030208'),(268,29,'Pacucha',NULL,'030209'),(269,29,'Pampachiri',NULL,'030210'),(270,29,'Pomacocha',NULL,'030211'),(271,29,'San Antonio de Cachi',NULL,'030212'),(272,29,'San Jerónimo',NULL,'030213'),(273,29,'San Miguel de Chaccrampa',NULL,'030214'),(274,29,'Santa María de Chicmo',NULL,'030215'),(275,29,'Talavera',NULL,'030216'),(276,29,'Tumay Huaraca',NULL,'030217'),(277,29,'Turpo',NULL,'030218'),(278,29,'Kaquiabamba',NULL,'030219'),(279,29,'José María Arguedas',NULL,'030220'),(280,30,'Antabamba',NULL,'030301'),(281,30,'El Oro',NULL,'030302'),(282,30,'Huaquirca',NULL,'030303'),(283,30,'Juan Espinoza Medrano',NULL,'030304'),(284,30,'Oropesa',NULL,'030305'),(285,30,'Pachaconas',NULL,'030306'),(286,30,'Sabaino',NULL,'030307'),(287,31,'Chalhuanca',NULL,'030401'),(288,31,'Capaya',NULL,'030402'),(289,31,'Caraybamba',NULL,'030403'),(290,31,'Chapimarca',NULL,'030404'),(291,31,'Colcabamba',NULL,'030405'),(292,31,'Cotaruse',NULL,'030406'),(293,31,'Huayllo',NULL,'030407'),(294,31,'Justo Apu Sahuaraura',NULL,'030408'),(295,31,'Lucre',NULL,'030409'),(296,31,'Pocohuanca',NULL,'030410'),(297,31,'San Juan de Chacña',NULL,'030411'),(298,31,'Sañayca',NULL,'030412'),(299,31,'Soraya',NULL,'030413'),(300,31,'Tapairihua',NULL,'030414'),(301,31,'Tintay',NULL,'030415'),(302,31,'Toraya',NULL,'030416'),(303,31,'Yanaca',NULL,'030417'),(304,32,'Tambobamba',NULL,'030501'),(305,32,'Cotabambas',NULL,'030502'),(306,32,'Coyllurqui',NULL,'030503'),(307,32,'Haquira',NULL,'030504'),(308,32,'Mara',NULL,'030505'),(309,32,'Challhuahuacho',NULL,'030506'),(310,33,'Chincheros',NULL,'030601'),(311,33,'Anco_Huallo',NULL,'030602'),(312,33,'Cocharcas',NULL,'030603'),(313,33,'Huaccana',NULL,'030604'),(314,33,'Ocobamba',NULL,'030605'),(315,33,'Ongoy',NULL,'030606'),(316,33,'Uranmarca',NULL,'030607'),(317,33,'Ranracancha',NULL,'030608'),(318,34,'Chuquibambilla',NULL,'030701'),(319,34,'Curpahuasi',NULL,'030702'),(320,34,'Gamarra',NULL,'030703'),(321,34,'Huayllati',NULL,'030704'),(322,34,'Mamara',NULL,'030705'),(323,34,'Micaela Bastidas',NULL,'030706'),(324,34,'Pataypampa',NULL,'030707'),(325,34,'Progreso',NULL,'030708'),(326,34,'San Antonio',NULL,'030709'),(327,34,'Santa Rosa',NULL,'030710'),(328,34,'Turpay',NULL,'030711'),(329,34,'Vilcabamba',NULL,'030712'),(330,34,'Virundo',NULL,'030713'),(331,34,'Curasco',NULL,'030714'),(332,35,'Arequipa',NULL,'040101'),(333,35,'Alto Selva Alegre',NULL,'040102'),(334,35,'Cayma',NULL,'040103'),(335,35,'Cerro Colorado',NULL,'040104'),(336,35,'Characato',NULL,'040105'),(337,35,'Chiguata',NULL,'040106'),(338,35,'Jacobo Hunter',NULL,'040107'),(339,35,'La Joya',NULL,'040108'),(340,35,'Mariano Melgar',NULL,'040109'),(341,35,'Miraflores',NULL,'040110'),(342,35,'Mollebaya',NULL,'040111'),(343,35,'Paucarpata',NULL,'040112'),(344,35,'Pocsi',NULL,'040113'),(345,35,'Polobaya',NULL,'040114'),(346,35,'Quequeña',NULL,'040115'),(347,35,'Sabandia',NULL,'040116'),(348,35,'Sachaca',NULL,'040117'),(349,35,'San Juan de Siguas',NULL,'040118'),(350,35,'San Juan de Tarucani',NULL,'040119'),(351,35,'Santa Isabel de Siguas',NULL,'040120'),(352,35,'Santa Rita de Siguas',NULL,'040121'),(353,35,'Socabaya',NULL,'040122'),(354,35,'Tiabaya',NULL,'040123'),(355,35,'Uchumayo',NULL,'040124'),(356,35,'Vitor',NULL,'040125'),(357,35,'Yanahuara',NULL,'040126'),(358,35,'Yarabamba',NULL,'040127'),(359,35,'Yura',NULL,'040128'),(360,35,'José Luis Bustamante Y Rivero',NULL,'040129'),(361,36,'Camaná',NULL,'040201'),(362,36,'José María Quimper',NULL,'040202'),(363,36,'Mariano Nicolás Valcárcel',NULL,'040203'),(364,36,'Mariscal Cáceres',NULL,'040204'),(365,36,'Nicolás de Pierola',NULL,'040205'),(366,36,'Ocoña',NULL,'040206'),(367,36,'Quilca',NULL,'040207'),(368,36,'Samuel Pastor',NULL,'040208'),(369,37,'Caravelí',NULL,'040301'),(370,37,'Acarí',NULL,'040302'),(371,37,'Atico',NULL,'040303'),(372,37,'Atiquipa',NULL,'040304'),(373,37,'Bella Unión',NULL,'040305'),(374,37,'Cahuacho',NULL,'040306'),(375,37,'Chala',NULL,'040307'),(376,37,'Chaparra',NULL,'040308'),(377,37,'Huanuhuanu',NULL,'040309'),(378,37,'Jaqui',NULL,'040310'),(379,37,'Lomas',NULL,'040311'),(380,37,'Quicacha',NULL,'040312'),(381,37,'Yauca',NULL,'040313'),(382,38,'Aplao',NULL,'040401'),(383,38,'Andagua',NULL,'040402'),(384,38,'Ayo',NULL,'040403'),(385,38,'Chachas',NULL,'040404'),(386,38,'Chilcaymarca',NULL,'040405'),(387,38,'Choco',NULL,'040406'),(388,38,'Huancarqui',NULL,'040407'),(389,38,'Machaguay',NULL,'040408'),(390,38,'Orcopampa',NULL,'040409'),(391,38,'Pampacolca',NULL,'040410'),(392,38,'Tipan',NULL,'040411'),(393,38,'Uñon',NULL,'040412'),(394,38,'Uraca',NULL,'040413'),(395,38,'Viraco',NULL,'040414'),(396,39,'Chivay',NULL,'040501'),(397,39,'Achoma',NULL,'040502'),(398,39,'Cabanaconde',NULL,'040503'),(399,39,'Callalli',NULL,'040504'),(400,39,'Caylloma',NULL,'040505'),(401,39,'Coporaque',NULL,'040506'),(402,39,'Huambo',NULL,'040507'),(403,39,'Huanca',NULL,'040508'),(404,39,'Ichupampa',NULL,'040509'),(405,39,'Lari',NULL,'040510'),(406,39,'Lluta',NULL,'040511'),(407,39,'Maca',NULL,'040512'),(408,39,'Madrigal',NULL,'040513'),(409,39,'San Antonio de Chuca',NULL,'040514'),(410,39,'Sibayo',NULL,'040515'),(411,39,'Tapay',NULL,'040516'),(412,39,'Tisco',NULL,'040517'),(413,39,'Tuti',NULL,'040518'),(414,39,'Yanque',NULL,'040519'),(415,39,'Majes',NULL,'040520'),(416,40,'Chuquibamba',NULL,'040601'),(417,40,'Andaray',NULL,'040602'),(418,40,'Cayarani',NULL,'040603'),(419,40,'Chichas',NULL,'040604'),(420,40,'Iray',NULL,'040605'),(421,40,'Río Grande',NULL,'040606'),(422,40,'Salamanca',NULL,'040607'),(423,40,'Yanaquihua',NULL,'040608'),(424,41,'Mollendo',NULL,'040701'),(425,41,'Cocachacra',NULL,'040702'),(426,41,'Dean Valdivia',NULL,'040703'),(427,41,'Islay',NULL,'040704'),(428,41,'Mejia',NULL,'040705'),(429,41,'Punta de Bombón',NULL,'040706'),(430,42,'Cotahuasi',NULL,'040801'),(431,42,'Alca',NULL,'040802'),(432,42,'Charcana',NULL,'040803'),(433,42,'Huaynacotas',NULL,'040804'),(434,42,'Pampamarca',NULL,'040805'),(435,42,'Puyca',NULL,'040806'),(436,42,'Quechualla',NULL,'040807'),(437,42,'Sayla',NULL,'040808'),(438,42,'Tauria',NULL,'040809'),(439,42,'Tomepampa',NULL,'040810'),(440,42,'Toro',NULL,'040811'),(441,43,'Ayacucho',NULL,'050101'),(442,43,'Acocro',NULL,'050102'),(443,43,'Acos Vinchos',NULL,'050103'),(444,43,'Carmen Alto',NULL,'050104'),(445,43,'Chiara',NULL,'050105'),(446,43,'Ocros',NULL,'050106'),(447,43,'Pacaycasa',NULL,'050107'),(448,43,'Quinua',NULL,'050108'),(449,43,'San José de Ticllas',NULL,'050109'),(450,43,'San Juan Bautista',NULL,'050110'),(451,43,'Santiago de Pischa',NULL,'050111'),(452,43,'Socos',NULL,'050112'),(453,43,'Tambillo',NULL,'050113'),(454,43,'Vinchos',NULL,'050114'),(455,43,'Jesús Nazareno',NULL,'050115'),(456,43,'Andrés Avelino Cáceres Dorregaray',NULL,'050116'),(457,44,'Cangallo',NULL,'050201'),(458,44,'Chuschi',NULL,'050202'),(459,44,'Los Morochucos',NULL,'050203'),(460,44,'María Parado de Bellido',NULL,'050204'),(461,44,'Paras',NULL,'050205'),(462,44,'Totos',NULL,'050206'),(463,45,'Sancos',NULL,'050301'),(464,45,'Carapo',NULL,'050302'),(465,45,'Sacsamarca',NULL,'050303'),(466,45,'Santiago de Lucanamarca',NULL,'050304'),(467,46,'Huanta',NULL,'050401'),(468,46,'Ayahuanco',NULL,'050402'),(469,46,'Huamanguilla',NULL,'050403'),(470,46,'Iguain',NULL,'050404'),(471,46,'Luricocha',NULL,'050405'),(472,46,'Santillana',NULL,'050406'),(473,46,'Sivia',NULL,'050407'),(474,46,'Llochegua',NULL,'050408'),(475,46,'Canayre',NULL,'050409'),(476,46,'Uchuraccay',NULL,'050410'),(477,46,'Pucacolpa',NULL,'050411'),(478,47,'San Miguel',NULL,'050501'),(479,47,'Anco',NULL,'050502'),(480,47,'Ayna',NULL,'050503'),(481,47,'Chilcas',NULL,'050504'),(482,47,'Chungui',NULL,'050505'),(483,47,'Luis Carranza',NULL,'050506'),(484,47,'Santa Rosa',NULL,'050507'),(485,47,'Tambo',NULL,'050508'),(486,47,'Samugari',NULL,'050509'),(487,47,'Anchihuay',NULL,'050510'),(488,48,'Puquio',NULL,'050601'),(489,48,'Aucara',NULL,'050602'),(490,48,'Cabana',NULL,'050603'),(491,48,'Carmen Salcedo',NULL,'050604'),(492,48,'Chaviña',NULL,'050605'),(493,48,'Chipao',NULL,'050606'),(494,48,'Huac-Huas',NULL,'050607'),(495,48,'Laramate',NULL,'050608'),(496,48,'Leoncio Prado',NULL,'050609'),(497,48,'Llauta',NULL,'050610'),(498,48,'Lucanas',NULL,'050611'),(499,48,'Ocaña',NULL,'050612'),(500,48,'Otoca',NULL,'050613'),(501,48,'Saisa',NULL,'050614'),(502,48,'San Cristóbal',NULL,'050615'),(503,48,'San Juan',NULL,'050616'),(504,48,'San Pedro',NULL,'050617'),(505,48,'San Pedro de Palco',NULL,'050618'),(506,48,'Sancos',NULL,'050619'),(507,48,'Santa Ana de Huaycahuacho',NULL,'050620'),(508,48,'Santa Lucia',NULL,'050621'),(509,49,'Coracora',NULL,'050701'),(510,49,'Chumpi',NULL,'050702'),(511,49,'Coronel Castañeda',NULL,'050703'),(512,49,'Pacapausa',NULL,'050704'),(513,49,'Pullo',NULL,'050705'),(514,49,'Puyusca',NULL,'050706'),(515,49,'San Francisco de Ravacayco',NULL,'050707'),(516,49,'Upahuacho',NULL,'050708'),(517,50,'Pausa',NULL,'050801'),(518,50,'Colta',NULL,'050802'),(519,50,'Corculla',NULL,'050803'),(520,50,'Lampa',NULL,'050804'),(521,50,'Marcabamba',NULL,'050805'),(522,50,'Oyolo',NULL,'050806'),(523,50,'Pararca',NULL,'050807'),(524,50,'San Javier de Alpabamba',NULL,'050808'),(525,50,'San José de Ushua',NULL,'050809'),(526,50,'Sara Sara',NULL,'050810'),(527,51,'Querobamba',NULL,'050901'),(528,51,'Belén',NULL,'050902'),(529,51,'Chalcos',NULL,'050903'),(530,51,'Chilcayoc',NULL,'050904'),(531,51,'Huacaña',NULL,'050905'),(532,51,'Morcolla',NULL,'050906'),(533,51,'Paico',NULL,'050907'),(534,51,'San Pedro de Larcay',NULL,'050908'),(535,51,'San Salvador de Quije',NULL,'050909'),(536,51,'Santiago de Paucaray',NULL,'050910'),(537,51,'Soras',NULL,'050911'),(538,52,'Huancapi',NULL,'051001'),(539,52,'Alcamenca',NULL,'051002'),(540,52,'Apongo',NULL,'051003'),(541,52,'Asquipata',NULL,'051004'),(542,52,'Canaria',NULL,'051005'),(543,52,'Cayara',NULL,'051006'),(544,52,'Colca',NULL,'051007'),(545,52,'Huamanquiquia',NULL,'051008'),(546,52,'Huancaraylla',NULL,'051009'),(547,52,'Huaya',NULL,'051010'),(548,52,'Sarhua',NULL,'051011'),(549,52,'Vilcanchos',NULL,'051012'),(550,53,'Vilcas Huaman',NULL,'051101'),(551,53,'Accomarca',NULL,'051102'),(552,53,'Carhuanca',NULL,'051103'),(553,53,'Concepción',NULL,'051104'),(554,53,'Huambalpa',NULL,'051105'),(555,53,'Independencia',NULL,'051106'),(556,53,'Saurama',NULL,'051107'),(557,53,'Vischongo',NULL,'051108'),(558,54,'Cajamarca',NULL,'060101'),(559,54,'Asunción',NULL,'060102'),(560,54,'Chetilla',NULL,'060103'),(561,54,'Cospan',NULL,'060104'),(562,54,'Encañada',NULL,'060105'),(563,54,'Jesús',NULL,'060106'),(564,54,'Llacanora',NULL,'060107'),(565,54,'Los Baños del Inca',NULL,'060108'),(566,54,'Magdalena',NULL,'060109'),(567,54,'Matara',NULL,'060110'),(568,54,'Namora',NULL,'060111'),(569,54,'San Juan',NULL,'060112'),(570,55,'Cajabamba',NULL,'060201'),(571,55,'Cachachi',NULL,'060202'),(572,55,'Condebamba',NULL,'060203'),(573,55,'Sitacocha',NULL,'060204'),(574,56,'Celendín',NULL,'060301'),(575,56,'Chumuch',NULL,'060302'),(576,56,'Cortegana',NULL,'060303'),(577,56,'Huasmin',NULL,'060304'),(578,56,'Jorge Chávez',NULL,'060305'),(579,56,'José Gálvez',NULL,'060306'),(580,56,'Miguel Iglesias',NULL,'060307'),(581,56,'Oxamarca',NULL,'060308'),(582,56,'Sorochuco',NULL,'060309'),(583,56,'Sucre',NULL,'060310'),(584,56,'Utco',NULL,'060311'),(585,56,'La Libertad de Pallan',NULL,'060312'),(586,57,'Chota',NULL,'060401'),(587,57,'Anguia',NULL,'060402'),(588,57,'Chadin',NULL,'060403'),(589,57,'Chiguirip',NULL,'060404'),(590,57,'Chimban',NULL,'060405'),(591,57,'Choropampa',NULL,'060406'),(592,57,'Cochabamba',NULL,'060407'),(593,57,'Conchan',NULL,'060408'),(594,57,'Huambos',NULL,'060409'),(595,57,'Lajas',NULL,'060410'),(596,57,'Llama',NULL,'060411'),(597,57,'Miracosta',NULL,'060412'),(598,57,'Paccha',NULL,'060413'),(599,57,'Pion',NULL,'060414'),(600,57,'Querocoto',NULL,'060415'),(601,57,'San Juan de Licupis',NULL,'060416'),(602,57,'Tacabamba',NULL,'060417'),(603,57,'Tocmoche',NULL,'060418'),(604,57,'Chalamarca',NULL,'060419'),(605,58,'Contumaza',NULL,'060501'),(606,58,'Chilete',NULL,'060502'),(607,58,'Cupisnique',NULL,'060503'),(608,58,'Guzmango',NULL,'060504'),(609,58,'San Benito',NULL,'060505'),(610,58,'Santa Cruz de Toledo',NULL,'060506'),(611,58,'Tantarica',NULL,'060507'),(612,58,'Yonan',NULL,'060508'),(613,59,'Cutervo',NULL,'060601'),(614,59,'Callayuc',NULL,'060602'),(615,59,'Choros',NULL,'060603'),(616,59,'Cujillo',NULL,'060604'),(617,59,'La Ramada',NULL,'060605'),(618,59,'Pimpingos',NULL,'060606'),(619,59,'Querocotillo',NULL,'060607'),(620,59,'San Andrés de Cutervo',NULL,'060608'),(621,59,'San Juan de Cutervo',NULL,'060609'),(622,59,'San Luis de Lucma',NULL,'060610'),(623,59,'Santa Cruz',NULL,'060611'),(624,59,'Santo Domingo de la Capilla',NULL,'060612'),(625,59,'Santo Tomas',NULL,'060613'),(626,59,'Socota',NULL,'060614'),(627,59,'Toribio Casanova',NULL,'060615'),(628,60,'Bambamarca',NULL,'060701'),(629,60,'Chugur',NULL,'060702'),(630,60,'Hualgayoc',NULL,'060703'),(631,61,'Jaén',NULL,'060801'),(632,61,'Bellavista',NULL,'060802'),(633,61,'Chontali',NULL,'060803'),(634,61,'Colasay',NULL,'060804'),(635,61,'Huabal',NULL,'060805'),(636,61,'Las Pirias',NULL,'060806'),(637,61,'Pomahuaca',NULL,'060807'),(638,61,'Pucara',NULL,'060808'),(639,61,'Sallique',NULL,'060809'),(640,61,'San Felipe',NULL,'060810'),(641,61,'San José del Alto',NULL,'060811'),(642,61,'Santa Rosa',NULL,'060812'),(643,62,'San Ignacio',NULL,'060901'),(644,62,'Chirinos',NULL,'060902'),(645,62,'Huarango',NULL,'060903'),(646,62,'La Coipa',NULL,'060904'),(647,62,'Namballe',NULL,'060905'),(648,62,'San José de Lourdes',NULL,'060906'),(649,62,'Tabaconas',NULL,'060907'),(650,63,'Pedro Gálvez',NULL,'061001'),(651,63,'Chancay',NULL,'061002'),(652,63,'Eduardo Villanueva',NULL,'061003'),(653,63,'Gregorio Pita',NULL,'061004'),(654,63,'Ichocan',NULL,'061005'),(655,63,'José Manuel Quiroz',NULL,'061006'),(656,63,'José Sabogal',NULL,'061007'),(657,64,'San Miguel',NULL,'061101'),(658,64,'Bolívar',NULL,'061102'),(659,64,'Calquis',NULL,'061103'),(660,64,'Catilluc',NULL,'061104'),(661,64,'El Prado',NULL,'061105'),(662,64,'La Florida',NULL,'061106'),(663,64,'Llapa',NULL,'061107'),(664,64,'Nanchoc',NULL,'061108'),(665,64,'Niepos',NULL,'061109'),(666,64,'San Gregorio',NULL,'061110'),(667,64,'San Silvestre de Cochan',NULL,'061111'),(668,64,'Tongod',NULL,'061112'),(669,64,'Unión Agua Blanca',NULL,'061113'),(670,65,'San Pablo',NULL,'061201'),(671,65,'San Bernardino',NULL,'061202'),(672,65,'San Luis',NULL,'061203'),(673,65,'Tumbaden',NULL,'061204'),(674,66,'Santa Cruz',NULL,'061301'),(675,66,'Andabamba',NULL,'061302'),(676,66,'Catache',NULL,'061303'),(677,66,'Chancaybaños',NULL,'061304'),(678,66,'La Esperanza',NULL,'061305'),(679,66,'Ninabamba',NULL,'061306'),(680,66,'Pulan',NULL,'061307'),(681,66,'Saucepampa',NULL,'061308'),(682,66,'Sexi',NULL,'061309'),(683,66,'Uticyacu',NULL,'061310'),(684,66,'Yauyucan',NULL,'061311'),(685,67,'Callao',NULL,'070101'),(686,67,'Bellavista',NULL,'070102'),(687,67,'Carmen de la Legua Reynoso',NULL,'070103'),(688,67,'La Perla',NULL,'070104'),(689,67,'La Punta',NULL,'070105'),(690,67,'Ventanilla',NULL,'070106'),(691,67,'Mi Perú',NULL,'070107'),(692,68,'Cusco',NULL,'080101'),(693,68,'Ccorca',NULL,'080102'),(694,68,'Poroy',NULL,'080103'),(695,68,'San Jerónimo',NULL,'080104'),(696,68,'San Sebastian',NULL,'080105'),(697,68,'Santiago',NULL,'080106'),(698,68,'Saylla',NULL,'080107'),(699,68,'Wanchaq',NULL,'080108'),(700,69,'Acomayo',NULL,'080201'),(701,69,'Acopia',NULL,'080202'),(702,69,'Acos',NULL,'080203'),(703,69,'Mosoc Llacta',NULL,'080204'),(704,69,'Pomacanchi',NULL,'080205'),(705,69,'Rondocan',NULL,'080206'),(706,69,'Sangarara',NULL,'080207'),(707,70,'Anta',NULL,'080301'),(708,70,'Ancahuasi',NULL,'080302'),(709,70,'Cachimayo',NULL,'080303'),(710,70,'Chinchaypujio',NULL,'080304'),(711,70,'Huarocondo',NULL,'080305'),(712,70,'Limatambo',NULL,'080306'),(713,70,'Mollepata',NULL,'080307'),(714,70,'Pucyura',NULL,'080308'),(715,70,'Zurite',NULL,'080309'),(716,71,'Calca',NULL,'080401'),(717,71,'Coya',NULL,'080402'),(718,71,'Lamay',NULL,'080403'),(719,71,'Lares',NULL,'080404'),(720,71,'Pisac',NULL,'080405'),(721,71,'San Salvador',NULL,'080406'),(722,71,'Taray',NULL,'080407'),(723,71,'Yanatile',NULL,'080408'),(724,72,'Yanaoca',NULL,'080501'),(725,72,'Checca',NULL,'080502'),(726,72,'Kunturkanki',NULL,'080503'),(727,72,'Langui',NULL,'080504'),(728,72,'Layo',NULL,'080505'),(729,72,'Pampamarca',NULL,'080506'),(730,72,'Quehue',NULL,'080507'),(731,72,'Tupac Amaru',NULL,'080508'),(732,73,'Sicuani',NULL,'080601'),(733,73,'Checacupe',NULL,'080602'),(734,73,'Combapata',NULL,'080603'),(735,73,'Marangani',NULL,'080604'),(736,73,'Pitumarca',NULL,'080605'),(737,73,'San Pablo',NULL,'080606'),(738,73,'San Pedro',NULL,'080607'),(739,73,'Tinta',NULL,'080608'),(740,74,'Santo Tomas',NULL,'080701'),(741,74,'Capacmarca',NULL,'080702'),(742,74,'Chamaca',NULL,'080703'),(743,74,'Colquemarca',NULL,'080704'),(744,74,'Livitaca',NULL,'080705'),(745,74,'Llusco',NULL,'080706'),(746,74,'Quiñota',NULL,'080707'),(747,74,'Velille',NULL,'080708'),(748,75,'Espinar',NULL,'080801'),(749,75,'Condoroma',NULL,'080802'),(750,75,'Coporaque',NULL,'080803'),(751,75,'Ocoruro',NULL,'080804'),(752,75,'Pallpata',NULL,'080805'),(753,75,'Pichigua',NULL,'080806'),(754,75,'Suyckutambo',NULL,'080807'),(755,75,'Alto Pichigua',NULL,'080808'),(756,76,'Santa Ana',NULL,'080901'),(757,76,'Echarate',NULL,'080902'),(758,76,'Huayopata',NULL,'080903'),(759,76,'Maranura',NULL,'080904'),(760,76,'Ocobamba',NULL,'080905'),(761,76,'Quellouno',NULL,'080906'),(762,76,'Kimbiri',NULL,'080907'),(763,76,'Santa Teresa',NULL,'080908'),(764,76,'Vilcabamba',NULL,'080909'),(765,76,'Pichari',NULL,'080910'),(766,76,'Inkawasi',NULL,'080911'),(767,76,'Villa Virgen',NULL,'080912'),(768,76,'Villa Kintiarina',NULL,'080913'),(769,77,'Paruro',NULL,'081001'),(770,77,'Accha',NULL,'081002'),(771,77,'Ccapi',NULL,'081003'),(772,77,'Colcha',NULL,'081004'),(773,77,'Huanoquite',NULL,'081005'),(774,77,'Omacha',NULL,'081006'),(775,77,'Paccaritambo',NULL,'081007'),(776,77,'Pillpinto',NULL,'081008'),(777,77,'Yaurisque',NULL,'081009'),(778,78,'Paucartambo',NULL,'081101'),(779,78,'Caicay',NULL,'081102'),(780,78,'Challabamba',NULL,'081103'),(781,78,'Colquepata',NULL,'081104'),(782,78,'Huancarani',NULL,'081105'),(783,78,'Kosñipata',NULL,'081106'),(784,79,'Urcos',NULL,'081201'),(785,79,'Andahuaylillas',NULL,'081202'),(786,79,'Camanti',NULL,'081203'),(787,79,'Ccarhuayo',NULL,'081204'),(788,79,'Ccatca',NULL,'081205'),(789,79,'Cusipata',NULL,'081206'),(790,79,'Huaro',NULL,'081207'),(791,79,'Lucre',NULL,'081208'),(792,79,'Marcapata',NULL,'081209'),(793,79,'Ocongate',NULL,'081210'),(794,79,'Oropesa',NULL,'081211'),(795,79,'Quiquijana',NULL,'081212'),(796,80,'Urubamba',NULL,'081301'),(797,80,'Chinchero',NULL,'081302'),(798,80,'Huayllabamba',NULL,'081303'),(799,80,'Machupicchu',NULL,'081304'),(800,80,'Maras',NULL,'081305'),(801,80,'Ollantaytambo',NULL,'081306'),(802,80,'Yucay',NULL,'081307'),(803,81,'Huancavelica',NULL,'090101'),(804,81,'Acobambilla',NULL,'090102'),(805,81,'Acoria',NULL,'090103'),(806,81,'Conayca',NULL,'090104'),(807,81,'Cuenca',NULL,'090105'),(808,81,'Huachocolpa',NULL,'090106'),(809,81,'Huayllahuara',NULL,'090107'),(810,81,'Izcuchaca',NULL,'090108'),(811,81,'Laria',NULL,'090109'),(812,81,'Manta',NULL,'090110'),(813,81,'Mariscal Cáceres',NULL,'090111'),(814,81,'Moya',NULL,'090112'),(815,81,'Nuevo Occoro',NULL,'090113'),(816,81,'Palca',NULL,'090114'),(817,81,'Pilchaca',NULL,'090115'),(818,81,'Vilca',NULL,'090116'),(819,81,'Yauli',NULL,'090117'),(820,81,'Ascensión',NULL,'090118'),(821,81,'Huando',NULL,'090119'),(822,82,'Acobamba',NULL,'090201'),(823,82,'Andabamba',NULL,'090202'),(824,82,'Anta',NULL,'090203'),(825,82,'Caja',NULL,'090204'),(826,82,'Marcas',NULL,'090205'),(827,82,'Paucara',NULL,'090206'),(828,82,'Pomacocha',NULL,'090207'),(829,82,'Rosario',NULL,'090208'),(830,83,'Lircay',NULL,'090301'),(831,83,'Anchonga',NULL,'090302'),(832,83,'Callanmarca',NULL,'090303'),(833,83,'Ccochaccasa',NULL,'090304'),(834,83,'Chincho',NULL,'090305'),(835,83,'Congalla',NULL,'090306'),(836,83,'Huanca-Huanca',NULL,'090307'),(837,83,'Huayllay Grande',NULL,'090308'),(838,83,'Julcamarca',NULL,'090309'),(839,83,'San Antonio de Antaparco',NULL,'090310'),(840,83,'Santo Tomas de Pata',NULL,'090311'),(841,83,'Secclla',NULL,'090312'),(842,84,'Castrovirreyna',NULL,'090401'),(843,84,'Arma',NULL,'090402'),(844,84,'Aurahua',NULL,'090403'),(845,84,'Capillas',NULL,'090404'),(846,84,'Chupamarca',NULL,'090405'),(847,84,'Cocas',NULL,'090406'),(848,84,'Huachos',NULL,'090407'),(849,84,'Huamatambo',NULL,'090408'),(850,84,'Mollepampa',NULL,'090409'),(851,84,'San Juan',NULL,'090410'),(852,84,'Santa Ana',NULL,'090411'),(853,84,'Tantara',NULL,'090412'),(854,84,'Ticrapo',NULL,'090413'),(855,85,'Churcampa',NULL,'090501'),(856,85,'Anco',NULL,'090502'),(857,85,'Chinchihuasi',NULL,'090503'),(858,85,'El Carmen',NULL,'090504'),(859,85,'La Merced',NULL,'090505'),(860,85,'Locroja',NULL,'090506'),(861,85,'Paucarbamba',NULL,'090507'),(862,85,'San Miguel de Mayocc',NULL,'090508'),(863,85,'San Pedro de Coris',NULL,'090509'),(864,85,'Pachamarca',NULL,'090510'),(865,85,'Cosme',NULL,'090511'),(866,86,'Huaytara',NULL,'090601'),(867,86,'Ayavi',NULL,'090602'),(868,86,'Córdova',NULL,'090603'),(869,86,'Huayacundo Arma',NULL,'090604'),(870,86,'Laramarca',NULL,'090605'),(871,86,'Ocoyo',NULL,'090606'),(872,86,'Pilpichaca',NULL,'090607'),(873,86,'Querco',NULL,'090608'),(874,86,'Quito-Arma',NULL,'090609'),(875,86,'San Antonio de Cusicancha',NULL,'090610'),(876,86,'San Francisco de Sangayaico',NULL,'090611'),(877,86,'San Isidro',NULL,'090612'),(878,86,'Santiago de Chocorvos',NULL,'090613'),(879,86,'Santiago de Quirahuara',NULL,'090614'),(880,86,'Santo Domingo de Capillas',NULL,'090615'),(881,86,'Tambo',NULL,'090616'),(882,87,'Pampas',NULL,'090701'),(883,87,'Acostambo',NULL,'090702'),(884,87,'Acraquia',NULL,'090703'),(885,87,'Ahuaycha',NULL,'090704'),(886,87,'Colcabamba',NULL,'090705'),(887,87,'Daniel Hernández',NULL,'090706'),(888,87,'Huachocolpa',NULL,'090707'),(889,87,'Huaribamba',NULL,'090709'),(890,87,'Ñahuimpuquio',NULL,'090710'),(891,87,'Pazos',NULL,'090711'),(892,87,'Quishuar',NULL,'090713'),(893,87,'Salcabamba',NULL,'090714'),(894,87,'Salcahuasi',NULL,'090715'),(895,87,'San Marcos de Rocchac',NULL,'090716'),(896,87,'Surcubamba',NULL,'090717'),(897,87,'Tintay Puncu',NULL,'090718'),(898,87,'Quichuas',NULL,'090719'),(899,87,'Andaymarca',NULL,'090720'),(900,88,'Huanuco',NULL,'100101'),(901,88,'Amarilis',NULL,'100102'),(902,88,'Chinchao',NULL,'100103'),(903,88,'Churubamba',NULL,'100104'),(904,88,'Margos',NULL,'100105'),(905,88,'Quisqui (Kichki)',NULL,'100106'),(906,88,'San Francisco de Cayran',NULL,'100107'),(907,88,'San Pedro de Chaulan',NULL,'100108'),(908,88,'Santa María del Valle',NULL,'100109'),(909,88,'Yarumayo',NULL,'100110'),(910,88,'Pillco Marca',NULL,'100111'),(911,88,'Yacus',NULL,'100112'),(912,89,'Ambo',NULL,'100201'),(913,89,'Cayna',NULL,'100202'),(914,89,'Colpas',NULL,'100203'),(915,89,'Conchamarca',NULL,'100204'),(916,89,'Huacar',NULL,'100205'),(917,89,'San Francisco',NULL,'100206'),(918,89,'San Rafael',NULL,'100207'),(919,89,'Tomay Kichwa',NULL,'100208'),(920,90,'La Unión',NULL,'100301'),(921,90,'Chuquis',NULL,'100307'),(922,90,'Marías',NULL,'100311'),(923,90,'Pachas',NULL,'100313'),(924,90,'Quivilla',NULL,'100316'),(925,90,'Ripan',NULL,'100317'),(926,90,'Shunqui',NULL,'100321'),(927,90,'Sillapata',NULL,'100322'),(928,90,'Yanas',NULL,'100323'),(929,91,'Huacaybamba',NULL,'100401'),(930,91,'Canchabamba',NULL,'100402'),(931,91,'Cochabamba',NULL,'100403'),(932,91,'Pinra',NULL,'100404'),(933,92,'Llata',NULL,'100501'),(934,92,'Arancay',NULL,'100502'),(935,92,'Chavín de Pariarca',NULL,'100503'),(936,92,'Jacas Grande',NULL,'100504'),(937,92,'Jircan',NULL,'100505'),(938,92,'Miraflores',NULL,'100506'),(939,92,'Monzón',NULL,'100507'),(940,92,'Punchao',NULL,'100508'),(941,92,'Puños',NULL,'100509'),(942,92,'Singa',NULL,'100510'),(943,92,'Tantamayo',NULL,'100511'),(944,93,'Rupa-Rupa',NULL,'100601'),(945,93,'Daniel Alomía Robles',NULL,'100602'),(946,93,'Hermílio Valdizan',NULL,'100603'),(947,93,'José Crespo y Castillo',NULL,'100604'),(948,93,'Luyando',NULL,'100605'),(949,93,'Mariano Damaso Beraun',NULL,'100606'),(950,94,'Huacrachuco',NULL,'100701'),(951,94,'Cholon',NULL,'100702'),(952,94,'San Buenaventura',NULL,'100703'),(953,95,'Panao',NULL,'100801'),(954,95,'Chaglla',NULL,'100802'),(955,95,'Molino',NULL,'100803'),(956,95,'Umari',NULL,'100804'),(957,96,'Puerto Inca',NULL,'100901'),(958,96,'Codo del Pozuzo',NULL,'100902'),(959,96,'Honoria',NULL,'100903'),(960,96,'Tournavista',NULL,'100904'),(961,96,'Yuyapichis',NULL,'100905'),(962,97,'Jesús',NULL,'101001'),(963,97,'Baños',NULL,'101002'),(964,97,'Jivia',NULL,'101003'),(965,97,'Queropalca',NULL,'101004'),(966,97,'Rondos',NULL,'101005'),(967,97,'San Francisco de Asís',NULL,'101006'),(968,97,'San Miguel de Cauri',NULL,'101007'),(969,98,'Chavinillo',NULL,'101101'),(970,98,'Cahuac',NULL,'101102'),(971,98,'Chacabamba',NULL,'101103'),(972,98,'Aparicio Pomares',NULL,'101104'),(973,98,'Jacas Chico',NULL,'101105'),(974,98,'Obas',NULL,'101106'),(975,98,'Pampamarca',NULL,'101107'),(976,98,'Choras',NULL,'101108'),(977,99,'Ica',NULL,'110101'),(978,99,'La Tinguiña',NULL,'110102'),(979,99,'Los Aquijes',NULL,'110103'),(980,99,'Ocucaje',NULL,'110104'),(981,99,'Pachacutec',NULL,'110105'),(982,99,'Parcona',NULL,'110106'),(983,99,'Pueblo Nuevo',NULL,'110107'),(984,99,'Salas',NULL,'110108'),(985,99,'San José de Los Molinos',NULL,'110109'),(986,99,'San Juan Bautista',NULL,'110110'),(987,99,'Santiago',NULL,'110111'),(988,99,'Subtanjalla',NULL,'110112'),(989,99,'Tate',NULL,'110113'),(990,99,'Yauca del Rosario',NULL,'110114'),(991,100,'Chincha Alta',NULL,'110201'),(992,100,'Alto Laran',NULL,'110202'),(993,100,'Chavin',NULL,'110203'),(994,100,'Chincha Baja',NULL,'110204'),(995,100,'El Carmen',NULL,'110205'),(996,100,'Grocio Prado',NULL,'110206'),(997,100,'Pueblo Nuevo',NULL,'110207'),(998,100,'San Juan de Yanac',NULL,'110208'),(999,100,'San Pedro de Huacarpana',NULL,'110209'),(1000,100,'Sunampe',NULL,'110210'),(1001,100,'Tambo de Mora',NULL,'110211'),(1002,101,'Nasca',NULL,'110301'),(1003,101,'Changuillo',NULL,'110302'),(1004,101,'El Ingenio',NULL,'110303'),(1005,101,'Marcona',NULL,'110304'),(1006,101,'Vista Alegre',NULL,'110305'),(1007,102,'Palpa',NULL,'110401'),(1008,102,'Llipata',NULL,'110402'),(1009,102,'Río Grande',NULL,'110403'),(1010,102,'Santa Cruz',NULL,'110404'),(1011,102,'Tibillo',NULL,'110405'),(1012,103,'Pisco',NULL,'110501'),(1013,103,'Huancano',NULL,'110502'),(1014,103,'Humay',NULL,'110503'),(1015,103,'Independencia',NULL,'110504'),(1016,103,'Paracas',NULL,'110505'),(1017,103,'San Andrés',NULL,'110506'),(1018,103,'San Clemente',NULL,'110507'),(1019,103,'Tupac Amaru Inca',NULL,'110508'),(1020,104,'Huancayo',NULL,'120101'),(1021,104,'Carhuacallanga',NULL,'120104'),(1022,104,'Chacapampa',NULL,'120105'),(1023,104,'Chicche',NULL,'120106'),(1024,104,'Chilca',NULL,'120107'),(1025,104,'Chongos Alto',NULL,'120108'),(1026,104,'Chupuro',NULL,'120111'),(1027,104,'Colca',NULL,'120112'),(1028,104,'Cullhuas',NULL,'120113'),(1029,104,'El Tambo',NULL,'120114'),(1030,104,'Huacrapuquio',NULL,'120116'),(1031,104,'Hualhuas',NULL,'120117'),(1032,104,'Huancan',NULL,'120119'),(1033,104,'Huasicancha',NULL,'120120'),(1034,104,'Huayucachi',NULL,'120121'),(1035,104,'Ingenio',NULL,'120122'),(1036,104,'Pariahuanca',NULL,'120124'),(1037,104,'Pilcomayo',NULL,'120125'),(1038,104,'Pucara',NULL,'120126'),(1039,104,'Quichuay',NULL,'120127'),(1040,104,'Quilcas',NULL,'120128'),(1041,104,'San Agustín',NULL,'120129'),(1042,104,'San Jerónimo de Tunan',NULL,'120130'),(1043,104,'Saño',NULL,'120132'),(1044,104,'Sapallanga',NULL,'120133'),(1045,104,'Sicaya',NULL,'120134'),(1046,104,'Santo Domingo de Acobamba',NULL,'120135'),(1047,104,'Viques',NULL,'120136'),(1048,105,'Concepción',NULL,'120201'),(1049,105,'Aco',NULL,'120202'),(1050,105,'Andamarca',NULL,'120203'),(1051,105,'Chambara',NULL,'120204'),(1052,105,'Cochas',NULL,'120205'),(1053,105,'Comas',NULL,'120206'),(1054,105,'Heroínas Toledo',NULL,'120207'),(1055,105,'Manzanares',NULL,'120208'),(1056,105,'Mariscal Castilla',NULL,'120209'),(1057,105,'Matahuasi',NULL,'120210'),(1058,105,'Mito',NULL,'120211'),(1059,105,'Nueve de Julio',NULL,'120212'),(1060,105,'Orcotuna',NULL,'120213'),(1061,105,'San José de Quero',NULL,'120214'),(1062,105,'Santa Rosa de Ocopa',NULL,'120215'),(1063,106,'Chanchamayo',NULL,'120301'),(1064,106,'Perene',NULL,'120302'),(1065,106,'Pichanaqui',NULL,'120303'),(1066,106,'San Luis de Shuaro',NULL,'120304'),(1067,106,'San Ramón',NULL,'120305'),(1068,106,'Vitoc',NULL,'120306'),(1069,107,'Jauja',NULL,'120401'),(1070,107,'Acolla',NULL,'120402'),(1071,107,'Apata',NULL,'120403'),(1072,107,'Ataura',NULL,'120404'),(1073,107,'Canchayllo',NULL,'120405'),(1074,107,'Curicaca',NULL,'120406'),(1075,107,'El Mantaro',NULL,'120407'),(1076,107,'Huamali',NULL,'120408'),(1077,107,'Huaripampa',NULL,'120409'),(1078,107,'Huertas',NULL,'120410'),(1079,107,'Janjaillo',NULL,'120411'),(1080,107,'Julcán',NULL,'120412'),(1081,107,'Leonor Ordóñez',NULL,'120413'),(1082,107,'Llocllapampa',NULL,'120414'),(1083,107,'Marco',NULL,'120415'),(1084,107,'Masma',NULL,'120416'),(1085,107,'Masma Chicche',NULL,'120417'),(1086,107,'Molinos',NULL,'120418'),(1087,107,'Monobamba',NULL,'120419'),(1088,107,'Muqui',NULL,'120420'),(1089,107,'Muquiyauyo',NULL,'120421'),(1090,107,'Paca',NULL,'120422'),(1091,107,'Paccha',NULL,'120423'),(1092,107,'Pancan',NULL,'120424'),(1093,107,'Parco',NULL,'120425'),(1094,107,'Pomacancha',NULL,'120426'),(1095,107,'Ricran',NULL,'120427'),(1096,107,'San Lorenzo',NULL,'120428'),(1097,107,'San Pedro de Chunan',NULL,'120429'),(1098,107,'Sausa',NULL,'120430'),(1099,107,'Sincos',NULL,'120431'),(1100,107,'Tunan Marca',NULL,'120432'),(1101,107,'Yauli',NULL,'120433'),(1102,107,'Yauyos',NULL,'120434'),(1103,108,'Junin',NULL,'120501'),(1104,108,'Carhuamayo',NULL,'120502'),(1105,108,'Ondores',NULL,'120503'),(1106,108,'Ulcumayo',NULL,'120504'),(1107,109,'Satipo',NULL,'120601'),(1108,109,'Coviriali',NULL,'120602'),(1109,109,'Llaylla',NULL,'120603'),(1110,109,'Mazamari',NULL,'120604'),(1111,109,'Pampa Hermosa',NULL,'120605'),(1112,109,'Pangoa',NULL,'120606'),(1113,109,'Río Negro',NULL,'120607'),(1114,109,'Río Tambo',NULL,'120608'),(1115,109,'Vizcatan del Ene',NULL,'120609'),(1116,110,'Tarma',NULL,'120701'),(1117,110,'Acobamba',NULL,'120702'),(1118,110,'Huaricolca',NULL,'120703'),(1119,110,'Huasahuasi',NULL,'120704'),(1120,110,'La Unión',NULL,'120705'),(1121,110,'Palca',NULL,'120706'),(1122,110,'Palcamayo',NULL,'120707'),(1123,110,'San Pedro de Cajas',NULL,'120708'),(1124,110,'Tapo',NULL,'120709'),(1125,111,'La Oroya',NULL,'120801'),(1126,111,'Chacapalpa',NULL,'120802'),(1127,111,'Huay-Huay',NULL,'120803'),(1128,111,'Marcapomacocha',NULL,'120804'),(1129,111,'Morococha',NULL,'120805'),(1130,111,'Paccha',NULL,'120806'),(1131,111,'Santa Bárbara de Carhuacayan',NULL,'120807'),(1132,111,'Santa Rosa de Sacco',NULL,'120808'),(1133,111,'Suitucancha',NULL,'120809'),(1134,111,'Yauli',NULL,'120810'),(1135,112,'Chupaca',NULL,'120901'),(1136,112,'Ahuac',NULL,'120902'),(1137,112,'Chongos Bajo',NULL,'120903'),(1138,112,'Huachac',NULL,'120904'),(1139,112,'Huamancaca Chico',NULL,'120905'),(1140,112,'San Juan de Iscos',NULL,'120906'),(1141,112,'San Juan de Jarpa',NULL,'120907'),(1142,112,'Tres de Diciembre',NULL,'120908'),(1143,112,'Yanacancha',NULL,'120909'),(1144,113,'Trujillo',NULL,'130101'),(1145,113,'El Porvenir',NULL,'130102'),(1146,113,'Florencia de Mora',NULL,'130103'),(1147,113,'Huanchaco',NULL,'130104'),(1148,113,'La Esperanza',NULL,'130105'),(1149,113,'Laredo',NULL,'130106'),(1150,113,'Moche',NULL,'130107'),(1151,113,'Poroto',NULL,'130108'),(1152,113,'Salaverry',NULL,'130109'),(1153,113,'Simbal',NULL,'130110'),(1154,113,'Victor Larco Herrera',NULL,'130111'),(1155,114,'Ascope',NULL,'130201'),(1156,114,'Chicama',NULL,'130202'),(1157,114,'Chocope',NULL,'130203'),(1158,114,'Magdalena de Cao',NULL,'130204'),(1159,114,'Paijan',NULL,'130205'),(1160,114,'Rázuri',NULL,'130206'),(1161,114,'Santiago de Cao',NULL,'130207'),(1162,114,'Casa Grande',NULL,'130208'),(1163,115,'Bolívar',NULL,'130301'),(1164,115,'Bambamarca',NULL,'130302'),(1165,115,'Condormarca',NULL,'130303'),(1166,115,'Longotea',NULL,'130304'),(1167,115,'Uchumarca',NULL,'130305'),(1168,115,'Ucuncha',NULL,'130306'),(1169,116,'Chepen',NULL,'130401'),(1170,116,'Pacanga',NULL,'130402'),(1171,116,'Pueblo Nuevo',NULL,'130403'),(1172,117,'Julcan',NULL,'130501'),(1173,117,'Calamarca',NULL,'130502'),(1174,117,'Carabamba',NULL,'130503'),(1175,117,'Huaso',NULL,'130504'),(1176,118,'Otuzco',NULL,'130601'),(1177,118,'Agallpampa',NULL,'130602'),(1178,118,'Charat',NULL,'130604'),(1179,118,'Huaranchal',NULL,'130605'),(1180,118,'La Cuesta',NULL,'130606'),(1181,118,'Mache',NULL,'130608'),(1182,118,'Paranday',NULL,'130610'),(1183,118,'Salpo',NULL,'130611'),(1184,118,'Sinsicap',NULL,'130613'),(1185,118,'Usquil',NULL,'130614'),(1186,119,'San Pedro de Lloc',NULL,'130701'),(1187,119,'Guadalupe',NULL,'130702'),(1188,119,'Jequetepeque',NULL,'130703'),(1189,119,'Pacasmayo',NULL,'130704'),(1190,119,'San José',NULL,'130705'),(1191,120,'Tayabamba',NULL,'130801'),(1192,120,'Buldibuyo',NULL,'130802'),(1193,120,'Chillia',NULL,'130803'),(1194,120,'Huancaspata',NULL,'130804'),(1195,120,'Huaylillas',NULL,'130805'),(1196,120,'Huayo',NULL,'130806'),(1197,120,'Ongon',NULL,'130807'),(1198,120,'Parcoy',NULL,'130808'),(1199,120,'Pataz',NULL,'130809'),(1200,120,'Pias',NULL,'130810'),(1201,120,'Santiago de Challas',NULL,'130811'),(1202,120,'Taurija',NULL,'130812'),(1203,120,'Urpay',NULL,'130813'),(1204,121,'Huamachuco',NULL,'130901'),(1205,121,'Chugay',NULL,'130902'),(1206,121,'Cochorco',NULL,'130903'),(1207,121,'Curgos',NULL,'130904'),(1208,121,'Marcabal',NULL,'130905'),(1209,121,'Sanagoran',NULL,'130906'),(1210,121,'Sarin',NULL,'130907'),(1211,121,'Sartimbamba',NULL,'130908'),(1212,122,'Santiago de Chuco',NULL,'131001'),(1213,122,'Angasmarca',NULL,'131002'),(1214,122,'Cachicadan',NULL,'131003'),(1215,122,'Mollebamba',NULL,'131004'),(1216,122,'Mollepata',NULL,'131005'),(1217,122,'Quiruvilca',NULL,'131006'),(1218,122,'Santa Cruz de Chuca',NULL,'131007'),(1219,122,'Sitabamba',NULL,'131008'),(1220,123,'Cascas',NULL,'131101'),(1221,123,'Lucma',NULL,'131102'),(1222,123,'Marmot',NULL,'131103'),(1223,123,'Sayapullo',NULL,'131104'),(1224,124,'Viru',NULL,'131201'),(1225,124,'Chao',NULL,'131202'),(1226,124,'Guadalupito',NULL,'131203'),(1227,125,'Chiclayo',NULL,'140101'),(1228,125,'Chongoyape',NULL,'140102'),(1229,125,'Eten',NULL,'140103'),(1230,125,'Eten Puerto',NULL,'140104'),(1231,125,'José Leonardo Ortiz',NULL,'140105'),(1232,125,'La Victoria',NULL,'140106'),(1233,125,'Lagunas',NULL,'140107'),(1234,125,'Monsefu',NULL,'140108'),(1235,125,'Nueva Arica',NULL,'140109'),(1236,125,'Oyotun',NULL,'140110'),(1237,125,'Picsi',NULL,'140111'),(1238,125,'Pimentel',NULL,'140112'),(1239,125,'Reque',NULL,'140113'),(1240,125,'Santa Rosa',NULL,'140114'),(1241,125,'Saña',NULL,'140115'),(1242,125,'Cayalti',NULL,'140116'),(1243,125,'Patapo',NULL,'140117'),(1244,125,'Pomalca',NULL,'140118'),(1245,125,'Pucala',NULL,'140119'),(1246,125,'Tuman',NULL,'140120'),(1247,126,'Ferreñafe',NULL,'140201'),(1248,126,'Cañaris',NULL,'140202'),(1249,126,'Incahuasi',NULL,'140203'),(1250,126,'Manuel Antonio Mesones Muro',NULL,'140204'),(1251,126,'Pitipo',NULL,'140205'),(1252,126,'Pueblo Nuevo',NULL,'140206'),(1253,127,'Lambayeque',NULL,'140301'),(1254,127,'Chochope',NULL,'140302'),(1255,127,'Illimo',NULL,'140303'),(1256,127,'Jayanca',NULL,'140304'),(1257,127,'Mochumi',NULL,'140305'),(1258,127,'Morrope',NULL,'140306'),(1259,127,'Motupe',NULL,'140307'),(1260,127,'Olmos',NULL,'140308'),(1261,127,'Pacora',NULL,'140309'),(1262,127,'Salas',NULL,'140310'),(1263,127,'San José',NULL,'140311'),(1264,127,'Tucume',NULL,'140312'),(1265,128,'Lima',NULL,'150101'),(1266,128,'Ancón',NULL,'150102'),(1267,128,'Ate',NULL,'150103'),(1268,128,'Barranco',NULL,'150104'),(1269,128,'Breña',NULL,'150105'),(1270,128,'Carabayllo',NULL,'150106'),(1271,128,'Chaclacayo',NULL,'150107'),(1272,128,'Chorrillos',NULL,'150108'),(1273,128,'Cieneguilla',NULL,'150109'),(1274,128,'Comas',NULL,'150110'),(1275,128,'El Agustino',NULL,'150111'),(1276,128,'Independencia',NULL,'150112'),(1277,128,'Jesús María',NULL,'150113'),(1278,128,'La Molina',NULL,'150114'),(1279,128,'La Victoria',NULL,'150115'),(1280,128,'Lince',NULL,'150116'),(1281,128,'Los Olivos',NULL,'150117'),(1282,128,'Lurigancho',NULL,'150118'),(1283,128,'Lurin',NULL,'150119'),(1284,128,'Magdalena del Mar',NULL,'150120'),(1285,128,'Pueblo Libre',NULL,'150121'),(1286,128,'Miraflores',NULL,'150122'),(1287,128,'Pachacamac',NULL,'150123'),(1288,128,'Pucusana',NULL,'150124'),(1289,128,'Puente Piedra',NULL,'150125'),(1290,128,'Punta Hermosa',NULL,'150126'),(1291,128,'Punta Negra',NULL,'150127'),(1292,128,'Rímac',NULL,'150128'),(1293,128,'San Bartolo',NULL,'150129'),(1294,128,'San Borja',NULL,'150130'),(1295,128,'San Isidro',NULL,'150131'),(1296,128,'San Juan de Lurigancho',NULL,'150132'),(1297,128,'San Juan de Miraflores',NULL,'150133'),(1298,128,'San Luis',NULL,'150134'),(1299,128,'San Martín de Porres',NULL,'150135'),(1300,128,'San Miguel',NULL,'150136'),(1301,128,'Santa Anita',NULL,'150137'),(1302,128,'Santa María del Mar',NULL,'150138'),(1303,128,'Santa Rosa',NULL,'150139'),(1304,128,'Santiago de Surco',NULL,'150140'),(1305,128,'Surquillo',NULL,'150141'),(1306,128,'Villa El Salvador',NULL,'150142'),(1307,128,'Villa María del Triunfo',NULL,'150143'),(1308,129,'Barranca',NULL,'150201'),(1309,129,'Paramonga',NULL,'150202'),(1310,129,'Pativilca',NULL,'150203'),(1311,129,'Supe',NULL,'150204'),(1312,129,'Supe Puerto',NULL,'150205'),(1313,130,'Cajatambo',NULL,'150301'),(1314,130,'Copa',NULL,'150302'),(1315,130,'Gorgor',NULL,'150303'),(1316,130,'Huancapon',NULL,'150304'),(1317,130,'Manas',NULL,'150305'),(1318,131,'Canta',NULL,'150401'),(1319,131,'Arahuay',NULL,'150402'),(1320,131,'Huamantanga',NULL,'150403'),(1321,131,'Huaros',NULL,'150404'),(1322,131,'Lachaqui',NULL,'150405'),(1323,131,'San Buenaventura',NULL,'150406'),(1324,131,'Santa Rosa de Quives',NULL,'150407'),(1325,132,'San Vicente de Cañete',NULL,'150501'),(1326,132,'Asia',NULL,'150502'),(1327,132,'Calango',NULL,'150503'),(1328,132,'Cerro Azul',NULL,'150504'),(1329,132,'Chilca',NULL,'150505'),(1330,132,'Coayllo',NULL,'150506'),(1331,132,'Imperial',NULL,'150507'),(1332,132,'Lunahuana',NULL,'150508'),(1333,132,'Mala',NULL,'150509'),(1334,132,'Nuevo Imperial',NULL,'150510'),(1335,132,'Pacaran',NULL,'150511'),(1336,132,'Quilmana',NULL,'150512'),(1337,132,'San Antonio',NULL,'150513'),(1338,132,'San Luis',NULL,'150514'),(1339,132,'Santa Cruz de Flores',NULL,'150515'),(1340,132,'Zúñiga',NULL,'150516'),(1341,133,'Huaral',NULL,'150601'),(1342,133,'Atavillos Alto',NULL,'150602'),(1343,133,'Atavillos Bajo',NULL,'150603'),(1344,133,'Aucallama',NULL,'150604'),(1345,133,'Chancay',NULL,'150605'),(1346,133,'Ihuari',NULL,'150606'),(1347,133,'Lampian',NULL,'150607'),(1348,133,'Pacaraos',NULL,'150608'),(1349,133,'San Miguel de Acos',NULL,'150609'),(1350,133,'Santa Cruz de Andamarca',NULL,'150610'),(1351,133,'Sumbilca',NULL,'150611'),(1352,133,'Veintisiete de Noviembre',NULL,'150612'),(1353,134,'Matucana',NULL,'150701'),(1354,134,'Antioquia',NULL,'150702'),(1355,134,'Callahuanca',NULL,'150703'),(1356,134,'Carampoma',NULL,'150704'),(1357,134,'Chicla',NULL,'150705'),(1358,134,'Cuenca',NULL,'150706'),(1359,134,'Huachupampa',NULL,'150707'),(1360,134,'Huanza',NULL,'150708'),(1361,134,'Huarochiri',NULL,'150709'),(1362,134,'Lahuaytambo',NULL,'150710'),(1363,134,'Langa',NULL,'150711'),(1364,134,'Laraos',NULL,'150712'),(1365,134,'Mariatana',NULL,'150713'),(1366,134,'Ricardo Palma',NULL,'150714'),(1367,134,'San Andrés de Tupicocha',NULL,'150715'),(1368,134,'San Antonio',NULL,'150716'),(1369,134,'San Bartolomé',NULL,'150717'),(1370,134,'San Damian',NULL,'150718'),(1371,134,'San Juan de Iris',NULL,'150719'),(1372,134,'San Juan de Tantaranche',NULL,'150720'),(1373,134,'San Lorenzo de Quinti',NULL,'150721'),(1374,134,'San Mateo',NULL,'150722'),(1375,134,'San Mateo de Otao',NULL,'150723'),(1376,134,'San Pedro de Casta',NULL,'150724'),(1377,134,'San Pedro de Huancayre',NULL,'150725'),(1378,134,'Sangallaya',NULL,'150726'),(1379,134,'Santa Cruz de Cocachacra',NULL,'150727'),(1380,134,'Santa Eulalia',NULL,'150728'),(1381,134,'Santiago de Anchucaya',NULL,'150729'),(1382,134,'Santiago de Tuna',NULL,'150730'),(1383,134,'Santo Domingo de Los Olleros',NULL,'150731'),(1384,134,'Surco',NULL,'150732'),(1385,135,'Huacho',NULL,'150801'),(1386,135,'Ambar',NULL,'150802'),(1387,135,'Caleta de Carquin',NULL,'150803'),(1388,135,'Checras',NULL,'150804'),(1389,135,'Hualmay',NULL,'150805'),(1390,135,'Huaura',NULL,'150806'),(1391,135,'Leoncio Prado',NULL,'150807'),(1392,135,'Paccho',NULL,'150808'),(1393,135,'Santa Leonor',NULL,'150809'),(1394,135,'Santa María',NULL,'150810'),(1395,135,'Sayan',NULL,'150811'),(1396,135,'Vegueta',NULL,'150812'),(1397,136,'Oyon',NULL,'150901'),(1398,136,'Andajes',NULL,'150902'),(1399,136,'Caujul',NULL,'150903'),(1400,136,'Cochamarca',NULL,'150904'),(1401,136,'Navan',NULL,'150905'),(1402,136,'Pachangara',NULL,'150906'),(1403,137,'Yauyos',NULL,'151001'),(1404,137,'Alis',NULL,'151002'),(1405,137,'Allauca',NULL,'151003'),(1406,137,'Ayaviri',NULL,'151004'),(1407,137,'Azángaro',NULL,'151005'),(1408,137,'Cacra',NULL,'151006'),(1409,137,'Carania',NULL,'151007'),(1410,137,'Catahuasi',NULL,'151008'),(1411,137,'Chocos',NULL,'151009'),(1412,137,'Cochas',NULL,'151010'),(1413,137,'Colonia',NULL,'151011'),(1414,137,'Hongos',NULL,'151012'),(1415,137,'Huampara',NULL,'151013'),(1416,137,'Huancaya',NULL,'151014'),(1417,137,'Huangascar',NULL,'151015'),(1418,137,'Huantan',NULL,'151016'),(1419,137,'Huañec',NULL,'151017'),(1420,137,'Laraos',NULL,'151018'),(1421,137,'Lincha',NULL,'151019'),(1422,137,'Madean',NULL,'151020'),(1423,137,'Miraflores',NULL,'151021'),(1424,137,'Omas',NULL,'151022'),(1425,137,'Putinza',NULL,'151023'),(1426,137,'Quinches',NULL,'151024'),(1427,137,'Quinocay',NULL,'151025'),(1428,137,'San Joaquín',NULL,'151026'),(1429,137,'San Pedro de Pilas',NULL,'151027'),(1430,137,'Tanta',NULL,'151028'),(1431,137,'Tauripampa',NULL,'151029'),(1432,137,'Tomas',NULL,'151030'),(1433,137,'Tupe',NULL,'151031'),(1434,137,'Viñac',NULL,'151032'),(1435,137,'Vitis',NULL,'151033'),(1436,138,'Iquitos',NULL,'160101'),(1437,138,'Alto Nanay',NULL,'160102'),(1438,138,'Fernando Lores',NULL,'160103'),(1439,138,'Indiana',NULL,'160104'),(1440,138,'Las Amazonas',NULL,'160105'),(1441,138,'Mazan',NULL,'160106'),(1442,138,'Napo',NULL,'160107'),(1443,138,'Punchana',NULL,'160108'),(1444,138,'Torres Causana',NULL,'160110'),(1445,138,'Belén',NULL,'160112'),(1446,138,'San Juan Bautista',NULL,'160113'),(1447,139,'Yurimaguas',NULL,'160201'),(1448,139,'Balsapuerto',NULL,'160202'),(1449,139,'Jeberos',NULL,'160205'),(1450,139,'Lagunas',NULL,'160206'),(1451,139,'Santa Cruz',NULL,'160210'),(1452,139,'Teniente Cesar López Rojas',NULL,'160211'),(1453,140,'Nauta',NULL,'160301'),(1454,140,'Parinari',NULL,'160302'),(1455,140,'Tigre',NULL,'160303'),(1456,140,'Trompeteros',NULL,'160304'),(1457,140,'Urarinas',NULL,'160305'),(1458,141,'Ramón Castilla',NULL,'160401'),(1459,141,'Pebas',NULL,'160402'),(1460,141,'Yavari',NULL,'160403'),(1461,141,'San Pablo',NULL,'160404'),(1462,142,'Requena',NULL,'160501'),(1463,142,'Alto Tapiche',NULL,'160502'),(1464,142,'Capelo',NULL,'160503'),(1465,142,'Emilio San Martín',NULL,'160504'),(1466,142,'Maquia',NULL,'160505'),(1467,142,'Puinahua',NULL,'160506'),(1468,142,'Saquena',NULL,'160507'),(1469,142,'Soplin',NULL,'160508'),(1470,142,'Tapiche',NULL,'160509'),(1471,142,'Jenaro Herrera',NULL,'160510'),(1472,142,'Yaquerana',NULL,'160511'),(1473,143,'Contamana',NULL,'160601'),(1474,143,'Inahuaya',NULL,'160602'),(1475,143,'Padre Márquez',NULL,'160603'),(1476,143,'Pampa Hermosa',NULL,'160604'),(1477,143,'Sarayacu',NULL,'160605'),(1478,143,'Vargas Guerra',NULL,'160606'),(1479,144,'Barranca',NULL,'160701'),(1480,144,'Cahuapanas',NULL,'160702'),(1481,144,'Manseriche',NULL,'160703'),(1482,144,'Morona',NULL,'160704'),(1483,144,'Pastaza',NULL,'160705'),(1484,144,'Andoas',NULL,'160706'),(1485,145,'Putumayo',NULL,'160801'),(1486,145,'Rosa Panduro',NULL,'160802'),(1487,145,'Teniente Manuel Clavero',NULL,'160803'),(1488,145,'Yaguas',NULL,'160804'),(1489,146,'Tambopata',NULL,'170101'),(1490,146,'Inambari',NULL,'170102'),(1491,146,'Las Piedras',NULL,'170103'),(1492,146,'Laberinto',NULL,'170104'),(1493,147,'Manu',NULL,'170201'),(1494,147,'Fitzcarrald',NULL,'170202'),(1495,147,'Madre de Dios',NULL,'170203'),(1496,147,'Huepetuhe',NULL,'170204'),(1497,148,'Iñapari',NULL,'170301'),(1498,148,'Iberia',NULL,'170302'),(1499,148,'Tahuamanu',NULL,'170303'),(1500,149,'Moquegua',NULL,'180101'),(1501,149,'Carumas',NULL,'180102'),(1502,149,'Cuchumbaya',NULL,'180103'),(1503,149,'Samegua',NULL,'180104'),(1504,149,'San Cristóbal',NULL,'180105'),(1505,149,'Torata',NULL,'180106'),(1506,150,'Omate',NULL,'180201'),(1507,150,'Chojata',NULL,'180202'),(1508,150,'Coalaque',NULL,'180203'),(1509,150,'Ichuña',NULL,'180204'),(1510,150,'La Capilla',NULL,'180205'),(1511,150,'Lloque',NULL,'180206'),(1512,150,'Matalaque',NULL,'180207'),(1513,150,'Puquina',NULL,'180208'),(1514,150,'Quinistaquillas',NULL,'180209'),(1515,150,'Ubinas',NULL,'180210'),(1516,150,'Yunga',NULL,'180211'),(1517,151,'Ilo',NULL,'180301'),(1518,151,'El Algarrobal',NULL,'180302'),(1519,151,'Pacocha',NULL,'180303'),(1520,152,'Chaupimarca',NULL,'190101'),(1521,152,'Huachon',NULL,'190102'),(1522,152,'Huariaca',NULL,'190103'),(1523,152,'Huayllay',NULL,'190104'),(1524,152,'Ninacaca',NULL,'190105'),(1525,152,'Pallanchacra',NULL,'190106'),(1526,152,'Paucartambo',NULL,'190107'),(1527,152,'San Francisco de Asís de Yarusyacan',NULL,'190108'),(1528,152,'Simon Bolívar',NULL,'190109'),(1529,152,'Ticlacayan',NULL,'190110'),(1530,152,'Tinyahuarco',NULL,'190111'),(1531,152,'Vicco',NULL,'190112'),(1532,152,'Yanacancha',NULL,'190113'),(1533,153,'Yanahuanca',NULL,'190201'),(1534,153,'Chacayan',NULL,'190202'),(1535,153,'Goyllarisquizga',NULL,'190203'),(1536,153,'Paucar',NULL,'190204'),(1537,153,'San Pedro de Pillao',NULL,'190205'),(1538,153,'Santa Ana de Tusi',NULL,'190206'),(1539,153,'Tapuc',NULL,'190207'),(1540,153,'Vilcabamba',NULL,'190208'),(1541,154,'Oxapampa',NULL,'190301'),(1542,154,'Chontabamba',NULL,'190302'),(1543,154,'Huancabamba',NULL,'190303'),(1544,154,'Palcazu',NULL,'190304'),(1545,154,'Pozuzo',NULL,'190305'),(1546,154,'Puerto Bermúdez',NULL,'190306'),(1547,154,'Villa Rica',NULL,'190307'),(1548,154,'Constitución',NULL,'190308'),(1549,155,'Piura',NULL,'200101'),(1550,155,'Castilla',NULL,'200104'),(1551,155,'Atacaos',NULL,'200105'),(1552,155,'Cura Mori',NULL,'200107'),(1553,155,'El Tallan',NULL,'200108'),(1554,155,'La Arena',NULL,'200109'),(1555,155,'La Unión',NULL,'200110'),(1556,155,'Las Lomas',NULL,'200111'),(1557,155,'Tambo Grande',NULL,'200114'),(1558,155,'Veintiseis de Octubre',NULL,'200115'),(1559,156,'Ayabaca',NULL,'200201'),(1560,156,'Frias',NULL,'200202'),(1561,156,'Jilili',NULL,'200203'),(1562,156,'Lagunas',NULL,'200204'),(1563,156,'Montero',NULL,'200205'),(1564,156,'Pacaipampa',NULL,'200206'),(1565,156,'Paimas',NULL,'200207'),(1566,156,'Sapillica',NULL,'200208'),(1567,156,'Sicchez',NULL,'200209'),(1568,156,'Suyo',NULL,'200210'),(1569,157,'Huancabamba',NULL,'200301'),(1570,157,'Canchaque',NULL,'200302'),(1571,157,'El Carmen de la Frontera',NULL,'200303'),(1572,157,'Huarmaca',NULL,'200304'),(1573,157,'Lalaquiz',NULL,'200305'),(1574,157,'San Miguel de El Faique',NULL,'200306'),(1575,157,'Sondor',NULL,'200307'),(1576,157,'Sondorillo',NULL,'200308'),(1577,158,'Chulucanas',NULL,'200401'),(1578,158,'Buenos Aires',NULL,'200402'),(1579,158,'Chalaco',NULL,'200403'),(1580,158,'La Matanza',NULL,'200404'),(1581,158,'Morropon',NULL,'200405'),(1582,158,'Salitral',NULL,'200406'),(1583,158,'San Juan de Bigote',NULL,'200407'),(1584,158,'Santa Catalina de Mossa',NULL,'200408'),(1585,158,'Santo Domingo',NULL,'200409'),(1586,158,'Yamango',NULL,'200410'),(1587,159,'Paita',NULL,'200501'),(1588,159,'Amotape',NULL,'200502'),(1589,159,'Arenal',NULL,'200503'),(1590,159,'Colan',NULL,'200504'),(1591,159,'La Huaca',NULL,'200505'),(1592,159,'Tamarindo',NULL,'200506'),(1593,159,'Vichayal',NULL,'200507'),(1594,160,'Sullana',NULL,'200601'),(1595,160,'Bellavista',NULL,'200602'),(1596,160,'Ignacio Escudero',NULL,'200603'),(1597,160,'Lancones',NULL,'200604'),(1598,160,'Marcavelica',NULL,'200605'),(1599,160,'Miguel Checa',NULL,'200606'),(1600,160,'Querecotillo',NULL,'200607'),(1601,160,'Salitral',NULL,'200608'),(1602,161,'Pariñas',NULL,'200701'),(1603,161,'El Alto',NULL,'200702'),(1604,161,'La Brea',NULL,'200703'),(1605,161,'Lobitos',NULL,'200704'),(1606,161,'Los Organos',NULL,'200705'),(1607,161,'Mancora',NULL,'200706'),(1608,162,'Sechura',NULL,'200801'),(1609,162,'Bellavista de la Unión',NULL,'200802'),(1610,162,'Bernal',NULL,'200803'),(1611,162,'Cristo Nos Valga',NULL,'200804'),(1612,162,'Vice',NULL,'200805'),(1613,162,'Rinconada Llicuar',NULL,'200806'),(1614,163,'Puno',NULL,'210101'),(1615,163,'Acora',NULL,'210102'),(1616,163,'Amantani',NULL,'210103'),(1617,163,'Atuncolla',NULL,'210104'),(1618,163,'Capachica',NULL,'210105'),(1619,163,'Chucuito',NULL,'210106'),(1620,163,'Coata',NULL,'210107'),(1621,163,'Huata',NULL,'210108'),(1622,163,'Mañazo',NULL,'210109'),(1623,163,'Paucarcolla',NULL,'210110'),(1624,163,'Pichacani',NULL,'210111'),(1625,163,'Plateria',NULL,'210112'),(1626,163,'San Antonio',NULL,'210113'),(1627,163,'Tiquillaca',NULL,'210114'),(1628,163,'Vilque',NULL,'210115'),(1629,164,'Azángaro',NULL,'210201'),(1630,164,'Achaya',NULL,'210202'),(1631,164,'Arapa',NULL,'210203'),(1632,164,'Asillo',NULL,'210204'),(1633,164,'Caminaca',NULL,'210205'),(1634,164,'Chupa',NULL,'210206'),(1635,164,'José Domingo Choquehuanca',NULL,'210207'),(1636,164,'Muñani',NULL,'210208'),(1637,164,'Potoni',NULL,'210209'),(1638,164,'Saman',NULL,'210210'),(1639,164,'San Anton',NULL,'210211'),(1640,164,'San José',NULL,'210212'),(1641,164,'San Juan de Salinas',NULL,'210213'),(1642,164,'Santiago de Pupuja',NULL,'210214'),(1643,164,'Tirapata',NULL,'210215'),(1644,165,'Macusani',NULL,'210301'),(1645,165,'Ajoyani',NULL,'210302'),(1646,165,'Ayapata',NULL,'210303'),(1647,165,'Coasa',NULL,'210304'),(1648,165,'Corani',NULL,'210305'),(1649,165,'Crucero',NULL,'210306'),(1650,165,'Ituata',NULL,'210307'),(1651,165,'Ollachea',NULL,'210308'),(1652,165,'San Gaban',NULL,'210309'),(1653,165,'Usicayos',NULL,'210310'),(1654,166,'Juli',NULL,'210401'),(1655,166,'Desaguadero',NULL,'210402'),(1656,166,'Huacullani',NULL,'210403'),(1657,166,'Kelluyo',NULL,'210404'),(1658,166,'Pisacoma',NULL,'210405'),(1659,166,'Pomata',NULL,'210406'),(1660,166,'Zepita',NULL,'210407'),(1661,167,'Ilave',NULL,'210501'),(1662,167,'Capazo',NULL,'210502'),(1663,167,'Pilcuyo',NULL,'210503'),(1664,167,'Santa Rosa',NULL,'210504'),(1665,167,'Conduriri',NULL,'210505'),(1666,168,'Huancane',NULL,'210601'),(1667,168,'Cojata',NULL,'210602'),(1668,168,'Huatasani',NULL,'210603'),(1669,168,'Inchupalla',NULL,'210604'),(1670,168,'Pusi',NULL,'210605'),(1671,168,'Rosaspata',NULL,'210606'),(1672,168,'Taraco',NULL,'210607'),(1673,168,'Vilque Chico',NULL,'210608'),(1674,169,'Lampa',NULL,'210701'),(1675,169,'Cabanilla',NULL,'210702'),(1676,169,'Calapuja',NULL,'210703'),(1677,169,'Nicasio',NULL,'210704'),(1678,169,'Ocuviri',NULL,'210705'),(1679,169,'Palca',NULL,'210706'),(1680,169,'Paratia',NULL,'210707'),(1681,169,'Pucara',NULL,'210708'),(1682,169,'Santa Lucia',NULL,'210709'),(1683,169,'Vilavila',NULL,'210710'),(1684,170,'Ayaviri',NULL,'210801'),(1685,170,'Antauta',NULL,'210802'),(1686,170,'Cupi',NULL,'210803'),(1687,170,'Llalli',NULL,'210804'),(1688,170,'Macari',NULL,'210805'),(1689,170,'Nuñoa',NULL,'210806'),(1690,170,'Orurillo',NULL,'210807'),(1691,170,'Santa Rosa',NULL,'210808'),(1692,170,'Umachiri',NULL,'210809'),(1693,171,'Moho',NULL,'210901'),(1694,171,'Conima',NULL,'210902'),(1695,171,'Huayrapata',NULL,'210903'),(1696,171,'Tilali',NULL,'210904'),(1697,172,'Putina',NULL,'211001'),(1698,172,'Ananea',NULL,'211002'),(1699,172,'Pedro Vilca Apaza',NULL,'211003'),(1700,172,'Quilcapuncu',NULL,'211004'),(1701,172,'Sina',NULL,'211005'),(1702,173,'Juliaca',NULL,'211101'),(1703,173,'Cabana',NULL,'211102'),(1704,173,'Cabanillas',NULL,'211103'),(1705,173,'Caracoto',NULL,'211104'),(1706,174,'Sandia',NULL,'211201'),(1707,174,'Cuyocuyo',NULL,'211202'),(1708,174,'Limbani',NULL,'211203'),(1709,174,'Patambuco',NULL,'211204'),(1710,174,'Phara',NULL,'211205'),(1711,174,'Quiaca',NULL,'211206'),(1712,174,'San Juan del Oro',NULL,'211207'),(1713,174,'Yanahuaya',NULL,'211208'),(1714,174,'Alto Inambari',NULL,'211209'),(1715,174,'San Pedro de Putina Punco',NULL,'211210'),(1716,175,'Yunguyo',NULL,'211301'),(1717,175,'Anapia',NULL,'211302'),(1718,175,'Copani',NULL,'211303'),(1719,175,'Cuturapi',NULL,'211304'),(1720,175,'Ollaraya',NULL,'211305'),(1721,175,'Tinicachi',NULL,'211306'),(1722,175,'Unicachi',NULL,'211307'),(1723,176,'Moyobamba',NULL,'220101'),(1724,176,'Calzada',NULL,'220102'),(1725,176,'Habana',NULL,'220103'),(1726,176,'Jepelacio',NULL,'220104'),(1727,176,'Soritor',NULL,'220105'),(1728,176,'Yantalo',NULL,'220106'),(1729,177,'Bellavista',NULL,'220201'),(1730,177,'Alto Biavo',NULL,'220202'),(1731,177,'Bajo Biavo',NULL,'220203'),(1732,177,'Huallaga',NULL,'220204'),(1733,177,'San Pablo',NULL,'220205'),(1734,177,'San Rafael',NULL,'220206'),(1735,178,'San José de Sisa',NULL,'220301'),(1736,178,'Agua Blanca',NULL,'220302'),(1737,178,'San Martín',NULL,'220303'),(1738,178,'Santa Rosa',NULL,'220304'),(1739,178,'Shatoja',NULL,'220305'),(1740,179,'Saposoa',NULL,'220401'),(1741,179,'Alto Saposoa',NULL,'220402'),(1742,179,'El Eslabón',NULL,'220403'),(1743,179,'Piscoyacu',NULL,'220404'),(1744,179,'Sacanche',NULL,'220405'),(1745,179,'Tingo de Saposoa',NULL,'220406'),(1746,180,'Lamas',NULL,'220501'),(1747,180,'Alonso de Alvarado',NULL,'220502'),(1748,180,'Barranquita',NULL,'220503'),(1749,180,'Caynarachi',NULL,'220504'),(1750,180,'Cuñumbuqui',NULL,'220505'),(1751,180,'Pinto Recodo',NULL,'220506'),(1752,180,'Rumisapa',NULL,'220507'),(1753,180,'San Roque de Cumbaza',NULL,'220508'),(1754,180,'Shanao',NULL,'220509'),(1755,180,'Tabalosos',NULL,'220510'),(1756,180,'Zapatero',NULL,'220511'),(1757,181,'Juanjuí',NULL,'220601'),(1758,181,'Campanilla',NULL,'220602'),(1759,181,'Huicungo',NULL,'220603'),(1760,181,'Pachiza',NULL,'220604'),(1761,181,'Pajarillo',NULL,'220605'),(1762,182,'Picota',NULL,'220701'),(1763,182,'Buenos Aires',NULL,'220702'),(1764,182,'Caspisapa',NULL,'220703'),(1765,182,'Pilluana',NULL,'220704'),(1766,182,'Pucacaca',NULL,'220705'),(1767,182,'San Cristóbal',NULL,'220706'),(1768,182,'San Hilarión',NULL,'220707'),(1769,182,'Shamboyacu',NULL,'220708'),(1770,182,'Tingo de Ponasa',NULL,'220709'),(1771,182,'Tres Unidos',NULL,'220710'),(1772,183,'Rioja',NULL,'220801'),(1773,183,'Awajun',NULL,'220802'),(1774,183,'Elías Soplin Vargas',NULL,'220803'),(1775,183,'Nueva Cajamarca',NULL,'220804'),(1776,183,'Pardo Miguel',NULL,'220805'),(1777,183,'Posic',NULL,'220806'),(1778,183,'San Fernando',NULL,'220807'),(1779,183,'Yorongos',NULL,'220808'),(1780,183,'Yuracyacu',NULL,'220809'),(1781,184,'Tarapoto',NULL,'220901'),(1782,184,'Alberto Leveau',NULL,'220902'),(1783,184,'Cacatachi',NULL,'220903'),(1784,184,'Chazuta',NULL,'220904'),(1785,184,'Chipurana',NULL,'220905'),(1786,184,'El Porvenir',NULL,'220906'),(1787,184,'Huimbayoc',NULL,'220907'),(1788,184,'Juan Guerra',NULL,'220908'),(1789,184,'La Banda de Shilcayo',NULL,'220909'),(1790,184,'Morales',NULL,'220910'),(1791,184,'Papaplaya',NULL,'220911'),(1792,184,'San Antonio',NULL,'220912'),(1793,184,'Sauce',NULL,'220913'),(1794,184,'Shapaja',NULL,'220914'),(1795,185,'Tocache',NULL,'221001'),(1796,185,'Nuevo Progreso',NULL,'221002'),(1797,185,'Polvora',NULL,'221003'),(1798,185,'Shunte',NULL,'221004'),(1799,185,'Uchiza',NULL,'221005'),(1800,186,'Tacna',NULL,'230101'),(1801,186,'Alto de la Alianza',NULL,'230102'),(1802,186,'Calana',NULL,'230103'),(1803,186,'Ciudad Nueva',NULL,'230104'),(1804,186,'Inclan',NULL,'230105'),(1805,186,'Pachia',NULL,'230106'),(1806,186,'Palca',NULL,'230107'),(1807,186,'Pocollay',NULL,'230108'),(1808,186,'Sama',NULL,'230109'),(1809,186,'Coronel Gregorio Albarracín Lanchipa',NULL,'230110'),(1810,187,'Candarave',NULL,'230201'),(1811,187,'Cairani',NULL,'230202'),(1812,187,'Camilaca',NULL,'230203'),(1813,187,'Curibaya',NULL,'230204'),(1814,187,'Huanuara',NULL,'230205'),(1815,187,'Quilahuani',NULL,'230206'),(1816,188,'Locumba',NULL,'230301'),(1817,188,'Ilabaya',NULL,'230302'),(1818,188,'Ite',NULL,'230303'),(1819,189,'Tarata',NULL,'230401'),(1820,189,'Héroes Albarracín',NULL,'230402'),(1821,189,'Estique',NULL,'230403'),(1822,189,'Estique-Pampa',NULL,'230404'),(1823,189,'Sitajara',NULL,'230405'),(1824,189,'Susapaya',NULL,'230406'),(1825,189,'Tarucachi',NULL,'230407'),(1826,189,'Ticaco',NULL,'230408'),(1827,190,'Tumbes',NULL,'240101'),(1828,190,'Corrales',NULL,'240102'),(1829,190,'La Cruz',NULL,'240103'),(1830,190,'Pampas de Hospital',NULL,'240104'),(1831,190,'San Jacinto',NULL,'240105'),(1832,190,'San Juan de la Virgen',NULL,'240106'),(1833,191,'Zorritos',NULL,'240201'),(1834,191,'Casitas',NULL,'240202'),(1835,191,'Canoas de Punta Sal',NULL,'240203'),(1836,192,'Zarumilla',NULL,'240301'),(1837,192,'Aguas Verdes',NULL,'240302'),(1838,192,'Matapalo',NULL,'240303'),(1839,192,'Papayal',NULL,'240304'),(1840,193,'Calleria',NULL,'250101'),(1841,193,'Campoverde',NULL,'250102'),(1842,193,'Iparia',NULL,'250103'),(1843,193,'Masisea',NULL,'250104'),(1844,193,'Yarinacocha',NULL,'250105'),(1845,193,'Nueva Requena',NULL,'250106'),(1846,193,'Manantay',NULL,'250107'),(1847,194,'Raymondi',NULL,'250201'),(1848,194,'Sepahua',NULL,'250202'),(1849,194,'Tahuania',NULL,'250203'),(1850,194,'Yurua',NULL,'250204'),(1851,195,'Padre Abad',NULL,'250301'),(1852,195,'Irazola',NULL,'250302'),(1853,195,'Curimana',NULL,'250303'),(1854,195,'Neshuya',NULL,'250304'),(1855,195,'Alexander Von Humboldt',NULL,'250305'),(1856,196,'Purus',NULL,'250401');
/*!40000 ALTER TABLE `distrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentos`
--

DROP TABLE IF EXISTS `documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentos` (
  `id_doc` int(11) NOT NULL,
  `des_doc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos`
--

LOCK TABLES `documentos` WRITE;
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
INSERT INTO `documentos` VALUES (1,'FACTURA'),(2,'NOTA CREDITO'),(3,'BOLETA VENTA'),(4,'GUIA DE REMISION'),(5,'PEDIDO COMPRA-VENTA'),(6,'NOTA PEDIDO');
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `estados_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estados_nombre` varchar(45) DEFAULT NULL,
  `pais_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`estados_id`),
  KEY `estado_fk_1_idx` (`pais_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Amazonas',1),(2,'Áncash',1),(3,'Apurímac',1),(4,'Arequipa',1),(5,'Ayacucho',1),(6,'Cajamarca',1),(7,'Callao',1),(8,'Cusco',1),(9,'Huancavelica',1),(10,'Huánuco',1),(11,'Ica',1),(12,'Junín',1),(13,'La Libertad',1),(14,'Lambayeque',1),(15,'Lima',1),(16,'Loreto',1),(17,'Madre de Dios',1),(18,'Moquegua',1),(19,'Pasco',1),(20,'Piura',1),(21,'Puno',1),(22,'San Martín',1),(23,'Tacna',1),(24,'Tumbes',1),(25,'Ucayali',1);
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familia`
--

DROP TABLE IF EXISTS `familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `familia` (
  `id_familia` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_familia` varchar(50) DEFAULT NULL,
  `estatus_familia` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_familia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familia`
--

LOCK TABLES `familia` WRITE;
/*!40000 ALTER TABLE `familia` DISABLE KEYS */;
INSERT INTO `familia` VALUES (1,'familia',1);
/*!40000 ALTER TABLE `familia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garante`
--

DROP TABLE IF EXISTS `garante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `garante` (
  `dni` int(11) NOT NULL,
  `nombre_full` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `refe_direccion` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `centro_traba` varchar(45) DEFAULT NULL,
  `direc_trab` varchar(45) DEFAULT NULL,
  `nombre_conyu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garante`
--

LOCK TABLES `garante` WRITE;
/*!40000 ALTER TABLE `garante` DISABLE KEYS */;
/*!40000 ALTER TABLE `garante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos`
--

DROP TABLE IF EXISTS `gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gastos` (
  `id_gastos` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `descripcion` text,
  `total` float(22,2) DEFAULT NULL,
  `tipo_gasto` bigint(20) DEFAULT NULL,
  `local_id` bigint(20) DEFAULT NULL,
  `status_gastos` tinyint(1) DEFAULT '1',
  `gasto_usuario` bigint(20) DEFAULT NULL,
  `id_moneda` int(11) DEFAULT NULL,
  `tasa_cambio` decimal(4,2) DEFAULT NULL,
  `proveedor_id` bigint(20) DEFAULT NULL,
  `usuario_id` bigint(20) DEFAULT NULL,
  `responsable_id` bigint(20) DEFAULT NULL,
  `motivo_eliminar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_gastos`),
  KEY `tipos_gasto_fk1_idx` (`tipo_gasto`),
  KEY `tipos_gasto_fk2_idx` (`local_id`),
  KEY `gasto_usuario` (`gasto_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos`
--

LOCK TABLES `gastos` WRITE;
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos` (
  `id_grupo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_grupo` varchar(45) DEFAULT NULL,
  `estatus_grupo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'grupo',1);
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos_cliente`
--

DROP TABLE IF EXISTS `grupos_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos_cliente` (
  `id_grupos_cliente` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_grupos_cliente` varchar(255) DEFAULT NULL,
  `status_grupos_cliente` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_grupos_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos_cliente`
--

LOCK TABLES `grupos_cliente` WRITE;
/*!40000 ALTER TABLE `grupos_cliente` DISABLE KEYS */;
INSERT INTO `grupos_cliente` VALUES (1,'Cliente Minorista',1),(2,'Cliente Mayorista',1);
/*!40000 ALTER TABLE `grupos_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos_usuarios`
--

DROP TABLE IF EXISTS `grupos_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos_usuarios` (
  `id_grupos_usuarios` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_grupos_usuarios` varchar(45) DEFAULT NULL,
  `status_grupos_usuarios` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_grupos_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos_usuarios`
--

LOCK TABLES `grupos_usuarios` WRITE;
/*!40000 ALTER TABLE `grupos_usuarios` DISABLE KEYS */;
INSERT INTO `grupos_usuarios` VALUES (1,'CEO APLICATION',1),(2,'Administrador',1),(8,'Ventas',1);
/*!40000 ALTER TABLE `grupos_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_cronograma`
--

DROP TABLE IF EXISTS `historial_cronograma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historial_cronograma` (
  `historialcrono_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cronogramapago_id` bigint(20) DEFAULT NULL,
  `historialcrono_fecha` datetime DEFAULT NULL,
  `historialcrono_monto` float(20,2) DEFAULT NULL,
  `historialcrono_tipopago` bigint(20) DEFAULT NULL,
  `monto_restante` float(20,2) DEFAULT NULL,
  `historialcrono_usuario` bigint(20) DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  `tasa_cambio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`historialcrono_id`),
  KEY `cronogramapago_id` (`cronogramapago_id`),
  KEY `historialcrono_tipopago` (`historialcrono_tipopago`),
  KEY `historialcrono_usuario` (`historialcrono_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_cronograma`
--

LOCK TABLES `historial_cronograma` WRITE;
/*!40000 ALTER TABLE `historial_cronograma` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_cronograma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impuestos`
--

DROP TABLE IF EXISTS `impuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impuestos` (
  `id_impuesto` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_impuesto` varchar(45) DEFAULT NULL,
  `porcentaje_impuesto` float DEFAULT NULL,
  `estatus_impuesto` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_impuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impuestos`
--

LOCK TABLES `impuestos` WRITE;
/*!40000 ALTER TABLE `impuestos` DISABLE KEYS */;
INSERT INTO `impuestos` VALUES (1,'IGV',18,1);
/*!40000 ALTER TABLE `impuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso`
--

DROP TABLE IF EXISTS `ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingreso` (
  `id_ingreso` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `int_Proveedor_id` bigint(20) DEFAULT NULL,
  `nUsuCodigo` bigint(20) DEFAULT NULL,
  `local_id` bigint(20) DEFAULT NULL,
  `tipo_documento` varchar(45) DEFAULT NULL,
  `documento_serie` char(8) DEFAULT NULL,
  `documento_numero` char(20) DEFAULT NULL,
  `ingreso_status` varchar(45) DEFAULT NULL,
  `fecha_emision` timestamp NULL DEFAULT NULL,
  `tipo_ingreso` varchar(45) DEFAULT NULL,
  `impuesto_ingreso` double DEFAULT NULL,
  `sub_total_ingreso` double DEFAULT NULL,
  `total_ingreso` double DEFAULT NULL,
  `pago` varchar(45) DEFAULT NULL,
  `ingreso_observacion` text,
  `costo_por` int(11) DEFAULT NULL,
  `utilidad_por` int(11) DEFAULT NULL,
  `id_moneda` int(11) DEFAULT NULL,
  `tasa_cambio` decimal(4,2) DEFAULT NULL,
  `factura_ingreso_id` bigint(20) DEFAULT NULL,
  `facturado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_ingreso`),
  KEY `fk_OrdenCompra_personal1_idx` (`nUsuCodigo`),
  KEY `fk_OrdenCompra_proveedor_idx` (`int_Proveedor_id`),
  KEY `fk_ingreso_local_idx` (`local_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso`
--

LOCK TABLES `ingreso` WRITE;
/*!40000 ALTER TABLE `ingreso` DISABLE KEYS */;
INSERT INTO `ingreso` VALUES (1,'2018-02-23 17:25:52',1,2,1,'BOLETA DE VENTA','343','34343434','COMPLETADO','2018-02-23 17:25:52','COMPRA',87.75,399.75,487.5,'CONTADO','',0,0,1029,NULL,NULL,0),(2,'2018-02-23 17:43:22',1,2,1,'BOLETA DE VENTA','ffg','dfgdfg','COMPLETADO','2018-02-23 17:43:22','COMPRA',29.25,133.25,162.5,'CONTADO','',0,0,1029,NULL,NULL,0),(3,'2018-02-23 21:58:47',1,2,1,'BOLETA DE VENTA','sdf','sdfsdf','COMPLETADO','2018-02-23 21:58:47','COMPRA',29.25,133.25,162.5,'CONTADO','',0,0,1029,NULL,NULL,0);
/*!40000 ALTER TABLE `ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso_contable`
--

DROP TABLE IF EXISTS `ingreso_contable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingreso_contable` (
  `id_ingreso` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `int_Proveedor_id` bigint(20) DEFAULT NULL,
  `nUsuCodigo` bigint(20) DEFAULT NULL,
  `local_id` bigint(20) DEFAULT NULL,
  `tipo_documento` varchar(45) DEFAULT NULL,
  `documento_serie` char(8) DEFAULT NULL,
  `documento_numero` char(20) DEFAULT NULL,
  `ingreso_status` varchar(45) DEFAULT NULL,
  `fecha_emision` timestamp NULL DEFAULT NULL,
  `tipo_ingreso` varchar(45) DEFAULT NULL,
  `impuesto_ingreso` double DEFAULT NULL,
  `sub_total_ingreso` double DEFAULT NULL,
  `total_ingreso` double DEFAULT NULL,
  `pago` varchar(45) DEFAULT NULL,
  `ingreso_observacion` text,
  `id_moneda` int(11) DEFAULT NULL,
  `tasa_cambio` decimal(4,2) DEFAULT NULL,
  `factura_ingreso_id` bigint(20) DEFAULT NULL,
  `facturado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_ingreso`),
  KEY `int_Proveedor_id` (`int_Proveedor_id`),
  KEY `nUsuCodigo` (`nUsuCodigo`),
  KEY `local_id` (`local_id`),
  KEY `id_moneda` (`id_moneda`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso_contable`
--

LOCK TABLES `ingreso_contable` WRITE;
/*!40000 ALTER TABLE `ingreso_contable` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingreso_contable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `id_inventario` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_producto` bigint(20) DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `fraccion` float DEFAULT NULL,
  `id_local` bigint(20) DEFAULT NULL,
  `tipo_operacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `fk_inventario_1_idx` (`id_producto`),
  KEY `fk_inventario_2_idx` (`id_local`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kardex`
--

DROP TABLE IF EXISTS `kardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kardex` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  `local_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `unidad_id` bigint(20) NOT NULL,
  `cantidad` bigint(20) NOT NULL DEFAULT '0',
  `cantidad_saldo` bigint(20) DEFAULT '0',
  `io` varchar(45) NOT NULL,
  `tipo` int(11) NOT NULL,
  `operacion` int(11) NOT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `ref_id` varchar(45) DEFAULT NULL,
  `ref_val` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardex`
--

LOCK TABLES `kardex` WRITE;
/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
INSERT INTO `kardex` VALUES (1,'2018-02-23 17:27:45',2,1,1,1,50,50,'1',1,9,'aa','aa','1',NULL),(2,'2018-02-23 17:27:45',2,1,2,1,50,50,'1',1,9,'aa','aa','1',NULL),(3,'2018-02-23 17:27:45',2,1,3,1,50,50,'1',1,9,'aa','aa','1',NULL),(4,'2018-02-23 20:34:51',2,1,1,1,40,10,'2',3,1,'-','-','1',NULL),(5,'2018-02-23 21:39:48',2,1,2,1,3,47,'2',3,1,'-','-','2',NULL),(6,'2018-02-23 21:58:47',2,1,1,1,50,60,'1',3,2,'sdf','sdfsdf','3',NULL);
/*!40000 ALTER TABLE `kardex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineas`
--

DROP TABLE IF EXISTS `lineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lineas` (
  `id_linea` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_linea` varchar(50) DEFAULT NULL,
  `estatus_linea` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_linea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineas`
--

LOCK TABLES `lineas` WRITE;
/*!40000 ALTER TABLE `lineas` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local` (
  `int_local_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `local_nombre` varchar(45) NOT NULL,
  `local_status` tinyint(1) NOT NULL DEFAULT '1',
  `principal` tinyint(1) NOT NULL DEFAULT '0',
  `distrito_id` int(11) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`int_local_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
INSERT INTO `local` VALUES (1,'PRINCIPAL',1,1,2,'DIRECCION','11111111'),(4,'local 2',1,0,1,'dfsdf','sdfsdfdsf');
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcas` (
  `id_marca` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(45) DEFAULT NULL,
  `estatus_marca` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'marca',1);
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_pago`
--

DROP TABLE IF EXISTS `metodos_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodos_pago` (
  `id_metodo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_metodo` varchar(255) DEFAULT NULL,
  `status_metodo` tinyint(1) DEFAULT '1',
  `tipo_metodo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_metodo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_pago`
--

LOCK TABLES `metodos_pago` WRITE;
/*!40000 ALTER TABLE `metodos_pago` DISABLE KEYS */;
INSERT INTO `metodos_pago` VALUES (3,'EFECTIVO',1,'CAJA'),(4,'DEPOSITO',1,'BANCO'),(5,'CHEQUE',1,'CAJA'),(6,'NOTA DE CREDITO',0,'CAJA'),(7,'TARJETA',1,'CAJA');
/*!40000 ALTER TABLE `metodos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneda`
--

DROP TABLE IF EXISTS `moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moneda` (
  `id_moneda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `simbolo` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `tasa_soles` decimal(4,2) DEFAULT NULL,
  `ope_tasa` char(1) DEFAULT NULL,
  `status_moneda` int(11) DEFAULT '1',
  PRIMARY KEY (`id_moneda`),
  UNIQUE KEY `fk_1_nombre_moneda` (`nombre`),
  UNIQUE KEY `fk_1_nombre_simbolo` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneda`
--

LOCK TABLES `moneda` WRITE;
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
INSERT INTO `moneda` VALUES (1029,'Soles','S/.','Peru',0.00,'/',1),(1030,'Dolares','$','EEUU',3.35,'/',1),(1031,'0','?¥','Japon',2.50,'0',0),(1034,'Euro','e','ZONA EURO',5.50,'/',0),(1037,'mon','haj','asdad',99.99,'/',0),(1038,'asda','adas','adsas',2.00,'/',0),(1039,'Moneda de Prueba','^','Venezuela',99.99,'/',0),(1040,'Bolivares','BsF','Venezuela',50.00,'*',0);
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento_historico`
--

DROP TABLE IF EXISTS `movimiento_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimiento_historico` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `producto_id` bigint(20) NOT NULL,
  `local_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  `um_id` int(11) NOT NULL,
  `cantidad` bigint(20) NOT NULL,
  `old_cantidad` bigint(20) DEFAULT NULL,
  `cantidad_actual` bigint(20) DEFAULT '0',
  `date` datetime NOT NULL,
  `tipo_movimiento` varchar(45) NOT NULL,
  `tipo_operacion` varchar(45) NOT NULL,
  `referencia_valor` varchar(100) DEFAULT NULL,
  `referencia_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento_historico`
--

LOCK TABLES `movimiento_historico` WRITE;
/*!40000 ALTER TABLE `movimiento_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_caja`
--

DROP TABLE IF EXISTS `movimientos_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos_caja` (
  `id_mov` int(11) NOT NULL AUTO_INCREMENT,
  `mto_mov` decimal(10,2) DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  `id_moneda` int(11) DEFAULT NULL,
  `tasa_cambio` decimal(4,2) DEFAULT NULL,
  `fecha_mov` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `tipo_mov` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_mov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_caja`
--

LOCK TABLES `movimientos_caja` WRITE;
/*!40000 ALTER TABLE `movimientos_caja` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos_caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcion`
--

DROP TABLE IF EXISTS `opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcion` (
  `nOpcion` bigint(20) NOT NULL AUTO_INCREMENT,
  `nOpcionClase` bigint(20) DEFAULT NULL,
  `cOpcionDescripcion` varchar(100) DEFAULT NULL,
  `cOpcionNombre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`nOpcion`)
) ENGINE=InnoDB AUTO_INCREMENT=813 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcion`
--

LOCK TABLES `opcion` WRITE;
/*!40000 ALTER TABLE `opcion` DISABLE KEYS */;
INSERT INTO `opcion` VALUES (1,NULL,'inventario','Inventario'),(2,NULL,'ingresos','Compras'),(3,NULL,'ventas','Ventas'),(4,NULL,'clientespadre','Clientes'),(5,NULL,'proveedores','Proveedores'),(6,NULL,'cajas','Caja y Bancos'),(7,NULL,'reportes','Reportes'),(8,NULL,'opciones','Configuraciones'),(101,1,'productos','Productos'),(102,1,'stock','Stock Productos'),(103,1,'traspaso','Traspasos de Almacen'),(104,1,'ajusteinventario','Entradas & Salidas'),(105,1,'listaprecios','Stock & Precios'),(106,1,'movimientoinventario','Kardex'),(107,1,'categorizacion','Categorizacion'),(108,1,'marcas','Marcas'),(109,1,'gruposproductos','Grupos'),(110,1,'familias','Familias'),(111,1,'lineas','Lineas'),(112,1,'categorias','Categorias'),(113,1,'provincia','Provincia'),(116,1,'exitenciaminima','Existencias bajas'),(117,1,'existenciasalta','Existencias altas'),(118,1,'plantilla','Plantilla Producto'),(119,1,'seriescalzado','Serie Calzado'),(201,2,'registraringreo','Registrar Compras'),(202,2,'ingresoexistencia','Registro de existencia'),(203,2,'consultarcompras','Consultar Compras'),(204,2,'devolucioningreso','Anulacion Compras'),(205,2,'facturaringresos','Facturar Compras'),(206,2,'compraszapatos','Compras Calzado'),(301,3,'generarventa','\'Realizar Venta'),(302,3,'historialventas','Registro Ventas'),(303,3,'anularventa','Anular & Devolver'),(304,3,'configurarventa','Configurar Venta'),(401,4,'clientes','Registrar Clientes'),(402,4,'gruposcliente','Grupos de Clientes'),(403,4,'cuentasporcobrar','Cuentas x Cobrar'),(501,5,'proveedor','Registrar Proveedores'),(502,5,'cuentasporpagar','Cuentas x Pagar'),(601,6,'cajaybancos','Caja y Bancos'),(602,6,'gastos','Gastos'),(603,6,'movimientocajas','Movimientos de caja'),(604,6,'tiposgasto','Tipo Gasto'),(605,6,'regmonedas','Monedas'),(606,6,'bancos','Bancos'),(607,6,'cuadrecaja','Cuadre de Caja'),(701,7,'diasalmacenaje','Dias de Almacenaje'),(702,7,'comprasvsventas','Compras vs Ventas'),(703,7,'resumenventas','Resumen de ventas'),(704,7,'deudaxproveedor','Deuda por Proveedor'),(705,7,'ventasporcliente','Ventas por Cliente'),(706,7,'valorizacioneinventario','Valorización inventario'),(707,7,'ingresodetallado','Ingreso Detalla'),(801,8,'opcionesgenerales','Parametros de configuracion'),(802,8,'locales','Locales'),(803,8,'usuariospadre','Usuarios'),(804,8,'usuarios','Registrar Usuarios'),(805,8,'gruposusuarios','Perfiles'),(806,8,'region','Ubigeo'),(807,8,'pais','Paises'),(808,8,'estado','Departamento'),(809,8,'ciudad','Provincia'),(810,8,'distrito','Distrito'),(811,8,'precios','Tipos de Precio'),(812,8,'unidadesmedida','Unidades de Medida');
/*!40000 ALTER TABLE `opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcion_grupo`
--

DROP TABLE IF EXISTS `opcion_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcion_grupo` (
  `grupo` bigint(20) NOT NULL,
  `Opcion` bigint(20) NOT NULL,
  `var_opcion_usuario_estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`grupo`,`Opcion`),
  KEY `nopcionUsuarioFKUsuario_idx` (`grupo`),
  KEY `nopcionUsuarioFKOpcion_idx` (`Opcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcion_grupo`
--

LOCK TABLES `opcion_grupo` WRITE;
/*!40000 ALTER TABLE `opcion_grupo` DISABLE KEYS */;
INSERT INTO `opcion_grupo` VALUES (1,1,1),(1,2,1),(1,3,1),(1,4,1),(1,5,1),(1,6,1),(1,7,1),(1,8,1),(1,9,1),(1,29,1),(1,30,1),(1,31,1),(1,32,1),(1,33,1),(1,34,1),(1,35,1),(1,36,1),(1,37,1),(1,38,1),(1,39,1),(1,40,1),(1,41,1),(1,42,1),(1,43,1),(1,44,1),(1,45,1),(1,46,1),(1,47,1),(1,48,1),(1,49,1),(1,50,1),(1,51,1),(1,52,1),(1,53,1),(1,54,1),(1,55,1),(1,56,1),(1,57,1),(1,58,1),(1,59,1),(1,60,1),(1,61,1),(1,62,1),(1,63,1),(1,64,1),(1,65,1),(1,66,1),(1,67,1),(1,68,1),(1,69,1),(1,70,1),(1,71,1),(1,72,1),(1,73,1),(1,74,1),(1,75,1),(1,76,1),(1,100,1),(1,101,1),(1,102,1),(1,103,1),(1,104,1),(1,105,1),(1,106,1),(1,107,1),(1,108,1),(1,109,1),(1,110,1),(1,111,1),(1,112,1),(1,113,1),(1,114,1),(1,115,1),(1,116,1),(1,117,1),(1,118,1),(2,1,1),(2,2,1),(2,3,1),(2,4,1),(2,5,1),(2,6,1),(2,7,1),(2,8,1),(2,101,1),(2,102,1),(2,103,1),(2,104,1),(2,105,1),(2,106,1),(2,107,1),(2,108,1),(2,109,1),(2,110,1),(2,111,1),(2,201,1),(2,202,1),(2,203,1),(2,204,1),(2,205,1),(2,301,1),(2,302,1),(2,303,1),(2,304,1),(2,401,1),(2,402,1),(2,403,1),(2,501,1),(2,502,1),(2,601,1),(2,602,1),(2,603,1),(2,604,1),(2,605,1),(2,606,1),(2,607,1),(2,701,1),(2,702,1),(2,703,1),(2,704,1),(2,705,1),(2,706,1),(2,707,1),(2,801,1),(2,802,1),(2,803,1),(2,804,1),(2,805,1),(2,806,1),(2,807,1),(2,808,1),(2,809,1),(2,810,1),(2,811,1),(2,812,1),(8,1,1),(8,3,1),(8,4,1),(8,102,1),(8,105,1),(8,301,1),(8,303,1),(8,401,1);
/*!40000 ALTER TABLE `opcion_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos_ingreso`
--

DROP TABLE IF EXISTS `pagos_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos_ingreso` (
  `pagoingreso_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pagoingreso_ingreso_id` bigint(20) DEFAULT NULL,
  `pagoingreso_fecha` datetime DEFAULT NULL,
  `pagoingreso_monto` float(22,2) DEFAULT NULL,
  `pagoingreso_restante` float(22,2) DEFAULT NULL,
  `pagoingreso_usuario` bigint(20) DEFAULT NULL,
  `id_moneda` int(11) DEFAULT NULL,
  `tasa_cambio` decimal(4,2) DEFAULT NULL,
  `medio_pago_id` bigint(20) DEFAULT NULL,
  `banco_id` bigint(20) DEFAULT NULL,
  `operacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pagoingreso_id`),
  KEY `pagoingreso_ingreso_id` (`pagoingreso_ingreso_id`),
  KEY `pagoingreso_usuario` (`pagoingreso_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos_ingreso`
--

LOCK TABLES `pagos_ingreso` WRITE;
/*!40000 ALTER TABLE `pagos_ingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `id_pais` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Peru');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'52636','pepe6');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pl_producto`
--

DROP TABLE IF EXISTS `pl_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_producto`
--

LOCK TABLES `pl_producto` WRITE;
/*!40000 ALTER TABLE `pl_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `pl_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pl_producto_propiedad`
--

DROP TABLE IF EXISTS `pl_producto_propiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_producto_propiedad` (
  `pl_producto_id` int(11) NOT NULL,
  `pl_propiedad_id` int(11) NOT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`pl_producto_id`,`pl_propiedad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_producto_propiedad`
--

LOCK TABLES `pl_producto_propiedad` WRITE;
/*!40000 ALTER TABLE `pl_producto_propiedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `pl_producto_propiedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pl_propiedad`
--

DROP TABLE IF EXISTS `pl_propiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_propiedad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pl_tipo_id` int(11) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_propiedad`
--

LOCK TABLES `pl_propiedad` WRITE;
/*!40000 ALTER TABLE `pl_propiedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `pl_propiedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pl_serie`
--

DROP TABLE IF EXISTS `pl_serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_serie` (
  `serie` varchar(45) NOT NULL,
  `rango` varchar(255) NOT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`serie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_serie`
--

LOCK TABLES `pl_serie` WRITE;
/*!40000 ALTER TABLE `pl_serie` DISABLE KEYS */;
INSERT INTO `pl_serie` VALUES ('A','16|17|18|19|20',1),('B','26|28|30|32|34',1),('C','X|XL|XXL',1),('D','M|S|L',1);
/*!40000 ALTER TABLE `pl_serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pl_tipo`
--

DROP TABLE IF EXISTS `pl_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `estado` tinyint(4) DEFAULT '1',
  `orden` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pl_tipo`
--

LOCK TABLES `pl_tipo` WRITE;
/*!40000 ALTER TABLE `pl_tipo` DISABLE KEYS */;
INSERT INTO `pl_tipo` VALUES (1,'MARCA',1,0),(2,'GRUPO',1,0),(3,'FAMILIA',1,0),(4,'LINEA',1,0),(5,'COLOR',1,0),(6,'MATERIAL',1,0),(7,'PLANTA',1,0);
/*!40000 ALTER TABLE `pl_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precios`
--

DROP TABLE IF EXISTS `precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `precios` (
  `id_precio` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_precio` varchar(45) DEFAULT NULL,
  `descuento_precio` double DEFAULT NULL,
  `mostrar_precio` tinyint(1) DEFAULT '0',
  `estatus_precio` tinyint(1) DEFAULT '1',
  `orden` int(11) DEFAULT '0',
  PRIMARY KEY (`id_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precios`
--

LOCK TABLES `precios` WRITE;
/*!40000 ALTER TABLE `precios` DISABLE KEYS */;
INSERT INTO `precios` VALUES (1,'Precio Venta',0,1,1,11),(3,'Precio Unitario',0,1,1,1);
/*!40000 ALTER TABLE `precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `producto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `producto_codigo_interno` varchar(50) DEFAULT NULL,
  `producto_codigo_barra` varchar(255) DEFAULT NULL,
  `producto_nombre` varchar(100) DEFAULT NULL,
  `producto_descripcion` varchar(500) DEFAULT NULL,
  `producto_vencimiento` datetime DEFAULT NULL,
  `producto_marca` bigint(20) DEFAULT NULL,
  `producto_linea` bigint(20) DEFAULT NULL,
  `producto_familia` bigint(20) DEFAULT NULL,
  `produto_grupo` bigint(20) DEFAULT NULL,
  `producto_proveedor` bigint(20) DEFAULT NULL,
  `producto_stockminimo` decimal(18,2) DEFAULT NULL,
  `producto_impuesto` bigint(20) DEFAULT NULL,
  `producto_estatus` tinyint(1) DEFAULT '1',
  `producto_largo` float DEFAULT NULL,
  `producto_ancho` float DEFAULT NULL,
  `producto_alto` float DEFAULT NULL,
  `producto_peso` float DEFAULT NULL,
  `producto_nota` text,
  `producto_cualidad` varchar(255) DEFAULT NULL,
  `producto_estado` tinyint(1) DEFAULT '1',
  `producto_costo_unitario` float(20,2) DEFAULT NULL,
  `producto_modelo` varchar(100) DEFAULT NULL,
  `producto_titulo_imagen` varchar(100) DEFAULT NULL,
  `producto_descripcion_img` text,
  PRIMARY KEY (`producto_id`),
  UNIQUE KEY `producto_fx_7_idx` (`producto_modelo`,`producto_nombre`),
  KEY `R_19` (`producto_linea`),
  KEY `producto_fk_1_idx` (`producto_marca`),
  KEY `producto_fk_3_idx` (`producto_familia`),
  KEY `producto_fk_4_idx` (`produto_grupo`),
  KEY `producto_fk_5_idx` (`producto_proveedor`),
  KEY `producto_fk_6_idx` (`producto_impuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'codigo 1','barra 1','nombre 1','desc 1',NULL,1,NULL,1,1,1,20.00,1,1,NULL,NULL,NULL,NULL,NULL,'MEDIBLE',1,3.25,NULL,NULL,NULL),(2,'codigo 2','barra 2','nombre 2','desc 2',NULL,1,NULL,1,1,1,30.00,1,1,NULL,NULL,NULL,NULL,NULL,'MEDIBLE',1,1.00,NULL,NULL,NULL),(3,'codigo 3','barra 3','nombre 3','desc 3',NULL,1,NULL,1,1,1,20.00,1,1,NULL,NULL,NULL,NULL,NULL,'MEDIBLE',1,1.00,NULL,NULL,NULL);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_almacen`
--

DROP TABLE IF EXISTS `producto_almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_almacen` (
  `id_local` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fraccion` int(11) NOT NULL,
  PRIMARY KEY (`id_local`,`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_almacen`
--

LOCK TABLES `producto_almacen` WRITE;
/*!40000 ALTER TABLE `producto_almacen` DISABLE KEYS */;
INSERT INTO `producto_almacen` VALUES (1,1,60,0),(1,2,47,0),(1,3,50,0);
/*!40000 ALTER TABLE `producto_almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_costo_unitario`
--

DROP TABLE IF EXISTS `producto_costo_unitario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_costo_unitario` (
  `producto_id` bigint(20) NOT NULL,
  `moneda_id` int(11) NOT NULL,
  `costo` float NOT NULL,
  `activo` varchar(2) DEFAULT NULL,
  `contable_costo` float DEFAULT '0',
  `contable_activo` varchar(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_costo_unitario`
--

LOCK TABLES `producto_costo_unitario` WRITE;
/*!40000 ALTER TABLE `producto_costo_unitario` DISABLE KEYS */;
INSERT INTO `producto_costo_unitario` VALUES (2,1030,1,'1',0,'1'),(2,1029,3.25,'0',0,'0'),(3,1030,1,'1',0,'1'),(3,1029,3.25,'0',0,'0'),(1,1029,3.25,'1',0,'1'),(1,1030,0.970149,'0',0,'0');
/*!40000 ALTER TABLE `producto_costo_unitario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_series`
--

DROP TABLE IF EXISTS `producto_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` bigint(20) NOT NULL,
  `serie` varchar(255) DEFAULT NULL,
  `local_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_series`
--

LOCK TABLES `producto_series` WRITE;
/*!40000 ALTER TABLE `producto_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proforma`
--

DROP TABLE IF EXISTS `proforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proforma` (
  `nProfCOdigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nProvCodigo` bigint(20) NOT NULL,
  `nProCodigo` bigint(20) NOT NULL,
  `cProfSerie` char(6) NOT NULL,
  `nCantidad` int(11) NOT NULL,
  PRIMARY KEY (`nProfCOdigo`),
  KEY `ProveedorFKProforma_idx` (`nProvCodigo`),
  KEY `ProductoFKProforma_idx` (`nProCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proforma`
--

LOCK TABLES `proforma` WRITE;
/*!40000 ALTER TABLE `proforma` DISABLE KEYS */;
/*!40000 ALTER TABLE `proforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `id_proveedor` bigint(20) NOT NULL AUTO_INCREMENT,
  `proveedor_ruc` varchar(20) DEFAULT '',
  `proveedor_nombre` varchar(50) NOT NULL,
  `proveedor_direccion1` text NOT NULL,
  `proveedor_paginaweb` varchar(50) DEFAULT '',
  `proveedor_email` varchar(50) DEFAULT '',
  `proveedor_telefono1` varchar(12) NOT NULL,
  `proveedor_contacto` text,
  `proveedor_telefono2` varchar(12) NOT NULL,
  `proveedor_status` tinyint(1) NOT NULL DEFAULT '1',
  `proveedor_observacion` varchar(500) DEFAULT '',
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'11111111111','prov','sss ss','','','','','',1,'');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shadow_stock`
--

DROP TABLE IF EXISTS `shadow_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shadow_stock` (
  `producto_id` bigint(20) NOT NULL,
  `stock` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`producto_id`),
  UNIQUE KEY `producto_id_UNIQUE` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shadow_stock`
--

LOCK TABLES `shadow_stock` WRITE;
/*!40000 ALTER TABLE `shadow_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `shadow_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta_pago`
--

DROP TABLE IF EXISTS `tarjeta_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarjeta_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta_pago`
--

LOCK TABLES `tarjeta_pago` WRITE;
/*!40000 ALTER TABLE `tarjeta_pago` DISABLE KEYS */;
INSERT INTO `tarjeta_pago` VALUES (1,'Visa'),(2,'Mastercard');
/*!40000 ALTER TABLE `tarjeta_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_gasto`
--

DROP TABLE IF EXISTS `tipos_gasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_gasto` (
  `id_tipos_gasto` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_tipos_gasto` varchar(255) DEFAULT NULL,
  `status_tipos_gasto` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_tipos_gasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_gasto`
--

LOCK TABLES `tipos_gasto` WRITE;
/*!40000 ALTER TABLE `tipos_gasto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipos_gasto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidades` (
  `id_unidad` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_unidad` varchar(45) DEFAULT NULL,
  `estatus_unidad` tinyint(1) DEFAULT '1',
  `abreviatura` varchar(45) DEFAULT NULL,
  `presentacion` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (1,'UNIDAD',1,'UND',1);
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades_has_precio`
--

DROP TABLE IF EXISTS `unidades_has_precio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidades_has_precio` (
  `id_precio` bigint(20) NOT NULL,
  `id_unidad` bigint(20) NOT NULL,
  `id_producto` bigint(20) NOT NULL,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`id_precio`,`id_unidad`,`id_producto`),
  KEY `fk_precios_has_unidades_has_producto_unidades_has_producto1_idx` (`id_unidad`),
  KEY `fk_precios_has_unidades_has_producto_precios1_idx` (`id_precio`),
  KEY `fk_precios_has_unidades_has_producto_unidades_has_producto3_idx` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades_has_precio`
--

LOCK TABLES `unidades_has_precio` WRITE;
/*!40000 ALTER TABLE `unidades_has_precio` DISABLE KEYS */;
INSERT INTO `unidades_has_precio` VALUES (1,1,1,1),(1,1,2,1),(1,1,3,1),(3,1,1,1),(3,1,2,1),(3,1,3,1);
/*!40000 ALTER TABLE `unidades_has_precio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades_has_producto`
--

DROP TABLE IF EXISTS `unidades_has_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidades_has_producto` (
  `id_unidad` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `unidades` float DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_unidad`,`producto_id`),
  KEY `fk_unidades_has_producto_producto1_idx` (`producto_id`),
  KEY `fk_unidades_has_producto_unidades1_idx` (`id_unidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades_has_producto`
--

LOCK TABLES `unidades_has_producto` WRITE;
/*!40000 ALTER TABLE `unidades_has_producto` DISABLE KEYS */;
INSERT INTO `unidades_has_producto` VALUES (1,1,1,1),(1,2,1,1),(1,3,1,1);
/*!40000 ALTER TABLE `unidades_has_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `nUsuCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(18) NOT NULL,
  `var_usuario_clave` varchar(50) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `nombre` varchar(255) DEFAULT NULL,
  `grupo` bigint(20) DEFAULT NULL,
  `id_local` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `identificacion` int(45) DEFAULT NULL,
  `esSuper` int(11) DEFAULT NULL,
  PRIMARY KEY (`nUsuCodigo`),
  KEY `grupo` (`grupo`),
  KEY `id_local` (`id_local`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,'admin','b867d9cd482834bbf35e785855f416d5',1,'Admin',2,1,0,12345678,NULL),(22,'usuario1','202cb962ac59075b964b07152d234b70',1,'Usuario Ventas',8,1,0,123456,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_almacen`
--

DROP TABLE IF EXISTS `usuario_almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_almacen` (
  `usuario_id` int(11) NOT NULL,
  `local_id` int(11) NOT NULL,
  PRIMARY KEY (`usuario_id`,`local_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_almacen`
--

LOCK TABLES `usuario_almacen` WRITE;
/*!40000 ALTER TABLE `usuario_almacen` DISABLE KEYS */;
INSERT INTO `usuario_almacen` VALUES (1,1),(1,2),(2,1),(2,4),(22,1);
/*!40000 ALTER TABLE `usuario_almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v_consulta_pagospendientes_venta`
--

DROP TABLE IF EXISTS `v_consulta_pagospendientes_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_consulta_pagospendientes_venta` (
  `Venta_id` int(1) DEFAULT NULL,
  `Cliente_Id` int(1) DEFAULT NULL,
  `Cliente` int(1) DEFAULT NULL,
  `Personal` int(1) DEFAULT NULL,
  `FechaReg` int(1) DEFAULT NULL,
  `FechaVenc` int(1) DEFAULT NULL,
  `MontoTotal` int(1) DEFAULT NULL,
  `MontoCancelado` int(1) DEFAULT NULL,
  `SaldoPendiente` int(1) DEFAULT NULL,
  `NroVenta` int(1) DEFAULT NULL,
  `TipoDocumento` int(1) DEFAULT NULL,
  `Estado` int(1) DEFAULT NULL,
  `Simbolo` int(1) DEFAULT NULL,
  `FormaPago` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v_consulta_pagospendientes_venta`
--

LOCK TABLES `v_consulta_pagospendientes_venta` WRITE;
/*!40000 ALTER TABLE `v_consulta_pagospendientes_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `v_consulta_pagospendientes_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v_cronogramapago`
--

DROP TABLE IF EXISTS `v_cronogramapago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_cronogramapago` (
  `nCPagoCodigo` int(1) DEFAULT NULL,
  `int_cronpago_nrocuota` int(1) DEFAULT NULL,
  `dat_cronpago_fecinicio` int(1) DEFAULT NULL,
  `dat_cronpago_fecpago` int(1) DEFAULT NULL,
  `dec_cronpago_pagocuota` int(1) DEFAULT NULL,
  `dec_cronpago_pagorecibido` int(1) DEFAULT NULL,
  `nVenCodigo` int(1) DEFAULT NULL,
  `id_moneda` int(1) DEFAULT NULL,
  `simbolo` int(1) DEFAULT NULL,
  `tasa_soles` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v_cronogramapago`
--

LOCK TABLES `v_cronogramapago` WRITE;
/*!40000 ALTER TABLE `v_cronogramapago` DISABLE KEYS */;
/*!40000 ALTER TABLE `v_cronogramapago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_lista_precios`
--

DROP TABLE IF EXISTS `v_lista_precios`;
/*!50001 DROP VIEW IF EXISTS `v_lista_precios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_lista_precios` AS SELECT 
 1 AS `producto_id`,
 1 AS `producto_nombre`,
 1 AS `producto_codigo_interno`,
 1 AS `producto_codigo_barra`,
 1 AS `stock_min`,
 1 AS `marca_id`,
 1 AS `grupo_id`,
 1 AS `familia_id`,
 1 AS `linea_id`,
 1 AS `proveedor_id`,
 1 AS `descripcion`,
 1 AS `criterio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `v_lista_productos_principal`
--

DROP TABLE IF EXISTS `v_lista_productos_principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_lista_productos_principal` (
  `nombre` int(1) DEFAULT NULL,
  `producto_id` int(1) DEFAULT NULL,
  `producto_codigo_barra` int(1) DEFAULT NULL,
  `producto_nombre` int(1) DEFAULT NULL,
  `producto_descripcion` int(1) DEFAULT NULL,
  `producto_marca` int(1) DEFAULT NULL,
  `producto_linea` int(1) DEFAULT NULL,
  `producto_familia` int(1) DEFAULT NULL,
  `produto_grupo` int(1) DEFAULT NULL,
  `producto_proveedor` int(1) DEFAULT NULL,
  `producto_stockminimo` int(1) DEFAULT NULL,
  `producto_impuesto` int(1) DEFAULT NULL,
  `producto_estatus` int(1) DEFAULT NULL,
  `producto_largo` int(1) DEFAULT NULL,
  `producto_ancho` int(1) DEFAULT NULL,
  `producto_alto` int(1) DEFAULT NULL,
  `producto_peso` int(1) DEFAULT NULL,
  `producto_nota` int(1) DEFAULT NULL,
  `producto_cualidad` int(1) DEFAULT NULL,
  `producto_estado` int(1) DEFAULT NULL,
  `producto_costo_unitario` int(1) DEFAULT NULL,
  `producto_modelo` int(1) DEFAULT NULL,
  `id_unidad` int(1) DEFAULT NULL,
  `nombre_unidad` int(1) DEFAULT NULL,
  `id_local` int(1) DEFAULT NULL,
  `cantidad` int(1) DEFAULT NULL,
  `fraccion` int(1) DEFAULT NULL,
  `nombre_linea` int(1) DEFAULT NULL,
  `nombre_marca` int(1) DEFAULT NULL,
  `nombre_familia` int(1) DEFAULT NULL,
  `nombre_grupo` int(1) DEFAULT NULL,
  `proveedor_nombre` int(1) DEFAULT NULL,
  `nombre_impuesto` int(1) DEFAULT NULL,
  `id_grupo` int(1) DEFAULT NULL,
  `nombre_fraccion` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v_lista_productos_principal`
--

LOCK TABLES `v_lista_productos_principal` WRITE;
/*!40000 ALTER TABLE `v_lista_productos_principal` DISABLE KEYS */;
/*!40000 ALTER TABLE `v_lista_productos_principal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v_usuario_almacen`
--

DROP TABLE IF EXISTS `v_usuario_almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_usuario_almacen` (
  `int_local_id` int(1) DEFAULT NULL,
  `local_nombre` int(1) DEFAULT NULL,
  `usuario_id` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v_usuario_almacen`
--

LOCK TABLES `v_usuario_almacen` WRITE;
/*!40000 ALTER TABLE `v_usuario_almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `v_usuario_almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `venta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `local_id` bigint(20) DEFAULT NULL,
  `id_documento` int(11) NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `id_vendedor` bigint(20) DEFAULT NULL,
  `condicion_pago` bigint(20) DEFAULT NULL,
  `id_moneda` int(11) DEFAULT NULL,
  `venta_status` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `factura_impresa` tinyint(2) DEFAULT '0',
  `subtotal` decimal(18,2) DEFAULT NULL,
  `total_impuesto` decimal(18,2) DEFAULT NULL,
  `total` decimal(18,2) DEFAULT NULL,
  `pagado` decimal(18,2) DEFAULT '0.00',
  `vuelto` decimal(18,2) DEFAULT '0.00',
  `tasa_cambio` decimal(4,2) DEFAULT NULL,
  `dni_garante` varchar(20) DEFAULT NULL,
  `inicial` decimal(6,2) DEFAULT NULL,
  `personal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`venta_id`),
  KEY `venta_tipodocumento_idx` (`factura_impresa`),
  KEY `ventafklocal_idx` (`local_id`),
  KEY `ventafkpersonal_idx` (`id_vendedor`),
  KEY `ventacondicionpagofk_idx` (`condicion_pago`),
  KEY `ventaclientefk_idx` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,3,1,2,1,1029,'COMPLETADO','2018-02-23 20:34:51',0,37.20,2.80,40.00,40.00,0.00,0.00,NULL,NULL,NULL),(2,1,3,1,2,1,1029,'COMPLETADO','2018-02-23 21:39:48',0,2.79,0.21,3.00,3.00,0.00,0.00,NULL,NULL,1);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_anular`
--

DROP TABLE IF EXISTS `venta_anular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_anular` (
  `nVenAnularCodigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_venta` bigint(20) NOT NULL,
  `var_venanular_descripcion` text NOT NULL,
  `nUsuCodigo` bigint(20) NOT NULL,
  `dat_fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nVenAnularCodigo`),
  KEY `VentaFKVenta_Anular_idx` (`id_venta`),
  KEY `UsuarioFKVenta_Anular_idx` (`nUsuCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_anular`
--

LOCK TABLES `venta_anular` WRITE;
/*!40000 ALTER TABLE `venta_anular` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_anular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_contable_detalle`
--

DROP TABLE IF EXISTS `venta_contable_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_contable_detalle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `venta_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `unidad_id` bigint(20) NOT NULL,
  `precio` float NOT NULL DEFAULT '0',
  `cantidad` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_contable_detalle`
--

LOCK TABLES `venta_contable_detalle` WRITE;
/*!40000 ALTER TABLE `venta_contable_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_contable_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_devolucion`
--

DROP TABLE IF EXISTS `venta_devolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_devolucion` (
  `id_devolucion` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_venta` bigint(20) DEFAULT NULL,
  `id_producto` bigint(20) DEFAULT NULL,
  `precio` decimal(18,2) DEFAULT NULL,
  `cantidad` decimal(18,3) NOT NULL DEFAULT '0.000',
  `unidad_medida` bigint(20) DEFAULT NULL,
  `detalle_importe` decimal(18,2) DEFAULT NULL,
  `detalle_costo_promedio` decimal(18,2) DEFAULT '0.00',
  `detalle_utilidad` decimal(18,2) DEFAULT '0.00',
  PRIMARY KEY (`id_devolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_devolucion`
--

LOCK TABLES `venta_devolucion` WRITE;
/*!40000 ALTER TABLE `venta_devolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_devolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_documento`
--

DROP TABLE IF EXISTS `venta_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_documento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `venta_id` bigint(20) NOT NULL,
  `numero_documento` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_documento`
--

LOCK TABLES `venta_documento` WRITE;
/*!40000 ALTER TABLE `venta_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_tarjeta`
--

DROP TABLE IF EXISTS `venta_tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_tarjeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` bigint(20) NOT NULL,
  `tarjeta_pago_id` int(11) NOT NULL,
  `numero` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_tarjeta`
--

LOCK TABLES `venta_tarjeta` WRITE;
/*!40000 ALTER TABLE `venta_tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_monedas_cajas`
--

DROP TABLE IF EXISTS `vw_monedas_cajas`;
/*!50001 DROP VIEW IF EXISTS `vw_monedas_cajas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_monedas_cajas` AS SELECT 
 1 AS `id_moneda`,
 1 AS `nombre`,
 1 AS `tasa_soles`,
 1 AS `ope_tasa`,
 1 AS `pais`,
 1 AS `simbolo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vw_rep_mov_cajas`
--

DROP TABLE IF EXISTS `vw_rep_mov_cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vw_rep_mov_cajas` (
  `id_caja` int(1) DEFAULT NULL,
  `caja` int(1) DEFAULT NULL,
  `moneda` int(1) DEFAULT NULL,
  `tasa_cambio` int(1) DEFAULT NULL,
  `fecha` int(1) DEFAULT NULL,
  `monto` int(1) DEFAULT NULL,
  `username` int(1) DEFAULT NULL,
  `tipomov` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vw_rep_mov_cajas`
--

LOCK TABLES `vw_rep_mov_cajas` WRITE;
/*!40000 ALTER TABLE `vw_rep_mov_cajas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vw_rep_mov_cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `v_lista_precios`
--

/*!50001 DROP VIEW IF EXISTS `v_lista_precios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_lista_precios` AS select `producto`.`producto_id` AS `producto_id`,`producto`.`producto_nombre` AS `producto_nombre`,`producto`.`producto_codigo_interno` AS `producto_codigo_interno`,`producto`.`producto_codigo_barra` AS `producto_codigo_barra`,`producto`.`producto_stockminimo` AS `stock_min`,`marcas`.`id_marca` AS `marca_id`,`grupos`.`id_grupo` AS `grupo_id`,`familia`.`id_familia` AS `familia_id`,`lineas`.`id_linea` AS `linea_id`,`proveedor`.`id_proveedor` AS `proveedor_id`,concat('Marca: ',ifnull(`marcas`.`nombre_marca`,'-'),', Grupo: ',ifnull(`grupos`.`nombre_grupo`,'-'),'<br/>','Familia: ',ifnull(`familia`.`nombre_familia`,'-'),', Linea: ',ifnull(`lineas`.`nombre_linea`,'-')) AS `descripcion`,concat(`producto`.`producto_nombre`,' ',ifnull(`grupos`.`nombre_grupo`,''),' ',ifnull(`proveedor`.`proveedor_nombre`,''),' ',ifnull(`marcas`.`nombre_marca`,''),' ',ifnull(`lineas`.`nombre_linea`,''),' ',ifnull(`familia`.`nombre_familia`,'')) AS `criterio` from (((((`producto` left join `marcas` on((`producto`.`producto_marca` = `marcas`.`id_marca`))) left join `lineas` on((`producto`.`producto_linea` = `lineas`.`id_linea`))) left join `familia` on((`producto`.`producto_familia` = `familia`.`id_familia`))) left join `grupos` on((`producto`.`produto_grupo` = `grupos`.`id_grupo`))) left join `proveedor` on((`producto`.`producto_proveedor` = `proveedor`.`id_proveedor`))) where (`producto`.`producto_estatus` = '1') order by `producto`.`producto_id`,`producto`.`producto_nombre` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_monedas_cajas`
--

/*!50001 DROP VIEW IF EXISTS `vw_monedas_cajas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_monedas_cajas` AS select `m`.`id_moneda` AS `id_moneda`,`m`.`nombre` AS `nombre`,`m`.`tasa_soles` AS `tasa_soles`,`m`.`ope_tasa` AS `ope_tasa`,`m`.`pais` AS `pais`,`m`.`simbolo` AS `simbolo` from `moneda` `m` where (`m`.`status_moneda` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-27  9:58:19
