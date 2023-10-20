USE SisDep;

-- LEFT
SELECT
	F.NomeFuncionario,
	D.NomeDependente,
	D.NascimentoDependente
FROM Funcionario AS F LEFT OUTER JOIN Dependente AS D
ON F.idMatricula = D.idMatricula
ORDER BY F.NomeFuncionario ASC;

-- LEFT faz com q o join pegue TODAS as informações da tabela à esquerda do Join, e à direita somente os que tem relação aparecerão
-- Caso não haja relação, resultará nulo(null)

-- RIGHT
SELECT
	F.NomeFuncionario,
	C.NomeCargo,
	F.Salario
FROM Funcionario AS F RIGHT JOIN Cargo AS C
ON F.idCargo = C.idCargo
ORDER BY F.Salario;

-- Mesmo funcionamento do LEFT, porém todos à direita do Join serão contabilizados ao invés da esquerda