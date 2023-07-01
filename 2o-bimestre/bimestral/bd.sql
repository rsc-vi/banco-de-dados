CREATE DATABASE lojaprova;
USE lojaprova;

CREATE TABLE produtos (
  id INT,
  nome VARCHAR(50),
  categoria VARCHAR(50),
  preco DOUBLE,
  PRIMARY KEY(id)
);
-- Inserção de dados na tabela "produtos"
INSERT INTO produtos (id, nome, categoria, preco)
VALUES (1, 'Camiseta', 'Vestuário', 29.99),
  (2, 'Calça', 'Vestuário', 59.99),
  (3, 'Tênis', 'Calçados', 99.99),
  (4, 'Bolsa', 'Acessórios', 49.99),
  (5, 'Óculos de Sol', 'Acessórios', 79.99),
  (6, 'Livro', 'Livros', 19.99),
  (7, 'Smartphone', 'Eletrônicos', 599.99),
  (8, 'Tablet', 'Eletrônicos', 299.99),
  (9, 'Fones de Ouvido', 'Eletrônicos', 99.99),
  (10, 'Mouse', 'Periféricos', 29.99);