create database Exercicio_DDL
go

use Exercicio_DDL
go

create table Pessoa (
 codigo int not null identity(1,1),
 nome varchar (30) not null,
 endereco varchar (50) not null,
 telefone int not null,
 primary key (codigo)
)
go

create table Cliente (
 codigo int not null identity(1,1),
 rg varchar not null,
 dtnasc date not null,
 primary key (codigo),
 foreign key (codigo) references Pessoa(codigo)
)
go

create table Atendente (
 codigo int not null identity(1,1),
 salario money not null,
 comissao money not null,
 primary key (codigo),
 foreign key (codigo) references Pessoa(codigo)
)
go

create table Livro (
 codigo int not null identity(1,1),
 titulo varchar (25) not null,
 autor varchar (30) not null,
 preco money not null,
 qtd_estoque int not null,
 primary key (codigo)
)
go

create table Venda (
 codigo int not null identity(1,1),
 quantidade int not null,
 cod_cli int not null,
 cod_aten int not null,
 cod_livro int not null,
 primary key (codigo),
 foreign key (cod_cli) references Cliente(codigo),
 foreign key (cod_aten) references Atendente(codigo),
 foreign key (cod_livro) references Livro(codigo)
)
go
