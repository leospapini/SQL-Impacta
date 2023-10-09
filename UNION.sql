USE Clientes;

-- Todos os comandos SELECT deverão ter o mesmo número de colunas
-- Todas as colunas unificadas deverão ter o mesmo tipo de dado
-- mesmo tipo de dado, tamanho, posição

SELECT * FROM Clientes2016
UNION
SELECT * FROM Clientes2017;

SELECT * FROM Clientes2016
UNION
SELECT * FROM Clientes2017
ORDER BY nomeCliente; -- Union sem o ALL exclui numeros repetidos


-- Diferenciando 2016 e 2017
SELECT 'Cliente 2016' AS Ano, * FROM Clientes2016
UNION
SELECT 'Cliente 2017', * FROM Clientes2017
ORDER BY nomeCliente;

-- Union ALL
SELECT * FROM Clientes2016
UNION ALL
SELECT * FROM Clientes2017
ORDER BY nomeCliente; -- Union com o ALL mostra até os valores repetidos, visualizado no idCliente 2790

-- Union com filtros
SELECT * FROM Clientes2016
WHERE nomeCidade = 'São Paulo'
UNION 
SELECT * FROM Clientes2017
WHERE nomeCidade = 'Rio de Janeiro'
ORDER BY nomeCliente