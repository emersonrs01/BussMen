-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25-Maio-2021 às 02:28
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
-- Database: `bancoteste`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `IdCargo` int(11) NOT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `Nomecargo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`IdCargo`, `salario`, `Nomecargo`) VALUES
(1, '1500.00', 'Gerente'),
(2, '1200.00', 'Técnico'),
(3, '1350.00', 'RH'),
(4, '1800.00', 'Técnico'),
(5, '2200.00', 'BOSS'),
(6, '1420.00', 'Financeiro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carros`
--

CREATE TABLE `carros` (
  `codigo` smallint(6) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `codpessoa` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `carros`
--

INSERT INTO `carros` (`codigo`, `modelo`, `marca`, `codpessoa`) VALUES
(1, 'Fusca', 'Volkswagen', 1),
(2, '308', 'Peugeot', 2),
(3, 'Hilux', 'Toyota', 2),
(4, 'Fusca', 'Volskwagen', 3),
(5, 'Toro', 'Fiat', 4),
(6, 'C4', 'Citröen', 7),
(7, 'Gol', 'Volskwagen', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo`
--

CREATE TABLE `grupo` (
  `IdGrupo` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

CREATE TABLE `mensagem` (
  `PessoaRecebido` int(11) DEFAULT NULL,
  `PessoaEnviado` int(11) DEFAULT NULL,
  `mensagem` varchar(200) DEFAULT NULL,
  `DataRecebida` date DEFAULT NULL,
  `DataLida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagemgrupo`
--

CREATE TABLE `mensagemgrupo` (
  `Pessoaenviada` int(11) DEFAULT NULL,
  `Grupo` int(11) DEFAULT NULL,
  `Mensagem2` varchar(200) DEFAULT NULL,
  `DataLida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `codigo` smallint(6) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `fone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pessoas`
--

INSERT INTO `pessoas` (`codigo`, `nome`, `fone`) VALUES
(1, 'João da Silva', '(54)99999-4444'),
(2, 'Maria Antonieta', '(21)66666-5555'),
(3, 'Joaquim José da Silva Xavier', '(31)88888-7777'),
(4, 'Laura Kauffmann', '(11)22222-3333'),
(5, 'Fulano de Tal', '(54)99999-0000'),
(6, 'Leafar Redeir', '(54)99999-9191'),
(7, 'Rafael Rieder', '(54)12345-6789');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`codigo`, `descricao`, `preco`, `quantidade`) VALUES
(1, 'Sapato Masculino', '139.90', 25),
(2, 'Sapato Feminino', '189.80', 18),
(3, 'Bota Solado Couro', '210.00', 20),
(4, 'Sapatilha de Prenda', '67.00', 15),
(5, 'Alpargata Uruguaia', '25.50', 36),
(6, 'Vestido de Prenda', '499.90', 4),
(7, 'Bombacha de Favo', '98.25', 10),
(8, 'Saia de armação', '120.00', 6),
(9, 'Camisa Manga Longa', '79.40', 10),
(10, 'Lenço Carijó 1,0m', '22.00', 20);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `IdPessoa` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `CargoPessoa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`IdPessoa`, `nome`, `data_nasc`, `CargoPessoa`) VALUES
(1, 'Juremildo', NULL, 5),
(2, 'Joniscreiton', NULL, 2),
(3, 'Devarvino', NULL, 2),
(4, 'Jenovéva', '2021-05-10', 3),
(5, 'Jair', NULL, 4),
(6, 'Gilmar', NULL, 6),
(7, 'Braulio', NULL, 6),
(11, 'Emerson', '0000-00-00', 1),
(12, 'egar', '2021-05-24', 5),
(13, 'edgar', '2021-05-24', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `apelido` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`apelido`, `senha`, `email`) VALUES
('adspf', '89794b621a313bb59eed0d9f0f4e8205', 'qquercoisa@teste.com.br'),
('fulano', '123mudar', 'fulano@detal.com.br'),
('rafaelrieder', 'fb5de96a1a4e8e9ed44b7b02099c9399', 'rieder@upf.br');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`IdCargo`);

--
-- Indexes for table `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_PessoaCarro` (`codpessoa`);

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
-- Indexes for table `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IdPessoa`),
  ADD KEY `FK_Usuario_2` (`CargoPessoa`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`apelido`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carros`
--
ALTER TABLE `carros`
  MODIFY `codigo` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `codigo` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `carros`
--
ALTER TABLE `carros`
  ADD CONSTRAINT `fk_PessoaCarro` FOREIGN KEY (`codpessoa`) REFERENCES `pessoas` (`codigo`);

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
