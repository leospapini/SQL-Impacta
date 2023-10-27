-- Funções Built-In são do próprio gerenciamento de banco de dados, no caso, SQL Server

/*

	NomeFunção([Argumentos])

	LEN(Texto Pesquisado)

	LEFT(Texto Pesquisado,Nº de caracteres)

	RIGHT(Texto Pesquisado,Nº de caracteres)

	REPLACE(Texto Pesquisado,Texto Localizado,Texto Substituição)

	CHARINDEX(Texto Pesquisado,Texto Localizado,Posição Inicial)

	SUBSTRING(Texto Pesquisado,Posição Inicial,Nº de Caracteres)

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
	LEN(NomeFuncionario) AS [N° de Caracteres],-- Quantidade de caracteres q tem o nome do funcionário
	idMatricula,
	LEFT(idMatricula,2) AS [Esquerda],-- Duas primeiras posições a esquerda da coluna pesquisa(idMatricula)
	RIGHT(idMatricula,1) AS [Direita],-- primeira posição a direita da coluna pesquisa(idMatricula)
	REPLACE(idMatricula, '10', '20') AS [Substituir],-- replace, como o nome mesmo ja diz, troca alguma informação dentro de um campo, neste caso, o 10 dentro de idMatricula para 20, somente visual
	CHARINDEX('silva', NomeFuncionario,1) AS [Localizar],-- Localizando a palavra 'silva', no nomeFuncionario, a partir da posição 1
	SUBSTRING(NomeFuncionario,1,CHARINDEX(' ',NomeFuncionario,1)-1) AS [Primeiro Nome]-- Pegando o nomeFuncionario, a partir da posição 1 até a posição 10 aonde, se o charindex encontrar um espaço ' ', ele vai parar no espaço
FROM Funcionario;


-- Funções para extração de espaços a direita(RTRIM), a esquerda(LTRIM) e a direita e a esquerda
SELECT RTRIM('Impacta     ');

SELECT LTRIM('     Impacta');

SELECT RTRIM(LTRIM('     Impacta     '));

-- Maiúscula e minúscula

SELECT
	UPPER(NomeFuncionario) AS [Maiúscula],
	LOWER(NomeFuncionario) AS [Minúscula]
FROM Funcionario;

SELECT REPLICATE('*',10);-- string de repetição, replica uma string um determinado número de vezes

SELECT REVERSE('IMPACTA');-- reversão de texto
--utilidade para o reverse
SELECT REVERSE(SUBSTRING(REVERSE('Funções Built-In.sql'),5,255));-- Aqui estamos dando um reverse na string, descobrindo q a extensão fica nas 4 primeiras posições, dps revertendo a reversão e retirando tudo dps da 5 posição

SELECT
	idMatricula,
	NomeFuncionario,
	CONCAT(idMatricula,idDepartamento,idCargo) AS [Concatenar],
	idDepartamento,
	idCargo
FROM Funcionario-- Aqui estamos concatenando o idMatricula com idDepartamento e idCargo numa mesma linha