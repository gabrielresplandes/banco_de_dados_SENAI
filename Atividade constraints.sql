create database banco;

create table contas(
	id int auto_increment primary key,
    nome varchar(20) not null,
    sobrenome varchar(100) unique not null,
    cpf varchar(11) unique not null,
    saldo decimal (10,2),
    data_Nascm date not null
);

insert into contas (nome, sobrenome, cpf, saldo, data_Nascm) values ("Junior", "Alves", 01234567816, 5250.70, '2003-10-19');
