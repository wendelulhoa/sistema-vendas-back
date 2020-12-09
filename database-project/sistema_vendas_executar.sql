-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Dez-2020 às 18:56
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_vendas`
--
create database sistema_vendas;
use sistema_vendas;
-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_categoria`
--

CREATE TABLE `tb_categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_categoria`
--

INSERT INTO `tb_categoria` (`id`, `nome`) VALUES
(1, 'apple'),
(2, 'samsung'),
(3, 'sony'),
(4, 'dell'),
(5, 'videogame');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_compras`
--

CREATE TABLE `tb_compras` (
  `id` int(11) NOT NULL,
  `cod_produto` int(11) DEFAULT NULL,
  `preco_compra` decimal(10,2) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `num_pedido` int(11) DEFAULT NULL,
  `data_compra` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_compras`
--

INSERT INTO `tb_compras` (`id`, `cod_produto`, `preco_compra`, `cpf`, `quantidade`, `num_pedido`, `data_compra`) VALUES
(1, 6, '2000.00', '00000000000', 1, 98624892, '09/12/2020 14:50:19'),
(2, 5, '3000.00', '00000000000', 1, 98624892, '09/12/2020 14:50:19'),
(3, 4, '4500.00', '00000000000', 1, 98624892, '09/12/2020 14:50:19'),
(4, 1, '3500.00', '00000000001', 2, 75810742, '09/12/2020 14:50:55'),
(5, 2, '2500.00', '00000000001', 2, 75810742, '09/12/2020 14:50:55'),
(6, 3, '3500.00', '00000000001', 2, 75810742, '09/12/2020 14:50:55'),
(7, 5, '3000.00', '00000000001', 2, 75810742, '09/12/2020 14:50:55'),
(8, 4, '4500.00', '00000000001', 2, 75810742, '09/12/2020 14:50:55'),
(9, 6, '2000.00', '00000000001', 2, 75810742, '09/12/2020 14:50:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_compras_pivot`
--

CREATE TABLE `tb_compras_pivot` (
  `cpf` varchar(15) DEFAULT NULL,
  `cod_pedido` int(11) DEFAULT NULL,
  `data_compra` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_compras_pivot`
--

INSERT INTO `tb_compras_pivot` (`cpf`, `cod_pedido`, `data_compra`) VALUES
('00000000000', 98624892, '09/12/2020 14:50:19'),
('00000000001', 75810742, '09/12/2020 14:50:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_endereco`
--

CREATE TABLE `tb_endereco` (
  `id` int(11) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cep` int(11) DEFAULT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` varchar(5) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_endereco`
--

INSERT INTO `tb_endereco` (`id`, `endereco`, `cep`, `rua`, `cidade`, `uf`, `cpf`) VALUES
(1, 'rua sem nome qd 08 lt 08', 73700000, 'rua sem', 'padre bernardo', 'GO', '00000000000'),
(2, 'quadra 09 lt 06', 73700000, 'rua sem nome', 'padre bernardo', 'GO', '00000000001');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_login`
--

CREATE TABLE `tb_login` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `password` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_login`
--

INSERT INTO `tb_login` (`id`, `user_name`, `cpf`, `password`) VALUES
(1, 'WENDEL ULHOA', '00000000000', '$2y$10$EwgJZKSpHzRwxKbosBlzzupSawnwHBpBbKdnq5DiqKid160j25BuO'),
(2, 'ZEZINHO', '00000000001', '$2y$10$jhUmReOPVAfXm4N5EC8UXOxs1OyBnqDGCJqYhhnlVIABnvLH3oa4.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_produtos`
--

CREATE TABLE `tb_produtos` (
  `id` int(11) NOT NULL,
  `nome_produto` varchar(100) DEFAULT NULL,
  `preco_produto` decimal(10,2) DEFAULT NULL,
  `cod_categoria` int(11) DEFAULT NULL,
  `path_img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_produtos`
--

INSERT INTO `tb_produtos` (`id`, `nome_produto`, `preco_produto`, `cod_categoria`, `path_img`) VALUES
(1, 'iphone x', '3500.00', 1, 'http://localhost:8000/api/produtos/FqjcivZkZCj6qFLwFobFdSZ2f7OioksQ5Bt3EZok.jpg'),
(2, 'samsung s9 128gb', '2500.00', 2, 'http://localhost:8000/api/produtos/lYD7zbF1YlSuK4fBm0O8kYHkj7nTtI2uFH3WbxuV.jpg'),
(3, 'samsung s10 256gb', '3500.00', 2, 'http://localhost:8000/api/produtos/DoHTuIz5JVsLAej7pkheNSQXUWO2s5P5oG4UsJtq.jpg'),
(4, 'notebook dell g3', '4500.00', 4, 'http://localhost:8000/api/produtos/myLYOjxejn1pguhJVCIVTylauhc3OzVmf3FnzOjf.jpg'),
(5, 'notebook samsung', '3000.00', 2, 'http://localhost:8000/api/produtos/uSNQgy96UAGi1zTF23WeU2EZ7p8mo0dVjgwmfYOU.jpg'),
(6, 'ps4 500gb', '1000.00', 5, 'http://localhost:8000/api/produtos/3TcEqtzOjQsRJgKNfj12T25loVPva9qd2mZM7kXJ.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_user`
--

INSERT INTO `tb_user` (`id`, `user_name`, `cpf`) VALUES
(1, 'WENDEL ULHOA', '00000000000'),
(2, 'ZEZINHO', '00000000001');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_categoria`
--
ALTER TABLE `tb_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_compras`
--
ALTER TABLE `tb_compras`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_endereco`
--
ALTER TABLE `tb_endereco`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices para tabela `tb_produtos`
--
ALTER TABLE `tb_produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_categoria`
--
ALTER TABLE `tb_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_compras`
--
ALTER TABLE `tb_compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `tb_endereco`
--
ALTER TABLE `tb_endereco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_login`
--
ALTER TABLE `tb_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_produtos`
--
ALTER TABLE `tb_produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
