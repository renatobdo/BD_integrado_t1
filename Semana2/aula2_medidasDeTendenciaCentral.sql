use testes;
create table alunos (nome varchar(60),
altura decimal(3,2));
alter table alunos modify altura float;
select * from alunos;
select * from alunos order by altura;
#https://elias.praciano.com/2015/03/como-calcular-a-media-no-mysql/
select avg(altura) from alunos;
#Retira valores repetidos para fazer a média
select avg(distinct altura) from alunos;
#Moda e media 
#https://www.geeksforgeeks.org/find-mean-mode-sql-server/
#Calculo das frequencias
SELECT altura, count(*) as "frequencia"
FROM   alunos
GROUP  BY altura
ORDER  BY altura;
#Calculo da moda (Para descobrir se tem mais de uma moda altera o valor do LIMIT para 2,3,4...)
with moda as (SELECT altura, count(*) as "frequencia"
FROM   alunos
GROUP  BY altura
ORDER  BY frequencia)select altura, frequencia from moda order by frequencia DESC LIMIT 1;

#Mediana
#https://www.geeksforgeeks.org/calculate-median-in-mysql/?ref=lbp
SET @i = -1;
SELECT
   AVG(d.altura) as Mediana 
FROM
   (SELECT @i:=@i + 1 AS i,
           alunos.altura AS altura
    FROM alunos
    ORDER BY alunos.altura) AS d
WHERE
d.i IN (FLOOR(i / 2), CEIL(i / 2));
select min(altura) from alunos;
select max(altura) from alunos;
SET @i = 0;
SET @row_index := -1;
SELECT *
FROM (
SELECT @row_index:=@row_index + 1 AS row_index, nome, altura
FROM alunos ORDER BY altura ) AS subquery
WHERE subquery.row_index IN (FLOOR(@row_index / 2) , CEIL(@row_index / 2));

SET @row_index := -1;
SELECT @row_index:=@row_index + 1 AS row_index, altura
FROM alunos ORDER BY altura;

 
SELECT AVG(subquery.altura) AS Mediana_das_alturas
FROM (
SELECT @row_index:=@row_index + 1 AS row_index, altura
FROM alunos ORDER BY altura ) AS subquery
WHERE subquery.row_index IN (FLOOR(@row_index / 2) , CEIL(@row_index / 2));


select * from alunos order by altura;
SELECT CEIL(COUNT(*)/2) FROM alunos;
SELECT FLOOR(COUNT(*)/2) FROM alunos;

select count(*) as qtd ,
	(case
		when mod(count(*),2) = 0 then
			"par"
		when mod(count(*),2) <> 0 then
			"impar"
	end) as "par_ou_impar" 
    from alunos;
select * from alunos;
insert into alunos (nome, altura) values ('Renato', 174);
delete from alunos where nome = 'Renato' and altura = 174;

delete from alunos where nome = 'Alice'; 
insert into alunos values ('Alice', 165);

SET @row_index := -1;
SELECT @row_index:=@row_index + 1 AS row_index, altura
FROM alunos ORDER BY row_index;

#https://www.ibge.gov.br/estatisticas/sociais/populacao/2098-np-censo-demografico/22827-censo-demografico-2022.html?edicao=35938&t=resultados
create table municipios(uf varchar(10), cod_uf int, cod_municipio int, nome_municipio varchar(180), populacao int);
#https://github.com/kelvins/Municipios-Brasileiros/blob/main/csv/municipios.csv
delete from municipios;
select * from municipios order by populacao desc limit 20;



create database empresa_t1;
use empresa_t1;
create table funcionario(nome varchar(100) not null,
cpf varchar(15));