USE SisDep;

-- b�nus de 100$ para todos os funcion�rios q possuam dependentes

BEGIN TRAN
	UPDATE Funcionario
	SET Salario = Salario + 100 -- ou salario += 100
	OUTPUT
		inserted.NomeFuncionario AS [Funcionario],
		deleted.Salario AS [Salario antigo],
		inserted.Salario AS [Salario]
	FROM Funcionario AS F INNER JOIN Dependente AS D -- inner join garante q somente funcion�rios com dependentes recebam o update
	ON F.idMatricula = D.idMatricula;


ROLLBACK
COMMIT
SELECT 
	F.NomeFuncionario,
	D.NomeDependente
FROM Funcionario AS F LEFT JOIN Dependente AS D
ON F.idMatricula = D.idMatricula;

-- Reajuste de 10% no sal�rio para funcion�rios q n�o possuam dependentes

SELECT
	F.NomeFuncionario,
	D.NomeDependente
FROM Funcionario AS F LEFT JOIN Dependente AS D
ON F.idMatricula = D.idMatricula
WHERE D.NomeDependente IS NULL;

BEGIN TRAN
	UPDATE Funcionario
	SET Salario = Salario * 1.1
	OUTPUT
		inserted.NomeFuncionario AS [Funcionario],
		deleted.Salario AS [Salario Antigo],
		inserted.Salario AS [Salario Novo]
	FROM Funcionario AS F LEFT JOIN Dependente AS D
	ON F.idMatricula = D.idMatricula
	WHERE D.NomeDependente IS NULL;

COMMIT

-- Desligamento de funcion�rios do departamento SAC com sal�rio acima de 1500$

BEGIN TRAN
	DELETE Funcionario
	OUTPUT
		deleted.NomeFuncionario AS [Funcionario que ser� deletado]
	FROM Funcionario AS F INNER JOIN Depto AS D
	ON F.idDepartamento = D.idDepartamento
	WHERE D.NomeDepartamento = 'SAC' AND Salario > 1500;

COMMIT
SELECT 
	F.NomeFuncionario,
	D.NomeDepartamento
FROM Funcionario AS F INNER JOIN Depto AS D
ON F.idDepartamento = D.idDepartamento
WHERE D.NomeDepartamento = 'SAC' AND Salario > 1500;

-- Desligamento de funcion�rios com sal�rio superior a 4000$ que n�o possuam dependentes

BEGIN TRAN
	DELETE Funcionario
	OUTPUT
		deleted.NomeFuncionario AS [Funcion�rio que ser� demitido],
		deleted.Salario AS [Sal�rio do funcion�rio que ser� demitido]
	FROM Funcionario AS F FULL JOIN Dependente AS D
	ON F.idMatricula = D.idMatricula
	WHERE D.NomeDependente IS NULL AND F.Salario > 4000;

COMMIT
ROLLBACK

SELECT
	F.NomeFuncionario,
	D.NomeDependente
FROM Funcionario AS F LEFT JOIN Dependente AS D
ON F.idMatricula = D.idMatricula
WHERE D.NomeDependente IS NULL AND Salario > 4000;