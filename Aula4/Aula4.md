
O `INNER JOIN` é um tipo de junção (join) em SQL que combina linhas de duas ou mais tabelas com base em uma condição de correspondência entre colunas. O resultado é um conjunto de resultados que contém apenas as linhas que têm correspondências em ambas as tabelas, de acordo com a condição especificada.

A sintaxe básica de um `INNER JOIN` é a seguinte:

```sql
SELECT colunas
FROM tabela1
INNER JOIN tabela2 ON tabela1.coluna = tabela2.coluna;
```

- `tabela1` e `tabela2` são os nomes das tabelas que você deseja unir.
- `tabela1.coluna` e `tabela2.coluna` são as colunas nas quais você deseja basear a junção.

A condição após o `ON` especifica como as duas tabelas devem ser relacionadas. Esta condição geralmente envolve a igualdade entre colunas correspondentes nas duas tabelas. Por exemplo, se você estiver unindo as tabelas `usuarios` e `pedidos` usando a coluna `id` na tabela `usuarios` e a coluna `id_usuario` na tabela `pedidos`, a condição seria `usuarios.id = pedidos.id_usuario`.

Exemplo prático:

```sql
-- Exemplo de INNER JOIN entre as tabelas usuarios e pedidos
SELECT usuarios.id, usuarios.nome, pedidos.numero_pedido, pedidos.descricao_produto, pedidos.quantidade
FROM usuarios
INNER JOIN pedidos ON usuarios.id = pedidos.id_usuario;
```

Neste exemplo, o `INNER JOIN` retorna as linhas que têm correspondências nas duas tabelas, com base na condição `usuarios.id = pedidos.id_usuario`. O resultado incluirá apenas as linhas em que há um `id` correspondente na tabela `usuarios` e um `id_usuario` correspondente na tabela `pedidos`.

O `INNER JOIN` é frequentemente usado quando você deseja recuperar informações de duas ou mais tabelas que estão relacionadas entre si por meio de chaves estrangeiras. Ele ajuda a criar consultas que combinam dados de diferentes tabelas com base em critérios específicos.
<hr>


Vamos criar uma tabela de pedidos para que você possa realizar um `INNER JOIN` com a tabela `usuarios`. Aqui está um exemplo de como você pode criar uma tabela de pedidos:

```sql
-- Criação da tabela de pedidos
CREATE TABLE pedidos (
    numero_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    descricao_produto VARCHAR(100),
    quantidade INT,
    valor_total DECIMAL(10, 2),
    data_pedido DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

-- Inserção de alguns dados de exemplo na tabela de pedidos
INSERT INTO pedidos (id_usuario, descricao_produto, quantidade, valor_total, data_pedido)
VALUES
    (1, 'Produto A', 3, 150.00, '2023-01-15'),
    (2, 'Produto B', 2, 80.00, '2023-02-02'),
    (3, 'Produto C', 1, 45.50, '2023-02-10'),
    (1, 'Produto D', 4, 200.00, '2023-03-05'),
    (4, 'Produto E', 2, 90.00, '2023-03-12');
```

Esta tabela `pedidos` possui uma chave estrangeira (`id_usuario`) que referencia a tabela `usuarios`. Isso permite a criação de um `INNER JOIN` entre as duas tabelas usando a coluna `id` da tabela `usuarios` e a coluna `id_usuario` da tabela `pedidos`. Por exemplo:

```sql
-- Exemplo de INNER JOIN entre as tabelas usuarios e pedidos
SELECT usuarios.id, usuarios.nome, pedidos.numero_pedido, pedidos.descricao_produto, pedidos.quantidade
FROM usuarios
INNER JOIN pedidos ON usuarios.id = pedidos.id_usuario;
```

Este exemplo retorna informações combinadas das tabelas `usuarios` e `pedidos` com base nas colunas especificadas no `INNER JOIN`. Lembre-se de adaptar as consultas conforme necessário para atender às suas necessidades específicas.



