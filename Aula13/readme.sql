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
WHERE ativo = TRUE


SELECT * FROM funcionarios_ativos;