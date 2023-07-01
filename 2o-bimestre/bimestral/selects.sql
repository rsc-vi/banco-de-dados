-- Qual é o preço médio, máximo e mínimo dos produtos?
SELECT AVG(preco) AS preco_medio, MAX(preco) AS preco_maximo, MIN(preco) AS preco_minimo FROM produtos;

#Preço médio: 136.99
#Preço máximo: 599.99
#Preço mínimo: 19.992


-- Quantos produtos existem em cada categoria?
SELECT categoria, COUNT(*) AS quantidade_produtos FROM produtos GROUP BY categoria;

# Vestuário: 2
# Calçados: 1
# Acessórios: 2
# Livros: 1
# Eletrônicos: 3
# Periféricos: 1


-- Quais são as categorias distintas existentes na tabela de produtos?
SELECT DISTINCT categoria FROM produtos;

# Vestuário
# Calçados
# Acessórios
# Livros
# Eletrônicos
# Periféricos


-- Quais categorias possuem mais de 2 produtos?
SELECT categoria FROM produtos GROUP BY categoria HAVING COUNT(*) > 2;

#Somente a categoria: Eletrônicos

-- Quais são os produtos que possuem a palavra "Livro" em seu nome?
SELECT id FROM produtos WHERE nome LIKE '%Livro%';

#Somente o produto 6


-- Quais são os 3 produtos mais caros?
SELECT * FROM produtos ORDER BY preco DESC LIMIT 3;

#Smarthphone
#Tablet
#Tênis


-- Quais produtos têm o preço dentro do intervalo de R$ 50 a R$ 100?
SELECT * FROM produtos WHERE preco >= 50 AND preco <= 100;
#OU
SELECT *FROM produtos WHERE preco BETWEEN 50 AND 100;

#Calça
#Tênis
#Óculos de Sol
#Fones de Ouvido



-- Quais são os produtos com ID 1, 3 e 5?
SELECT * FROM produtos WHERE id IN (1, 3, 5);

#ID 1: Camiseta
#ID 3: Tênis
#ID 5: Óculos de Sol


-- Qual é o valor total gasto em produtos da categoria "Eletrônicos"?
SELECT SUM(preco) AS valor_total_gasto FROM produtos WHERE categoria = 'Eletrônicos';

#O valor total gasto é: 999.97


-- Quais são os produtos que pertencem às categorias "Vestuário" ou "Acessórios" e possuem um preço entre R$ 30 e R$ 50?
SELECT * FROM produtos WHERE categoria IN ('Vestuário', 'Acessórios') AND preco BETWEEN 30 AND 50;


#Apenas a Bolsa, da categoria acessórios possui um preço entre R$30 e R$50

