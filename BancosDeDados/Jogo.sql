create database jogo;
use jogo;

CREATE TABLE Jogadores (
    ID_jogador INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Data_criacao DATE NOT NULL,
    Ultimo_login DATETIME,
    PRIMARY KEY (ID_jogador)
);

CREATE TABLE Partidas (
    ID_partida INT NOT NULL AUTO_INCREMENT,
    Mapa VARCHAR(50) NOT NULL,
    Data_partida DATETIME NOT NULL,
    Duracao TIME NOT NULL,
    Pontuacao_A INT NOT NULL,
    Pontuacao_B INT NOT NULL,
    PRIMARY KEY (ID_partida)
);

CREATE TABLE Estatisticas_partida (
    ID_estatistica INT NOT NULL AUTO_INCREMENT,
    ID_jogador INT NOT NULL,
    ID_partida INT NOT NULL,
    Kills INT NOT NULL,
    Deaths INT NOT NULL,
    Assists INT NOT NULL,
    Headshots INT NOT NULL,
    Pontuacao INT NOT NULL,
    Armas VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID_estatistica),
    FOREIGN KEY (ID_jogador) REFERENCES Jogadores(ID_jogador),
    FOREIGN KEY (ID_partida) REFERENCES Partidas(ID_partida)
);



INSERT INTO Jogadores (Nome, Email, Data_criacao, Ultimo_login) VALUES 
('João', 'joao@example.com', '2022-01-01', '2022-01-05 14:30:00'),
('Maria', 'maria@example.com', '2022-01-02', '2022-01-05 12:10:00'),
('Pedro', 'pedro@example.com', '2022-01-03', '2022-01-05 15:45:00');
select * from jogadores;

INSERT INTO Partidas (Mapa, Data_partida, Duracao, Pontuacao_A, Pontuacao_B) VALUES
('de_dust2', '2022-01-05 16:30:00', '00:30:00', 16, 14),
('de_inferno', '2022-01-06 14:15:00', '00:45:00', 8, 16);
select * from Partidas;

INSERT INTO Estatisticas_partida (ID_jogador, ID_partida, Kills, Deaths, Assists, Headshots, Pontuacao, Armas) VALUES
(1, 1, 20, 10, 5, 10, 25, 'AK-47, Desert Eagle'),
(2, 1, 10, 20, 5, 5, 15, 'M4A1, USP-S'),
(3, 1, 15, 15, 7, 8, 20, 'AWP, Glock-18'),
(1, 2, 5, 20, 3, 1, 10, 'AK-47, Desert Eagle'),
(2, 2, 12, 15, 4, 4, 18, 'M4A1, USP-S');



