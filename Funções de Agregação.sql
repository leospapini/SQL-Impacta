USE SisDep;

-- Retornar o total geral de sal�rios pagos

SELECT SUM(salario) AS [Sal�rio Total] FROM Funcionario;

-- Retornar a m�dia de sal�rios

SELECT AVG(salario) AS [M�dia Salarial] FROM Funcionario;

-- Mais de uma agrega��o num mesmo comando select

SELECT
	MAX(salario) AS [Maior Sal�rio],
	MIN(salario) AS [Menor Sal�rio],
	COUNT(salario) AS [N� de Funcion�rios]
FROM Funcionario;

USE SysConVendas;
SELECT * FROM Dados;

SELECT COUNT(Vendedor) AS [Contagem Coluna] FROM Dados;-- Neste exemplo, o count n�o contabiliza os vendedores nulos, portanto de 450 linhas, vai pra 445
SELECT COUNT(Pedido) AS [Contagem Coluna] FROM Dados;-- Neste exemplo, n�o possu�mos pedidos nulos, portanto o resultado � 450
SELECT COUNT(*) AS [Contagem Linha] FROM Dados;-- Quando colocamos um * no count, ele conta as linhas, n�o leva em considera��o se est� ou n�o nulo