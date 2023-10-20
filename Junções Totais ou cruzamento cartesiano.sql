SELECT 
	F.NomeFuncionario,
	F.Admissao,
	D.NomeDependente,
	D.NascimentoDependente
FROM Funcionario AS F FULL JOIN Dependente AS D
ON F.idMatricula = D.idMatricula
ORDER BY F.NomeFuncionario;

-- FULL JOIN significa tanto os da esquerda quanto da direita serão buscados na íntegra


SELECT * FROM Depto;

SELECT * FROM Projeto;

SELECT 
	D.NomeDepartamento,
	P.NomeProjeto,
	P.DataInicio,
	P.DataTermino
FROM Depto AS D CROSS JOIN Projeto AS P;

-- Não há necessidade de dizer qual elemento da tabela será feito a correlação pois o cross join já entende q cada elemento será combinado com todos elementos
