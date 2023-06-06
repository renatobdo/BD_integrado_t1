create database s16;
use s16;
-- Criação da tabela "clientes"
CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50),
  idade INT,
  cidade VARCHAR(50)
);

-- Inserção de dados na tabela "clientes"
INSERT INTO clientes (nome, idade, cidade)
VALUES ('João', 28, 'São Paulo'),
       ('Maria', 35, 'Rio de Janeiro'),
       ('Pedro', 42, 'Belo Horizonte'),
       ('Ana', 31, 'Curitiba');

-- Criação da tabela "contas"
CREATE TABLE contas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50),
  saldo DECIMAL(10, 2)
);

-- Inserção de dados na tabela "contas"
INSERT INTO contas (nome, saldo)
VALUES ('João', 1000.50),
       ('Maria', 500.75),
       ('Pedro', 0),
       ('Ana', 1500.25);

-- Criação da tabela "pedidos"
CREATE TABLE pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente VARCHAR(50),
  data DATE,
  status VARCHAR(20)
);

-- Inserção de dados na tabela "pedidos"
INSERT INTO pedidos (cliente, data, status)
VALUES ('João', '2023-05-01', 'entregue'),
       ('Maria', '2023-05-05', 'cancelado'),
       ('Pedro', '2023-05-03', 'entregue'),
       ('Ana', '2023-05-10', 'entregue');

-- Criação da tabela "produtos"
CREATE TABLE produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50)
);

-- Inserção de dados na tabela "produtos"
INSERT INTO produtos (nome)
VALUES ('Camiseta'),
       ('Calça'),
       ('Tênis');

-- Criação da tabela "estoque"
CREATE TABLE estoque (
  id INT AUTO_INCREMENT PRIMARY KEY,
  produto_id INT,
  quantidade INT
);

-- Inserção de dados na tabela "estoque"
INSERT INTO estoque (produto_id, quantidade)
VALUES (1, 10),
       (2, 5),
       (3, 8);


-- Criação da tabela "funcionarios"
CREATE TABLE funcionarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50),
  gerente_id INT
);

-- Inserção de dados na tabela "funcionarios"
INSERT INTO funcionarios (nome, gerente_id)
VALUES ('João', NULL),
       ('Maria', 1),
       ('Pedro', 1),
       ('Ana', 2),
       ('Carlos', 2);


# 1 - Exemplo de VIEW básica:
CREATE VIEW clientes_acima_30 AS
SELECT id, nome, idade, cidade
FROM clientes
WHERE idade > 30;

select * from clientes;   
select * from clientes_acima_30;    

# 2 - Exemplo de Updatable VIEW:
CREATE VIEW clientes_ativos AS
SELECT id, nome, saldo
FROM contas
WHERE saldo > 0
WITH CHECK OPTION;

select * from contas;
select * from clientes_ativos;

# 3 - Exemplo de Check Option VIEW
CREATE VIEW pedidos_recentes AS
SELECT id, cliente, data
FROM pedidos
WHERE status = 'entregue'
WITH CHECK OPTION;

select * from pedidos;
select * from pedidos_recentes;

# 4 - exemplo de merge view
CREATE VIEW produtos_vendidos AS
SELECT p.id, p.nome, s.quantidade
FROM produtos p
JOIN estoque s ON p.id = s.produto_id;

select * from produtos;
select * from produtos_vendidos;

# 5 - Recursive VIEW:
CREATE VIEW gerentes_subordinados AS
WITH RECURSIVE cte AS (
    SELECT id, nome, gerente_id
    FROM funcionarios
    WHERE gerente_id IS NULL -- Funcionários de nível superior
    UNION ALL
    SELECT f.id, f.nome, f.gerente_id
    FROM funcionarios f
    JOIN cte ON f.gerente_id = cte.id
)
SELECT id, nome, gerente_id
FROM cte;

select * from funcionarios;
select * from gerentes_subordinados;

CREATE VIEW gerentes_subordinados2 AS
WITH RECURSIVE cte AS (
    SELECT f.id, f.nome, f.gerente_id, NULL AS nome_do_gerente
    FROM funcionarios f
    WHERE f.gerente_id IS NULL -- Funcionários de nível superior
    UNION ALL
    SELECT f.id, f.nome, f.gerente_id, cte.nome AS nome_do_gerente
    FROM funcionarios f
    JOIN cte ON f.gerente_id = cte.id
)
SELECT id, nome, gerente_id, nome_do_gerente
FROM cte;

select * from gerentes_subordinados2;

