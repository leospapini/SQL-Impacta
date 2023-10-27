USE SisDep;

-- Retornar o total geral de salários pagos

SELECT SUM(salario) AS [Salário Total] FROM Funcionario;

-- Retornar a média de salários

SELECT AVG(salario) AS [Média Salarial] FROM Funcionario;

-- Mais de uma agregação num mesmo comando select

SELECT
	MAX(salario) AS [Maior Salário],
	MIN(salario) AS [Menor Salário],
	COUNT(salario) AS [N° de Funcionários]
FROM Funcionario;

USE SysConVendas;
SELECT * FROM Dados;

SELECT COUNT(Vendedor) AS [Contagem Coluna] FROM Dados;-- Neste exemplo, o count não contabiliza os vendedores nulos, portanto de 450 linhas, vai pra 445
SELECT COUNT(Pedido) AS [Contagem Coluna] FROM Dados;-- Neste exemplo, não possuímos pedidos nulos, portanto o resultado é 450
SELECT COUNT(*) AS [Contagem Linha] FROM Dados;-- Quando colocamos um * no count, ele conta as linhas, não leva em consideração se está ou não nulo