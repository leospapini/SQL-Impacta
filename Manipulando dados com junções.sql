USE SisDep;

-- bônus de 100$ para todos os funcionários q possuam dependentes

BEGIN TRAN
	UPDATE Funcionario
	SET Salario = Salario + 100 -- ou salario += 100
	OUTPUT
		inserted.NomeFuncionario AS [Funcionario],
		deleted.Salario AS [Salario antigo],
		inserted.Salario AS [Salario]
	FROM Funcionario AS F INNER JOIN Dependente AS D -- inner join garante q somente funcionários com dependentes recebam o update
	ON F.idMatricula = D.idMatricula;


ROLLBACK
COMMIT
SELECT 
	F.NomeFuncionario,
	D.NomeDependente
FROM Funcionario AS F LEFT JOIN Dependente AS D
ON F.idMatricula = D.idMatricula;

-- Reajuste de 10% no salário para funcionários q não possuam dependentes

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

-- Desligamento de funcionários do departamento SAC com salário acima de 1500$

BEGIN TRAN
	DELETE Funcionario
	OUTPUT
		deleted.NomeFuncionario AS [Funcionario que será deletado]
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

-- Desligamento de funcionários com salário superior a 4000$ que não possuam dependentes

BEGIN TRAN
	DELETE Funcionario
	OUTPUT
		deleted.NomeFuncionario AS [Funcionário que será demitido],
		deleted.Salario AS [Salário do funcionário que será demitido]
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