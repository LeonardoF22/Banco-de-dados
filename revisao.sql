-- Criando o banco de dados --
CREATE DATABASE academia;
-- Selecionando o banco --
USE academia;

-- Criando as tabelas --
CREATE TABLE tb_clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60),
    telefone VARCHAR(15),
    endereco VARCHAR(30)
);

CREATE TABLE tb_contratos (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATE,
    data_fim DATE,
    valor FLOAT,
    forma_pag VARCHAR(15),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
);

CREATE TABLE tb_professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60),
    telefone VARCHAR(15),
    carteira_trabalho VARCHAR(15),
    salario FLOAT
);

CREATE TABLE tb_modalidades (
    id_modalidade INT AUTO_INCREMENT PRIMARY KEY,
    modalidade VARCHAR(30)
);

CREATE TABLE tb_professorModalidade(
    id_professorModalidade INT AUTO_INCREMENT PRIMARY KEY,
    id_professor INT,
    id_modalidade INT,
    FOREIGN KEY (id_professor) REFERENCES tb_professores(id_professor),
    FOREIGN KEY (id_modalidade) REFERENCES tb_modalidades(id_modalidade)
);

CREATE TABLE tb_fichas(
    id_ficha INT AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    horario TIME,
    id_modalidade INT,
    descricao VARCHAR(100),
    duracao TIME,
    id_professor INT,
    id_cliente INT,
    FOREIGN KEY (id_modalidade) REFERENCES tb_modalidades(id_modalidade),
    FOREIGN KEY (id_professor) REFERENCES tb_professores(id_professor),
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
);

-- Inserindo dados no banco (dados criados pelo chatGPT)--
INSERT INTO tb_clientes (nome, telefone, endereco) VALUES   
    ('Ana Silva', '98765-4321', 'Rua A, 123, São Paulo'), 
    ('Carlos Souza', '87654-3210', 'Rua B, 456, São Paulo'),
    ('Maria Oliveira', '91234-5678', 'Rua C, 789, São Paulo');

INSERT INTO tb_contratos (data_inicio, data_fim, valor, forma_pagamento, id_cliente) VALUES 
    ('2024-01-01', '2024-06-30', 600, 'mensal', 1),
    ('2024-02-01', '2024-07-31', 700, 'anual', 2),
    ('2024-03-01', '2024-08-31', 750, 'trimestral', 3);

INSERT INTO tb_professores (nome, telefone, carteira_trabalho, salario) VALUES
    ('João Pereira', '90000-0001', '1234567', 2500.00),
    ('Lucia Santos', '90000-0002', '2345678', 2700.00),
    ('Pedro Almeida', '90000-0003', '3456789', 3000.00);

INSERT INTO tb_modalidades (nome) VALUES
    ('Musculação'),
    ('Pilates'),
    ('Yoga');

INSERT INTO tb_professorModalidade (id_modalidade, id_professor) VALUES
    (1, 1), -- Professor 1 -> Musculação
    (2, 2), -- Professor 2 -> Pilates
    (3, 3), -- Professor 3 -> Yoga
    (1, 3); -- Professor 1 -> Yoga

INSERT INTO tb_ficha (data, horario, id_modalidade, descricao, duracao, id_professor, id_cliente) VALUES
    ('2024-09-15', '09:00:00', 1, 'Treino de musculação focado em força', '01:00:00', 1, 1),
    ('2024-09-16', '10:00:00', 2, 'Aula de Pilates', '01:00:00', 2, 2),
    ('2024-09-17', '11:00:00', 3, 'Sessão de Yoga para relaxamento', '01:00:00', 3, 3),
    ('2024-09-18', '08:00:00', 1, 'Treino de musculação para resistência', '01:00:00', 1, 2);

   


