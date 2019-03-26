-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.43-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema fariapersonalizados
--

CREATE DATABASE IF NOT EXISTS fariapersonalizados;
USE fariapersonalizados;

--
-- Definition of table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `CAT_CODIGOID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CAT_DESCRICAO` varchar(255) NOT NULL,
  PRIMARY KEY (`CAT_CODIGOID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorias`
--

/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`CAT_CODIGOID`,`CAT_DESCRICAO`) VALUES 
 (1,'CANECA DE ACRILICO'),
 (2,'CANECA DE PORCELANA'),
 (3,'CANECA DE POLÍMERO');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;


--
-- Definition of table `critica_processamento`
--

DROP TABLE IF EXISTS `critica_processamento`;
CREATE TABLE `critica_processamento` (
  `CRI_CODIGO_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CRI_DATA_HORA` datetime NOT NULL,
  `CRI_TELA` varchar(255) NOT NULL,
  `CRI_METODO` varchar(255) NOT NULL,
  `CRI_ERRO` varchar(255) NOT NULL,
  `CRI_USUARIO` varchar(50) NOT NULL,
  PRIMARY KEY (`CRI_CODIGO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `critica_processamento`
--

/*!40000 ALTER TABLE `critica_processamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `critica_processamento` ENABLE KEYS */;


--
-- Definition of table `detalhes_mensagem`
--

DROP TABLE IF EXISTS `detalhes_mensagem`;
CREATE TABLE `detalhes_mensagem` (
  `DET_MEN_CODIGOID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DET_MEN_CODMENSAGEM` int(10) unsigned DEFAULT NULL,
  `DET_MEN_CODREMETENTE` int(10) unsigned DEFAULT NULL,
  `DET_MEN_MENSAGEM` text,
  `DET_MEN_DATAEMISSAO` datetime DEFAULT NULL,
  `DET_MEN_LIDO` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`DET_MEN_CODIGOID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detalhes_mensagem`
--

/*!40000 ALTER TABLE `detalhes_mensagem` DISABLE KEYS */;
INSERT INTO `detalhes_mensagem` (`DET_MEN_CODIGOID`,`DET_MEN_CODMENSAGEM`,`DET_MEN_CODREMETENTE`,`DET_MEN_MENSAGEM`,`DET_MEN_DATAEMISSAO`,`DET_MEN_LIDO`) VALUES 
 (1,1,1,'Bom dia Valentina, <br> Favor acessar o menu de orçamentos em seu painel para realizar este procedimento. <br> Atenciosamente, Italo Angelo. <br> Gerente de Produção - Faria Personalizados','2019-02-27 11:08:00','N');
/*!40000 ALTER TABLE `detalhes_mensagem` ENABLE KEYS */;


--
-- Definition of table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
  `EMP_CODIGOID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EMP_NOME_FANT` varchar(255) NOT NULL,
  `EMP_RAZAO_SOCIAL` varchar(255) DEFAULT NULL,
  `EMP_CNPJ` varchar(14) DEFAULT NULL,
  `EMP_ENDERECO` varchar(500) DEFAULT NULL,
  `EMP_TEL1` varchar(15) DEFAULT NULL,
  `EMP_TEL2` varchar(15) DEFAULT NULL,
  `EMP_FAX` varchar(15) DEFAULT NULL,
  `EMP_DATA_ABERTURA` datetime DEFAULT NULL,
  `EMP_NOME_PROP` varchar(255) NOT NULL,
  `EMP_TEL_PROP` varchar(15) DEFAULT NULL,
  `EMP_CPF_PROP` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`EMP_CODIGOID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `empresa`
--

/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` (`EMP_CODIGOID`,`EMP_NOME_FANT`,`EMP_RAZAO_SOCIAL`,`EMP_CNPJ`,`EMP_ENDERECO`,`EMP_TEL1`,`EMP_TEL2`,`EMP_FAX`,`EMP_DATA_ABERTURA`,`EMP_NOME_PROP`,`EMP_TEL_PROP`,`EMP_CPF_PROP`) VALUES 
 (1,'Faria Personalizados','','','','','','','0001-01-01 00:00:00','Ana Maria de Faria Santos','','');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;


--
-- Definition of table `log_sistema`
--

DROP TABLE IF EXISTS `log_sistema`;
CREATE TABLE `log_sistema` (
  `LOG_CODIGOID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LOG_TELA` varchar(255) NOT NULL,
  `LOG_METODO` varchar(255) NOT NULL,
  `LOG_TIPO` int(10) unsigned NOT NULL,
  `LOG_COMANDO` text NOT NULL,
  `LOG_STATUS` int(10) unsigned NOT NULL,
  `LOG_DATA_CADASTRO` datetime NOT NULL,
  `LOG_USUARIO` varchar(50) NOT NULL,
  PRIMARY KEY (`LOG_CODIGOID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_sistema`
--

/*!40000 ALTER TABLE `log_sistema` DISABLE KEYS */;
INSERT INTO `log_sistema` (`LOG_CODIGOID`,`LOG_TELA`,`LOG_METODO`,`LOG_TIPO`,`LOG_COMANDO`,`LOG_STATUS`,`LOG_DATA_CADASTRO`,`LOG_USUARIO`) VALUES 
 (1,'CRUDCategorias.aspx','atualizaGridCategoria',3,'SELECT cat_codigoid  AS CODIGO, \r\n                                   cat_descricao AS CATEGORIA \r\n                            FROM   categorias  order by CAT_CODIGOID asc',1,'2019-03-26 11:50:31','ADMIN'),
 (2,'CRUDCategorias.aspx','atualizaGridCategoria',3,'SELECT cat_codigoid  AS CODIGO, \r\n                                   cat_descricao AS CATEGORIA \r\n                            FROM   categorias where 1=1  order by CAT_CODIGOID asc',1,'2019-03-26 12:44:11','ADMIN'),
 (3,'CRUDCategorias.aspx','atualizaGridCategoria',3,'SELECT cat_codigoid  AS CODIGO, \r\n                                   cat_descricao AS CATEGORIA \r\n                            FROM   categorias where 1=1  order by CAT_CODIGOID asc',1,'2019-03-26 12:47:27','ADMIN'),
 (4,'CRUDCategorias.aspx','atualizaGridCategoria',3,'SELECT cat_codigoid  AS CODIGO, \r\n                                   cat_descricao AS CATEGORIA \r\n                            FROM   categorias where 1=1  order by CAT_CODIGOID asc',1,'2019-03-26 12:48:19','ADMIN'),
 (5,'CRUDCategorias.aspx','atualizaGridCategoria',3,'SELECT cat_codigoid  AS CODIGO, \r\n                                   cat_descricao AS CATEGORIA \r\n                            FROM   categorias where 1=1  order by CAT_CODIGOID asc',1,'2019-03-26 16:14:46','ADMIN'),
 (6,'CRUDCategorias.aspx','atualizaGridCategoria',3,'SELECT cat_codigoid  AS CODIGO, \r\n                                   cat_descricao AS CATEGORIA \r\n                            FROM   categorias where 1=1  order by CAT_CODIGOID asc',1,'2019-03-26 16:15:35','ADMIN'),
 (7,'CRUDCategorias.aspx','atualizaGridCategoria',3,'SELECT cat_codigoid  AS CODIGO, \r\n                                   cat_descricao AS CATEGORIA \r\n                            FROM   categorias where 1=1  order by CAT_CODIGOID asc',1,'2019-03-26 16:16:20','ADMIN'),
 (8,'CRUDCategorias.aspx','atualizaGridCategoria',3,'SELECT cat_codigoid  AS CODIGO, \r\n                                   cat_descricao AS CATEGORIA \r\n                            FROM   categorias where 1=1  order by CAT_CODIGOID asc',1,'2019-03-26 16:58:31','ADMIN'),
 (9,'CRUDCategorias.aspx','atualizaGridCategoria',3,'SELECT cat_codigoid  AS CODIGO, \r\n                                   cat_descricao AS CATEGORIA \r\n                            FROM   categorias where 1=1  order by CAT_CODIGOID asc',1,'2019-03-26 17:00:16','ADMIN'),
 (10,'CRUDCategorias.aspx','atualizaGridCategoria',3,'SELECT cat_codigoid  AS CODIGO, \r\n                                   cat_descricao AS CATEGORIA \r\n                            FROM   categorias where 1=1  order by CAT_CODIGOID asc',1,'2019-03-26 17:01:40','ADMIN'),
 (11,'CRUDCategorias.aspx','_gridCategorias_RowDeleting',4,'DELETE FROM CATEGORIAS where cat_codigoid = ?cat_codigoid',1,'2019-03-26 17:01:53','ADMIN');
/*!40000 ALTER TABLE `log_sistema` ENABLE KEYS */;


--
-- Definition of table `mensagens`
--

DROP TABLE IF EXISTS `mensagens`;
CREATE TABLE `mensagens` (
  `MEN_CODIGOID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MEN_ASSUNTO` varchar(255) DEFAULT NULL,
  `MEN_CODUSUREMETENTE` int(10) unsigned DEFAULT NULL,
  `MEN_CODUSUdESTINATARIO` int(10) unsigned DEFAULT NULL,
  `MEN_DATACRIACAO` datetime DEFAULT NULL,
  `MEN_DESCRICAO` text,
  PRIMARY KEY (`MEN_CODIGOID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mensagens`
--

/*!40000 ALTER TABLE `mensagens` DISABLE KEYS */;
INSERT INTO `mensagens` (`MEN_CODIGOID`,`MEN_ASSUNTO`,`MEN_CODUSUREMETENTE`,`MEN_CODUSUdESTINATARIO`,`MEN_DATACRIACAO`,`MEN_DESCRICAO`) VALUES 
 (1,'Orçamento de canecas de Acrilico',2,0,'2019-02-27 11:05:00','Boa Tarde <br> Gostaria de pedir o orçamento de 50 canecas de chopp, da cor branca.');
/*!40000 ALTER TABLE `mensagens` ENABLE KEYS */;


--
-- Definition of table `orcamentos`
--

DROP TABLE IF EXISTS `orcamentos`;
CREATE TABLE `orcamentos` (
  `ORC_CODIGOID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ORC_DATA` datetime NOT NULL,
  `ORC_CODIGOPRODUTO` int(10) unsigned NOT NULL,
  `ORC_QUANTIDADE` int(10) unsigned NOT NULL DEFAULT '0',
  `ORC_VALOR_TOTAL` double(10,2) NOT NULL,
  `ORC_CODIGO_USER` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ORC_CODIGOID`),
  KEY `FK_PRODUTOS` (`ORC_CODIGOPRODUTO`),
  CONSTRAINT `FK_PRODUTOS` FOREIGN KEY (`ORC_CODIGOPRODUTO`) REFERENCES `produtos` (`PROD_CODIGOID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orcamentos`
--

/*!40000 ALTER TABLE `orcamentos` DISABLE KEYS */;
INSERT INTO `orcamentos` (`ORC_CODIGOID`,`ORC_DATA`,`ORC_CODIGOPRODUTO`,`ORC_QUANTIDADE`,`ORC_VALOR_TOTAL`,`ORC_CODIGO_USER`) VALUES 
 (1,'2019-03-11 10:03:00',1,100,200.00,2);
/*!40000 ALTER TABLE `orcamentos` ENABLE KEYS */;


--
-- Definition of table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `PER_CODIGOID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PER_DESCRICAO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PER_CODIGOID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perfil`
--

/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` (`PER_CODIGOID`,`PER_DESCRICAO`) VALUES 
 (1,'FUNCIONARIO'),
 (2,'CLIENTE');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;


--
-- Definition of table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos` (
  `PROD_CODIGOID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PROD_DESCRICAO` varchar(255) NOT NULL,
  `PROD_PRECO` double(10,2) NOT NULL,
  `PROD_CODIGO_CATEGORIA` int(10) unsigned NOT NULL,
  `PROD_DATA_CADASTRO` datetime NOT NULL,
  `PROD_USER` varchar(50) NOT NULL,
  PRIMARY KEY (`PROD_CODIGOID`),
  KEY `FK_CATEGORIA` (`PROD_CODIGO_CATEGORIA`),
  CONSTRAINT `FK_CATEGORIA` FOREIGN KEY (`PROD_CODIGO_CATEGORIA`) REFERENCES `categorias` (`CAT_CODIGOID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produtos`
--

/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`PROD_CODIGOID`,`PROD_DESCRICAO`,`PROD_PRECO`,`PROD_CODIGO_CATEGORIA`,`PROD_DATA_CADASTRO`,`PROD_USER`) VALUES 
 (1,'CANECA DE ACRILICO - 300ML',0.75,1,'2019-03-11 10:02:00','ADMIN');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `USU_CODIGOID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USU_NOME` varchar(255) DEFAULT NULL,
  `USU_USUARIO` varchar(100) DEFAULT NULL,
  `USU_SENHA` varchar(255) DEFAULT NULL,
  `USU_PERFIL` int(10) unsigned NOT NULL,
  `USU_EMAIL` varchar(255) DEFAULT NULL,
  `USU_ENDERECO` varchar(500) DEFAULT NULL,
  `USU_TELEFONE` varchar(20) DEFAULT NULL,
  `USU_CELULAR` varchar(20) DEFAULT NULL,
  `USU_DATACADASTRO` datetime DEFAULT NULL,
  `USU_CEP` varchar(10) DEFAULT NULL,
  `USU_CAMINHO_IMG_PERFIL` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`USU_CODIGOID`),
  KEY `IDX_PERFIL` (`USU_PERFIL`) USING BTREE,
  CONSTRAINT `FK_PERFIL` FOREIGN KEY (`USU_PERFIL`) REFERENCES `perfil` (`PER_CODIGOID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`USU_CODIGOID`,`USU_NOME`,`USU_USUARIO`,`USU_SENHA`,`USU_PERFIL`,`USU_EMAIL`,`USU_ENDERECO`,`USU_TELEFONE`,`USU_CELULAR`,`USU_DATACADASTRO`,`USU_CEP`,`USU_CAMINHO_IMG_PERFIL`) VALUES 
 (1,'Italo Angelo','italoangelo13','2bc33fada526d4eae9c27647d2e374b8',1,'italoangelo.ti@gmail.com','Rua José Augusto Pinto, 190, Pompéu, Sabará - MG','(31) 3671-6139','(31) 97507-0686','2019-02-27 10:53:00','34518-010','italoangelo13_02032019_2104.jpg'),
 (2,'Valentina Faria','valentina1faria','d85a98ee06397ef26667d5cd994c250b',2,'italogaloucura22@gmail.com','Rua José Augusto Pinto, 190, Pompéu, Sabará - MG','(31) 3671-6139','(31) 97507-0686','2019-02-27 11:04:00','34518-010','valentina1faria_02032019_2203.jpg');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
