USE Consorcio;

-- visualizando dados da tabela carteira
SELECT * FROM Carteiras;

-- Excluindo registros
DELETE FROM Carteiras
WHERE Cpf = 74632202244;

DELETE FROM Carteiras
WHERE Uf = 'GO';

USE SisDep;

-- Exclus�o bem sucedida
DELETE FROM Funcionario
WHERE idMatricula = 1001;
-- Funcionario 1001 n�o tem nenhum dependente

-- Exclus�o mal sucedida (ERRO)
DELETE FROM Funcionario
WHERE idMatricula = 1000;
-- J� o funcionario 1000 tem um dependente, portanto ocorre um erro de conflito de constraint

SELECT * FROM Dependente
WHERE idMatricula = 1000;

-- Neste caso, antes de apagar o funcion�rio em si, precisamos apagar os dependentes primeiro

-- Precisamos sempre utilizar a condi��o WHERE antes de excluir algum dado, pois caso n�o utilizemos, iremos excluir a tabela INTEIRA
