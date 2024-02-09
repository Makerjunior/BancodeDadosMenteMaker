# Documentação de Alterações na Tabela "pedidos"

## 1. Adição de Coluna "estado"
Para adicionar a coluna "estado" à tabela "pedidos" com o tipo de dados VARCHAR(50), execute o seguinte comando SQL:

```sql
ALTER TABLE pedidos ADD estado VARCHAR(50);
```

Esta alteração permite armazenar o estado do pedido, como "Vendido", "Em processo", etc.

## 2. Descrição da Tabela "pedidos"
Para obter uma descrição detalhada da estrutura atual da tabela "pedidos", utilize o comando:

```sql
DESCRIBE pedidos;
```

Este comando exibirá informações sobre todas as colunas presentes na tabela, incluindo seus nomes, tipos de dados e outras propriedades.

## 3. Inserção de Dados na Tabela "pedidos"
Para inserir um novo registro na tabela "pedidos", incluindo valores para todas as colunas, execute o seguinte comando SQL:

```sql
INSERT INTO pedidos (id_usuario, descricao_produto, quantidade, valor_total, data_pedido, estado)
VALUES (7, 'Produto F', 9, 30.00, '2024-02-02', 'Vendido');
```

Este comando adiciona um novo pedido à tabela, especificando o ID do usuário, a descrição do produto, a quantidade, o valor total, a data do pedido e o estado.

## 4. Modificação do Tipo de Dados da Coluna "id_usuario"
Para modificar o tipo de dados da coluna "id_usuario" para CHAR(20), utilize o seguinte comando SQL:

```sql
ALTER TABLE pedidos MODIFY COLUMN id_usuario CHAR(20);
```

Esta alteração redefine o tipo de dados da coluna "id_usuario" para armazenar até 20 caracteres, em vez do tipo de dados anterior.

Por favor, lembre-se de substituir os valores específicos nos comandos SQL com os dados relevantes para o seu caso de uso.