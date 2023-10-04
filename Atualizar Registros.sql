USE SisDep;

-- Bonus de 100$ para todos os funcionários

UPDATE Funcionario
SET Salario = Salario + 100;

-- Reajuste de 10% para todos os funcionários
UPDATE Funcionario

-- SET Salario = Salario * 0.1 + Salario
-- SET Salario = Salario * 1.1
-- Operador Composto
SET Salario *= 1.1;

-- Atualização de mais de 1 coluna simultâneamente
-- Com aplicação de filtros

UPDATE Funcionario
SET Salario = Salario * 1.05, idCargo = 2
WHERE idMatricula = 1000;

SELECT * FROM Funcionario;

