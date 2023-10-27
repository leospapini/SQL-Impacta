/*

	NomeFunção([Argumentos])

	CAST(Valor Referência AS Tipo de Dado)

	CONVERT(Tipo de Dado,Valor Referência,Estilo)

	Onde Estilo será aplicado para datas e possui códigos de 1 a 14 (Ano Sem Século)

	e 101 1 114 (Ano Com Século)

	FORMAT(Valor Referência,Formato,Cultura/País)

	EX:

	Format(Campo Monetário,'C','en-us')
	Format(Campo Monetário,'C','pt-br')

	Format(Campo Data,'d','pt-br')
	Format(Campo Data,'D','pt-br')
	Format(Campo Data,'dd - mm - yyyy','pt-br')

*/


USE SisDep;

-- Conversão em tempo de execução, não alterará a tabela em si
SELECT
	NomeFuncionario,
	CAST(Admissao AS DATE) AS [Admissão]-- campo formato datetime com a hora não informada, ou seja, apresenta 00h00m00s, utilizando o CAST, estamos convertendo o campo datetime, para campo date, ou seja, mostrará apenas o DIA
FROM Funcionario;

EXEC sp_help Funcionario;

SELECT 'Média Final: ' + CAST(6.5 AS VARCHAR) [Média];-- Concatenando um tipo string com um tipo float alterando o tipo float temporáriamente para varchar

-- Convert convertendo datetime para varchar nos padrões 1, 2, 3 e 101, 102 e 103
SELECT
	NomeFuncionario,
	CONVERT(VARCHAR,Admissao,1) AS [Código 1],
	CONVERT(VARCHAR,Admissao,2) AS [Código 2],
	CONVERT(VARCHAR,Admissao,3) AS [Código 3],
	CONVERT(VARCHAR,Admissao,101) AS [Código 101],
	CONVERT(VARCHAR,Admissao,102) AS [Código 102],
	CONVERT(VARCHAR,Admissao,103) AS [Código 103]
FROM Funcionario;

SELECT 
	NomeFuncionario,
	FORMAT(Salario,'C','EN-US') AS [Formato Dólar],-- Formatando uma coluna money para C(currency) no formato dólar
	FORMAT(Salario,'C','PT-BR') AS [Formato Real],-- Formatando uma coluna money para C(currency) no formato real
	FORMAT(Admissao,'d','PT-BR') AS [Formato Data 1],-- Formatando uma coluna datetime para d minúsculo no formato de data dia/mes/ano
	FORMAT(Admissao,'D','PT-BR') AS [Formato Data 2],-- Formatando uma coluna datetime para D maiúsculo no formato de data dia por extenso, dia de mes de ano
	FORMAT(Admissao,'dd - mm - yyyy','PT-BR') AS [Formato Data 3]-- Formatando uma coluna datetime para um formato personalizado
FROM Funcionario;