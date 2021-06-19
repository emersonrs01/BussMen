-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19-Jun-2021 às 19:49
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
  `Pessoarecebido` int(11) NOT NULL,
  `Pessoaenviada` int(11) NOT NULL,
  `mensagem` varchar(200) DEFAULT NULL,
  `DataRecebida` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mensagem`
--

INSERT INTO `mensagem` (`Pessoarecebido`, `Pessoaenviada`, `mensagem`, `DataRecebida`) VALUES
(1, 2, 'Bem vindo edgar', '2021-06-19 17:05:24'),
(4, 2, 'Mensagem Grupo/Usuario', '2021-06-19 17:06:19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagemgrupo`
--

CREATE TABLE `mensagemgrupo` (
  `Pessoaenviada` int(11) DEFAULT NULL,
  `Grupo` int(11) DEFAULT NULL,
  `mensagem` varchar(200) DEFAULT NULL,
  `DataRecebida` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mensagemgrupo`
--

INSERT INTO `mensagemgrupo` (`Pessoaenviada`, `Grupo`, `mensagem`, `DataRecebida`) VALUES
(2, 1, 'Bem vindo novo usuario', '2021-06-19 17:04:47'),
(2, 2, 'Mensagem Grupo/Usuario', '2021-06-19 17:06:19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `IdPessoa` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `data_nasc` date NOT NULL,
  `senha` varchar(50) NOT NULL,
  `IdGrupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`IdPessoa`, `nome`, `data_nasc`, `senha`, `IdGrupo`) VALUES
(1, 'Edgar', '1984-04-07', 'e7d80ffeefa212b7c5c55700e4f7193e', 1),
(2, 'Juremildo', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 1),
(3, 'Joniscreiton', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 1),
(4, 'Devarvino', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 1),
(5, 'Jenovéva', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 1),
(6, 'Jair', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 1),
(7, 'Gilmar', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 1),
(8, 'Braulio', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 1),
(9, 'admin', '1999-07-23', '698dc19d489c4e4db73e28a713eab07b', 1),
(10, 'Emerson', '2021-06-01', '698dc19d489c4e4db73e28a713eab07b', 2),
(11, 'Emerson 2 ', '0000-00-00', '698dc19d489c4e4db73e28a713eab07b', 2),
(12, 'Emerson 2 ', '2019-07-23', '698dc19d489c4e4db73e28a713eab07b', 2),
(14, 'teste 33', '2021-05-24', '698dc19d489c4e4db73e28a713eab07b', 2),
(20, 'teste2', '1999-07-07', 'teste', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`IdGrupo`);

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
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IdPessoa`),
  ADD KEY `FK_Usuario_2` (`IdGrupo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `grupo`
--
ALTER TABLE `grupo`
  MODIFY `IdGrupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IdPessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `mensagem`
--
ALTER TABLE `mensagem`
  ADD CONSTRAINT `FK_Mensagem_1` FOREIGN KEY (`Pessoarecebido`) REFERENCES `usuario` (`IdPessoa`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Mensagem_2` FOREIGN KEY (`Pessoaenviada`) REFERENCES `usuario` (`IdPessoa`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `FK_Usuario_2` FOREIGN KEY (`IdGrupo`) REFERENCES `grupo` (`IdGrupo`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
