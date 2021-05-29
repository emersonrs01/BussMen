-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 29-Maio-2021 às 20:12
-- Versão do servidor: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `IdCargo` int(11) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `Nomecargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`IdCargo`, `salario`, `Nomecargo`) VALUES
(1, '1500.00', 'Gerente'),
(2, '1200.00', 'T?cnico'),
(3, '1350.00', 'RH'),
(4, '1800.00', 'T?cnico'),
(5, '2200.00', 'BOSS'),
(6, '1420.00', 'Financeiro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo`
--

CREATE TABLE `grupo` (
  `IdGrupo` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo`
--

INSERT INTO `grupo` (`IdGrupo`, `nome`) VALUES
(1, 'novo usuario'),
(2, 'usuario antigo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

CREATE TABLE `mensagem` (
  `PessoaRecebido` int(11) NOT NULL,
  `PessoaEnviado` int(11) NOT NULL,
  `mensagem` varchar(200) DEFAULT NULL,
  `DataRecebida` date NOT NULL,
  `DataLida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagemgrupo`
--

CREATE TABLE `mensagemgrupo` (
  `Pessoaenviada` int(11) DEFAULT NULL,
  `Grupo` int(11) DEFAULT NULL,
  `Mensagem2` varchar(200) DEFAULT NULL,
  `DataLida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mensagemgrupo`
--

INSERT INTO `mensagemgrupo` (`Pessoaenviada`, `Grupo`, `Mensagem2`, `DataLida`) VALUES
(NULL, 1, 'bem vindo', NULL),
(NULL, 2, 'bem vindo', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `IdPessoa` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `data_nasc` date NOT NULL,
  `senha` varchar(50) NOT NULL,
  `CargoPessoa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`IdPessoa`, `nome`, `data_nasc`, `senha`, `CargoPessoa`) VALUES
(1, 'Juremildo', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 5),
(2, 'Joniscreiton', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 2),
(3, 'Devarvino', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 2),
(4, 'Jenov?va', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 3),
(5, 'Jair', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 4),
(6, 'Gilmar', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 6),
(7, 'Braulio', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 6),
(10, 'admin', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`IdCargo`);

--
-- Indexes for table `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`IdGrupo`);

--
-- Indexes for table `mensagem`
--
ALTER TABLE `mensagem`
  ADD KEY `FK_Mensagem_1` (`PessoaRecebido`),
  ADD KEY `FK_Mensagem_2` (`PessoaEnviado`);

--
-- Indexes for table `mensagemgrupo`
--
ALTER TABLE `mensagemgrupo`
  ADD KEY `FK_MensagemGrupo_1` (`Pessoaenviada`),
  ADD KEY `FK_MensagemGrupo_2` (`Grupo`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IdPessoa`),
  ADD KEY `FK_Usuario_2` (`CargoPessoa`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `mensagem`
--
ALTER TABLE `mensagem`
  ADD CONSTRAINT `FK_Mensagem_1` FOREIGN KEY (`PessoaRecebido`) REFERENCES `usuario` (`IdPessoa`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Mensagem_2` FOREIGN KEY (`PessoaEnviado`) REFERENCES `usuario` (`IdPessoa`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `mensagemgrupo`
--
ALTER TABLE `mensagemgrupo`
  ADD CONSTRAINT `FK_MensagemGrupo_1` FOREIGN KEY (`Pessoaenviada`) REFERENCES `usuario` (`IdPessoa`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_MensagemGrupo_2` FOREIGN KEY (`Grupo`) REFERENCES `grupo` (`IdGrupo`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_Usuario_2` FOREIGN KEY (`CargoPessoa`) REFERENCES `cargo` (`IdCargo`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
