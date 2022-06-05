create database portalnether;

use portalnether;

create table mods(
    idMod int primary key auto_increment,
    nomeMod varchar(35),
    descricao varchar(255)
);

create table usuario(
    idUsuario int primary key auto_increment,
    nome varchar(100),
    email varchar(100),
    senha varbinary(128),
    fkMod int,
	foreign key (fkMod) references mods(idMod)
);
