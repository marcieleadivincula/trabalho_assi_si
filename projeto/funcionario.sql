
Create database if not exists funcionario;
use funcionario;

create table if not exists Cadfuncionario (
ID int(11) not null auto_increment primary key,
nome varchar(50) not null,
situacao varchar(7) not null,
valor_hora real not null,
observacao varchar(200),
horas real default null,
periodo date,
total real
)engine = innodb;


 create table if not exists login(
 ID int(11) not null auto_increment primary key,
 usuario varchar(30) not null,
 senha varchar(30) not null
 )engine = innodb;
 
 insert into login (ID, usuario, senha) values (0, 'admin', 'admin');
 insert into login (ID, usuario, senha) values (0, 'diogo', 'diogo');
insert into login (ID, usuario, senha) values (0, 'fulber', 'fulber');

select * from Cadfuncionario;
