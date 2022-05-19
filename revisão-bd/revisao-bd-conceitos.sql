CREATE DATABASE revisao;

USE revisao;

CREATE TABLE motorista (
id INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
CNH CHAR(11),
validade DATE,
categoria CHAR(4)
);

INSERT INTO motorista VALUES 
	(null, 'Vivian', '12345678900', '2023-10-13', 	'B');
    
SELECT * FROM motorista;

CREATE TABLE carro (
idCarro INT PRIMARY KEY auto_increment,
modelo VARCHAR(45),
placa CHAR(7),
estado CHAR(2),
fkMotora INT,
FOREIGN KEY (fkMotora) REFERENCES motorista(id)
);

INSERT INTO carro VALUES 
	(null, 'i30', 'ABC1234', 'SP', 1);
    
SELECT * FROM carro;

CREATE TABLE carroAuto (
id INT PRIMARY KEY auto_increment,
modelo VARCHAR(45),
placa CHAR(7),
estado CHAR(2)
);

INSERT INTO carroAuto VALUES
(null ,'Jetta', 'DEF5678', 'SC');

CREATE TABLE motoraAuto (
idMotora INT auto_increment,
fkCarro INT,
FOREIGN KEY (fkCarro) REFERENCES carroAuto(id),
PRIMARY KEY (idMotora, fkCarro),
nome VARCHAR(45),
CNH CHAR(11),
validade DATE,
categoria CHAR(4)
);

-- ALTER TABLE motoraAuto ADD nome VARCHAR(45) after fkCarro;

DESC motoraAuto;

INSERT INTO motoraAuto VALUES
	(null, 1, 'Franklin', '00987654321', '2023-12-18', 'B');
    
SELECT * FROM motoraAuto;

SELECT motoraAuto.nome AS 'Motorista', carroAuto.modelo AS Carro FROM motoraAuto 
JOIN carroAuto ON idMotora = fkCarro;

CREATE TABLE motora (
id INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
CNH CHAR(11),
validade DATE,
categoria CHAR(4),
fkCondPrincipal INT,
FOREIGN KEY (fkCondPrincipal) REFERENCES motora(id)
);

INSERT INTO motora (nome) VALUES
	('SPTech');
    
INSERT INTO motora VALUES
	(null, 'Rafael', '13579008642', '2023-01-24', 'AB', null);

UPDATE motora SET fkCondPrincipal = 2 WHERE id = 1;

SELECT * FROM motora;
    
SELECT * FROM motora AS motorista JOIN motora AS condutor
	ON condutor.id = motorista.fkCondPrincipal;
    
CREATE TABLE motoraAluguel (
id INT primary key auto_increment,
nome VARCHAR(45),
CNH CHAR(11),
validade DATE,
categoria CHAR(4)
);
    
INSERT INTO motoraAluguel VALUES 
	(null, 'Vivian', '12345678900', '2023-10-13', 'B');
    
CREATE TABLE carroAluguel(
id INT PRIMARY KEY auto_increment,
modelo VARCHAR(45),
placa CHAR(7),
estado CHAR(2) 
)auto_increment = 10000;

INSERT INTO carroAluguel VALUES
	(null, 'i30', 'NAM2912', 'SP'),
    (null, 'Jetta', 'JSA2344', 'SC');

CREATE TABLE aluguel (
idAluguel INT auto_increment,
fkMotora INT,
FOREIGN KEY (fkMotora) REFERENCES motoraAluguel(id),
fkCarro INT,
FOREIGN KEY (fkCarro) REFERENCES carroAluguel(id),
PRIMARY KEY (idAluguel, fkMotora, fkCarro),
dtInicio DATETIME default current_timestamp,
dtFim DATETIME,
valor DECIMAL(10,2),
check (valor >= 0)
);

SELECT * FROM carroAluguel;
SELECT * FROM motoraAluguel;

-- SELECT sysdate(); 
INSERT INTO aluguel(fkMotora,fkCarro, valor) VALUES 
(1, 10000, 10.99);

SELECT * FROM aluguel;	

SELECT * FROM motoraAluguel JOIN aluguel
	on motoraAluguel.id = fkMotora
    JOIN carroAluguel
    on carroAluguel.id = fkCarro;