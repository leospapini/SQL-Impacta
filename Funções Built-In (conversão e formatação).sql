/*

	NomeFun��o([Argumentos])

	CAST(Valor Refer�ncia AS Tipo de Dado)

	CONVERT(Tipo de Dado,Valor Refer�ncia,Estilo)

	Onde Estilo ser� aplicado para datas e possui c�digos de 1 a 14 (Ano Sem S�culo)

	e 101 1 114 (Ano Com S�culo)

	FORMAT(Valor Refer�ncia,Formato,Cultura/Pa�s)

	EX:

	Format(Campo Monet�rio,'C','en-us')
	Format(Campo Monet�rio,'C','pt-br')

	Format(Campo Data,'d','pt-br')
	Format(Campo Data,'D','pt-br')
	Format(Campo Data,'dd - mm - yyyy','pt-br')

*/


USE SisDep;

-- Convers�o em tempo de execu��o, n�o alterar� a tabela em si
SELECT
	NomeFuncionario,
	CAST(Admissao AS DATE) AS [Admiss�o]-- campo formato datetime com a hora n�o informada, ou seja, apresenta 00h00m00s, utilizando o CAST, estamos convertendo o campo datetime, para campo date, ou seja, mostrar� apenas o DIA
FROM Funcionario;

EXEC sp_help Funcionario;

SELECT 'M�dia Final: ' + CAST(6.5 AS VARCHAR) [M�dia];-- Concatenando um tipo string com um tipo float alterando o tipo float tempor�riamente para varchar

-- Convert convertendo datetime para varchar nos padr�es 1, 2, 3 e 101, 102 e 103
SELECT
	NomeFuncionario,
	CONVERT(VARCHAR,Admissao,1) AS [C�digo 1],
	CONVERT(VARCHAR,Admissao,2) AS [C�digo 2],
	CONVERT(VARCHAR,Admissao,3) AS [C�digo 3],
	CONVERT(VARCHAR,Admissao,101) AS [C�digo 101],
	CONVERT(VARCHAR,Admissao,102) AS [C�digo 102],
	CONVERT(VARCHAR,Admissao,103) AS [C�digo 103]
FROM Funcionario;

SELECT 
	NomeFuncionario,
	FORMAT(Salario,'C','EN-US') AS [Formato D�lar],-- Formatando uma coluna money para C(currency) no formato d�lar
	FORMAT(Salario,'C','PT-BR') AS [Formato Real],-- Formatando uma coluna money para C(currency) no formato real
	FORMAT(Admissao,'d','PT-BR') AS [Formato Data 1],-- Formatando uma coluna datetime para d min�sculo no formato de data dia/mes/ano
	FORMAT(Admissao,'D','PT-BR') AS [Formato Data 2],-- Formatando uma coluna datetime para D mai�sculo no formato de data dia por extenso, dia de mes de ano
	FORMAT(Admissao,'dd - mm - yyyy','PT-BR') AS [Formato Data 3]-- Formatando uma coluna datetime para um formato personalizado
FROM Funcionario;