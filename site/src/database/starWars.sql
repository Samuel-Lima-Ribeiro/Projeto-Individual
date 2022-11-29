drop database starWars;

create database starWars;
use starWars;

create table personagens (
	idPersonagem int primary key,
    nome varchar(60)
);

insert into personagens values
(1 ,'Yoda'),
(2, 'Luke Skywalker'),
(3, 'Darth Vader'),
(4, 'Leia Organa'),
(5, 'Obi-Wan Kenobi'),
(6, 'Han Solo');

create table filmes (
	idFilme int primary key,
    nome varchar(60)
);

insert into filmes values
(1, 'A Ameaça Fantasma'),
(2, 'Ataque dos Clones'),
(3, 'A Vingança dos Sith'),
(4, 'Uma Nova Esperança'),
(5, 'O Império Contra-Ataca'),
(6, 'O Retorno de Jedi');

-- insert into personagem e filme

create table usuario (
	idUsuario int primary key auto_increment,
    nome varchar(45),
    email varchar(60),
    senha varchar(30),
    dtNasc date,
    fkPersonagem int,
    foreign key (fkPersonagem) references personagens (idPersonagem),
    fkFilme int,
    foreign key (fkFilme) references filmes (idFilme),
    Classe varchar(60) constraint chkClass check(Classe in('jedi', 'sith', null))
);

insert into usuario  values 
(null, 'Caio', 'caioRibeiro@gmail.com', 'starUooo', '2003-10-07',1, 1, 'sith'),
(null, 'Fernando', 'fernandoSouza@gmail.com','Darthmaul', '2000-10-07', 1, 2, 'sith'),
(null, 'Maria', 'maria.lima@gmail.com','dathVarde', '1999-10-07', 2, 3, 'jedi'),
(null, 'Tamires', 'tamires.lima@gmail.com', 'dathBane', '2004-10-07', 4, 4, null);

select count(*) as qtdUsuario from usuario;

select DATE_FORMAT(now(),'%H:%i:%s') as horaAtual;

insert into usuario (nome, email, senha, dtNasc) values
('samuel', 'samuca@gmail.com', '123', '2003-02-10');

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