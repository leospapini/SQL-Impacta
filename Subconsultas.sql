USE Clientes;

SELECT * FROM Clientes2016;
SELECT * FROM Clientes2017;

-- Quais clientes na base 2016 tamb�m est�o na base 2017

SELECT * FROM Clientes2016 C16
WHERE
	EXISTS
	(
		SELECT idCliente FROM Clientes2017 C17 -- Filtro num select dentro de outro select, ou seja, somente os clientes de 2016 q tbm permaneceram em 2017
		WHERE C16.idCliente = C17.idCliente
	)

-- Quais clientes na base 2016 que n�o est�o na base 2017

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

-- Nome dos funcion�rios q possuam dependentes

SELECT
	F.NomeFuncionario
FROM Funcionario F
WHERE 
	F.idMatricula IN( -- que matr�cula da tabela funcion�rio existe aqui dentro?
		SELECT D.idMatricula FROM Dependente D);

-- Nome dos funcion�rios q n�o possuam dependentes

SELECT
	F.NomeFuncionario,
	F.idMatricula
FROM Funcionario F
WHERE 
	F.idMatricula NOT IN( -- que matr�cula da tabela funcion�rio n�o existe aqui dentro?
		SELECT D.idMatricula FROM Dependente D);

-- IN E NOT IN s�o considerados evolu��es do exists not exists

------------------------------------------------------------------


-- Retornar funcion�rios com sal�rio acima da m�dia salarial

SELECT AVG(SALARIO) M�DIA FROM Funcionario;


SELECT 
	NomeFuncionario,
	Admissao,
	Salario
FROM Funcionario
WHERE Salario > (SELECT AVG(SALARIO) FROM Funcionario); -- primeiro ele tira a m�dia, dps ele checa quais funcionarios est�o acima e mostra eles