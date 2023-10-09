USE SeguroVeiculo;

SELECT * FROM Apolices;

-- Operadores Relacionais
SELECT * FROM Apolices
WHERE valorApolice >= 50000;

-- Operadores L�gicos
SELECT * FROM Apolices
WHERE idSeguradora = 1 OR idSeguradora = 3;

SELECT * FROM Apolices
WHERE idSeguradora = 1 AND valorApolice >= 50000;

SELECT * FROM Apolices
WHERE NOT idCidade = 5; -- Deve se evitar sempre q poss�vel utilizar o operador NOT pois existem maneiras melhores de fazer a mesma coisa

SELECT * FROM Apolices
WHERE valorApolice >= 30000
ORDER BY valorApolice DESC;

-- Operadores Aritm�ticos
SELECT nContrato, valorApolice, valorApolice * 1.1 AS [Reajuste Anual]
FROM Apolices; -- Apenas um c�lculo matem�tico

-- Operadores Compostos
BEGIN TRAN
	UPDATE Apolices
	SET valorApolice *= 1.1
COMMIT