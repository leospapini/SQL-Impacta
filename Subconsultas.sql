USE Clientes;

SELECT * FROM Clientes2016;
SELECT * FROM Clientes2017;

-- Quais clientes na base 2016 também estão na base 2017

SELECT * FROM Clientes2016 C16
WHERE
	EXISTS
	(
		SELECT idCliente FROM Clientes2017 C17 -- Filtro num select dentro de outro select, ou seja, somente os clientes de 2016 q tbm permaneceram em 2017
		WHERE C16.idCliente = C17.idCliente
	)

-- Quais clientes na base 2016 que não estão na base 2017

SELECT * FROM Clientes2016 C16
WHERE
	NOT EXISTS
	(
		SELECT idCliente FROM Clientes2017 C17
		WHERE C16.idCliente = C17.idCliente
	)

------------------------------------------------------------------


-- Utilizando in, not in

USE SisDep;

-- Nome dos funcionários q possuam dependentes

SELECT
	F.NomeFuncionario
FROM Funcionario F
WHERE 
	F.idMatricula IN( -- que matrícula da tabela funcionário existe aqui dentro?
		SELECT D.idMatricula FROM Dependente D);

-- Nome dos funcionários q não possuam dependentes

SELECT
	F.NomeFuncionario,
	F.idMatricula
FROM Funcionario F
WHERE 
	F.idMatricula NOT IN( -- que matrícula da tabela funcionário não existe aqui dentro?
		SELECT D.idMatricula FROM Dependente D);

-- IN E NOT IN são considerados evoluções do exists not exists

------------------------------------------------------------------


-- Retornar funcionários com salário acima da média salarial

SELECT AVG(SALARIO) MÉDIA FROM Funcionario;


SELECT 
	NomeFuncionario,
	Admissao,
	Salario
FROM Funcionario
WHERE Salario > (SELECT AVG(SALARIO) FROM Funcionario); -- primeiro ele tira a média, dps ele checa quais funcionarios estão acima e mostra eles