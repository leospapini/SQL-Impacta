USE Concessionaria;

-- Tabelas
CREATE TABLE tblMarcas
(							--identity = código auto gerado inicia em 1
	idMarca			int			identity		primary key,
	nomeMarca		nchar(10)	not null		unique --unique = dados únicos, uma vez guardados, só serão acrescentados mas nunca excluídos
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
	Constraint FK_tblModelos_tblMarcas_idMarca --Constraint está sendo utilizado para alterar o nome da referência da chave estrangêira idMarca
	Foreign Key (idMarca)
	References tblMarcas(idMarca),

	nomeModelo		nchar(30)		not null
	Constraint UQ_tblModelos_nomeModelo
	Unique (nomeModelo)
);

--Se não utilizarmos o Constraint igual no exemplo do idMarcas, o próprio servidor criará um nome para aquela restrição, o que não é nada amigável
--Para nosso código e entendimento

EXEC sp_help tblModelos;