-- Exercicio 1

create database seven_clothes;

create table vendas(
	id_venda int primary key not null auto_increment,
    id_produto int(3) not null,
    quantidade int(2) not null,
    preco_unitario decimal(8,2) not null,
    id_categoria int(2) not null
);

insert into seven_clothes.vendas (id_produto, quantidade, preco_unitario, id_categoria) values ('22', '4', '129.90', '2');
insert into seven_clothes.vendas (id_produto, quantidade, preco_unitario, id_categoria) values ('23', '7', '59.90', '4');
insert into seven_clothes.vendas (id_produto, quantidade, preco_unitario, id_categoria) values ('24', '9', '329.90', '6');
insert into seven_clothes.vendas (id_produto, quantidade, preco_unitario, id_categoria) values ('22', '4', '229.90', '2');
insert into seven_clothes.vendas (id_produto, quantidade, preco_unitario, id_categoria) values ('27', '2', '429.90', '4');
insert into seven_clothes.vendas (id_produto, quantidade, preco_unitario, id_categoria) values ('29', '9', '49.90', '6');

SELECT 
    id_categoria, 
    SUM(quantidade * preco_unitario) AS total_vendas
FROM vendas
GROUP BY id_categoria
ORDER BY id_categoria;

-- Exercicio 2

create database seven_eletronicos;

create table produtos(
	id_produto int(3) primary key not null,
    nome_produto varchar(128),
    preco decimal(8,2),
    estoque int(3)
);

insert into seven_eletronicos.produtos(id_produto, nome_produto, preco, estoque) values (122, 'Smartphone Samsung S22', 2499.90, 32 );
insert into seven_eletronicos.produtos(id_produto, nome_produto, preco, estoque) values (110, 'Smartwatch QCY T42', 299.90, 18);
insert into seven_eletronicos.produtos(id_produto, nome_produto, preco, estoque) values (72, 'Mouse RedDragon STW3', 259.90, 9);

SELECT id_produto, nome_produto 
FROM produtos
WHERE nome_produto LIKE '%smart%';


-- Exercicio 3

create database seven_consultas;

create table clientes(
	id_cliente int(3) primary key not null,
    nome_cliente varchar(255),
    estado varchar(255)
);

insert into clientes (id_cliente, nome_cliente, estado) values (1, 'Carlos Silva', 'SP');
insert into clientes (id_cliente, nome_cliente, estado) values (2, 'Mariana Oliveira', 'SP');
insert into clientes (id_cliente, nome_cliente, estado) values (3, 'Fernando Souza', 'RJ');
insert into clientes (id_cliente, nome_cliente, estado) values (4, 'Juliana Mendes', 'RJ');
insert into clientes (id_cliente, nome_cliente, estado) values (5, 'Roberto Lima', 'MG');
insert into clientes (id_cliente, nome_cliente, estado) values (6, 'Ana Paula Castro', 'MG');

SELECT id_cliente, nome_cliente, estado
FROM clientes
WHERE estado IN ('SP', 'RJ', 'MG');

