USE SysConVendas;

SELECT * FROM Dados;

-- Neste exemplo estamos utilizando a coluna Cidade n�o agregada para fazer uma soma total do faturamento por cidade
SELECT
	Cidade, SUM(total) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade;

SELECT
	Produto, Cidade, SUM(total) AS [Faturamento Total],
	COUNT(*) AS [N� de Ocorr�ncias]
FROM Dados
GROUP BY Cidade, Produto;

-- Filtros em agrupamento HAVING
-- Superior a 20.000
SELECT
	Cidade, SUM(total) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade
HAVING SUM(TOTAL) > 20000
ORDER BY 2;-- ORDER BY 2 significa order by SUM(TOTAL) pois foi nossa segunda atribui��o

-- Subtotais com ROLL UP, roll up faz subtotais utilizando a primeira coluna do select

SELECT
	Cidade, SUM(total) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade
WITH ROLLUP-- al�m de ter os totais cidade por cidade, ele soma tudo e coloca numa linha nova

SELECT
	Cidade, Produto, SUM(total) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade, Produto
WITH ROLLUP-- acrescenta uma linha com a somat�ria total por cidade e, no final, acrescenta uma �ltima linha com o total geral

-- Subtotais com CUBE, cube faz subtotais utilizando TODAS as colunas do select

SELECT
	Cidade, Produto, SUM(total) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade, Produto
WITH CUBE

-----------------------------------------------------------------

USE SisDep;

-- Agrupamento com jun��es
-- Estamos interessados em saber apenas a quantidade de dependentes, e n�o os nomes dos dependentes
SELECT
	NomeFuncionario,count(*) [N� de Dependentes]
FROM Funcionario AS F INNER JOIN Dependente AS D
ON F.idMatricula = D.idMatricula
GROUP BY NomeFuncionario;