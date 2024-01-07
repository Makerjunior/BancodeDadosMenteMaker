

```


create table minha_tabela(
id int primary key auto_increment,
nome varchar(50),
sobrenome varchar(50),
idade int,
email varchar(100),
telefone varchar(20),
data_nasc date
);

insert into minha_tabela(nome, sobrenome, idade, email, telefone, data_nasc) 
values ("Junior", "Silva", 15, "junior@gmail.comn",'(31) 9999-9999','1995-05-05');


insert into minha_tabela(nome, sobrenome, idade, email, telefone, data_nasc) 
values ("Paulo", "Souza", 40, "paulo@gmail.comn",'(31) 8888-9999','1980-05-05');


insert into minha_tabela (nome, sobrenome, idade, email, telefone, data_nasc)
values 
   ("Sergio", "Silva", 15, "junior@gmail.comn",'(31) 9999-9999','1995-05-05'),
   ("Alex", "Silva", 15, "junior@gmail.comn",'(31) 9999-9999','1995-05-05'), 
   ("Marcelo", "Silva", 15, "junior@gmail.comn",'(31) 9999-9999','1995-05-05'),
   ("Raphael", "Silva", 15, "junior@gmail.comn",'(31) 9999-9999','1995-05-05');



select * from minha_tabela;




```