create database JoinAula;

create table endereco(
	id int primary key auto_increment,
    rua varchar(350) not null,
    numero int(3) not null,
    pessoa_id int(3) not null,
    foreign key (pessoa_id) references pessoa(id)
);

create table pessoa(
	id int primary key auto_increment,
    nome varchar(250) not null,
    nacionalidade varchar(80) not null
);

insert into pessoa (nome, nacionalidade) values ("Pedro", "Brasileiro");
insert into pessoa (nome, nacionalidade) values ("Tom", "Americano");
insert into endereco(rua, numero, pessoa_id) values ("Rua do Limoeiro, Av. Jose Carlos", "122", 1);

--  Sem Inner
select pessoa.nome, endereco.rua from pessoa join endereco on pessoa.id = endereco.id;

--  Inner (Interseção ou "comum nas duas colunas")
select pessoa.nome, endereco.rua from pessoa inner join endereco on pessoa.id = endereco.id;

-- Junta as duas, priorizando a tabela da direita
select pessoa.nome, endereco.rua from endereco right join pessoa on pessoa.id = endereco.id;

-- Junta as duas, priorizando a tabela da esquerda
select pessoa.nome, endereco.rua from endereco left join pessoa on pessoa.id = endereco.id;

use employees;

-- O que quero, De onde?, Agrupar quem?
select gender, count(gender) as qtd_por_genero from employees group by gender;
select dept_no, count(dept_no) from dept_emp group by dept_no;