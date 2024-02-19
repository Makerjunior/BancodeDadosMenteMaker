

1. **IF-ELSE:**
   - Neste exemplo, estamos usando a função IF do MySQL para classificar os funcionários com base em seus salários. Se o salário for maior que 5000, o funcionário é classificado como "Alto", caso contrário, é classificado como "Baixo".
1. **IF-ELSE:**
```sql
SELECT nome, 
       IF(salario > 5000, 'Alto', 'Baixo') AS classificacao_salario
FROM funcionarios;
```

2. **CASE:**
   - Aqui, estamos usando a cláusula CASE para dividir os funcionários em faixas etárias. Dependendo da idade do funcionário, ele será classificado como "Jovem" se tiver menos de 30 anos, "Adulto" se tiver entre 30 e 49 anos e "Idoso" se tiver 50 anos ou mais.

2. **CASE:**
```sql
SELECT nome,
       CASE
           WHEN idade < 30 THEN 'Jovem'
           WHEN idade >= 30 AND idade < 50 THEN 'Adulto'
           ELSE 'Idoso'
       END AS faixa_etaria
FROM funcionarios;
```
### Procedure: ExibirNumerosWHILE
```
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
```

**Descrição:**
Esta procedure exibe os números de 1 a 5 utilizando um loop WHILE.

**Parâmetros:**
Nenhum.

**Variáveis Locais:**
- `contador`: Variável INT utilizada como contador no loop.

**Funcionamento:**
1. A procedure começa declarando uma variável local chamada `contador`, inicializada com o valor 1.
2. Em seguida, é iniciado um loop WHILE com a condição `WHILE contador <= 5 DO`.
3. Dentro do loop, cada valor de `contador` é selecionado e exibido.
4. A cada iteração, o valor de `contador` é incrementado em 1 usando `SET contador = contador + 1`.
5. O loop continua enquanto o valor de `contador` for menor ou igual a 5.
6. Após exibir os números de 1 a 5, a procedure é finalizada com `END WHILE`.

### Procedure: ExibirNumerosFOR

```
CREATE PROCEDURE ExibirNumerosFOR()
BEGIN
    DECLARE contador INT DEFAULT 1;

    FOR contador IN 1..5 DO
        SELECT contador;
    END FOR;
END//
DELIMITER ;
CALL  ExibirNumerosFOR();
```

**Descrição:**
Esta procedure exibe os números de 1 a 5 utilizando um loop FOR.

**Parâmetros:**
Nenhum.

**Variáveis Locais:**
- `contador`: Variável INT utilizada como contador no loop.

**Funcionamento:**
1. A procedure começa declarando uma variável local chamada `contador`, inicializada com o valor 1.
2. Em seguida, um loop FOR é iniciado com a sintaxe `FOR contador IN 1..5 DO`.
3. Dentro do loop, cada valor de `contador` é selecionado e exibido.
4. O loop executa cinco iterações, exibindo os números de 1 a 5.
5. A procedure é finalizada com `END FOR`.

### Procedure: ExibirFuncionariosPorDepartamentoFOR
```
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
```


**Descrição:**
Esta procedure exibe os funcionários de um departamento específico utilizando um loop FOR.

**Parâmetros:**
- `nomeDepartamento`: Nome do departamento para o qual os funcionários serão exibidos.

**Variáveis Locais:**
- `totalFuncionarios`: Variável INT que armazena o número total de funcionários do departamento.
- `contador`: Variável INT utilizada como contador no loop.
- `funcionarioNome`: Variável VARCHAR(50) para armazenar o nome do funcionário.
- `funcionarioSalario`: Variável DECIMAL(10, 2) para armazenar o salário do funcionário.

**Funcionamento:**
1. A procedure começa calculando o número total de funcionários do departamento especificado e armazenando-o na variável `totalFuncionarios`.
2. Em seguida, um loop FOR é iniciado com a sintaxe `FOR contador IN 1..totalFuncionarios DO`.
3. Dentro do loop, o nome e o salário de cada funcionário são selecionados e armazenados nas variáveis `funcionarioNome` e `funcionarioSalario`.
4. Os dados do funcionário são exibidos a cada iteração do loop.
5. A procedure é finalizada com `END FOR`.

### Procedure: ExibirFuncionariosPorDepartamentoWHILE

```
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
```

**Descrição:**
Esta procedure exibe os funcionários de um departamento específico utilizando um loop WHILE.

**Parâmetros:**
- `nomeDepartamento`: Nome do departamento para o qual os funcionários serão exibidos.

**Variáveis Locais:**
- `totalFuncionarios`: Variável INT que armazena o número total de funcionários do departamento.
- `contador`: Variável INT utilizada como contador no loop.
- `funcionarioNome`: Variável VARCHAR(50) para armazenar o nome do funcionário.
- `funcionarioSalario`: Variável DECIMAL(10, 2) para armazenar o salário do funcionário.

**Funcionamento:**
1. A procedure começa calculando o número total de funcionários do departamento especificado e armazenando-o na variável `totalFuncionarios`.
2. Em seguida, é iniciado um loop WHILE com a condição `WHILE contador <= totalFuncionarios DO`.
3. Dentro do loop, o nome e o salário de cada funcionário são selecionados e armazenados nas variáveis `funcionarioNome` e `funcionarioSalario`.
4. Os dados do funcionário são exibidos a cada iteração do loop.
5. O contador é incrementado em 1 após cada iteração usando `SET contador = contador + 1`.
6. O loop continua enquanto o valor do contador for menor ou igual ao número total de funcionários.
7. A procedure é finalizada com `END WHILE`.