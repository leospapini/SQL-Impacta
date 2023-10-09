USE SisDep;

SELECT 
	NomeFuncionario, Admissao, Salario, Uf, Cidade
FROM Funcionario INNER JOIN Localidade
ON Funcionario.idLocalidade = Localidade.idLocalidade;


SELECT 
	NomeFuncionario, NomeDepartamento, Admissao, Salario, Uf, Cidade
FROM Funcionario 
INNER JOIN Localidade
ON Funcionario.idLocalidade = Localidade.idLocalidade
INNER JOIN Depto
ON Depto.idDepartamento = Funcionario.idDepartamento;

SELECT * FROM Funcionario;
SELECT * FROM Localidade;

-- Nomes Qualificados

SELECT
	Funcionario.NomeFuncionario,
	Dependente.NomeDependente,
	Dependente.NascimentoDependente
FROM Funcionario INNER JOIN Dependente
ON Dependente.idMatricula = Funcionario.idMatricula
ORDER BY Funcionario.NomeFuncionario;

-- Rótulos ou Alias

SELECT
	F.NomeFuncionario,
	D.NomeDependente,
	D.NascimentoDependente
FROM Funcionario AS F INNER JOIN Dependente AS D
ON D.idMatricula = F.idMatricula
ORDER BY F.NomeFuncionario; -- mesmo resultado porém rotulando as tabelas funcionario como F e Dependente como D
-- Só irá me retornar funcionários q efetivamente tenham pelo menos 1 dependente

SELECT * FROM Funcionario;
SELECT * FROM Dependente;