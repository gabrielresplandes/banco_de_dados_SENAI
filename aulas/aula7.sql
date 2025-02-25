create database relacionamento;

create table alunos(
	id int primary key auto_increment,
    nome varchar(150),
    turma varchar(8)
);

insert into alunos (nome, turma) values ('Yuri Alberto', 'M122');
insert into alunos (nome, turma) values ('Kyrie Irving', 'V130');
insert into alunos (nome, turma) values ('Luka Doncic', 'M122');
insert into alunos (nome, turma) values ('Tiquinho Soares', 'V130');

create table contatos(
	id int primary key auto_increment,
    telefone varchar(20),
    aluno_id int not null,
    foreign key (aluno_id) references alunos(id)
);

delete from contatos;

set sql_safe_updates = 1;

insert into contatos (telefone, aluno_id) values ("(61) 999999999", 1);
insert into contatos (telefone, aluno_id) values ("(61) 977777777", 2);
insert into contatos (telefone, aluno_id) values ("(61) 988888888", 1);
insert into contatos (telefone, aluno_id) values ("(61) 977777777", 2);