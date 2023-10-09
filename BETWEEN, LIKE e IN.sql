USE SisDep;

-- Between
SELECT
	idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE Salario BETWEEN 1500 AND 3000;

SELECT
	idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE Admissao NOT BETWEEN '2005/1/1' AND '2005/12/31'
ORDER BY Admissao ASC; -- todos MENOS 2005 em ordem crescente

------------------------------------------------------------------
-- IN

SELECT
	idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE idDepartamento IN(1,3,5,10);

SELECT
	idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE idDepartamento NOT IN(1,7); -- Tudo q não for 1 e 7


------------------------------------------------------------------
-- LIKE força muito o servidor, só utilizado em casos extremos

/*
	Caracteres coringa

	% = 1 ou mais caracteres desconhecidos
	_ = somente 1 caractere desconhecido
*/

SELECT
	idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE NomeFuncionario LIKE 'A%'
ORDER BY NomeFuncionario; -- Todas as pessoas onde a primeira letra começa com A, da segunda posição em diante, não importa

SELECT
	idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE NomeFuncionario LIKE 'A_A%'
ORDER BY NomeFuncionario; -- Neste exemplo, a primeira letra tem q ser A, a segunda tanto faz, a terceira tem q ser A de novo, a partir dai tanto faz

SELECT
	idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE NomeFuncionario LIKE '%Oliveira'
ORDER BY NomeFuncionario; -- Tanto faz o nome da pessoa, mas o sobrenome, ou seja, a última palavra, tem q ter Oliveira

SELECT
	idDepartamento, idMatricula, NomeFuncionario, Admissao, Salario
FROM Funcionario
WHERE NomeFuncionario LIKE '%Silva%'
ORDER BY NomeFuncionario; -- Todas as pessoas q possuam Silva em qualquer parte do nome, no meio ou no fim