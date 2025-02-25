create database seven_sorveteria;

create table clientes(
	id_cliente int primary key auto_increment,
    nome varchar(255) not null
);

create table pedidos(
	id_pedido int primary key auto_increment,
    produto varchar(200) not null,
    data_pedido date not null,
    cliente_id int(3) not null,
    foreign key (cliente_id) references clientes(id_cliente)
);

insert into clientes (nome) values ("Carlos");
insert into clientes (nome) values ("Ana");
insert into clientes (nome) values ("Bruna");
insert into clientes (nome) values ("Jessica");
insert into clientes (nome) values ("Victor");
insert into clientes (nome) values ("Fernanda");

insert into pedidos (produto, data_pedido, cliente_id) values ("Picole de Caju", '2025-02-05', 1);
insert into pedidos (produto, data_pedido, cliente_id) values ("Sorvete de Flocos - 1l", '2025-02-08', 1);
insert into pedidos (produto, data_pedido, cliente_id) values ("2x Acai 500ml", '2025-02-12', 1);

insert into pedidos (produto, data_pedido, cliente_id) values ("2x Acai 500ml", '2025-02-12', 2);

insert into pedidos (produto, data_pedido, cliente_id) values ("Acai 1,5l", '2025-02-02', 5);

insert into pedidos (produto, data_pedido, cliente_id) values ("4x Acai 300ml", '2025-02-06', 6);
insert into pedidos (produto, data_pedido, cliente_id) values ("Sorvete de Morango - 1l", '2025-02-06', 6);

-- Lista os pedidos e os nomes dos clientes que fizeram pedidos
SELECT pedidos.id_pedido, clientes.nome, pedidos.produto, pedidos.data_pedido
FROM pedidos
JOIN clientes ON pedidos.cliente_id = clientes.id_cliente;

-- Lista todos os clientes e os pedidos que fizeram (mesmo que não tenham feito pedidos)
SELECT clientes.id_cliente, clientes.nome, pedidos.id_pedido, pedidos.produto, pedidos.data_pedido
FROM clientes
LEFT JOIN pedidos ON clientes.id_cliente = pedidos.cliente_id
ORDER BY clientes.id_cliente;

-- Mostra quantos pedidos cada cliente fez
SELECT clientes.id_cliente, clientes.nome, COUNT(pedidos.id_pedido) AS total_pedidos
FROM clientes
LEFT JOIN pedidos ON clientes.id_cliente = pedidos.cliente_id
GROUP BY clientes.id_cliente, clientes.nome
ORDER BY total_pedidos DESC;






