DELIMITER //

CREATE PROCEDURE listar_funcionarios()
BEGIN
    DECLARE count INT DEFAULT 0;
    DECLARE nome_funcionario VARCHAR(50);

    WHILE count < 5 DO
        SELECT nome INTO nome_funcionario FROM funcionarios LIMIT count, 1;
        SELECT nome_funcionario;
        SET count = count + 1;
    END WHILE;
END//

DELIMITER ;

CALL listar_funcionarios();
DROP PROCEDURE IF EXISTS listar_funcionarios;

Em SQL, normalmente você não usa uma sintaxe de loop `WHILE` dessa maneira. No entanto, alguns sistemas de banco de dados, como MySQL e PostgreSQL, oferecem suporte a instruções `LOOP` ou `WHILE` dentro de procedimentos armazenados ou funções.

Aqui está um exemplo de como você poderia usar um loop `WHILE` em um procedimento armazenado no MySQL:

```sql
DELIMITER //

CREATE PROCEDURE listar_funcionarios()
BEGIN
    DECLARE count INT DEFAULT 0;
    DECLARE nome_funcionario VARCHAR(50);

    WHILE count < 5 DO
        SELECT nome INTO nome_funcionario FROM funcionarios LIMIT count, 1;
        SELECT nome_funcionario;
        SET count = count + 1;
    END WHILE;
END//

DELIMITER ;

CALL listar_funcionarios();
```

Neste exemplo:

- `DELIMITER //` é usado para alterar o delimitador de instrução para `//` em vez de `;`, permitindo a definição de procedimento armazenado com múltiplas instruções.
- `DECLARE` é usado para declarar variáveis locais dentro do procedimento armazenado.
- `WHILE` é usado para iniciar um loop enquanto a condição especificada for verdadeira.
- `SELECT ... INTO` é usado para atribuir o valor de uma consulta a uma variável.
- `SET` é usado para atualizar o valor de uma variável.

No entanto, a maioria das consultas SQL é baseada em conjuntos e é mais eficiente do que usar loops para iterar sobre os resultados. Em muitos casos, é possível alcançar o que você precisa usando operações de conjunto SQL como SELECT, JOIN e outras, em vez de loops.



Claro, vamos criar um exemplo de procedimento armazenado que retorna o nome e o salário dos funcionários de um determinado departamento. Suponha que queremos um procedimento armazenado que, dado o nome de um departamento, retorne o nome e o salário de todos os funcionários desse departamento.

Aqui está um exemplo de como poderíamos criar esse procedimento armazenado:

```sql
DELIMITER //

CREATE PROCEDURE ExibirFuncionariosPorDepartamento(IN nomeDepartamento VARCHAR(100))
BEGIN
    SELECT f.nome, f.salario
    FROM funcionarios f
    JOIN TB_departamentos d ON f.departamento_id = d.id
    WHERE d.departamento = nomeDepartamento;
END//

DELIMITER ;
```

Neste exemplo:
- `IN nomeDepartamento VARCHAR(100)`: Declaramos um parâmetro de entrada chamado `nomeDepartamento`, que será usado para passar o nome do departamento para o procedimento armazenado.
- `SELECT f.nome, f.salario`: Selecionamos o nome e o salário dos funcionários.
- `JOIN TB_departamentos d ON f.departamento_id = d.id`: Juntamos a tabela `funcionarios` com a tabela `TB_departamentos` usando a chave estrangeira `departamento_id`.
- `WHERE d.departamento = nomeDepartamento;`: Filtramos os funcionários pelo departamento fornecido como parâmetro.

Para chamar esse procedimento armazenado e exibir os funcionários de um departamento específico (por exemplo, "Vendas"), você pode usar o seguinte comando:

```sql
CALL ExibirFuncionariosPorDepartamento('Vendas');
```

Isso exibirá o nome e o salário de todos os funcionários do departamento de Vendas.