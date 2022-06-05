-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para workbench - local - desenvolvimento */
create database portalnether;

use portalnether;

create table usuario(
    idUsuario int primary key auto_increment,
    nome varchar(100),
    email varchar(100),
    senha varbinary(128)
);

create table votos(
    idVoto int primary key auto_increment,
    nomeMod varchar(35),
    momento datetime default current_timestamp,
    fkUsuario int,
	foreign key (fkUsuario) references usuario(idUsuario)
);
