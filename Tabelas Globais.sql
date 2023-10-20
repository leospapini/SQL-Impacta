-- Tabelas globais podem ser visualizadas dentro de qualquer query do nosso servidor

SELECT *
INTO ##Pesquisa2
FROM Dados
WHERE Regiao = 'Sudeste';-- criando tabela global com todas as informa��es dentro da tabela dados onde a regi�o � IGUAL a sudeste

SELECT * FROM ##Pesquisa2;

SELECT * FROM #Pesquisa1;-- n�o conseguimos visualizar a tabela Pesquisa1 pois ela foi criada em outra query local

-- Tabelas Globais permanecem ativas at� o encerramento do servidor management studio, enquanto locais ao fechar a query local, perdem a conex�o