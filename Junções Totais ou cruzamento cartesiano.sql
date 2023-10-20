SELECT 
	F.NomeFuncionario,
	F.Admissao,
	D.NomeDependente,
	D.NascimentoDependente
FROM Funcionario AS F FULL JOIN Dependente AS D
ON F.idMatricula = D.idMatricula
ORDER BY F.NomeFuncionario;

-- FULL JOIN significa tanto os da esquerda quanto da direita ser�o buscados na �ntegra


SELECT * FROM Depto;

SELECT * FROM Projeto;

SELECT 
	D.NomeDepartamento,
	P.NomeProjeto,
	P.DataInicio,
	P.DataTermino
FROM Depto AS D CROSS JOIN Projeto AS P;

-- N�o h� necessidade de dizer qual elemento da tabela ser� feito a correla��o pois o cross join j� entende q cada elemento ser� combinado com todos elementos
