create database techstore;

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    email VARCHAR(255),
    endereco VARCHAR(255)
);

-- Tabela de Produtos
CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(50),
    descricao VARCHAR(255),
    preco DECIMAL(10,2)
);

-- Tabela de Pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    produto_id INT,
    data_pedido DATE,
    quantidade INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO clientes (nome, email, endereco) VALUES 
('João da Silva', 'Joao.Silva@GMAIL.com', 'Av. Paulista, 1000'),
('MARIA de Souza', 'Maria.Souza@outlook.com', 'Rua das Flores, 200'),
('carlos alberto', 'Carlos.Alberto@gmail.COM', 'Av. Brasil, 300'),
('ANA PAULA', 'Ana.Paula@YAHOO.com', 'Av. Central, 400');

INSERT INTO produtos (codigo, descricao, preco) VALUES 
('N001', 'Notebook Dell Inspiron', 3500.00),
('S001', 'Smartphone Samsung Galaxy', 2000.00),
(NULL, 'Notebook Lenovo IdeaPad', 2800.00),
('P001', 'Tablet Apple iPad', 4500.00);

INSERT INTO pedidos (cliente_id, produto_id, data_pedido, quantidade) VALUES 
(1, 1, '2025-01-15', 1),
(2, 2, '2025-01-20', 2),
(3, 3, '2025-02-05', 1),
(4, 4, '2025-02-10', 3);

--  Corrigir nomes para letras maiúsculas
UPDATE clientes
SET nome = UPPER(nome);

-- Normalizar e-mails para letras minúsculas
UPDATE clientes
SET email = LOWER(email);

-- Padronizar endereços: substituir "Av." por "Avenida"
UPDATE clientes
SET endereco = REPLACE(endereco, 'Av.', 'Avenida');

-- Identificar produtos que contenham "Notebook" na descrição
SELECT * FROM produtos
WHERE descricao LIKE '%Notebook%';

-- Verificar quantos clientes possuem e-mails com o domínio "@gmail.com"
SELECT COUNT(*) AS total_gmail
FROM clientes
WHERE email LIKE '%@gmail.com';

-- Identificar produtos sem código cadastrado
SELECT * FROM produtos
WHERE codigo IS NULL OR codigo = '';

