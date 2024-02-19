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


SELECT f.nome AS nome_funcionario, d.departamento
FROM funcionarios f
JOIN TB_departamentos d ON f.departamento_id = d.id;

/*
A consulta acima une a tabela Funcionários com a tabela Departamentos utilizando a chave estrangeira departamento_id. 
O resultado mostrará o nome dos funcionários e o departamento ao qual cada um pertence.  
Use JOIN para unir as tabelas “funcionarios” e “TB_departamentos”,  
usando o campo “departamento_id” como chave estrangeira na tabela “funcionarios”.  
Se você quiser listar todos os funcionários sem saber em que departamento eles trabalham,    
basta usar SELECT com apenas o campo “nome” da tabela “funcionarios”.
O campo “departamento_id” na tabela funcionarios faz referencia a o id de um departamento na tabela TB_departamentos.
*/



SHOW TABLEs;

delete from funcionarios;

SHOW TABLEs;

INSERT INTO funcionarios (nome, idade, salario, data_contratacao) VALUES ('Joao', 34, 5000.76, CURRENT_DATE());

INSERT INTO funcionarios (nome, idade, salario)
SELECT 'Joao', 34, 5000.76
WHERE NOT EXISTS (
    SELECT * FROM funcionarios WHERE nome = 'Joao' AND idade = 34
);


INSERT INTO funcionarios (nome, idade, salario, data_contratacao, ativo) VALUES ('Mariana', 28, 9999.9, CURRENT_DATE() - INTERVAL 1 MONTH, FALSE);

SELECT * from funcionarios;



SELECT COUNT(*) AS "Total de funcionarios" FROM funcionarios;
SELECT COUNT(*) AS "Total de ativos" FROM funcionarios WHERE ativo = 1;
SELECT COUNT(*) AS "Total de inativos" FROM funcionarios WHERE ativo = 0;
SELECT COUNT(*) FROM funcionarios WHERE salario > 2000; 
SELECT COUNT(*) FROM funcionarios WHERE salario AND sexo = 'Masculino'; 
SELECT * FROM funcionarios WHERE salario > 6000.00 AND sexo = 'Masculino' AND ativo = 1; 
SELECT SUM(salario) AS 'Salario dos funcionarios' FROM funcionarios; 
SELECT AVG(salario) AS 'Media de salarios' FROM funcionarios; 
SELECT MAX(salario) FROM funcionarios; 
SELECT MIN(salario) FROM funcionarios;
select * from funcionarios WHERE  salario > 5500.00;

SELECT * FROM funcionarios LIMIT 4;
/*
LIMIT 3, 5: Isso significa que a consulta começará a retornar registros a partir do quarto registro (índice 3) e retornará um total de cinco registros.
Portanto, a consulta retornará os registros 4, 5, 6, 7 e 8 da tabela funcionarios.
*/
SELECT * FROM funcionarios LIMIT 3, 5;

UPDATE funcionarios
SET salario = salario * 1.1;

UPDATE funcionarios
SET salario = salario * 1.1
WHERE salario < 6000.00;


CREATE VIEW funcionarios_ativos AS
SELECT *
FROM funcionarios
WHERE ativo = TRUE;

SELECT * FROM funcionarios_ativos;

CREATE VIEW funcionarios_inativos AS
SELECT *
FROM funcionarios
WHERE ativo = FALSE;
SELECT * FROM funcionarios_inativos;

CREATE VIEW funcionarios_sem_departamento AS
SELECT f.*
FROM funcionarios f
LEFT JOIN TB_departamentos d ON f.departamento_id = d.id
WHERE d.id IS NULL;

DROP VIEW funcionarios_sem_departamento;

select * from  funcionarios_sem_departamento;

SELECT * from funcionarios;

/*
Para visualizar as views existentes em um banco de dados,
você pode consultar o catálogo de informações do banco de dados. 
No MySQL, por exemplo, você pode usar a tabela information_schema.views para isso. Aqui está como fazer isso:
*/
SELECT table_name
FROM information_schema.views
WHERE table_schema = 'curso';

