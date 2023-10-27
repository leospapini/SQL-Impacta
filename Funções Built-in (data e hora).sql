/*

	NomeFun��o([Argumentos])

	GETDATE()

	DAY(Data Refer�ncia)

	MONTH(Data Refer�ncia)

	YEAR(Data Refer�ncia)

	EOMONTH(Data Refer�ncia,Quantidade de meses a adicionar)

	DATEFROMPARTS(Ano,M�s,Dia)

	DATEDIFF(Parte Data,Data Inicial,Data Final)

	DATEADD(Parte Data,valor a ser adicionado,Data Refer�ncia)

	DATENAME(Data Refer�ncia,Parte Data)

	onde Parte Data poder� ser:

		> YEAR		YYYY
		> QUARTER	Q
		> MONTH		M
		> WEEK		WW
		> DAY		D

*/

SELECT GETDATE();-- Data e hora do servidor

USE SisDep;

-- Dia, M�s e Ano
SELECT
	NomeFuncionario, Admissao,
	DAY(Admissao) AS [Dia],
	MONTH(Admissao) AS [Mes],
	YEAR(Admissao) AS [Ano]
FROM Funcionario;

-- Retornar admitidos na 1� quinzena de qualquer do 2� semestre dos seguintes anos (2000, 2003, 2005, 2008 e 2010)

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

SELECT EOMONTH(GETDATE(),0);-- �ltimo dia do m�s atual

SELECT EOMONTH(GETDATE(),1);-- �ltimo dia do m�s atual + 1, no caso nosso m�s atual � outubro, portanto mostrar� o �ltimo dia de novembro

SELECT DATEFROMPARTS(2023,10,27);-- Fun��o �til para quando precisamos passar a data de forma separada e n�o inteira

SELECT DATEDIFF(DAY,'1996/09/24',GETDATE()) AS [Dias de vida];-- Subtra��o da data indicada(no caso minha data de nascen�a, com o dia atual, ou seja, quantos dias de vida eu j� vivi

SELECT DATEDIFF(DAY,'1996/09/24',GETDATE()) AS [Dias de vida];
SELECT DATEDIFF(WEEK,'1996/09/24',GETDATE()) AS [Semanas de vida];
SELECT DATEDIFF(MONTH,'1996/09/24',GETDATE()) AS [Meses de vida];
SELECT DATEDIFF(QUARTER,'1996/09/24',GETDATE()) AS [Trimestres de vida];
SELECT DATEDIFF(YEAR,'1996/09/24',GETDATE()) AS [Anos de vida];

SELECT DATEADD(DAY,65,GETDATE()) AS [DIAS];-- Neste caso, estamos pegando a data atual e acrescentando 65 dias e mostrando o dia q ser�
SELECT DATEADD(WEEK,20,GETDATE()) AS [SEMANAS];
SELECT DATEADD(MONTH,18,GETDATE()) AS [MESES];
SELECT DATEADD(QUARTER,6,GETDATE()) AS [TRIMESTRES];
SELECT DATEADD(YEAR,5,GETDATE()) AS [ANOS];

-- DATENAME pega a coluna espec�ficada e mostra o dia da semana e o m�s, por�m em ingl�s
-- O que precisaria ser feito para mostrar em portugu�s??

SET LANGUAGE 'BRAZILIAN';-- Altera��o tempor�ria para a lingua portugu�s, comando de sess�o, ou seja, apenas enquanto estiver com a query ativa
-- Ap�s esta altera��o, as colunas ficam em portugu�s
SELECT
	NomeFuncionario,
	Admissao,
	DATENAME(WEEKDAY,Admissao) AS [Dia da Semana],
	DATENAME(MONTH,Admissao) AS [M�s]
FROM Funcionario;