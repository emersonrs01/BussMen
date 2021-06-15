-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2021 at 11:20 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bussmen`
--

-- --------------------------------------------------------

--
-- Table structure for table `grupo`
--

CREATE TABLE `grupo` (
  `IdGrupo` int NOT NULL auto_increment,
  `nome` varchar(50) NOT NULL,
  primary key(IdGrupo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grupo`
--

INSERT INTO `grupo` (`IdGrupo`, `nome`) VALUES
(null, 'novo usuario'),
(null, 'usuario antigo');

-- --------------------------------------------------------

--
-- Table structure for table `mensagem`
--

CREATE TABLE `mensagem` (
  `Pessoarecebido` int(11) NOT NULL,
  `Pessoaenviada` int(11) NOT NULL,
  `mensagem` varchar(200) DEFAULT NULL,
  `DataRecebida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mensagemgrupo`
--

CREATE TABLE `mensagemgrupo` (
  `Pessoaenviada` int DEFAULT NULL,
  `Grupo` int DEFAULT NULL,
  `mensagem` varchar(200) DEFAULT NULL,
  `DataRecebida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mensagemgrupo`
--

INSERT INTO `mensagemgrupo` (`Pessoaenviada`, `Grupo`, `mensagem`) VALUES
(NULL, 1, 'bem vindo'),
(NULL, 2, 'bem vindo');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `IdPessoa` int NOT NULL auto_increment,
  `nome` varchar(50) NOT NULL,
  `data_nasc` date NOT NULL,
  `senha` varchar(50) NOT NULL,
  primary key(IdPessoa)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`IdPessoa`, `nome`, `data_nasc`, `senha`) VALUES
(null, 'Edgar', '1984-04-07', 'e7d80ffeefa212b7c5c55700e4f7193e'),
(null, 'Juremildo', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b'),
(null, 'Joniscreiton', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b'),
(null, 'Devarvino', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b'),
(null, 'Jenovéva', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b'),
(null, 'Jair', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b'),
(null, 'Gilmar', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b'),
(null, 'Braulio', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b'),
(null, 'admin', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mensagem`
--
ALTER TABLE `mensagem`
  ADD KEY `FK_Mensagem_1` (`Pessoarecebido`),
  ADD KEY `FK_Mensagem_2` (`Pessoaenviada`);

--
-- Indexes for table `mensagemgrupo`
--
ALTER TABLE `mensagemgrupo`
  ADD KEY `FK_MensagemGrupo_1` (`Pessoaenviada`),
  ADD KEY `FK_MensagemGrupo_2` (`Grupo`);


--
-- Constraints for dumped tables
--

--
-- Constraints for table `mensagem`
--
ALTER TABLE `mensagem`
  ADD CONSTRAINT `FK_Mensagem_1` FOREIGN KEY (`Pessoarecebido`) REFERENCES `usuario` (`IdPessoa`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Mensagem_2` FOREIGN KEY (`Pessoaenviada`) REFERENCES `usuario` (`IdPessoa`) ON DELETE CASCADE;

--
-- Constraints for table `mensagemgrupo`
--
ALTER TABLE `mensagemgrupo`
  ADD CONSTRAINT `FK_MensagemGrupo_1` FOREIGN KEY (`Pessoaenviada`) REFERENCES `usuario` (`IdPessoa`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_MensagemGrupo_2` FOREIGN KEY (`Grupo`) REFERENCES `grupo` (`IdGrupo`) ON DELETE SET NULL;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
