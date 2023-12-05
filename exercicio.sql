-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05-Dez-2023 às 21:00
-- Versão do servidor: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exercicio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `id` int(10) UNSIGNED NOT NULL,
  `turma_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endereco` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idade` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`id`, `turma_id`, `nome`, `email`, `endereco`, `idade`) VALUES
(1, 1, 'katia', 'katia@gmail.com', 'rua 12', 10),
(2, 1, 'Ethan', 'ethan@gmail.com', 'projetada 13', 9),
(3, 2, 'Sophie', 'sophie@gmail.com', 'rua 13', 4),
(4, 2, 'Laura', 'laura@gmail.com', 'rua p4', 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `id` int(10) UNSIGNED NOT NULL,
  `professor` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disciplina` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `turma`
--

INSERT INTO `turma` (`id`, `professor`, `disciplina`) VALUES
(1, 'Assis', 'Matematica'),
(2, 'José', 'Fisica');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_aluno_disciplina`
-- (See below for the actual view)
--
CREATE TABLE `v_aluno_disciplina` (
`id` int(10) unsigned
,`nome` varchar(150)
,`email` varchar(150)
,`endereco` varchar(200)
,`idade` int(10) unsigned
,`disciplina` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `v_aluno_disciplina`
--
DROP TABLE IF EXISTS `v_aluno_disciplina`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_aluno_disciplina`  AS  select `a`.`id` AS `id`,`a`.`nome` AS `nome`,`a`.`email` AS `email`,`a`.`endereco` AS `endereco`,`a`.`idade` AS `idade`,`t`.`disciplina` AS `disciplina` from (`aluno` `a` join `turma` `t`) where (`a`.`turma_id` = `t`.`id`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aluno_FKIndex1` (`turma_id`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aluno`
--
ALTER TABLE `aluno`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `turma`
--
ALTER TABLE `turma`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
