USE Concessionaria;

-- Tabelas
CREATE TABLE tblMarcas
(							--identity = c�digo auto gerado inicia em 1
	idMarca			int			identity		primary key,
	nomeMarca		nchar(10)	not null		unique --unique = dados �nicos, uma vez guardados, s� ser�o acrescentados mas nunca exclu�dos
);


-- Visualizando estrutura de dados

EXEC sp_help tblMarcas;

CREATE TABLE tblModelos
(
	--PK da tabela modelos
	idModelo		int			identity
	Constraint PK_tblModelos_idModelo
	Primary Key (idModelo),
	--FK da tabela marcas sendo integradas na tabela modelos
	idMarca			int			not null
	Constraint FK_tblModelos_tblMarcas_idMarca --Constraint est� sendo utilizado para alterar o nome da refer�ncia da chave estrang�ira idMarca
	Foreign Key (idMarca)
	References tblMarcas(idMarca),

	nomeModelo		nchar(30)		not null
	Constraint UQ_tblModelos_nomeModelo
	Unique (nomeModelo)
);

--Se n�o utilizarmos o Constraint igual no exemplo do idMarcas, o pr�prio servidor criar� um nome para aquela restri��o, o que n�o � nada amig�vel
--Para nosso c�digo e entendimento

EXEC sp_help tblModelos;