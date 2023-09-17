USE Concessionaria;

-- visualizar �ndices
EXEC sp_help tblEstoque;
-- chaves prim�rias j� s�o do tipo clustered

-- Criando �ndice
CREATE NONCLUSTERED INDEX IX_tblEstoque
ON tblEstoque(dataEntrada DESC)-- ordem decrescente

EXEC sp_helpindex tblEstoque; -- lista os �ndices da tabela

-- Excluir um �ndice
DROP INDEX IX_tblEstoque
ON tblEstoque; -- ao excluir um �ndex, n�o excluo informa��es da tabela
			   -- apenas o index da mesma