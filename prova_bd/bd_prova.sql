create database seven_marketplace;

create table clientes(
	id_cliente int auto_increment primary key,
    nome varchar(155) not null,
    email varchar(155),
    telefone varchar(15) not null,
    endereco varchar(200) not null
);

create table pedidos(
	id_pedido int auto_increment primary key,
    id_cliente int,
    data_pedido date not null,
    total int not null,
    status_pedido varchar(35) not null,
    foreign key (id_cliente) references clientes (id_cliente)
);

create table fornecedores(
	id_fornecedor int auto_increment primary key,
    nome_fornecedor varchar(150) not null,
    contato varchar(35) not null,
    endereco varchar(200) not null
);

create table produtos(
	id_produto int auto_increment primary key,
    nome_produto varchar(150) not null,
    preco decimal(8,2) not null,
    id_fornecedor int,
    estoque int not null,
    foreign key (id_fornecedor) references fornecedores (id_fornecedor)
);

create table pagamentos(
	id_pagamento int auto_increment primary key,
    id_pedido int,
    metodo_pagamento varchar(65) not null,
    status_pagamento varchar(35) not null,
    valor_pago decimal(8,2) not null,
    foreign key (id_pedido) references pedidos (id_pedido)
);

CREATE TABLE pedido_produto (
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) ON DELETE CASCADE ON UPDATE CASCADE
);

alter table pedidos 
add constraint fk_pedidos_clientes 
foreign key (id_cliente) references clientes(id_cliente) 
on delete cascade on update cascade;

alter table produtos 
add constraint fk_produtos_fornecedores 
foreign key (id_fornecedor) references fornecedores(id_fornecedor) 
on delete cascade on update cascade;

alter table pagamentos 
add constraint fk_pagamentos_pedidos 
foreign key (id_pedido) references pedidos(id_pedido) 
on delete cascade on update cascade;