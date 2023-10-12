```
create database curso;
use curso;

CREATE TABLE minha_tabela (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    idade INT,
    email VARCHAR(100),
    telefone VARCHAR(20),
    data_nascimento DATE
);

INSERT INTO minha_tabela (id, nome, sobrenome, idade, email, telefone, data_nascimento)
VALUES (1, 'João', 'Silva', 30, 'joao.silva@email.com', '(11) 9999-9999', '1990-01-01');

INSERT INTO minha_tabela ( nome, sobrenome, idade, email, telefone, data_nascimento)
VALUES ('Maria', 'Santos', 25, 'maria.santos@email.com', '(11) 8888-8888', '1995-05-05');


select nome,idade,telefone from minha_tabela;

```