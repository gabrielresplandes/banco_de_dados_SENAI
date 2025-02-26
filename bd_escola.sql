create database seven_escolas;

CREATE TABLE alunos (
  id_aluno INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(85) NOT NULL UNIQUE,
  data_nascimento DATE NOT NULL
);

CREATE TABLE professores (
  id_professor INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(85) NOT NULL UNIQUE,
  especialidade VARCHAR(45) NOT NULL
);

CREATE TABLE cursos (
  id_curso INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(200),
  id_professor INT,
  FOREIGN KEY (id_professor) REFERENCES professores(id_professor) 
  ON DELETE SET NULL ON UPDATE NO ACTION
);

CREATE TABLE matriculas (
  id_matricula INT PRIMARY KEY AUTO_INCREMENT,
  id_aluno INT NOT NULL,
  id_curso INT NOT NULL,
  data_matricula DATE NOT NULL,
  FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno) 
  ON DELETE CASCADE ON UPDATE NO ACTION,
  FOREIGN KEY (id_curso) REFERENCES cursos(id_curso) 
  ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE avaliacoes (
  id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
  id_matricula INT NOT NULL,
  nota DECIMAL(5,2) NOT NULL,
  data_avaliacao DATE NOT NULL,
  FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula) 
  ON DELETE CASCADE ON UPDATE NO ACTION
);

INSERT INTO professores (nome, email, especialidade) VALUES 
  ("Fernando Ribeiro", "fernando.ribeiro@email.com", "Banco de Dados"),
  ("Ana Pereira", "ana.pereira@email.com", "Desenvolvimento Web"),
  ("Carlos Souza", "carlos.souza@email.com", "Redes de Computadores"),
  ("Juliana Mendes", "juliana.mendes@email.com", "Engenharia de Software"),
  ("Marcos Oliveira", "marcos.oliveira@email.com", "Inteligência Artificial");

INSERT INTO cursos (nome, descricao, id_professor) VALUES 
  ("Banco de Dados", "Fundamentos e modelagem de banco de dados relacionais", 1),
  ("Desenvolvimento Web", "Criação de sites modernos e responsivos", 2),
  ("Redes de Computadores", "Configuração e manutenção de redes", 3),
  ("Engenharia de Software", "Práticas e padrões no desenvolvimento de software", 4),
  ("Inteligência Artificial", "Introdução ao aprendizado de máquina e IA", 5);
  
INSERT INTO alunos (nome, email, data_nascimento) VALUES 
  ("Beatriz Souza", "beatriz.souza@email.com", "2002-03-17"),
  ("Carlos Menezes", "carlos.menezes@email.com", "2000-09-05"),
  ("Mariana Alves", "mariana.alves@email.com", "1998-12-22"),
  ("Lucas Oliveira", "lucas.oliveira@email.com", "1999-07-14"),
  ("Renata Lima", "renata.lima@email.com", "2001-06-30"),
  ("Diego Martins", "diego.martins@email.com", "2003-05-05"),
  ("Tatiane Silva", "tatiane.silva@email.com", "2002-10-11");
  
INSERT INTO alunos (nome, email, data_nascimento) VALUES 
  ("Gabriel Santos", "gabriel.santos@email.com", "2001-04-18"),
  ("Luiza Fernandes", "luiza.fernandes@email.com", "1999-10-07"),
  ("Felipe Andrade", "felipe.andrade@email.com", "2000-12-22");
  
INSERT INTO matriculas (id_aluno, id_curso, data_matricula) VALUES 
  (1, 1, "2024-02-20"),
  (2, 1, "2024-02-20"),
  (3, 2, "2024-02-21"),
  (4, 2, "2024-02-21"),
  (5, 3, "2024-02-22"),
  (6, 4, "2024-02-23"),
  (7, 5, "2024-02-24"),
  (3, 3, "2024-02-25"),
  (4, 5, "2024-02-26"),
  (1, 4, "2024-02-27"),
  (2, 5, "2024-02-28");
  
INSERT INTO matriculas (id_aluno, id_curso, data_matricula) VALUES 
  (8, 1, "2024-03-01"),
  (9, 2, "2024-03-02"),
  (10, 3, "2024-03-03");
  
INSERT INTO avaliacoes (id_matricula, nota, data_avaliacao) VALUES 
  (1, 9.0, "2024-03-10"),
  (2, 8.5, "2024-03-12"),
  (3, 7.8, "2024-03-15"),
  (4, 9.5, "2024-03-18"),
  (5, 8.0, "2024-03-20"),
  (6, 7.2, "2024-03-22"),
  (7, 9.8, "2024-03-25"),
  (8, 8.7, "2024-03-27"),
  (9, 7.5, "2024-03-29"),
  (10, 9.1, "2024-03-30"),
  (11, 8.3, "2024-04-01");

-- Lista os alunos matriculados no curso de Banco de Dados
SELECT a.id_aluno, a.nome, a.email, c.nome AS curso, m.data_matricula
FROM alunos a
JOIN matriculas m ON a.id_aluno = m.id_aluno
JOIN cursos c ON m.id_curso = c.id_curso
WHERE c.nome = 'Banco de Dados';

-- Quantidade de alunos matriculados em cada curso
SELECT c.nome AS curso, COUNT(m.id_aluno) AS total_alunos
FROM cursos c
LEFT JOIN matriculas m ON c.id_curso = m.id_curso
GROUP BY c.id_curso, c.nome
ORDER BY total_alunos DESC;

-- Quantidade de alunos matriculados em cada curso
SELECT c.nome AS curso, COUNT(m.id_aluno) AS total_alunos
FROM cursos c
LEFT JOIN matriculas m ON c.id_curso = m.id_curso
GROUP BY c.id_curso, c.nome
ORDER BY total_alunos DESC;

-- Média de nota dos alunos em determinado curso
SELECT c.nome AS curso, AVG(a.nota) AS media_notas
FROM cursos c
JOIN matriculas m ON c.id_curso = m.id_curso
JOIN avaliacoes a ON m.id_matricula = a.id_matricula
WHERE c.nome = 'Banco de Dados';

-- Lista os alunos que ainda não receberam nota
SELECT a.id_aluno, a.nome, a.email, c.nome AS curso, m.data_matricula
FROM alunos a
JOIN matriculas m ON a.id_aluno = m.id_aluno
JOIN cursos c ON m.id_curso = c.id_curso
LEFT JOIN avaliacoes av ON m.id_matricula = av.id_matricula
WHERE av.id_avaliacao IS NULL;

