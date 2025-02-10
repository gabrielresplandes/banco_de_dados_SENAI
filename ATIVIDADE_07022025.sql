create database seven_shirts;

create table estoque(
	id int auto_increment primary key,
	nome varchar(80),
    tamanho varchar(10),
    cor varchar(20),
    valor decimal(8,2)
);

INSERT INTO seven_shirts.estoque (nome, tamanho, cor, valor) VALUES 
    ('Camiseta Manga Longa DryFit', 'M', 'Preta', 45.90),
    ('Meia Cano Curto - Nike', '3', 'Branca', 27.90),
    ('Touca TNF', '3', 'Preta', 49.90),
    ('Oculos RayBan', '0', 'Dourado', 729.90),
    ('Tenis Adidas', '41', 'Preto', 429.90),
    ('Relogio Casio', '0', 'Prata', 209.90);


SET SQL_SAFE_UPDATES = 0;
DELETE FROM estoque;

