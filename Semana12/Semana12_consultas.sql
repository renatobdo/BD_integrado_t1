select * from Estatisticas_partida;
# 1) Qual o jogador que fez mais pontos?
select * from Estatisticas_partida order by pontuacao desc;
#3) Quais partidas os jogadores jogaram
select nome, j.id_jogador, p.id_partida, mapa, pontuacao from
	jogadores j inner join 
    estatisticas_partida ep on j.id_jogador = ep.id_jogador
    inner join partidas p on ep.id_partida = p.id_partida
    order by pontuacao desc;

#2) Qual jogador ficou mais tempo jogando?
select * from partidas;
select time_to_sec(Duracao) from partidas;
select SUM(time_to_sec(Duracao)) from partidas;
select SEC_TO_TIME(SUM(time_to_sec(Duracao))) from partidas;
SELECT Jogadores.Nome, SEC_TO_TIME(SUM(TIME_TO_SEC(partidas.Duracao))) AS Horas_jogadas
FROM Jogadores
INNER JOIN Estatisticas_partida ON 
	Jogadores.ID_jogador = Estatisticas_partida.ID_jogador
INNER JOIN Partidas ON 
	Estatisticas_partida.ID_partida = Partidas.ID_partida
GROUP BY Jogadores.Nome;
#4) Quantas pessoas determinado jogador matou?
select nome, j.id_jogador, p.id_partida, mapa, pontuacao, kills, deaths from
	jogadores j inner join 
    estatisticas_partida ep on j.id_jogador = ep.id_jogador
    inner join partidas p on ep.id_partida = p.id_partida 
    order by pontuacao desc;

#5) Quantas pessoas determinado jogador matou?
select nome, j.id_jogador, p.id_partida, mapa, pontuacao, sum(kills), deaths from
	jogadores j inner join 
    estatisticas_partida ep on j.id_jogador = ep.id_jogador
    inner join partidas p on ep.id_partida = p.id_partida group by j.id_jogador
    order by pontuacao desc;