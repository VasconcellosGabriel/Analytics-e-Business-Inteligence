CREATE TABLE `Livro` (
  `codigo_identificacao` int PRIMARY KEY COMMENT 'Código único do livro',
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `ano_publicacao` int,
  `quantidade_exemplares` int DEFAULT 1 COMMENT 'Quantidade de cópias disponíveis'
);

CREATE TABLE `Morador` (
  `id_morador` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `endereco` varchar(255),
  `telefone` varchar(255)
);

CREATE TABLE `Emprestimo` (
  `id_emprestimo` int PRIMARY KEY AUTO_INCREMENT,
  `id_morador` int NOT NULL,
  `codigo_livro` int NOT NULL,
  `data_emprestimo` date NOT NULL,
  `data_prevista_devolucao` date NOT NULL,
  `data_devolucao_real` date COMMENT 'Fica em branco (null) se o livro ainda não foi devolvido'
);

ALTER TABLE `Emprestimo` ADD FOREIGN KEY (`id_morador`) REFERENCES `Morador` (`id_morador`);

ALTER TABLE `Emprestimo` ADD FOREIGN KEY (`codigo_livro`) REFERENCES `Livro` (`codigo_identificacao`);
