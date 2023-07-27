# clientes(nome, cidade, id_cliente)
# pedidos(valor, data, id_pedido, id_clientes)
# produtos(nome, preco, id_produto, id_categoria)
#categorias(nome, id_categorias)
#pedidosprodutos(quantidade, id_pedido, id_produto)
CREATE DATABASE lojas;
USE lojas;

CREATE TABLE clientes (
nome VARCHAR (50),
cidade VARCHAR (50),
id_cliente VARCHAR (50),
PRIMARY KEY (id_cliente)
);

CREATE TABLE categorias (
nome VARCHAR (50),
id_categoria VARCHAR (50),
PRIMARY KEY (id_categoria)
);

CREATE TABLE produtos (
nome VARCHAR (50),
preco DOUBLE,
id_produto VARCHAR (50),
FK_id_categoria VARCHAR (50),
FOREIGN KEY (FK_id_categoria) REFERENCES categorias(id_categoria),
PRIMARY KEY (id_produto, FK_id_categoria)
);

CREATE TABLE pedidos (
valor INT,
data VARCHAR (10),
id_pedido VARCHAR (50),
FK_id_cliente VARCHAR (50),
FOREIGN KEY (FK_id_cliente) REFERENCES clientes(id_cliente),
PRIMARY KEY (id_pedido, FK_id_cliente) 
);



CREATE TABLE tem (
quantidade INT,
FK_id_pedido VARCHAR (50),
FK_id_produto VARCHAR(50),
FOREIGN KEY (FK_id_pedido) REFERENCES pedidos (id_pedido), 
FOREIGN KEY (FK_id_produto) REFERENCES produtos (id_produto) 
);





