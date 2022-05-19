CREATE TABLE projetoi;

USE projetoi;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY auto_increment,
    nome VARCHAR(45) NOT NULL,
    email VARCHAR(60) UNIQUE NOT NULL,
    senha VARCHAR(60) NOT NULL
);
