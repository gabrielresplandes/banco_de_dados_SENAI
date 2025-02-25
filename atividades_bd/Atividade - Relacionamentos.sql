create database livrariaDB;

create table autores(
	id_autor int primary key auto_increment,
    nome varchar(155) not null,
    nacionalidade varchar(60)
);

create table livros(
	id_livro int primary key auto_increment,
    titulo varchar(155) not null,
    ano_publi int (4),
    autor_id int not null,
    foreign key (autor_id) references autores(id_autor)
);

insert into autores(nome, nacionalidade) values ("Machado de Assis", "Brasileiro");
insert into autores(nome, nacionalidade) values ("Edgar Allan Poe", "Americano");
insert into autores(nome, nacionalidade) values ("Clarice Lispector", "Brasileira");

insert into livros (titulo, ano_publi, autor_id) values ("memórias póstumas de brás cubas", 1881, 1);
insert into livros (titulo, ano_publi, autor_id) values ("o alienista", 1882, 1);
insert into livros (titulo, ano_publi, autor_id) values ("o corvo", 1845, 2);
insert into livros (titulo, ano_publi, autor_id) values ("a hora da estrela", 1977, 3);
insert into livros (titulo, ano_publi, autor_id) values ("assassinatos na rua morgue", 1841, 2);


-- Seleçao dos livros e seeus respectivos autores
select livros.titulo, livros.ano_publi, autores.nome as autor, autores.nacionalidade
from livros
inner join autores on livros.autor_id = autores.id_autor;

-- Lista os autores e a quantidade de livros de cada autor escreveu
select autores.nome as autor, count(livros.id_livro) as quantidade_livros
from autores
left join livros on autores.id_autor = livros.autor_id
group by autores.nome;

-- Exibe os livros de um autor específico
select livros.titulo, livros.ano_publi
from livros
inner join autores on livros.autor_id = autores.id_autor
where autores.nome = "machado de assis";
