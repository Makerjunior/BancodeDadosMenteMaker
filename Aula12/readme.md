
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