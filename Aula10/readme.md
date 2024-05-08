drop DATABASE curso;

CREATE DATABASE IF NOT EXISTS `curso`;
USE `curso`;

CREATE TABLE IF NOT EXISTS funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    data_contratacao DATE NOT NULL,
    ativo BOOLEAN DEFAULT FALSE NOT NULL,
    sexo ENUM('Masculino', 'Feminino', 'Outro') DEFAULT 'Outro' NOT NULL
);

CREATE TABLE IF NOT EXISTS TB_departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    departamento VARCHAR(100) NOT NULL,
    gerente VARCHAR(50),
    data_criacao DATE
);

ALTER TABLE funcionarios
ADD COLUMN departamento_id INT,
ADD CONSTRAINT fk_departamento FOREIGN KEY (departamento_id) REFERENCES TB_departamentos(id);

INSERT INTO TB_departamentos (departamento, gerente, data_criacao) VALUES
('Vendas', 'João da Silva', '2021-01-01'),
('RH', 'Maria Souza', '2021-01-01'),
('Tecnologia', 'Pedro Oliveira', '2021-01-01'),
('Financeiro', 'Ana Santos', '2021-01-01');

SELECT * from TB_departamentos;

INSERT INTO funcionarios (nome, idade, salario, data_contratacao, ativo, sexo, departamento_id) VALUES
('João Silva', 35, 5000.00, '2022-01-01', TRUE, 'Masculino', 1),
('Maria Santos', 28, 4500.00, '2022-01-02', TRUE, 'Feminino', 2),
('Pedro Oliveira', 40, 6000.00, '2022-01-03', TRUE, 'Masculino', 3),
('Ana Souza', 32, 5500.00, '2022-01-04', FALSE, 'Feminino', 1),
('Marcos Pereira', 45, 7000.00, '2022-01-05', TRUE, 'Masculino', 2),
('Juliana Costa', 27, 4800.00, '2022-01-06', TRUE, 'Feminino', 3),
('Lucas Lima', 29, 5200.00, '2022-01-07', FALSE, 'Masculino', 4),
('Carla Silva', 38, 5800.00, '2022-01-08', TRUE, 'Feminino', 2),
('Rafael Santos', 33, 5600.00, '2022-01-09', TRUE, 'Masculino', 3),
('Fernanda Oliveira', 31, 5100.00, '2022-01-10', FALSE, 'Feminino', 1),
('Bruno Almeida', 37, 5900.00, '2022-01-11', TRUE, 'Masculino', 2),
('Mariana Silva', 26, 4700.00, '2022-01-12', TRUE, 'Feminino', 3),
('Gustavo Santos', 42, 6300.00, '2022-01-13', TRUE, 'Masculino', 1),
('Camila Oliveira', 30, 5400.00, '2022-01-14', FALSE, 'Feminino', 2),
('Diego Souza', 36, 5700.00, '2022-01-15', TRUE, 'Masculino', 3),
('Patrícia Almeida', 39, 6100.00, '2022-01-16', TRUE, 'Feminino', 4),
('Rodrigo Lima', 34, 5500.00, '2022-01-17', TRUE, 'Masculino', 2),
('Tatiana Costa', 29, 5300.00, '2022-01-18', FALSE, 'Feminino', 3),
('Renato Pereira', 41, 6200.00, '2022-01-19', TRUE, 'Masculino', 1),
('Isabela Santos', 28, 4900.00, '2022-01-20', TRUE, 'Feminino', 2);