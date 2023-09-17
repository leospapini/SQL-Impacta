/*
	Criando um banco de dados
	Autor: Leonardo Papini
	21/08/2023

*/

-- Banco via T-SQL

CREATE DATABASE DptPessoal;

-- Colocando em uso
USE DptPessoal; -- Conecta com o banco desejado

-- Excluir banco (muito raramente utilizado)
DROP DATABASE DptPessoal; -- *banco n�o pode estar em uso, obrigat�rio mudar o diret�rio

-- O mesmo n�o poder� estar em uso
-- Ctrl + R = Exibe a janela de RESULTADOS

SELECT GETDATE() -- data e hora atual do windows