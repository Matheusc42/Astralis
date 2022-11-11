-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12-Nov-2022 às 00:52
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `astralis`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `fullName` varchar(60) NOT NULL,
  `rm` int(11) NOT NULL,
  `rg` varchar(7) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `responsavel_mae` varchar(60) DEFAULT NULL,
  `responsavel_pai` varchar(60) DEFAULT NULL,
  `dataNascimento` date NOT NULL,
  `idade` int(11) NOT NULL,
  `endereco` varchar(90) NOT NULL,
  `isMatriculado` bit(1) NOT NULL,
  `classe` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `classe`
--

CREATE TABLE `classe` (
  `idReg` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `ano` int(11) NOT NULL,
  `alunos` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `idReg` int(11) NOT NULL,
  `fullName` varchar(60) NOT NULL,
  `rg` varchar(7) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `endereco` varchar(90) NOT NULL,
  `cargo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `idReg` int(11) NOT NULL,
  `fullName` varchar(60) NOT NULL,
  `rg` varchar(7) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `endereco` varchar(90) NOT NULL,
  `cargo` varchar(15) NOT NULL,
  `formacao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`rm`);

--
-- Índices para tabela `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`idReg`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`idReg`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`idReg`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `rm` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `classe`
--
ALTER TABLE `classe`
  MODIFY `idReg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `idReg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `idReg` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
