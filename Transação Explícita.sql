USE SeguroVeiculo;

SELECT * FROM Apolices;

-- Iniciar uma transação
BEGIN TRAN

-- Verificar se há alguma transação ativa

SELECT @@TRANCOUNT; -- Retorna 1 caso exista uma transação ativa, 0 caso não haja transação ativa

UPDATE Apolices
SET valorApolice = valorApolice + 1500;

-- Cancelar uma operação
ROLLBACK 

-- Ou seja, começar uma transação explícita antes de executar alterações garante que, caso cometemos algum erro, conseguimos voltar uma operação com o ROLLBACK
-- Garantindo a segurança da nossa atualização

BEGIN TRAN 
	UPDATE Apolices
	SET valorApolice = valorApolice + 1500
	WHERE nContrato = 1000;

-- Confirmar a operação
COMMIT TRAN -- A partir do momento q executarmos o commit, não será mais possível retornar a transação anterior

USE SisDep;

BEGIN TRAN
	UPDATE Funcionario
	SET Salario = Salario * 1.1
	OUTPUT -- com o comando OUTPUT conseguimos visualizar o antes (deleted) e o depois (inserted) da nossa transação
		deleted.idMatricula,
		deleted.NomeFuncionario,
		deleted.Salario AS [Salário Anterior],
		inserted.Salario AS [Novo Salário]
	WHERE Salario <= 3000;

-- Tendo certeza q o update foi feito corretamente, realizamos a operação do commit para encerrar a transação
-- Caso o update foi realizado de maneira incorreta, utilizamos o ROLLBACK

COMMIT