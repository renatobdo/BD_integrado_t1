-- cria o banco de dados escola
drop  database if exists escola3;
CREATE database escola3;
USE escola3 ;
-- -----------------------------------------------------
-- Table `escola`.`turma`
-- -----------------------------------------------------
CREATE TABLE turma (
  codigo VARCHAR(10) NOT NULL,
  professor VARCHAR(60) NOT NULL,
  ano DATE NULL,
  semestre INT NULL,
  numero_disciplina VARCHAR(45) NULL,
  PRIMARY KEY (codigo));


-- -----------------------------------------------------
-- Table `escola`.`aluno`
-- -----------------------------------------------------
CREATE TABLE aluno (
  prontuario VARCHAR(10) NOT NULL,
  nome VARCHAR(150) NOT NULL,
  data_nascimento DATETIME NOT NULL,
  genero VARCHAR(15) NOT NULL,
  altura FLOAT NULL,
  peso FLOAT NULL,
  etnia VARCHAR(45) NULL,
  turma_codigo VARCHAR(10) NOT NULL,
  PRIMARY KEY (prontuario),
  CONSTRAINT fk_aluno_turma1 FOREIGN KEY (turma_codigo)
    REFERENCES turma (codigo) ON DELETE NO ACTION ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `escola`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE disciplina (
  codigo VARCHAR(10) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  aluno_prontuario VARCHAR(10) NOT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT fk_disciplina_aluno
    FOREIGN KEY (aluno_prontuario)
    REFERENCES aluno (prontuario));


-- -----------------------------------------------------
-- Table `escola`.`pre_requisito`
-- -----------------------------------------------------
CREATE TABLE pre_requisito (
  numero_pre_requisito VARCHAR(10) NOT NULL,
  disciplina_codigo VARCHAR(10) NOT NULL,
  PRIMARY KEY (numero_pre_requisito, disciplina_codigo),
  CONSTRAINT fk_pre_requisito_disciplina1
    FOREIGN KEY (disciplina_codigo)
    REFERENCES disciplina (codigo));
    
create table registro_nota(
	codigo varchar(10), nota float, numero_aluno varchar(10), 
    turma_codigo varchar(10), primary key (codigo), constraint fk_registro
    foreign key(numero_aluno) references aluno(prontuario));


INSERT INTO turma values ('DBE1', 'Renato Bueno', 2023, 1,'DBE123') ; 

insert into aluno values ('GU21579X', 'Renato Bueno', '2007-09-05', 
					'MASCULINO', 1.74, 69, 'BRANCO','DBE');
                    
#select * from aluno;                    
                    
alter table turma modify ano year;    
update turma set ano = 2023 where codigo = 'DBE';                
#select * from turma;  

#select count(*) from aluno where genero = 'F';
#select count(*) from aluno where genero = 'M';
#select count(*) as 'quantidade', 
#	altura from aluno group by altura;
alter table aluno modify genero varchar(2);




INSERT INTO aluno (prontuario, nome, data_nascimento, 
genero, altura, peso, etnia,
 turma_codigo)VALUES 
('GU1234500', 'João Silva', '2005-02-15', 
'NB', 1.70, 65, 'Branca', 'DBE');

#select count(*) as 'quantidade', genero from aluno 
#	group by genero;

#select count(*) as 'quantidade', etnia from aluno 
#	group by etnia;

    
    
    
#select altura, nome from aluno order by altura;

#select * from aluno;  
#select * from aluno where altura > 1.8;  
#select round(AVG(altura),2) from aluno;

#select count(*) from aluno where altura < 1.69;
#select count(*) from aluno where altura > 1.69;

#select count(*) from aluno;

alter table aluno modify genero varchar(2); 
alter table aluno modify data_nascimento date;             
                    
				
insert into aluno values ('GU21578X', 'Jose Bueno', '1952-09-05', 
					'MASCULINO', 1.74, 69, 'BRANCO','DBE');
insert into aluno values ('GU21575X', 'Maria Diná', '1942-11-28', 
					'Feminino', 1.50, 58, 'BRANCO','DBE');
                    

#select * from turma;


#select * from aluno where genero like 'fe%'; 
#select * from aluno where altura > 1.5;

#select * from turma; 


alter table turma modify ano year;
update turma set ano = 2023 where codigo = 'DBE';




#alter table aluno add genero varchar(50) after data_nascimento;

insert into disciplina values ('DBE', 'Desenvolvimento Backend', 'GU21579X');
insert into pre_requisito values (1, 'DBE');
#select * from disciplina;
#select * from pre_requisito;


update turma set ano = 2023 where codigo = 'DBE';

select prontuario,data_nascimento from aluno;
insert into aluno values ('GU123456', 'Rafael Bueno', '2007-09-05', 
	'MASCULINO', 1.74, 69, 'BRANCO', 'DBE');
UPDATE aluno set data_nascimento = '2007-09-05 16:30:00' where 
prontuario = 'GU123456';
              
UPDATE ALUNO SET data_nascimento = '2007-09-05' where prontuario = 'GU21579X';

select * from turma;
select * from aluno;

#insere na tabela aluno
INSERT INTO aluno (prontuario, nome, data_nascimento, genero, altura, peso, etnia,
 turma_codigo)
VALUES 
('GU1234567', 'João Silva', '2005-02-15', 'M', 1.70, 65, 'Branca', 'DBE'),
('GU2345678', 'Maria Santos', '2004-07-12', 'F', 1.60, 50, 'Parda','DBE'),
('GU3456789', 'Pedro Souza', '2003-09-02', 'M', 1.80, 75, 'Preta','DBE'),
('GU4567890', 'Ana Oliveira', '2005-05-20', 'F', 1.55, 48, 'Branca','DBE'),
('GU5678902', 'Lucas Almeida', '2004-11-10', 'M', 1.75, 70, 'Indígena','DBE'),
('GU6789012', 'Julia Costa', '2003-03-30', 'F', 1.68, 60, 'Amarela','DBE'),
('GU7890123', 'Felipe Pereira', '2005-06-25', 'M', 1.72, 68, 'Branca','DBE'),
('GU890123x', 'Gabriela Fernandes', '2004-04-18', 'F', 1.62, 52, 'Parda','DBE'),
('GU9012345', 'Rafaela Santos', '2003-11-22', 'F', 1.67, 63, 'Branca','DBE'),
('GU0123456', 'Gustavo Lima', '2005-01-05', 'M', 1.79, 72, 'Parda','DBE'),
('GU9234567', 'Paulo Oliveira', '2004-08-15', 'M', 1.78, 74, 'Preta','DBE'),
('GU8345678', 'Carolina Silva', '2003-12-02', 'F', 1.65, 55, 'Branca','DBE'),
('GU7456789', 'Marcelo Souza', '2005-04-20', 'M', 1.83, 80, 'Indígena','DBE'),
('GU6567890', 'Fernanda Santos', '2004-02-10', 'F', 1.58, 49, 'Amarela', 'DBE'),
('GU5678901', 'Leonardo Almeida', '2003-07-30', 'M', 1.77, 71, 'Branca','DBE'),
('GU4789012', 'Amanda Costa', '2005-09-25', 'F', 1.70, 62, 'Parda','DBE'),
('GU3890123', 'Vinicius Pereira', '2004-05-18', 'M', 1.76, 69, 'Branca','DBE'),
('GU2901234', 'Isabela Fernandes', '2003-02-22', 'F', 1.63, 54, 'Preta','DBE'),
('GU1012345', 'Mariana Santos', '2005-10-05', 'F', 1.64, 57, 'Branca','DBE');

#atualiza
update aluno set etnia = 'Branca' where etnia = 'BRANCO';
#agrupar alunos pela etnia 
select count(*) as quantidade, etnia from aluno group by etnia; 

#agrupar alunos pelo genero
select * from aluno;
update aluno set genero = 'M' where genero = 'MA';
update aluno set genero = 'F' where genero = 'Fe';
select count(*) as quantidade, genero from aluno group by genero;

#agrupar pela etnia e altura
select ROUND(AVG(altura),2) as altura, etnia FROM aluno group by etnia; 

select * from aluno;
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