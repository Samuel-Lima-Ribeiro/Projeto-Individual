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
(null, 'The Champ', 'caioRibeiro@gmail.com', 'starUooo', '2003-10-07', 1),
(null, 'Palpatine66', 'caioRibeiro@gmail.com', 'starUooo', '2003-10-07', 7),
(null, 'Darth Bane', 'caioRibeiro@gmail.com', 'starUooo', '2003-10-07', 4),
(null, 'Shameika', 'caioRibeiro@gmail.com', 'starUooo', '2003-10-07', 5),
(null, 'Darth Malgus', 'caioRibeiro@gmail.com', 'starUooo', '2003-10-07', 4),
(null, 'Bastila Shan', 'caioRibeiro@gmail.com', 'starUooo', '2003-10-07', 3),
(null, 'Fernando', 'fernandoSouza@gmail.com','Darthmaul', '2000-10-07', 2),
(null, 'Maria', 'maria.lima@gmail.com','dathVarde', '1999-10-07', 3),
(null, 'Tamires', 'tamires.lima@gmail.com', 'dathBane', '2004-10-07', 4),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 5),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 6),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 7),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 1),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 2),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 3),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 4),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 4),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 7),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 7),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 6),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 5),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 3),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 2),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 5),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 2),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 1),
(null, 'Joao', 'sam@gmail.com', '123', '2003-02-10', 2);

create table jogo (
	idJogo int,
    fkUsuario int,
    vitoria int,
    empate int,
    derrota int,
    foreign key(fkUsuario) references usuario(idUsuario),
    primary key(idJogo, fkUsuario)
);

select * from personagem;

insert into jogo values
(2, 2, 1000, 0, 0),
(3, 3, 103, 30, 10),
(4, 4, 66, 23, 1),
(5, 5, 1, 0, 0),
(6, 6, 296, 100, 76),
(7, 7, 84, 0, 9);

select * from usuario;

-- funcao aniversario
select DATE_FORMAT(dtNasc, '%d-%m') as aniversario from usuario where idUsuario = 6 
and DATE_FORMAT(dtNasc, '%d-%m') like DATE_FORMAT(now(), '%d-%m') ;

-- selects
select nome as usuario, vitoria, empate, derrota , fkpersonagem from jogo join usuario on usuario.idusuario = jogo.fkusuario 
where vitoria > 0 or empate > 0 or derrota > 0 order by vitoria;

select u.nome, p.nome from usuario u join personagem p on p.idpersonagem = u.fkpersonagem;

select count(*) as votos, p.nome as personagem from usuario u join personagem p on p.idpersonagem = u.fkpersonagem  
group by u.fkpersonagem order by votos desc;

select count(*) as qtdUsuario from usuario;

select DATE_FORMAT(now(),'%H:%i:%s') as horaAtual;

select * from usuario left join jogo on usuario.idusuario = jogo.fkusuario;

select u.nome, p.nome from usuario u join personagem p on p.idpersonagem = u.fkpersonagem;

select * from jogo;