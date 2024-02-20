/*Exercicio 01 - Criar banco de dados Comex*/
create database if not exists db_comex;

use db_comex;

create table categoria (
id bigint not null auto_increment,
nome varchar(100),
primary key(id)
);

create table produto (
id bigint not null auto_increment,
nome varchar(255),
preco decimal(10,2),
categoria_id bigint,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

create table cliente (
id bigint auto_increment,
nome varchar(255),
primary key(id)
);

create table pedido (
id bigint auto_increment primary key,
data datetime,
cliente_id bigint,
FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

create table item_pedido (
id bigint not null auto_increment primary key,
pedido_id bigint,
produto_id bigint,
preco_unitario decimal(10,2),
quantidade integer,
foreign key (pedido_id) references pedido(id),
foreign key (produto_id) references produto(id)
);
/*FIM Exercicio 01 - Sprint 05*/

/*Exercicio 02 - Efetuar carga nas tabelas*/
/*itens tabela categoria*/
INSERT INTO categoria (nome) VALUES 
('INFO'),
('MÓVEIS'),
('LIVROS'),
('CELULARES'),
('AUTOMOTIVA');

/*itens tabela produto*/
INSERT INTO produto (nome, preco, categoria_id) VALUES 
('Notebook Samsung', 3523.00, 1), 
('Sofá 3 lugares', 2500.00, 2),
('Clean Architecture', 102.90, 3),
('Mesa de jantar 6 lugares', 3678.98, 2),
('iPhone 13 Pro', 9176.00, 4),
('Monitor Dell 27"', 1889.00, 1),
('Implementing Domain-Driven Design', 144.07, 3),
('Jogo de pneus', 1276.79, 5),
('Clean Code', 95.17, 3),
('Galaxy S22 Ultra', 8549.10, 4),
('Macbook Pro 16', 31752.00, 1),
('Refactoring Improving the Design of Existing Code', 173.90, 3),
('Cama queen size', 3100.00, 2),
('Central multimidia', 711.18, 5),
('Building Microservices', 300.28, 3),
('Galaxy Tab S8', 5939.10, 1);

/*itens tabela cliente*/
INSERT INTO cliente (nome) VALUES
('ANA'),
('ELI'),
('DANI'),
('GABI'),
('BIA'),
('CAIO');

/*itens tabela pedido*/
INSERT INTO pedido (data, cliente_id) VALUES 
('2022-01-01', 1),
('2022-01-05', 1),
('2022-01-08', 1),
('2022-01-06', 2),
('2022-01-13', 1),
('2022-01-04', 3),
('2022-01-10', 4),
('2022-01-15', 5),
('2022-01-09', 5),
('2022-01-14', 3),
('2022-01-03', 6),
('2022-01-12', 3),
('2022-01-07', 3),
('2022-01-16', 6),
('2022-01-11', 6),
('2022-01-02', 5);

/*itens tabela item_pedido*/
INSERT INTO item_pedido (pedido_id, produto_id, preco_unitario, quantidade) VALUES
(1, 1, 3523.00, 1),
(2, 2, 2500.00, 1),
(3, 3, 102.90, 2),
(4, 4, 3678.98, 1),
(5, 5, 9176.00, 6),
(6, 6, 1889.00, 3),
(7, 7, 144.07, 3),
(8, 8, 1276.79, 1),
(9, 9, 95.17, 1),
(10, 10, 8549.10, 5),
(11, 11, 31752.00, 1),
(12, 12, 173.90, 1),
(13, 13, 3100.00, 2),
(14, 14, 711.18, 1),
(15, 15, 300.28, 2),
(16, 16, 5939.10, 4);
/*FIM Exercicio 02 - Sprint 05*/

/*Exercicio 03 - Relatório de produtos e categorias*/
SELECT 
    categ.id AS id_categoria,
    categ.nome AS nome_categoria,
    prod.id AS id_produto,
    prod.nome AS nome_produto,
    prod.preco AS preco_produto
FROM 
    categoria categ
JOIN 
    produto prod ON categ.id = prod.categoria_id;
/*FIM Exercicio 03 - Sprint 05*/

/*Exercicio 04 - Relatório completo de pedidos*/
SELECT
    cliente.nome AS nome_cliente,
    categoria.nome AS nome_categoria,
    produto.nome AS nome_produto,
    item_pedido.preco_unitario AS preco_unitario,
    item_pedido.quantidade AS quantidade_vendida,
    pedido.data AS data_pedido
FROM
    cliente
JOIN
    pedido ON cliente.id = pedido.cliente_id
JOIN
    item_pedido ON pedido.id = item_pedido.pedido_id
JOIN
    produto ON item_pedido.produto_id = produto.id
JOIN
    categoria ON produto.categoria_id = categoria.id;
/*FIM Exercicio 04 - Sprint 05*/

/*Exercicio 05 - Relatório de vendas por categorias*/
SELECT
    categoria.nome AS nome_categoria,
    SUM(item_pedido.quantidade) AS total_vendido
FROM
    categoria
JOIN
    produto ON categoria.id = produto.categoria_id
JOIN
    item_pedido ON produto.id = item_pedido.produto_id
GROUP BY
    categoria.nome;
/*FIM Exercicio 05 - Sprint 05*/

/*Exercicio 06 - Relatório analítico de pedidos*/
SELECT
    COUNT(DISTINCT pedido.id) AS quantidade_pedidos_realizados,
    FORMAT(SUM(item_pedido.quantidade), 0) AS quantidade_produtos_vendidos,
    FORMAT(MIN(item_pedido.quantidade * item_pedido.preco_unitario), 2) AS valor_pedido_mais_barato,
    TRIM(TRAILING '0' FROM FORMAT(MAX(item_pedido.quantidade * item_pedido.preco_unitario), 2)) AS valor_pedido_mais_caro,
    FORMAT(SUM(item_pedido.quantidade * item_pedido.preco_unitario), 2) AS montante_vendido
FROM
    pedido
JOIN
    item_pedido ON pedido.id = item_pedido.pedido_id;
/*FIM Exercicio 06 - Sprint 05*/

/*Exercicio 07 - Relatório de clientes mais fiéis*/
SELECT
    c.nome AS nome_cliente,
    COUNT(p.id) AS quantidade_pedidos_feitos
FROM
    cliente c
JOIN
    pedido p ON c.id = p.cliente_id
GROUP BY
    c.id, c.nome;
/*FIM Exercicio 07 - Sprint 05*/