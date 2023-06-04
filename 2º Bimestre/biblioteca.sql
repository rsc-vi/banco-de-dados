CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autores(
    id_autor INT,
    nome VARCHAR(50),
    data_nascimento VARCHAR(10),
    nacionalidade VARCHAR(50),
    PRIMARY KEY (id_autor)
);

CREATE TABLE categorias(
    id_categoria INT,
    nome VARCHAR(50),
    PRIMARY KEY (id_categoria)
);

CREATE TABLE livros(
    id_livro INT,
    titulo VARCHAR(200),
    FK_id_autor INT,
    FK_id_categoria INT,
    editora VARCHAR(100),
    ano_publicacao INT,
    FOREIGN KEY (FK_id_autor) REFERENCES autores(id_autor),
    FOREIGN KEY (FK_id_categoria) REFERENCES categorias(id_categoria),
    PRIMARY KEY (id_livro)
);

INSERT INTO autores (id_autor, nome, data_nascimento, nacionalidade)
VALUES(1, 'Collen Hoover', '11/12/1979', 'Estadounidense'),
    (2, ' Dan Brown', '22/06/1964', 'Estadounidense'),
    (3, 'John Ronald Reuel Tolkien', '03/01/1892', 'sul-africano');

INSERT INTO categorias (id_categoria, nome)
VALUES(1, 'Romance'),
    (2, 'Mistério'),
    (3, 'Aventura');

INSERT INTO livros (id_livro, titulo, FK_id_autor, FK_id_categoria, editora, ano_publicacao)
VALUES (1, 'Todas as suas (im)perfeições', 1, 1, 'Galera Record', 2019),
    (2, 'Verity', 1, 1, 'Galera Record', 2018),
    (3, 'O Código Da Vinci', 2, 2, 'Editora Sexante', 2003),
    (4, 'Anjos e Demônios', 2, 2, 'Editora Sexante', 2000),
    (5, 'O Hobbit', 3, 3, 'George Allen & Unwin Ltd.', 1937),
    (6, 'O Senhor dos Anéis', 3, 3, 'George Allen & Unwin Ltd.', 1954);

ALTER TABLE livros
DROP COLUMN ano_publicacao;

UPDATE livros
SET FK_id_autor = 1 
WHERE id_livro = 2;

DELETE FROM livros 
WHERE id_livro = 2;
      