CREATE VIEW gerentes_subordinados3 AS
WITH RECURSIVE cte AS (
    SELECT f.id, f.nome, f.gerente_id, NULL AS nome_do_gerente
    FROM funcionarios f
    WHERE f.gerente_id IS NULL -- Funcionários de nível superior
    UNION ALL
    SELECT f.id, f.nome, f.gerente_id, cte.nome
    FROM funcionarios f
    JOIN cte ON f.gerente_id = cte.id
)
SELECT id, nome, gerente_id, CAST(nome_do_gerente AS CHAR) AS nome_do_gerente
FROM cte;

select * from gerentes_subordinados3;

CREATE VIEW gerentes_subordinados4 AS
WITH RECURSIVE cte AS (
    SELECT f.id, f.nome, f.gerente_id, '' AS nome_do_gerente
    FROM funcionarios f
    WHERE f.gerente_id IS NULL -- Funcionários de nível superior
    UNION ALL
    SELECT f.id, f.nome, f.gerente_id, cte.nome
    FROM funcionarios f
    JOIN cte ON f.gerente_id = cte.id
)
SELECT cte.id, cte.nome, cte.gerente_id, gerente.nome AS nome_do_gerente
FROM cte
LEFT JOIN funcionarios gerente ON cte.gerente_id = gerente.id;

select * from gerentes_subordinados4;

CREATE VIEW gerentes_subordinados5 AS
WITH RECURSIVE cte AS (
    SELECT f.id, f.nome, f.gerente_id, f.nome AS nome_do_gerente
    FROM funcionarios f
    WHERE f.gerente_id IS NULL -- Funcionários de nível superior
    UNION ALL
    SELECT f.id, f.nome, f.gerente_id, gerente.nome
    FROM funcionarios f
    JOIN cte ON f.gerente_id = cte.id
    LEFT JOIN funcionarios gerente ON f.gerente_id = gerente.id
)
SELECT id, nome, gerente_id, nome_do_gerente
FROM cte;

select * from gerentes_subordinados5;


## Detalhando os exemplos 2 e 3
select * from funcionarios;
alter table funcionarios add salario decimal(10,2) after nome;

update funcionarios set salario = 15000 where id = 1;
update funcionarios set salario = 10000 where id = 2;
update funcionarios set salario = 9500 where id = 3;
update funcionarios set salario = 7000 where id = 4;
update funcionarios set salario = 6900 where id = 5;

-- Criação da visualização atualizável
#drop view funcionarios_salario_aumentado;
CREATE OR REPLACE VIEW funcionarios_salario_aumentado AS
SELECT id, nome, salario, salario * 1.1 AS novo_salario
FROM funcionarios;

select * from funcionarios_salario_aumentado;
UPDATE funcionarios_salario_aumentado SET salario = 7500 WHERE id = 1;
select * from funcionarios_salario_aumentado;
update funcionarios set salario = 15000 where id = 1;
select * from funcionarios;
## 
select * from produtos;
alter table produtos add quantidade int;
alter table produtos add preco decimal(10,2);
update produtos set quantidade = 20, preco = 25 where id =1;
update produtos set quantidade = 10, preco = 50 where id =2;
update produtos set quantidade = 5, preco = 100 where id =3;

CREATE OR REPLACE VIEW produtos_em_estoque AS
SELECT id, nome, quantidade, preco
FROM produtos
WHERE quantidade > 0
WITH CHECK OPTION;

# o insert abaixo vai dar erro. Por quê?
INSERT INTO produtos_em_estoque (id, nome, quantidade, preco)
VALUES (4, 'Boné', 0, 15);

INSERT INTO produtos_em_estoque (id, nome, quantidade, preco)
VALUES (4, 'Óculos de sol', 3, 50);

select * from produtos_em_estoque;

## Exemplos com a LGPD (lei geral de proteção de dados)
CREATE TABLE dados_pessoais (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50),
  endereco VARCHAR(100),
  telefone VARCHAR(20),
  email VARCHAR(50)
);

INSERT INTO dados_pessoais (nome, endereco, telefone, email)
VALUES
  ('João Silva', 'Rua A, 123', '(11) 1234-5678', 'joao.silva@example.com'),
  ('Maria Santos', 'Av. B, 456', '(22) 9876-5432', 'maria.santos@example.com'),
  ('Pedro Oliveira', 'Rua C, 789', '(33) 2468-1357', 'pedro.oliveira@example.com');

# Crie uma view com base na LGPD (lei geral de proteção de dados)


