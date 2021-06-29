-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2021 at 01:38 AM
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
  `IdGrupo` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grupo`
--

INSERT INTO `grupo` (`IdGrupo`, `nome`) VALUES
(1, 'Limpeza'),
(2, 'Contabilidade'),
(3, 'Direção'),
(4, 'Torneiros'),
(5, 'Motoristas');

-- --------------------------------------------------------

--
-- Table structure for table `mensagem`
--

CREATE TABLE `mensagem` (
  `Pessoarecebido` int(11) NOT NULL,
  `Pessoaenviada` int(11) NOT NULL,
  `mensagem` varchar(200) DEFAULT NULL,
  `DataRecebida` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mensagem`
--

INSERT INTO `mensagem` (`Pessoarecebido`, `Pessoaenviada`, `mensagem`, `DataRecebida`) VALUES
(1, 2, 'Bem vindo edgar', '2021-06-19 17:05:24'),
(4, 2, 'Mensagem Grupo/Usuario', '2021-06-19 17:06:19'),
(10, 1, 'enviando mensagens...', '2021-06-19 18:02:57'),
(28, 1, 'Teste de mensagens em grupo.', '2021-06-20 23:14:57'),
(29, 1, 'Mensagem para o usuário DEUCERTO', '2021-06-20 23:15:37'),
(1, 29, 'E ai ADMIN como você está indo? ', '2021-06-20 23:16:22'),
(1, 1, 'E se a mensagem for muito grande? \r\n\r\nE se for um texto enorme? \r\n\r\nO sistema vai fazer como dai? \r\n\r\nVamos ver a seguir!', '2021-06-20 23:18:39'),
(1, 1, 'No entanto, as universidades mais seletivas recebem applications de vários bons alunos com resultados e notas semelhantes.Então eles usam o seu essay (juntamente com suas cartas de recomendação e ativ', '2021-06-20 23:19:08'),
(1, 1, 'texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto te', '2021-06-20 23:27:51'),
(1, 2, 'E ae seu ADMIN, ve se troca a minha senha para @senhanova!', '2021-06-20 23:36:00'),
(2, 1, 'Senha trocada Sr. Juremildo. ', '2021-06-20 23:36:26');

-- --------------------------------------------------------

--
-- Table structure for table `mensagemgrupo`
--

CREATE TABLE `mensagemgrupo` (
  `Pessoaenviada` int(11) DEFAULT NULL,
  `Grupo` int(11) DEFAULT NULL,
  `mensagem` varchar(200) DEFAULT NULL,
  `DataRecebida` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mensagemgrupo`
--

INSERT INTO `mensagemgrupo` (`Pessoaenviada`, `Grupo`, `mensagem`, `DataRecebida`) VALUES
(2, 1, 'Bem vindo novo usuario', '2021-06-19 17:04:47'),
(2, 2, 'Mensagem Grupo/Usuario', '2021-06-19 17:06:19'),
(1, 1, 'enviando mensagens...', '2021-06-19 18:02:57'),
(1, 2, 'Teste de mensagens em grupo.', '2021-06-20 23:14:57'),
(1, 3, 'E se a mensagem for muito grande? \r\n\r\nE se for um texto enorme? \r\n\r\nO sistema vai fazer como dai? \r\n\r\nVamos ver a seguir!', '2021-06-20 23:18:39'),
(1, 1, 'No entanto, as universidades mais seletivas recebem applications de vários bons alunos com resultados e notas semelhantes.Então eles usam o seu essay (juntamente com suas cartas de recomendação e ativ', '2021-06-20 23:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `IdPessoa` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `data_nasc` date NOT NULL,
  `senha` varchar(50) NOT NULL,
  `IdGrupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`IdPessoa`, `nome`, `data_nasc`, `senha`, `IdGrupo`) VALUES
(1, 'admin', '1984-04-07', '21232f297a57a5a743894a0e4a801fc3', 3),
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
(20, 'teste2', '1999-07-07', 'teste', 2),
(28, 'User34', '2021-06-12', '732002cec7aeb7987bde842b9e00ee3b', 2),
(29, 'DeuCerto', '1984-04-07', 'e7d80ffeefa212b7c5c55700e4f7193e', 2),
(32, 'DeuCerto66', '0006-06-06', 'e7d80ffeefa212b7c5c55700e4f7193e', 1),
(33, 'DeuCerto77', '2006-06-06', 'e7d80ffeefa212b7c5c55700e4f7193e', 2),
(34, 'boss', '2006-06-06', 'd327854bbdee0d3ab1aa22b733e7e4eb', 3);

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
  MODIFY `IdGrupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IdPessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_Usuario_2` FOREIGN KEY (`IdGrupo`) REFERENCES `grupo` (`IdGrupo`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
