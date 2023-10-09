USE SisDep;

-- Todas as colunas de uma tabela

SELECT * FROM Funcionario;

-- Somente algumas colunas

SELECT idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario;

-- Ordenar dados

SELECT idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
ORDER BY NomeFuncionario ASC;

SELECT idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
ORDER BY Salario DESC;

-- Ordena��o por mais de uma coluna

SELECT idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
ORDER BY idDepartamento ASC, Salario DESC;

-- Ordenar pela posi��o da coluna

SELECT idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
ORDER BY 1 ASC, 5 DESC; -- Mesmo resultado q no c�digo acima, por�m utilizamos apenas o n�mero da coluna ao inv�s do nome

-- Rank TOP
-- 20 primeiras linhas da tabela
SELECT TOP 20 idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario;

-- 10% de registro
SELECT TOP 10 PERCENT idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario;

-- 10 Maiores sal�rios
SELECT TOP 10 idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
ORDER BY Salario DESC;

-- Com empates
SELECT TOP 9 WITH TIES idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
ORDER BY Salario DESC; -- Solicitamos os 9 maiores com empates, ou seja, resulta em 10 linhas pois o 9� maior sal�rio tem mais um funcion�rio com o mesmo sal�rio

-- Retornar os 5 funcion�rios mais antigos
SELECT TOP 5 WITH TIES idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
ORDER BY Admissao ASC;