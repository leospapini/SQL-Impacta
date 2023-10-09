USE Clientes;

SELECT * FROM Clientes2016;
SELECT * FROM Clientes2017;


-- Clientes Mantidos
SELECT nomeCliente FROM Clientes2016
INTERSECT
SELECT nomeCliente FROM Clientes2017; -- Clientes q já estavam na base de 2016 e permaneceram na base de 2017, já vem ordenado


-- Clientes que recindiram contrato, ou seja, estavam em 2016 e não permaneceram em 2017
SELECT nomeCliente FROM Clientes2016
EXCEPT
SELECT nomeCliente FROM Clientes2017;


-- Novos Clientes, ou seja, não estavam em 2016 mas surgiram em 2017
SELECT nomeCliente FROM Clientes2017
EXCEPT
SELECT nomeCliente FROM Clientes2016;