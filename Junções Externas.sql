USE SisDep;

-- LEFT
SELECT
	F.NomeFuncionario,
	D.NomeDependente,
	D.NascimentoDependente
FROM Funcionario AS F LEFT OUTER JOIN Dependente AS D
ON F.idMatricula = D.idMatricula
ORDER BY F.NomeFuncionario ASC;

-- LEFT faz com q o join pegue TODAS as informa��es da tabela � esquerda do Join, e � direita somente os que tem rela��o aparecer�o
-- Caso n�o haja rela��o, resultar� nulo(null)

-- RIGHT
SELECT
	F.NomeFuncionario,
	C.NomeCargo,
	F.Salario
FROM Funcionario AS F RIGHT JOIN Cargo AS C
ON F.idCargo = C.idCargo
ORDER BY F.Salario;

-- Mesmo funcionamento do LEFT, por�m todos � direita do Join ser�o contabilizados ao inv�s da esquerda