Como inserir dados na tabela que criamos anteriormente:

```sql
INSERT INTO minha_tabela (id, nome, sobrenome, idade, email, telefone, data_nascimento)
VALUES 
  (1, 'João', 'Silva', 30, 'joao.silva@email.com', '(11) 9999-9999', '1990-01-01'),
  (2, 'Maria', 'Santos', 25, 'maria.santos@email.com', '(11) 8888-8888', '1995-05-05');
```

Neste exemplo, estamos inserindo duas linhas de dados na tabela "minha_tabela". Cada linha representa um registro e os valores correspondem aos campos que definimos anteriormente. Certifique-se de que os valores correspondam ao tipo de dados definido para cada campo.

Você pode adicionar mais linhas de dados à tabela usando a mesma sintaxe do comando INSERT INTO. Lembre-se de que a ordem dos valores deve corresponder à ordem dos campos na tabela.