drop database starWars;

create database starWars;
use starWars;

create table personagens (
	idPersonagem int primary key auto_increment,
    nome varchar(60)
);

create table filmes (
	idFilme int primary key auto_increment,
    nome varchar(60)
);

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
    foreign key (fkFilme) references filmes (idFilme)
);

insert into usuario (nome, email, senha, dtNasc) values
('samuel', 'samuca@gmail.com', '123', '2003-02-10');



















create table teste (
	id int,
    data varchar(100)
);

insert into teste values (1, '2003-10-07');

select DATE_FORMAT(data, '%d-%m') from teste;