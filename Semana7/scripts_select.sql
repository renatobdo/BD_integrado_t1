select * from aluno;
select count(*) as quantidade, genero from 
aluno group by genero;
update aluno set genero = 'M' 
	where prontuario IN ('GU6789012',
    'GU6789033');

select count(*) as quantidade, etnia from 
aluno group by etnia;

update aluno set etnia = 'Branca' where
	etnia = 'BRANCO';

select * from aluno;
update aluno set etnia = 'Branca' where
	etnia = 'BRANCO'; 
select round(avg(altura),2) 
	as media_altura, count(*)
    as quantidade, 
    etnia from aluno group by etnia;
select * from aluno;

select round(avg(peso),2) 
	as media_de_peso, count(*)
    as quantidade, 
    etnia from aluno group by etnia;

select round(avg(altura),2) as altura,
	count(*) as quantidades_por_genero,genero
    from aluno where genero = 'F'
UNION
select round(avg(altura),2) as altura,
	count(*) as quantidade_por_genero, genero 
    from aluno where genero = 'M';

select count(*) from aluno;