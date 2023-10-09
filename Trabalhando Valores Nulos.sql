USE SysConVendas;

SELECT * FROM Dados

BEGIN TRAN
	UPDATE Dados
	SET Vendedor = NULL
	WHERE Pedido IN(21820, 21872, 21924, 21963, 22080)
COMMIT

-- Função ISNULL
SELECT 
	Pedido, ISNULL(Vendedor, 'Sem Informação') AS Vendedor, Produto, Total
FROM Dados; -- Usamos ISNULL para tratar o nulo


-- Filtrar Nulos e não Nulos

SELECT 
	Pedido, Vendedor, Produto, Total
FROM Dados
WHERE Vendedor IS NULL; -- mostra apenas os valores nulos dentro de vendedor

SELECT 
	Pedido, Vendedor, Produto, Total
FROM Dados
WHERE Vendedor IS NOT NULL; -- mostra todos menos os valores nulos dentro de vendedor

-- COALESCE
CREATE TABLE Cotacao
(
	codigo		int				identity,
	produto		varchar(50)		not null,
	cotacao1	money			null,
	cotacao2	money			null,
	cotacao3	money			null
)

INSERT INTO Cotacao
VALUES
('Mouse', NULL, 25, NULL),
('Impressora', 200, NULL, 350),
('Monitor', NULL, NULL, 500),
('HD Externo', NULL, NULL, NULL);

SELECT * FROM Cotacao;

SELECT
	produto,
	COALESCE(cotacao1,cotacao2,cotacao3,0) AS Cotação 
FROM Cotacao;
-- Coalesce traz o primeiro valor não nulo do campo especificado, caso não haja nenhum valor q não seja nulo, retorna o 0 conforme especificado no ultimo parâmetro

SELECT * FROM Cotacao
WHERE COALESCE(cotacao1,cotacao2,cotacao3,0) = 0; -- verificamos rapidamente qual dos produtos não teve nenhum valor em nenhuma das cotações