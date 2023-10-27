/*

	NomeFunção([Argumentos])

	GETDATE()

	DAY(Data Referência)

	MONTH(Data Referência)

	YEAR(Data Referência)

	EOMONTH(Data Referência,Quantidade de meses a adicionar)

	DATEFROMPARTS(Ano,Mês,Dia)

	DATEDIFF(Parte Data,Data Inicial,Data Final)

	DATEADD(Parte Data,valor a ser adicionado,Data Referência)

	DATENAME(Data Referência,Parte Data)

	onde Parte Data poderá ser:

		> YEAR		YYYY
		> QUARTER	Q
		> MONTH		M
		> WEEK		WW
		> DAY		D

*/

SELECT GETDATE();-- Data e hora do servidor

USE SisDep;

-- Dia, Mês e Ano
SELECT
	NomeFuncionario, Admissao,
	DAY(Admissao) AS [Dia],
	MONTH(Admissao) AS [Mes],
	YEAR(Admissao) AS [Ano]
FROM Funcionario;

-- Retornar admitidos na 1ª quinzena de qualquer do 2º semestre dos seguintes anos (2000, 2003, 2005, 2008 e 2010)

SELECT
	NomeFuncionario, Admissao,
	DAY(Admissao) AS [Dia],
	MONTH(Admissao) AS [Mes],
	YEAR(Admissao) AS [Ano]
FROM Funcionario
WHERE
	DAY(Admissao) <= 15 AND MONTH(Admissao) >= 7 AND
	YEAR(Admissao) IN(2000,2003,2005,2008,2010)
ORDER BY Ano;

SELECT EOMONTH(GETDATE(),0);-- Último dia do mês atual

SELECT EOMONTH(GETDATE(),1);-- Último dia do mês atual + 1, no caso nosso mês atual é outubro, portanto mostrará o último dia de novembro

SELECT DATEFROMPARTS(2023,10,27);-- Função útil para quando precisamos passar a data de forma separada e não inteira

SELECT DATEDIFF(DAY,'1996/09/24',GETDATE()) AS [Dias de vida];-- Subtração da data indicada(no caso minha data de nascença, com o dia atual, ou seja, quantos dias de vida eu já vivi

SELECT DATEDIFF(DAY,'1996/09/24',GETDATE()) AS [Dias de vida];
SELECT DATEDIFF(WEEK,'1996/09/24',GETDATE()) AS [Semanas de vida];
SELECT DATEDIFF(MONTH,'1996/09/24',GETDATE()) AS [Meses de vida];
SELECT DATEDIFF(QUARTER,'1996/09/24',GETDATE()) AS [Trimestres de vida];
SELECT DATEDIFF(YEAR,'1996/09/24',GETDATE()) AS [Anos de vida];

SELECT DATEADD(DAY,65,GETDATE()) AS [DIAS];-- Neste caso, estamos pegando a data atual e acrescentando 65 dias e mostrando o dia q será
SELECT DATEADD(WEEK,20,GETDATE()) AS [SEMANAS];
SELECT DATEADD(MONTH,18,GETDATE()) AS [MESES];
SELECT DATEADD(QUARTER,6,GETDATE()) AS [TRIMESTRES];
SELECT DATEADD(YEAR,5,GETDATE()) AS [ANOS];

-- DATENAME pega a coluna específicada e mostra o dia da semana e o mês, porém em inglês
-- O que precisaria ser feito para mostrar em português??

SET LANGUAGE 'BRAZILIAN';-- Alteração temporária para a lingua português, comando de sessão, ou seja, apenas enquanto estiver com a query ativa
-- Após esta alteração, as colunas ficam em português
SELECT
	NomeFuncionario,
	Admissao,
	DATENAME(WEEKDAY,Admissao) AS [Dia da Semana],
	DATENAME(MONTH,Admissao) AS [Mês]
FROM Funcionario;