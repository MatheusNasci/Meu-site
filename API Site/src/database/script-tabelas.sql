/* para workbench - local - desenvolvimento */
create database portalnether;

use portalnether;

create table Usuario(
idUsuario int primary key auto_increment,
nome varchar(100),
email varchar(100),
senha varchar(45)
);


/* para sql server - remoto - produção */

-- CREATE TABLE Usuario (
-- 	idUsuario INT PRIMARY KEY IDENTITY(1,1),
-- 	nome VARCHAR(50),
-- 	email VARCHAR(50),
-- 	senha VARCHAR(50),
-- );

