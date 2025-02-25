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
  ("Carlos Silva", "carlos.silva@email.com", "Matemática"),
  ("Ana Souza", "ana.souza@email.com", "Física"),
  ("João Mendes", "joao.mendes@email.com", "História");
  
INSERT INTO cursos (nome, descricao, id_professor) VALUES 
  ("Cálculo I", "Curso introdutório de cálculo diferencial", 1),
  ("Mecânica Clássica", "Estudo das leis do movimento", 2),
  ("História Moderna", "História do século XV ao XIX", 3);
  
INSERT INTO alunos (nome, email, data_nascimento) VALUES 
  ("Lucas Pereira", "lucas.pereira@email.com", "2000-05-12"),
  ("Mariana Lima", "mariana.lima@email.com", "2001-08-25"),
  ("Ricardo Alves", "ricardo.alves@email.com", "1999-11-30");

INSERT INTO matriculas (id_aluno, id_curso, data_matricula) VALUES 
  (1, 1, "2024-02-01"),
  (1, 2, "2024-02-01"),
  (2, 3, "2024-02-01"),
  (3, 1, "2024-02-01");
  
INSERT INTO avaliacoes (id_matricula, nota, data_avaliacao) VALUES 
  (1, 8.5, "2024-03-10"),
  (2, 7.8, "2024-03-15"),
  (3, 9.2, "2024-03-20"),
  (4, 6.5, "2024-03-25");


