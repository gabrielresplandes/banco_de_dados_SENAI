CREATE DATABASE cadastro1;

CREATE TABLE cadastro1.pessoas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    rg VARCHAR(15) UNIQUE,
    cpf VARCHAR(14) UNIQUE,
    idade TINYINT
);

-- Inserção de usuários no banco de dados
INSERT INTO cadastro1.pessoas (nome, rg, cpf, idade, saldo) VALUES 
    ('Amanda Ferreira', '1234567', '98765432100', 22),
    ('Jack Danniels', '7654321', '12345678901', 19),
    ('Pedro Albuquerque', '5967203', '74562135408', 32),
    ('Junior Alves', '9854776', '95514762514', 26),
    ('Cristiano Romulo', '9630145', '62387410253', 18);
    
-- Alteração na tabela "pessoas" adicionando o campo "saldo"
ALTER TABLE cadastro1.pessoas ADD saldo DECIMAL(10,2);

-- Fazendo a inclusão do saldo para os usuários cadastrados no banco
UPDATE cadastro1.pessoas SET saldo = 1500.75 WHERE id = 1;
UPDATE cadastro1.pessoas SET saldo = 320.00 WHERE id = 2;
UPDATE cadastro1.pessoas SET saldo = 850.50 WHERE id = 3;
UPDATE cadastro1.pessoas SET saldo = 3500.80 WHERE id = 4;
UPDATE cadastro1.pessoas SET saldo = 500.25 WHERE id = 5;
