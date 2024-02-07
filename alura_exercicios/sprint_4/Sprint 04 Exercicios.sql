CREATE DATABASE IF NOT EXISTS db_comex;

USE db_comex;

/*Exercicio 01 - Criar tabela para armazenar vendas de produtos*/
CREATE TABLE tb_pedido (
id bigint,
produto varchar(255),
categoria varchar(255),
preco decimal(10,2),
quantidade integer,
data date,
cliente varchar(60));

/*Adicionando coluna ID como chave primária*/
ALTER TABLE tb_pedido ADD PRIMARY KEY (id);
/*Fim exercicio 01*/

/*Exercicio 02 - Inserir dados na tabela de pedidos */
INSERT INTO tb_pedido 
(id, categoria, produto, preco, quantidade, data, cliente) 
VALUES
(1, 'INFO', 'Notebook Samsung', 3523.00, 1, '2022-01-01', 'ANA'),
(2, 'MÓVEIS', 'Sofá 3 lugares', 2500.00, 1, '2022-01-05', 'ANA'),
(3, 'LIVROS', 'Clean Architecture', 102.90, 2, '2022-01-08', 'ANA'),
(4, 'MÓVEIS', 'Mesa de jantar 6 lugares', 3678.98, 1, '2022-01-06', 'ELI'),
(5, 'CELULARES', 'iPhone 13 Pro', 9176.00, 6, '2022-01-13', 'ANA'),
(6, 'INFO', 'Monitor Dell 27"', 1889.00, 3, '2022-01-04', 'DANI'),
(7, 'LIVROS', 'Implementing Domain-Driven Design', 144.07, 3, '2022-01-10', 'GABI'),
(8, 'AUTOMOTIVA', 'Jogo de pneus', 1276.79, 1, '2022-01-15', 'BIA'),
(9, 'LIVROS', 'Clean Code', 95.17, 1, '2022-01-09', 'BIA'),
(10, 'CELULARES', 'Galaxy S22 Ultra', 8549.10, 5, '2022-01-14', 'DANI'),
(11, 'INFO', 'Macbook Pro 16', 31752.00, 1, '2022-01-03', 'CAIO'),
(12, 'LIVROS', 'Refactoring Improving the Design of Existing Code', 173.90, 1, '2022-01-12', 'DANI'),
(13, 'MÓVEIS', 'Cama queen size', 3100.00, 2, '2022-01-07', 'DANI'),
(14, 'AUTOMOTIVA', 'Central multimidia', 711.18, 1, '2022-01-16', 'CAIO'),
(15, 'LIVROS', 'Building Microservices', 300.28, 2, '2022-01-11', 'CAIO'),
(16, 'INFO', 'Galaxy Tab S8', 5939.10, 4, '2022-01-02', 'BIA');
/*Fim exercicio 02*/

/*Exercicio 03 -  Corrigir categoria INFORMÁTICA*/
UPDATE tb_pedido SET categoria = 'INFORMÁTICA' WHERE categoria = 'INFO';
/*Fim exercicio 03*/

/*Exercicio 04 - Relatório de todos os pedidos*/
SELECT * FROM tb_pedido;
/*Fim exercicio 04*/

/*Exercício 05 - Relatório de pedidos por categoria*/
SELECT * FROM tb_pedido WHERE categoria = 'CELULARES';
/*Fim exercicio 05*/

/*Exercício 06 - Relatório de pedidos por preço*/
SELECT * FROM tb_pedido WHERE preco >= 3000.00 AND preco <= 10000.00;
/*Fim exercicio 06*/

/*Exercício 07 - Remover pedidos*/
DELETE FROM tb_pedido WHERE quantidade = 1;
DELETE FROM tb_pedido WHERE cliente = 'BIA';
/*Fim exercicio 07*/