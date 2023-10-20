-- Objetos criados no banco de sistema TempDB. Podem ser úteis para armazenar dados na memória RAM e obter uma melhora no desempenho
-- da consulta, ou poderão simplesmente ser objetos de teste para comandos de exclusão e/ou atualização.

-- Tabela Temporária local (CREATE TABLE)
-- Tabelas locais só podem ser visualizadas dentro das queries onde as mesmas foram criadas

CREATE TABLE #Clientes -- criando uma tabela com 1 hashtag(#) realiza a criação de uma tabela LOCAL, ou seja, apenas este computador conectado no servidor terá acesso
(
	codigo		int,
	nomeCliente	varchar(50),
	cadastro	date

)-- fica localizada dentro do system databases tempdb temporary tables

SELECT * FROM #Clientes;

INSERT INTO #Clientes
VALUES
(1, 'Leonardo','2023/10/20'),
(2, 'Lucas','2023/10/19');

----------------------------------------------------------------------------

USE SysConVendas;

SELECT * FROM Dados; -- gravados numa tabela física

SELECT *
INTO #Pesquisa1
FROM Dados;-- seleciona todas as colunas da tabela Dados e será copiado dentro de uma tabela local chamada Pesquisa1

SELECT * FROM #Pesquisa1;-- copia integral da tabela Dados numa tabela local, diminui o custo de leitura em um disco pois utiliza a RAM

-- Filtros

SELECT * FROM #Pesquisa1
WHERE Mes = 'Agosto';

-- Atualizações para fins de teste ou algum cálculo que vai ter q ser armazenado em disco depois

UPDATE #Pesquisa1
SET Vendedor = 'HÉLIO'
WHERE Pedido = 21794;

SELECT * FROM ##Pesquisa2; -- visualizando a tabela Pesquisa2 global q foi criada dentro da query Tabelas Globais