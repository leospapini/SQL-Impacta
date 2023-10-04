CREATE DATABASE Pedidos_Venda;
USE Pedidos_Venda;

CREATE TABLE tb_Produto
(
	idProduto		int			identity		primary key,
	nProduto		varchar(20),
	idUMedida		int,
	idCategoria		int,
	qEstoque		numeric,
	qMinima			numeric,
	pCusto			numeric,
	pVenda			numeric,
	cTecnicas		varchar(max),
	Fotografia		varbinary(max)
)

CREATE TABLE tb_Unidade
(
	idUnidade		int			identity		primary key,
	nUnidade		varchar(20)
)

INSERT INTO tb_Unidade (nUnidade)
VALUES 
('PE�AS'), ('METROS'), ('QUILOGRAMAS'), ('D�ZIAS'), ('PACOTE'), ('CAIXA');

SELECT * FROM tb_Unidade;

CREATE TABLE tb_Categoria
(
	idCategoria			int			identity		primary key,
	nCategoria			varchar(20)
)

INSERT INTO tb_Categoria (nCategoria)
VALUES
('MOUSE'), ('PEN DRIVE'), ('MONITOR DE VIDEO'), ('TECLADO'), ('CPU'), ('CABO DE REDE');

SELECT * FROM tb_Categoria;

BEGIN TRAN
INSERT INTO tb_Produto (nProduto, idUMedida, idCategoria, qEstoque, qMinima, pCusto, pVenda)
OUTPUT
	inserted.nProduto AS [Produto],
	inserted.idUMedida AS [Unidade],
	inserted.idCategoria AS [Categoria],
	inserted.qEstoque AS [Quantidade],
	inserted.qMinima AS [Quantidade M�nima],
	inserted.pCusto AS [Pre�o Custo],
	inserted.pVenda AS [Pre�o Venda]
VALUES
('Caneta Azul', 1, 1, 150, 40, 0.5, 0.75),
('Caneta Verde', 1, 1, 50, 40, 0.5, 0.75),
('Caneta Vermelha', 1, 1, 80, 35, 0.5, 0.75),
('L�pis', 1, 1, 400, 80, 0.5, 0.8),
('R�gua', 1, 1, 40, 10, 1.0, 1.5);

COMMIT

SELECT * FROM tb_Produto;

		
	
