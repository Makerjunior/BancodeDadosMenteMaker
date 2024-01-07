 SET SQL_SAFE_UPDATES = 0;

update minha_tabela set sobrenome = 'Pereira' where id =1;
update minha_tabela set idade = 15 where nome='Paulo';

alter table minha_tabela change column telefone Fone varchar(15);

rename table minha_tabela to usuarios;
select * from  usuarios;