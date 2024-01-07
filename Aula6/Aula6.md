
create table pedidos(
 numero_pedidos int primary key auto_increment,
 id_usuario int,
 descricao_produto varchar(50),
 quantidade int,
 valor_total decimal(10,2),
 data_pedido date,
 foreign key(id_usuario) references usuarios(id) 
);

INSERT INTO pedidos (id_usuario, descricao_produto, quantidade, valor_total, data_pedido)
VALUES
    (1, 'Produto A', 3, 150.00, '2023-01-15'),
    (2, 'Produto B', 2, 80.00, '2023-02-02'),
    (3, 'Produto C', 1, 45.50, '2023-02-10'),
    (1, 'Produto D', 4, 200.00, '2023-03-05'),
    (4, 'Produto E', 2, 90.00, '2023-03-12');
use  curso;
select * from pedidos;

select usuarios.id, usuarios.nome, pedidos.data_pedido, pedidos.descricao_produto, pedidos.quantidade
 from usuarios
 inner join pedidos on usuarios.id = pedidos.id_usuario;
 