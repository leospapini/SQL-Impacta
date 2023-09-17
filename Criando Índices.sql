USE Concessionaria;

-- visualizar índices
EXEC sp_help tblEstoque;
-- chaves primárias já são do tipo clustered

-- Criando índice
CREATE NONCLUSTERED INDEX IX_tblEstoque
ON tblEstoque(dataEntrada DESC)-- ordem decrescente

EXEC sp_helpindex tblEstoque; -- lista os índices da tabela

-- Excluir um índice
DROP INDEX IX_tblEstoque
ON tblEstoque; -- ao excluir um índex, não excluo informações da tabela
			   -- apenas o index da mesma