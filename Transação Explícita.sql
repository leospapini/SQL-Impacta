USE SeguroVeiculo;

SELECT * FROM Apolices;

-- Iniciar uma transa��o
BEGIN TRAN

-- Verificar se h� alguma transa��o ativa

SELECT @@TRANCOUNT; -- Retorna 1 caso exista uma transa��o ativa, 0 caso n�o haja transa��o ativa

UPDATE Apolices
SET valorApolice = valorApolice + 1500;

-- Cancelar uma opera��o
ROLLBACK 

-- Ou seja, come�ar uma transa��o expl�cita antes de executar altera��es garante que, caso cometemos algum erro, conseguimos voltar uma opera��o com o ROLLBACK
-- Garantindo a seguran�a da nossa atualiza��o

BEGIN TRAN 
	UPDATE Apolices
	SET valorApolice = valorApolice + 1500
	WHERE nContrato = 1000;

-- Confirmar a opera��o
COMMIT TRAN -- A partir do momento q executarmos o commit, n�o ser� mais poss�vel retornar a transa��o anterior

USE SisDep;

BEGIN TRAN
	UPDATE Funcionario
	SET Salario = Salario * 1.1
	OUTPUT -- com o comando OUTPUT conseguimos visualizar o antes (deleted) e o depois (inserted) da nossa transa��o
		deleted.idMatricula,
		deleted.NomeFuncionario,
		deleted.Salario AS [Sal�rio Anterior],
		inserted.Salario AS [Novo Sal�rio]
	WHERE Salario <= 3000;

-- Tendo certeza q o update foi feito corretamente, realizamos a opera��o do commit para encerrar a transa��o
-- Caso o update foi realizado de maneira incorreta, utilizamos o ROLLBACK

COMMIT