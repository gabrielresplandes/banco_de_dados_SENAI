create database seven_Brasil;

create table clientes(
	nome varchar(80) unique not null,
    email varchar(255) unique not null,
    telefone varchar(18)
);
	insert into seven_Brasil.clientes (nome, email, telefone) values 
    ('Junior Pereira', 'juninff61@gmail.com', '(61) 98756-5432');
    
    insert into seven_Brasil.clientes (nome, email, telefone) values
    ('Amanda Alves', 'teste@gmail.com', '(61)91234-5678');
    
create table produtos (
    id int auto_increment primary key,
    nome varchar(255) not null,
    peso decimal(6,2) not null,
    cor varchar(100)
);

insert into produtos (nome, peso, cor) values ("Creme Natura", 350.00, "Branco");
insert into produtos (nome, peso, cor) values ("Perfume DG", 120.00, "");

create table pedidos(
	id int auto_increment primary key not null,
    pagamento varchar(80),
    valor decimal(6,2),
    produto_id int not null,
    foreign key (produto_id) references produtos(id)
);

insert into pedidos (pagamento, valor, produto_id) values ("PIX", 69.99, 1);
insert into pedidos (pagamento, valor, produto_id) values ("Boleto", 269.99, 2);