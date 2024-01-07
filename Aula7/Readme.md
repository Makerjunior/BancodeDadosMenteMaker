

1. **INNER JOIN:**
   - Retorna registros que têm valores correspondentes em ambas as tabelas.

   ```sql
   SELECT usuarios.id, usuarios.nome, pedidos.data_pedido, pedidos.descricao_produto, pedidos.quantidade
   FROM usuarios
   INNER JOIN pedidos ON usuarios.id = pedidos.id_usuario;
   ```

2. **LEFT JOIN (ou LEFT OUTER JOIN):**
   - Retorna todos os registros da tabela à esquerda (usuarios) e os registros correspondentes da tabela à direita (pedidos). Se não houver correspondência, as colunas da tabela à direita terão valores nulos.

   ```sql
   SELECT usuarios.id, usuarios.nome, pedidos.data_pedido, pedidos.descricao_produto, pedidos.quantidade
   FROM usuarios
   LEFT JOIN pedidos ON usuarios.id = pedidos.id_usuario;
   ```

3. **RIGHT JOIN (ou RIGHT OUTER JOIN):**
   - Retorna todos os registros da tabela à direita (pedidos) e os registros correspondentes da tabela à esquerda (usuarios). Se não houver correspondência, as colunas da tabela à esquerda terão valores nulos.

   ```sql
   SELECT usuarios.id, usuarios.nome, pedidos.data_pedido, pedidos.descricao_produto, pedidos.quantidade
   FROM usuarios
   RIGHT JOIN pedidos ON usuarios.id = pedidos.id_usuario;
   ```

4. **FULL JOIN (ou FULL OUTER JOIN):**
   - Retorna todos os registros quando há uma correspondência em qualquer uma das tabelas. Se não houver correspondência, os valores não correspondentes nas tabelas terão valores nulos.

   ```sql
   SELECT usuarios.id, usuarios.nome, pedidos.data_pedido, pedidos.descricao_produto, pedidos.quantidade
   FROM usuarios
   LEFT JOIN pedidos ON usuarios.id = pedidos.id_usuario
   UNION
   SELECT usuarios.id, usuarios.nome, pedidos.data_pedido, pedidos.descricao_produto, pedidos.quantidade
   FROM usuarios
   RIGHT JOIN pedidos ON usuarios.id = pedidos.id_usuario
   WHERE usuarios.id IS NULL; -- Para garantir que não haja duplicatas
   ```

5. **CROSS JOIN:**
   - Retorna o produto cartesiano de ambas as tabelas, ou seja, combina cada linha da tabela à esquerda com cada linha da tabela à direita.

   ```sql
   SELECT * FROM usuarios CROSS JOIN pedidos;
   ```

6. **SELF JOIN:**
   - É usado quando você deseja combinar linhas da mesma tabela.

   ```sql
   SELECT t1.id, t1.nome, t2.id as id2, t2.nome as nome2
   FROM usuarios t1
   INNER JOIN usuarios t2 ON t1.id = t2.id;
   ```


- `SELECT t1.id, t1.nome, t2.id as id2, t2.nome as nome2`: Esta parte da consulta seleciona as colunas que serão retornadas como resultado. `t1.id` e `t1.nome` são as colunas da primeira instância da tabela `usuarios` (renomeada como `t1`), enquanto `t2.id` e `t2.nome` são as colunas da segunda instância da mesma tabela (renomeada como `t2`). A renomeação é útil para distinguir as colunas das duas instâncias da tabela.

- `FROM usuarios t1`: Especifica a tabela `usuarios` como a fonte de dados principal da consulta. Ela é aliás renomeada como `t1`, sendo a primeira instância da tabela.

- `INNER JOIN usuarios t2 ON t1.id = t2.id`: Aqui está a parte chave do "SELF JOIN". Uma segunda instância da tabela `usuarios` é introduzida (renomeada como `t2`), e a condição `ON t1.id = t2.id` é utilizada para especificar como as duas instâncias da tabela devem ser combinadas. Neste caso, as linhas são combinadas quando o valor da coluna `id` da primeira instância (`t1`) é igual ao valor da coluna `id` da segunda instância (`t2`).

Portanto, essa consulta retorna todas as combinações de pares de linhas da tabela `usuarios` onde o valor da coluna `id` é igual nas duas instâncias. O resultado terá colunas como `id`, `nome` para a primeira instância (`t1`), e `id2`, `nome2` para a segunda instância (`t2`). Isso pode ser útil em situações em que você precisa comparar ou relacionar informações de linhas diferentes dentro da mesma tabela.

Estes exemplos devem ser adaptados ao seu esquema específico e são fornecidos como guias gerais para ajudar você a entender e aplicar diferentes tipos de JOINs em consultas SQL no MySQL.