/*
Neste exemplo, a consulta irá agrupar os funcionários pelo sexo e contar o número total de funcionários em cada grupo de sexo. 
O resultado mostrará o sexo dos funcionários e a contagem total de funcionários para cada sexo.
*/

SELECT sexo as "Sexo", COUNT(*) AS "Total de funcionarios"
FROM funcionarios
GROUP BY sexo;

/*
ALTER TABLE funcionarios
ADD COLUMN departamento ENUM('Vendas', 'RH', 'Tecnologia', 'Financeiro');
ALTER TABLE funcionarios
DROP COLUMN departamento;
*/


SELECT * from funcionarios;

SELECT * FROM TB_departamentos;
SELECT * from  funcionarios WHERE departamento='Vendas' OR departamento='RH';


 SELECT * from funcionarios;
-- IF --
 SELECT nome, 
       IF(salario > 6500, 'Salário Alto', ' Salário  Baixo') AS classificacao_salario
FROM funcionarios;

UPDATE funcionarios
SET salario = IF(salario < 5000, salario * 1.1, salario);

-- Case -- 
SELECT nome,
       CASE
           WHEN idade < 30 THEN 'Jovem'
           WHEN idade >= 30 AND idade < 50 THEN 'Adulto'
           ELSE 'Idoso'
       END AS "Classificação"
FROM funcionarios;

-- Uso do While --

DELIMITER //
CREATE PROCEDURE ExibirNumerosWHILE()
BEGIN
    DECLARE contador INT DEFAULT 1;

    WHILE contador <= 5 DO
        SELECT contador;
        SET contador = contador + 1;
    END WHILE;
END//
DELIMITER //

CALL  ExibirNumerosWHILE();

-- Uso de For --

CREATE PROCEDURE ExibirNumerosFOR()
BEGIN
    DECLARE contador INT DEFAULT 1;

    FOR contador IN 1..5 DO
        SELECT contador;
    END FOR;
END//
DELIMITER ;
CALL  ExibirNumerosFOR();

-- Uso de for --

DELIMITER //

CREATE PROCEDURE ExibirFuncionariosPorDepartamentoFOR(IN nomeDepartamento VARCHAR(100))
BEGIN
    DECLARE totalFuncionarios INT;
    DECLARE contador INT DEFAULT 1;
    DECLARE funcionarioNome VARCHAR(50);
    DECLARE funcionarioSalario DECIMAL(10, 2);

    SELECT COUNT(*) INTO totalFuncionarios
    FROM funcionarios f
    JOIN TB_departamentos d ON f.departamento_id = d.id
    WHERE d.departamento = nomeDepartamento;

    FOR contador IN 1..totalFuncionarios DO
        SELECT nome, salario INTO funcionarioNome, funcionarioSalario
        FROM funcionarios f
        JOIN TB_departamentos d ON f.departamento_id = d.id
        WHERE d.departamento = nomeDepartamento
        LIMIT contador, 1;

        SELECT funcionarioNome, funcionarioSalario;
    END FOR;
END//
DELIMITER ;
CALL  ExibirFuncionariosPorDepartamentoFOR('Vendas');

-- Uso de While--

DELIMITER //

CREATE PROCEDURE ExibirFuncionariosPorDepartamentoWHILE(IN nomeDepartamento VARCHAR(100))
BEGIN
    DECLARE totalFuncionarios INT;
    DECLARE contador INT DEFAULT 1;
    DECLARE funcionarioNome VARCHAR(50);
    DECLARE funcionarioSalario DECIMAL(10, 2);

    SELECT COUNT(*) INTO totalFuncionarios
    FROM funcionarios f
    JOIN TB_departamentos d ON f.departamento_id = d.id
    WHERE d.departamento = nomeDepartamento;

    WHILE contador <= totalFuncionarios DO
        SELECT nome, salario INTO funcionarioNome, funcionarioSalario
        FROM funcionarios f
        JOIN TB_departamentos d ON f.departamento_id = d.id
        WHERE d.departamento = nomeDepartamento
        LIMIT contador, 1;

        SELECT funcionarioNome, funcionarioSalario;
        SET contador = contador + 1;
    END WHILE;
END//
DELIMITER ;
CALL   ExibirFuncionariosPorDepartamentoWHILE('RH');