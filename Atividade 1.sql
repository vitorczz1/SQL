create database ST767B
go

use ST767b
go

create table Produto(
  ID_produto int identity (1,1) primary key not null,
  Nome varchar (35),
  Fornecedor varchar (25),
  Quantidade int,
  Marca varchar (15),
  Tamanho real,
  Cor varchar (10),
  Tipo varchar (15),
  Preco money,
  Garantia bit
);
go

create table Pessoa(
  ID_pessoa int identity (1,1) primary key not null,
  Nome varchar (35),
  RG varchar (10),
  CPF varchar (10),
  CEP char (8),
  Rua varchar (35),
  Bairro varchar (20),
  Cidade varchar (15),
  Estado varchar (15),
  Pais varchar (10),
  Numero_casa int,
  Complemento varchar (10),
  Data_nascimento date,
  Telefone varchar (15),
  Celular varchar (15),
  Email varchar (20),
  Sexo varchar (10)
);
go

create table Cliente(
  ID_cliente int identity (1,1) primary key not null,
  ID_pessoa int foreign key references pessoa(ID_pessoa),
  Data_cadastro date, /* automático*/
  Qtd_compras int
);
go

create table Fornecedor(
  ID_fornecedor int identity (1,1) primary key not null,
  ID_pessoa int foreign key references pessoa(ID_pessoa),
  Produto_oferecido varchar (15),
  Valor_produto money,
  Qtd_produto int,
  CNPJ varchar (15)
);
go

create table Funcionario(
  ID_funcionario int identity (1,1) primary key not null,
  ID_pessoa int foreign key references pessoa(ID_pessoa),
  Salario money,
  Data_Contrato date,
  Departamento varchar (15),
  CTPS varchar (10),
  Matricula varchar (10)
);
go

create table Login(
  ID_login int identity (1,1) primary key not null,
  ID_funcionario int foreign key references funcionario(ID_funcionario),
  Tipo_usuario varchar (15),
  Usuario varchar (35),
  Senha varchar (20),
);
go

create table Notificacao(
  ID_cliente int foreign key references cliente(ID_cliente),
  Data_notificacao date,
  Hora time,
  Categoria varchar (15),
  Valor_desconto money
);
go

create table Venda_produto(
  ID_venda int identity (1,1) primary key not null,
  ID_funcionario int foreign key references funcionario(ID_funcionario),
  ID_produto int foreign key references produto(ID_produto),
  Data_venda date,
  Hora time,
  Qtd_vendida bigint
);
go

create table Transacoes_monetarias(
  ID_venda int foreign key references venda_produto(ID_venda),
  Data_transacoes date,
  Qtd_transacoes int,
  Forma_pagamento varchar (10),
  Valor_transacao money,
  Comprador varchar (15),
  Vendas_funcionario int,
  Qtd_parcelamentos int,
  Valor_parcelas money,
  Qtd_parcelas int,
  Total bigint
);
go

create table Relatorio_financeiro(
  ID_venda int foreign key references venda_produto(ID_venda),
  Data_emissao date,
  Faturamento_mensal money,
  Faturamento_diario money,
  Receita_mensal money,
  Receita_diaria money,
  Despesas money,
  Lucros money,
  Calculo_impostos money
);
go

create table Alerta_produto(
  ID_produto int foreign key references produto(ID_produto),
  ID_venda int foreign key references venda_produto(ID_venda),
  Status_produto varchar (15)
);
go
