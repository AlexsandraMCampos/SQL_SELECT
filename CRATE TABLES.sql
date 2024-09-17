CREATE TABLE dim_clientes (
    codigoCliente VARCHAR(5) PRIMARY KEY,
    nomeDaEmpresa VARCHAR(40) NOT NULL,
    nomeDoContato VARCHAR(30) NULL,
    cargoContato VARCHAR(30),
    endereco VARCHAR(60),
    cidade VARCHAR(15),
    regiao VARCHAR(15),
    cep VARCHAR(15),
    pais VARCHAR(15),
    telefone VARCHAR(24),
    fax VARCHAR(24)
);


CREATE TABLE dim_Funcionarios(
	CodigoDoFuncionario 	INT	 			PRIMARY KEY,
	Sobrenome 				VARCHAR(20) 	NOT NULL,
	Nome 					VARCHAR(10) 	NOT NULL,
	Cargo 					VARCHAR(30) 	NULL,
	Tratamento 				VARCHAR(25) 	NULL,
	DataDeNascimento 		DATE	 		NULL,
	DataDeContratacao 		DATE			NULL,
	Endereco 				VARCHAR(60) 	NULL,
	Cidade 					VARCHAR(15) 	NULL,
	Regiao 					VARCHAR(15) 	NULL,
	CEP 					VARCHAR(10) 	NULL,
	Pais 					VARCHAR(15) 	NULL,
	TelefoneResidencial 	VARCHAR(24) 	NULL,
	Ramal 					VARCHAR(4) 		NULL,
	Observacoes 			VARCHAR(2000) 	NULL
);


CREATE TABLE dim_Fornecedores(
	CodigoDoFornecedor 			INT 		PRIMARY KEY,
	NomeDaEmpresa 				VARCHAR(40) 	NOT NULL,
	NomeDoContato 				VARCHAR(30) 	NULL,
	CargoDoContato 				VARCHAR(30) 	NULL,
	Endereco 					VARCHAR(60) 	NULL,
	Cidade 						VARCHAR(15) 	NULL,
	Regiao 						VARCHAR(15) 	NULL,
	CEP 						VARCHAR(10) 	NULL,
	Pais 						VARCHAR(15) 	NULL,
	Telefone 					VARCHAR(24) 	NULL,
	Fax 						VARCHAR(24) 	NULL
);

CREATE TABLE dim_Categorias(
	CodigoDaCategoria 		INT				NOT NULL	PRIMARY KEY,
	NomeDaCategoria 		VARCHAR(15) 	NOT NULL,
	Descricao 				VARCHAR(2000) 	NULL
);

CREATE TABLE dim_Transportadoras(
	CodigoDaTransportadora 	INT 			NOT NULL	PRIMARY KEY,
	NomeDaEmpresa 			VARCHAR(40) 	NOT NULL,
	Telefone 				VARCHAR(24) 	NULL
);


CREATE TABLE dim_Produtos(
	CodigoDoProduto 			INT 			PRIMARY KEY,
	NomeDoProduto 				VARCHAR(40)		NOT NULL,
	CodigoDoFornecedor 			INT,
	CodigoDaCategoria 			INT,
	QuantidadePorUnidade 		VARCHAR(25),
	PrecoUnitario 				DECIMAL(5,2),
	UnidadesEmEstoque 			INT,
	UnidadesPedidas 			INT,
	NivelDeReposicao 			INT,
	Descontinuado 				BIT,
  
  	FOREIGN KEY (CodigoDoFornecedor) REFERENCES dim_Fornecedores (codigodofornecedor),
  	FOREIGN KEY (CodigoDaCategoria) REFERENCES dim_Categorias(codigodacategoria)
  
);


CREATE TABLE fact_Pedidos(
	NumeroDoPedido 			INT	 			NOT NULL	PRIMARY KEY,
	CodigoDoCliente 		VARCHAR(5) 		NULL,
	CodigoDoFuncionario 	INT		 		NULL,
	DataDoPedido 			DATE	 		NULL,
	DataDeEntrega 			DATE	 		NULL,
	DataDeEnvio 			DATE	 		NULL,
	CodigoDaTransportadora	INT	 			NULL,
	Frete 					MONEY 			NULL,
	NomeDoDestinatario 		VARCHAR(40)		NULL,
	EndereçoDoDestinatario 	VARCHAR(60) 	NULL,
	CidadeDeDestino 		VARCHAR(15) 	NULL,
	RegiaoDeDestino 		VARCHAR(15) 	NULL,
	CEPdeDestino 			VARCHAR(10) 	NULL,
	PaisDeDestino 			VARCHAR(15) 	NULL,
  
  	FOREIGN KEY (CodigoDoCliente) REFERENCES dim_clientes(codigocliente),
  	FOREIGN key (CodigoDoFuncionario) REFERENCES dim_Funcionarios(codigodofuncionario),
  	FOREIGN key (CodigoDaTransportadora) REFERENCES dim_Transportadoras(codigodatransportadora)
);

CREATE TABLE dim_DetalhesPedidos(
	
  	NumeroDoPedido 			INT	 				NOT NULL,
	CodigoDoProduto 		INT	 				NOT NULL,
	PrecoUnitario 			Decimal(5,2) 		NOT NULL,
	Quantidade 				INT 				NOT NULL,
	Desconto 				Float 				NOT NULL,
  
  	FOREIGN KEY (NumeroDoPedido) REFERENCES fact_Pedidos(numerodopedido),
  	FOREIGN key (CodigoDoProduto) REFERENCES dim_Produtos(codigodoproduto)
);


