-- Fun��es Built-In s�o do pr�prio gerenciamento de banco de dados, no caso, SQL Server

/*

	NomeFun��o([Argumentos])

	LEN(Texto Pesquisado)

	LEFT(Texto Pesquisado,N� de caracteres)

	RIGHT(Texto Pesquisado,N� de caracteres)

	REPLACE(Texto Pesquisado,Texto Localizado,Texto Substitui��o)

	CHARINDEX(Texto Pesquisado,Texto Localizado,Posi��o Inicial)

	SUBSTRING(Texto Pesquisado,Posi��o Inicial,N� de Caracteres)

	RTRIM(Texto Pesquisado)

	LTRIM(Texto Pesquisado)

	UPPER(Texto Pesquisado)

	LOWER(Texto Pesquisado)

	REPLICATE(Texto a Repetir,Quantidade de Vezes)

	REVERSE(Texto a ser Invertido)
	
	STRING_SPLIT(Texto a ser separado,Caractere delimitador)

*/

USE SisDep;

SELECT
	NomeFuncionario,
	LEN(NomeFuncionario) AS [N� de Caracteres],-- Quantidade de caracteres q tem o nome do funcion�rio
	idMatricula,
	LEFT(idMatricula,2) AS [Esquerda],-- Duas primeiras posi��es a esquerda da coluna pesquisa(idMatricula)
	RIGHT(idMatricula,1) AS [Direita],-- primeira posi��o a direita da coluna pesquisa(idMatricula)
	REPLACE(idMatricula, '10', '20') AS [Substituir],-- replace, como o nome mesmo ja diz, troca alguma informa��o dentro de um campo, neste caso, o 10 dentro de idMatricula para 20, somente visual
	CHARINDEX('silva', NomeFuncionario,1) AS [Localizar],-- Localizando a palavra 'silva', no nomeFuncionario, a partir da posi��o 1
	SUBSTRING(NomeFuncionario,1,CHARINDEX(' ',NomeFuncionario,1)-1) AS [Primeiro Nome]-- Pegando o nomeFuncionario, a partir da posi��o 1 at� a posi��o 10 aonde, se o charindex encontrar um espa�o ' ', ele vai parar no espa�o
FROM Funcionario;


-- Fun��es para extra��o de espa�os a direita(RTRIM), a esquerda(LTRIM) e a direita e a esquerda
SELECT RTRIM('Impacta     ');

SELECT LTRIM('     Impacta');

SELECT RTRIM(LTRIM('     Impacta     '));

-- Mai�scula e min�scula

SELECT
	UPPER(NomeFuncionario) AS [Mai�scula],
	LOWER(NomeFuncionario) AS [Min�scula]
FROM Funcionario;

SELECT REPLICATE('*',10);-- string de repeti��o, replica uma string um determinado n�mero de vezes

SELECT REVERSE('IMPACTA');-- revers�o de texto
--utilidade para o reverse
SELECT REVERSE(SUBSTRING(REVERSE('Fun��es Built-In.sql'),5,255));-- Aqui estamos dando um reverse na string, descobrindo q a extens�o fica nas 4 primeiras posi��es, dps revertendo a revers�o e retirando tudo dps da 5 posi��o

SELECT
	idMatricula,
	NomeFuncionario,
	CONCAT(idMatricula,idDepartamento,idCargo) AS [Concatenar],
	idDepartamento,
	idCargo
FROM Funcionario-- Aqui estamos concatenando o idMatricula com idDepartamento e idCargo numa mesma linha