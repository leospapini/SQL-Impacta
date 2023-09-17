USE Concessionaria;

-- identity significa q o c�digo ser� passado automaticamente
-- mas precisamos inserir o nome da marca
EXEC sp_help tblMarcas

-- Insert posicional
INSERT INTO tblMarcas
VALUES('FIAT');-- se tentarmos colocar outro nome igual, dar� um erro
		       -- por conta da constraint UNIQUE, ou seja, n�o podemos ter
			   -- duas informa��es iguais na mesma coluna

-- Inser��o de v�rias linhas
INSERT INTO tblMarcas
VALUES
('FORD'),('CHEVROLET'),('VOLKSWAGEN'),('HONDA');

-- Visualizar dados
SELECT * FROM tblMarcas;-- uma tabela com unique, ordena por unique
                        -- ou seja, por ordem alfab�tica


-- Insert Declarativo
INSERT INTO tblModelos
(idMarca, nomeModelo) -- declarando antes de passar os valores
VALUES
(4, 'Onix'),(1, 'Uno'),(3, 'Eco Sport');-- 4, 'Onix', id 4 = volks, modelo Onix

SELECT * FROM tblModelos;

INSERT INTO tblEstoque
(idModelo, dataEntrada, precoEstoque, placa)
VALUES
(1, '2017-01-05', 45000, 'FGY4568');

SELECT * FROM tblEstoque;