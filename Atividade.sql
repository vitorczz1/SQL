create database ST767B
go

use ST767b
go

create table Produto(
  ID_produto int identity (1,1) primary key not null,
  Nome char (50),
  Fornecedor char (50),
  Quantidade int,
  Marca char (50),
  Tamanho char(50),
  Cor char (50),
  Tipo char (50),
  Preco money,
  Garantia bit
);
go

create table Pessoa(
  ID_pessoa int identity (1,1) primary key not null,
  Nome char (50),
  RG char (50),
  CPF char (50),
  CEP char (50),
  Rua char (50),
  Bairro char (50),
  Cidade char (50),
  Estado char (50),
  Pais char (50),
  Numero_casa int,
  Complemento char (50),
  Data_nascimento date,
  Telefone char (50),
  Celular char (50),
  Email char (50),
  Sexo char (50)
);
go

create table Cliente(
  ID_cliente int identity (1,1) primary key not null,
  ID_pessoa int foreign key references pessoa(ID_pessoa),
  ID_venda int foreign key references venda_produto(ID_venda),
  Data_cadastro date, /* automático*/
  Qtd_compras int
);
go

create table Fornecedor(
  ID_fornecedor int identity (1,1) primary key not null,
  ID_pessoa int foreign key references pessoa(ID_pessoa),
  ID_produto int foreign key references produto(ID_produto),
  Produto_oferecido varchar (50),
  Valor_produto money,
  Qtd_produto int,
  CNPJ varchar (50)
);
go

create table Funcionario(
  ID_funcionario int identity (1,1) primary key not null,
  ID_pessoa int foreign key references pessoa(ID_pessoa),
  Nome_usuario varchar (50),
  Senha varchar (50),
  Salario money,
  Data_Contrato date,
  Departamento varchar (50),
  CTPS varchar (50),
  Matricula varchar (50)
);
go

create table Login(
  ID_login int identity (1,1) primary key not null,
  ID_funcionario int foreign key references funcionario(ID_funcionario),
  Tipo_usuario char (50),
  Usuario char (50),
  Senha char (50),
);
go

create table Notificacao(
  ID_notificacao int identity (1,1) primary key not null,
  ID_cliente int foreign key references cliente(ID_cliente),
  Data_notificacao date,
  Hora time,
  Categoria char (50),
  Valor_desconto money
);
go

create table Venda_produto(
  ID_venda int identity (1,1) primary key not null,
  ID_funcionario int foreign key references funcionario(ID_funcionario),
  ID_produto int foreign key references produto(ID_produto),
  Data_venda date,
  Hora time,
  Valor_venda money,
  Qtd_vendida bigint
);
go

create table Transacoes_monetarias(
  ID_transacoes int identity (1,1) primary key not null,
  ID_venda int foreign key references venda_produto(ID_venda),
  Data_transacoes date,
  Qtd_transacoes int,
  Forma_pagamento char (50),
  Valor_transacao money,
  Comprador char (50),
  Vendas_funcionario int,
  Qtd_parcelamentos int,
  Valor_parcelas money,
  Qtd_parcelas int,
  Total money
);
go

create table Relatorio_financeiro(
  ID_relatorio int identity (1,1) primary key not null,
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
  ID_alerta int identity (1,1) primary key not null,
  ID_produto int foreign key references produto(ID_produto),
  ID_venda int foreign key references venda_produto(ID_venda),
  Status_produto bit
);
go

create view Vw_produto as 
Select ID_produto as Identificador,
       Nome,
       Quantidade,
       Marca,
       Tamanho,
       Cor,
       Tipo,
       Preco,
       Garantia
from Produto
go

select * from Vw_produto
go

create view Vw_venda as 
Select ID_venda as Identificador,
  ID_funcionario,
  ID_produto,
  Data_venda,
  Hora,
  Valor_venda,
  Qtd_vendida
from Venda_produto
go

select * from Vw_venda
go

create view Vw_transacoes as
Select ID_transacoes
  ID_venda,
  Data_transacoes, 
  Qtd_transacoes,
  Forma_pagamento, 
  Valor_transacao,
  Comprador, 
  Vendas_funcionario, 
  Qtd_parcelamentos, 
  Valor_parcelas, 
  Qtd_parcelas,
  Total
from Transacoes_monetarias as T
inner join Venda_produto as V
on T.ID_venda = V.ID_venda
go

select * from Vw_transacoes
go

create view Vw_relatorio as
Select ID_relatorio
  ID_venda,
  Data_emissao,
  Faturamento_mensal,
  Faturamento_diario,
  Receita_mensal,
  Receita_diaria,
  Despesas,
  Lucros,
  Calculo_impostos
from Relatorio_financeiro as R
full outer join Venda_produto as V
on R.ID_venda = V.ID_venda
go

select * from Vw_relatorio
go
