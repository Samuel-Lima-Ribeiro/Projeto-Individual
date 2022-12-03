drop database starWars;

create database starWars;
use starWars;

create table personagem (
	idPersonagem int primary key,
    nome varchar(60)
);

insert into personagem values
(1 ,'Yoda'),
(2, 'Luke Skywalker'),
(3, 'Darth Vader'),
(4, 'Leia Organa'),
(5, 'Obi-Wan Kenobi'),
(6, 'Han Solo'),
(7, 'Palpatine');

create table usuario (
	idUsuario int primary key auto_increment,
    nome varchar(45),
    email varchar(60),
    senha varchar(30),
    dtNasc date,
    fkPersonagem int,
    foreign key (fkPersonagem) references personagem (idPersonagem)
);

insert into usuario  values 
(null, 'Caio', 'caioRibeiro@gmail.com', 'starUooo', '2003-10-07',1),
(null, 'Fernando', 'fernandoSouza@gmail.com','Darthmaul', '2000-10-07', 1),
(null, 'Maria', 'maria.lima@gmail.com','dathVarde', '1999-10-07', 2),
(null, 'Tamires', 'tamires.lima@gmail.com', 'dathBane', '2004-10-07', 4),
(null, 'samuel', 'samuca@gmail.com', '123', '2003-02-10', 2);

create table jogo (
	idJogo int,
    fkUsuario int,
    vitoria int,
    empate int,
    derrota int,
    foreign key(fkUsuario) references usuario(idUsuario),
    primary key(idJogo, fkUsuario)
);

insert into jogo values
(1, 1, 10, 0, 0),
(2, 2, 1, 0, 10);

select count(*) as qtdUsuario from usuario;

select DATE_FORMAT(now(),'%H:%i:%s') as horaAtual;

select * from usuario;

-- funcao aniversario
select DATE_FORMAT(dtNasc, '%d-%m') as aniversario from usuario where idUsuario = 6 
and DATE_FORMAT(dtNasc, '%d-%m') like DATE_FORMAT(now(), '%d-%m') ;













create table teste (
	id int,
    data varchar(100)
);

insert into teste values (1, '2003-10-07');

select DATE_FORMAT(data, '%d-%m') from teste;