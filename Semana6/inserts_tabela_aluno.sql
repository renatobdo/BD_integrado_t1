INSERT INTO aluno (prontuario, nome, data_nascimento, genero, altura, peso, etnia,
 turma_codigo)
VALUES 
('GU1234567', 'João Silva', '2005-02-15', 'M', 1.70, 65, 'Branca', 'DBE1'),
('GU2345678', 'Maria Santos', '2004-07-12', 'F', 1.60, 50, 'Parda','DBE1'),
('GU3456789', 'Pedro Souza', '2003-09-02', 'M', 1.80, 75, 'Preta','DBE1'),
('GU4567890', 'Ana Oliveira', '2005-05-20', 'F', 1.55, 48, 'Branca','DBE1'),
('GU5678902', 'Lucas Almeida', '2004-11-10', 'M', 1.75, 70, 'Indígena','DBE1'),
('GU6789012', 'Julia Costa', '2003-03-30', 'F', 1.68, 60, 'Amarela','DBE1'),
('GU7890123', 'Felipe Pereira', '2005-06-25', 'M', 1.72, 68, 'Branca','DBE1'),
('GU890123x', 'Gabriela Fernandes', '2004-04-18', 'F', 1.62, 52, 'Parda','DBE1'),
('GU9012345', 'Rafaela Santos', '2003-11-22', 'F', 1.67, 63, 'Branca','DBE1'),
('GU0123456', 'Gustavo Lima', '2005-01-05', 'M', 1.79, 72, 'Parda','DBE1'),
('GU9234567', 'Paulo Oliveira', '2004-08-15', 'M', 1.78, 74, 'Preta','DBE1'),
('GU8345678', 'Carolina Silva', '2003-12-02', 'F', 1.65, 55, 'Branca','DBE1'),
('GU7456789', 'Marcelo Souza', '2005-04-20', 'M', 1.83, 80, 'Indígena','DBE1'),
('GU6567890', 'Fernanda Santos', '2004-02-10', 'F', 1.58, 49, 'Amarela', 'DBE1'),
('GU5678901', 'Leonardo Almeida', '2003-07-30', 'M', 1.77, 71, 'Branca','DBE1'),
('GU4789012', 'Amanda Costa', '2005-09-25', 'F', 1.70, 62, 'Parda','DBE1'),
('GU3890123', 'Vinicius Pereira', '2004-05-18', 'M', 1.76, 69, 'Branca','DBE1'),
('GU2901234', 'Isabela Fernandes', '2003-02-22', 'F', 1.63, 54, 'Preta','DBE1'),
('GU1012345', 'Mariana Santos', '2005-10-05', 'F', 1.64, 57, 'Branca','DBE1');

create table prontuarios (select prontuario from aluno);
select * from prontuarios;

select count(*) as quantide, area from disciplina group by area;






select a.prontuario, a.nome, d.nome 
	from aluno a join aluno_disciplina ad on a.prontuario = ad.aluno_prontuario
				 join disciplina d 		  on ad.disciplina_codigo = d.codigo
			where a.prontuario = 'GU0123456';



select * from aluno_disciplina where aluno_prontuario like 'X%';



select count(etnia) from aluno where etnia = 'Branca';




select nome, prontuario from aluno;


select count(*) as quantidade, etnia from aluno group by etnia;


insert into aluno(nome, prontuario) values ('Gabriela','GU21579x');
insert into aluno values ('GU21578x', 'Gabriela da Silva', '2005-09-05',
 'F', 1.72, 62, null, 'DBE1');

select round(avg(altura),2) as altura, 
	count(*) as quantidade, etnia from aluno group by etnia;
    
    
select count(*) from aluno;


select * from aluno where prontuario like '%215%';




